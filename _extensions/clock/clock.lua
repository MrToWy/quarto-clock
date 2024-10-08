quarto.doc.add_html_dependency({
    name = "quarto-clock",
    version = "1.0.1",
    scripts = {"clock.js"},
    stylesheets = {"clock.css"}
  })
  
  return {
      -- Füge den Filter zu Pandoc hinzu
      {
          Div = function (div)
              if div.classes[1] == "clock" then
                  local containerId = div.identifier
                  local timeLimit = tonumber(div.attributes["seconds"]) or 300  -- Default: 300 Sekunden
                  local startOn = div.attributes["starton"] or "slide" -- Default: timers run when visible
              
                  local htmlSnippet = string.format([[
                      <div id="%s"></div>
                      <script>
                          document.addEventListener("DOMContentLoaded", function () {
                              initializeClock("%s", %d, "%s");
                          });
                      </script>
                  ]], containerId, containerId, timeLimit, startOn)
  
                  return pandoc.RawBlock("html", htmlSnippet)
              end
              return div
          end
      }
  }
  