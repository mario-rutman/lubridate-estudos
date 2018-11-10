library(tidyverse)
library(lubridate)

# Há dois momentos: a leitura de um 'character' que será transformado em data; e, 
# a leitura da data para ser transformada em texto normal de data, para ser lida.
 
# Datas iguais.
ymd("1964-03-12")
ymd("19640312")
dmy("12 de março de 1964")
dmy("12/3/1964")
dmy("12/03/1964")
dmy("12-mar-1964")
dmy("12/março/1964")


# Data de hoje.
today()

# Data de hoje com as horas.
now()

# Diferença entre duas datas. O resultado é em dias. 
today() - dmy("7/6/2018")
dmy("9/6/1958") - dmy("30/6/1959")
dmy("9/6/1959") - dmy("30/6/1959")
dmy("30/6/1959") - ymd("1967-03-30")

today() - dmy("29/9/2008") # Quantos dias tem Alice.
today() - dmy("11/2/2006") # Quantos dias tem Anita.
today() - dmy("30/03/1967") # Quantos dias tem Maria.
today() - dmy("30/6/1959") # Quantos dias tem Mário.
dmy("29/9/2018") - today() # Quantos dias faltam para o aniversário da Alice.

# as.duration dá a diferença entre datas em segundos, 
# e aproxima para a unidade conveniente.  
as.duration(today() - dmy("30/06/1959"))

as.duration(today() - ymd("1967-03-30"))
as.duration(today() - dmy("30-3-1967"))
as.duration(today() - dmy("30 de março de 1967"))

as.duration(today() - ymd("2018-06-01"))
as.duration(today() - ymd("2018-04-01"))
as.duration(today() - ymd("2018-01-01"))
as.duration(today() - ymd("2017-01-01"))

as.duration(today() - dmy("29/9/2008")) # Quantos segundos e anos tem Alice.
as.duration(today() - dmy("11/2/2006")) # Quantos segundos e anos tem Anita.
as.duration(today() - dmy("30/03/1967")) # Quantos segundos e anos tem Maria.
as.duration(today() - dmy("30/6/1959")) # Quantos segundos e anos tem Mário.

as.duration(dmy("30/6/1959") - dmy("30/3/1967")) # Quantos segundos e anos Mário tinha quando Maria nasceu.
as.duration(dmy("24/11/1930") - dmy("30/6/1959")) # Idade do papai quando nasci.

as.duration(dmy("29/9/2018") - today()) # Quantos segundos faltam para festa da alice.

# Duration. Dá a duração em segundos de years, days, hours etc.
dyears(x = 0.1)
ddays(x = 15)
ddays(x = 21)
ddays(x = 2.5) 
dhours(x = 0.1)

# Tem também uma forma mais completa.
duration(0.1, unit = "years") 

# As duas expressões dão o mesmo resultado.
ddays(x = 15) == duration(15, unit = "days")
ddays(x = 21) == duration(21, unit = "days")
dyears(x = 10.1) == duration(10.1, unit = "years")
dhours(x = 0.1) == duration(0.1, unit = "hours")

# Quanto falta para a viagem?
# Data da viagem, incluindo as horas, menos now(), resultado em dias.
round(ymd_hm("2018-07-14 21:05") - now(), digits = 1)
# Data da viagem, incluindo as horas, menos now(), resultado em dias.
as.duration(ymd_hm("2018-07-14 21:05") - now()) 

# Resultado em segundos e outra unidade mais conveniente.
round(as.duration(ymd_hm("2018-07-17 21:05") - now()), digits = 0)

# Esta é muito legal, você cria a função sf que 'depreende' 
# um padrão para aplicar às datas.

sf<- stamp("Obra de arte criada com grande inspiração segunda-feira, 4 de junho de 2018")

# Aplicando a função às datas.
sf(ymd("2018-05-29"))
sf(ymd("2018-07-15"))
sf(dmy("30/6/1959"))
sf(mdy("setembro, 7 1999"))
sf(dmy("7/9/1999"))


