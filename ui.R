library(shiny)
if (!exists("all_cities")) all_cities = readRDS("data/cities.rds")
if (!exists("usa_cities")) usa_cities = readRDS("data/usa_cities.rds")

shinyUI(fluidPage(
  tags$head(
    tags$link(rel="stylesheet", type="text/css", href="custom_styles.css")
  ),

  title = "Agente Viajero con Recocido Simulado, Shiny y R",

  tags$h2(tags$a(href="/traveling-salesman", "Agente Viajero", target="_blank")),

  plotOutput("map", height="550px"),

  fluidRow(
    column(5,
      tags$ol(
        tags$li("Personalice la lista de ciudades. Básese en el mapa mundial o el mapa de Estados Unidos"),
        tags$li("Ajuste a su gusto los parámetros del recocido simulado"),
        tags$li("Clic en el botón 'solucionar' !")
      )
    ),
    column(3,
      tags$button("SOLUCIONAR", id="go_button", class="btn btn-info btn-large action-button shiny-bound-input")
    ),
    column(3,
      HTML("<button id='set_random_cities_2' class='btn btn-large action-button shiny-bound-input'>
              <i class='fa fa-refresh'></i>
              Establecer ciudades aleatoriamente
            </button>")
    ), class="aaa"
  ),

  hr(),

  fluidRow(
    column(5,
      h4("Elija un mapa y las ciudades que visitará"),
      selectInput("map_name", NA, c("World", "USA"), "World", width="100px"),
      p("Seleccione las ciudades individualmente, o", actionButton("set_random_cities", "elija hacerlo aleatoriamente", icon=icon("refresh"))),
      selectizeInput("cities", NA, all_cities$full.name, multiple=TRUE, width="100%",
                     options = list(maxItems=30, maxOptions=100, placeholder="Start typing to select some cities...",
                                    selectOnTab=TRUE, openOnFocus=FALSE, hideSelected=TRUE)),
      checkboxInput("label_cities", "Etiquetar las ciudades sobre el mapa?", FALSE)
    ),

    column(2,
      h4("Parámetros del recocido simulado"),
      inputPanel(
        numericInput("s_curve_amplitude", "Amplitud de la curva-S", 4000, min=0, max=10000000),
        numericInput("s_curve_center", "Centro de la curva-S", 0, min=-1000000, max=1000000),
        numericInput("s_curve_width", "Ancho de la curva-S", 3000, min=1, max=1000000),
        numericInput("total_iterations", "Total iteraciones a realizar a ejecutar", 25000, min=0, max=1000000),
        numericInput("plot_every_iterations", "Dibujar el mapa cada N Iteraciones", 1000, min=1, max=1000000)
      ),
      class="numeric-inputs"
    ),

    column(5,
      plotOutput("annealing_schedule", height="260px"),
      plotOutput("distance_results", height="260px")
    )
  )
))
