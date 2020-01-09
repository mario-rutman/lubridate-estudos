library(tidyverse)
library(lubridate)

# Para ficar no formato brasileiro. É fundamental para os dias e meses ficarem em português.
Sys.setlocale("LC_ALL", "pt_BR.UTF-8")

# Para não aparecer notação científica.
options(scipen=999)


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

# De uma data podemos extrair diversas informações.
mydate <- ymd("1988-09-29")

## extract year information
year(mydate)

## extract day of the month
mday(mydate)

## extract weekday information
wday(mydate)

## label with actual day of the week
wday(mydate, label = TRUE)

## how old is someone born on 30 de junho de 1959
mydate <- ymd("1959-06-30")

## subtract birthday from todays date
age <- today() - mydate
age

## a duration object can get this information in years
as.duration(age)



# Diferença entre duas datas. O resultado é em dias. 
today() - dmy("7/6/2018")
dmy("9/6/1958") - dmy("30/6/1959")
dmy("9/6/1959") - dmy("30/6/1959")
dmy("30/6/1959") - ymd("1967-03-30")

today() - dmy("29/9/2008") # Quantos dias tem Alice.
today() - dmy("11/2/2006") # Quantos dias tem Anita.
today() - dmy("30/03/1967") # Quantos dias tem Maria.
today() - dmy("30/6/1959") # Quantos dias tem Mário.
dmy("29/9/2020") - today() # Quantos dias faltam para o aniversário da Alice.

# as.duration dá a diferença entre datas em segundos, 
# e aproxima para a unidade conveniente.  
as.duration(today() - dmy("30/06/1959"))

# tempo que falta para a viagem a Londres.
as.duration(today() - dmy("15/07/2019")) 


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
dyears(x = 0.1) # quanto dura 0.1 anos?
ddays(x = 15) # quanto dura 15 dias?
ddays(x = 21) # quanto dura 21 dias?
ddays(x = 2.5) # quanto dura 2.5 dias?
dhours(x = 0.1) # quanto dura 0.1 horas?

# Tem também uma forma mais completa.
duration(0.1, unit = "years") 

# As duas expressões dão o mesmo resultado.
ddays(x = 15) == duration(15, unit = "days")
ddays(x = 21) == duration(21, unit = "days")
dyears(x = 10.1) == duration(10.1, unit = "years")
dhours(x = 0.1) == duration(0.1, unit = "hours")

# Quanto falta para a viagem?
as.duration(today() - dmy("14/07/2019")) # tempo que falta para a viagem a Londres.
# Data da viagem menos now(), resultado em dias.
round(ymd_hm("2019-07-14 21:50") - now(), digits = 1) 

# Resultado em segundos e outra unidade mais conveniente.
round(as.duration(ymd_hm("2018-07-17 21:05") - now()), digits = 0)
round(as.duration(ymd_hm("2019-07-14 21:05") - now()), digits = 0)


# Esta é muito legal, você cria a função sf que 'depreende' 
# um padrão para aplicar às datas.

sf<- stamp("Obra de arte criada com grande inspiração segunda-feira, 4 de junho de 2018")

# Aplicando a função às datas.
sf(ymd("2018-05-29"))
sf(ymd("2018-07-15"))
sf(dmy("30/6/1959"))
sf(mdy("setembro, 7 1999"))
sf(dmy("7/9/1999"))

# Avançando mais um pouco.
# Essa função é bem legal. 
library(nycflights13)

flights %>% #pega o df flights
  select(year, month, day) %>% # seleciona as colunas ano, mês e dia, que são apenas números.
  mutate(departure = make_date(year, month, day)) # e cria a coluna da data.

flights %>% #pega o df flights
  select(year, month) %>% #  mas quer usar apenas as colunas ano e mês, que são apenas números.
  mutate(departure = make_date(year, month)) # e cria a coluna da data.

# diferenças de tempo.
year("1985-05-04") - year("1988-09-29")
month("1985-05-04") - month("1988-09-29")
day("1985-05-04") - day("1988-09-29")

# dia da semana de uma data. 
# Como fiz o Sys.setlocale("LC_ALL", "pt_BR.UTF-8") o resultado é em português.
wday(ymd('1985-05-04'), label = TRUE, abbr = FALSE)
wday(ymd('1967-03-30'), label = TRUE, abbr = TRUE) # dia da semana que Maria nasceu.
wday(ymd('2006-02-11'), label = TRUE, abbr = FALSE) # dia da semana que Anita nasceu.
wday(ymd('2007-09-29'), label = TRUE, abbr = TRUE) # dia da semana que Alice nasceu.
wday(ymd('1959-06-30'), label = TRUE, abbr = FALSE) # dia da semana que Mário nasceu.

#
#
time_length(difftime(as.Date("2003-04-05"), as.Date("2001-01-01")), "years")
time_length(difftime(Sys.time(), as.Date("2006-11-02")), "years")

# Lubridate provides similar functions, but easier to understand
now() # equivalent to Sys.time()
floor_date(now(), unit = "month") # round down
floor_date(now(), unit = "year")

round_date(now(), unit = "hour") # round to nearest unit

ceiling_date(now(), unit = "minutes") # round up

# git config user.name "UserName"
# git config user.email "email@domain.com"
