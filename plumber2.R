# plumber2.R

#* Subset the data according to certain parameter
#* @param variable The variable used  
#* @param accept.value The value of the column used to filter the data. If numeric the function will return data greater than intered value
#* @post /subsetdata
function(variable, accept.value){
  
  if(is.numeric(iris[variable]))    
    iris %>% 
    subset(., iris[variable] > as.numeric(accept.value))
  else 
    iris %>% 
    subset(., iris[variable] == accept.value)
}