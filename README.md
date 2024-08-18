# Quarto Clock

This extension provides the ability to add a dynamic clock to your slides. This might be helpful, if, for example, you want your audience to think about a specific topic for 5 minutes.
 
![image](https://github.com/user-attachments/assets/3ab03177-0065-42e0-8e9f-f56a1c2aa051)


## Installation
In the RStudio terminal:

```
$ quarto add MrToWy/quarto-clock
```

## Usage

You can add timers using:

- raw HTML
- LUA filter (recommended)

### Raw HTML/JavaScript
If you want to add a timer in raw HTML, you can use the following code snippet in your `qmd`-File:

```
<div id="UNIQUE-ID"></div>
<script src="_extensions/MrToWy/clock/clock.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        initializeClock("UNIQUE-ID", SECONDS, STARTON); 
    });
</script>
```

...and replace `UNIQUE-ID` with a (tadaaa) unique ID, `SECONDS` with the seconds to count down, and `STARTON` with `presentation`, `slide`, or `interaction` to indicate when the timer become active:

- From the start of a `presentation`
- When the `slide` is visible
- On `interaction`, clicking on the timer

Here is an example of a 4 minute timer that start when the slide is on focus:

```
Please think about this for 4 minutes.
<div id="4minWaiting"></div>
<script src="_extensions/produnis/timer/timer.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        initializeTimer("4minWaiting", 240, "slide"); 
    });
</script>
```

### Lua filter

This extension also provides a lua-filter that can be activated in YAML with:

```
---
filters: 
  - clock
---
```

Having the filter ready, you can more easily add a timer with:

```
:::{.clock #UNIQUE-ID seconds=100 starton=presentation}
:::
```

The above will start timing from when the presentation is loaded.
The example below starts when the slide or page becomes visible.

```
:::{.timer #UNIQUE-ID seconds=100 starton=slide}
:::
```

Or inserting a timer that requires clicking to start:

```
:::{.timer #UNIQUE-ID seconds=100 starton=interaction}
:::
```

You can use as many timers on your slides as you want, as long as you use a unique `UNIQUE-ID` every time.

![multiple timers in action](https://www.produnis.de/blog/posts/2024-01-04-Revealjs-Timer/revealjstimer.jpg)
