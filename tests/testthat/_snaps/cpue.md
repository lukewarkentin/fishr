# cpue errors when input is not numeric

    Code
      cpue("five", 10)
    Condition
      Error:
      ! Unsupported input type for cpue(): character

# cpue warns when catch and effore lines differ

    Code
      cpue(c(100, 200, 300), c(10, 20))
    Condition
      Warning in `catch / effort`:
      longer object length is not a multiple of shorter object length
    Output
      Survey Result Summary
      ---------------------
      Method:  ratio 
      Gear factor:  1 
      Records 3 
      Mean CPUE:  16.67 
      SD CPUE:  11.55 

# cpue uses verbosity when option set to TRUE

    Code
      cpue(100, 10)
    Message
      Processing 1 records.
    Output
      Survey Result Summary
      ---------------------
      Method:  ratio 
      Gear factor:  1 
      Records 1 
      Mean CPUE:  10 
      SD CPUE:  NA 

# print.cpue_result displays expected output

    Code
      print(result)
    Output
      Survey Result Summary
      ---------------------
      Method:  ratio 
      Gear factor:  1 
      Records 3 
      Mean CPUE:  13.33 
      SD CPUE:  5.77 

