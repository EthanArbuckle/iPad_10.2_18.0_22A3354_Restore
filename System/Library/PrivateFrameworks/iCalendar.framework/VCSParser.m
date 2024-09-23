@implementation VCSParser

+ (id)parseVCSFile:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99DF0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContentsOfFile:", v5);

  objc_msgSend(v6, "increaseLengthBy:", 1);
  objc_msgSend(a1, "parseVCSData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)parseVCSData:(id)a3
{
  id v3;
  VCSParserInputStream *v4;
  size_t v5;
  void *v6;
  void *v7;
  VCSParseState *v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *i;
  int v15;
  size_t v17;
  size_t v18;
  void *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _BYTE *v24;
  id v25;
  VCSParsedLine *v27;
  uint8_t buf;
  _BYTE v29[7];
  size_t __size;

  v3 = a3;
  v4 = -[VCSParserInputStream initWithData:]([VCSParserInputStream alloc], "initWithData:", v3);
  if (!v4)
  {
    VCSLogHandle();
    v8 = (VCSParseState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
      +[VCSParser parseVCSData:].cold.1();
    v23 = 0;
    goto LABEL_38;
  }
  v25 = v3;
  v5 = 100;
  v6 = malloc_type_malloc(0x64uLL, 0x401CF266uLL);
  v7 = malloc_type_malloc(0x64uLL, 0x877CCA7EuLL);
  v8 = objc_alloc_init(VCSParseState);
  v27 = objc_alloc_init(VCSParsedLine);
  v24 = v29;
  v9 = 100;
  while (1)
  {
    __size = v5;
    v10 = -[VCSParserInputStream getLine:withSize:](v4, "getLine:withSize:", v6, &__size, v24);
    if (v10 == 3)
      break;
LABEL_6:
    v12 = v10;
    if (v10)
    {
LABEL_7:
      if (!v12)
        goto LABEL_27;
      if (v12 == 4)
      {
        free(v6);
        free(v7);
        -[VCSParseState calendars](v8, "calendars");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copy");

        goto LABEL_34;
      }
    }
    else
    {
      if (-[VCSParserInputStream isContinued](v4, "isContinued"))
      {
        while (1)
        {
          __size = v9;
          v13 = -[VCSParserInputStream getLine:withSize:](v4, "getLine:withSize:", v7, &__size);
          if (v13 == 3)
          {
            v9 = __size;
            v7 = malloc_type_realloc(v7, __size, 0xA2DC7BC8uLL);
            v13 = -[VCSParserInputStream getLine:withSize:](v4, "getLine:withSize:", v7, &__size);
          }
          v12 = v13;
          if (!v13)
          {
            for (i = (const char *)v7; ; ++i)
            {
              v15 = *(unsigned __int8 *)i;
              if (v15 != 32 && v15 != 9)
                break;
            }
            v17 = strlen((const char *)v6);
            v18 = v17 + strlen(i) + 2;
            if (v5 < v18)
            {
              v6 = reallocf(v6, v18);
              v5 = v18;
            }
            if (!v6)
              goto LABEL_33;
            strlcat((char *)v6, "\n", v5);
            strlcat((char *)v6, i, v5);
          }
          if (!-[VCSParserInputStream isContinued](v4, "isContinued"))
            goto LABEL_7;
        }
      }
LABEL_27:
      -[VCSParseState setLineNumber:](v8, "setLineNumber:", -[VCSParserInputStream lineNum](v4, "lineNum"));
      -[VCSParsedLine loadFromCString:withParseState:](v27, "loadFromCString:withParseState:", v6, v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && objc_msgSend(a1, "decodeVCSLine:withParseState:", v19, v8) == 2)
      {
        VCSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          +[VCSParser parseVCSData:].cold.2(&buf, v24, v20);

      }
    }
  }
  v5 = __size;
  v11 = reallocf(v6, __size);
  if (v11)
  {
    v6 = v11;
    v10 = -[VCSParserInputStream getLine:withSize:](v4, "getLine:withSize:", v11, &__size);
    goto LABEL_6;
  }
LABEL_33:
  free(v7);

  v23 = 0;
LABEL_34:
  v3 = v25;
LABEL_38:

  return v23;
}

+ (unint64_t)decodeVCSLine:(id)a3 withParseState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VCSProperty *v11;
  VCSProperty *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (v8 == 3)
  {
    v11 = -[VCSProperty initWithVCSLine:parseState:]([VCSProperty alloc], "initWithVCSLine:parseState:", v6, v7);
    if (!v11)
    {
LABEL_15:
      v10 = objc_msgSend(v7, "status");
      goto LABEL_16;
    }
    v12 = v11;
    objc_msgSend(v7, "currentEntity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:", v12);

    v14 = v7;
    v15 = 0;
LABEL_14:
    objc_msgSend(v14, "setStatus:", v15);
    goto LABEL_15;
  }
  if (v8 != 1)
  {
    VCSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[VCSParser decodeVCSLine:withParseState:].cold.1(v6, v16);
    goto LABEL_13;
  }
  v9 = objc_msgSend(v6, "tokenID");
  if (v9 == 2)
  {
    v10 = objc_msgSend(a1, "endVCSEntity:withParseState:", v6, v7);
    goto LABEL_16;
  }
  if (v9 != 1)
  {
    VCSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[VCSParser decodeVCSLine:withParseState:].cold.2();
LABEL_13:

    v14 = v7;
    v15 = 1;
    goto LABEL_14;
  }
  v10 = objc_msgSend(a1, "beginVCSEntity:withParseState:", v6, v7);
LABEL_16:
  v17 = v10;

  return v17;
}

+ (unint64_t)beginVCSEntity:(id)a3 withParseState:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = a4;
  v19 = 0;
  v6 = a3;
  v7 = objc_msgSend(v5, "context");
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v6, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 1);
  v11 = +[VCSParsedLine tokenizeNSStringKeyword:withType:](VCSParsedLine, "tokenizeNSStringKeyword:withType:", v10, &v19);
  if (v19 != 2)
  {
    VCSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[VCSParser beginVCSEntity:withParseState:].cold.4((uint64_t)v10, v5, v12);
    goto LABEL_19;
  }
  if ((unint64_t)(v11 - 4) >= 2)
  {
    if (v11 == 3)
    {
      if (!v7)
      {
        v17 = (void *)objc_opt_new();
        objc_msgSend(v5, "setCurrentCalendar:", v17);

        objc_msgSend(v5, "currentCalendar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setCurrentEntity:", v18);

        objc_msgSend(v5, "setContext:", 1);
        goto LABEL_20;
      }
      VCSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[VCSParser beginVCSEntity:withParseState:].cold.2();
    }
    else
    {
      VCSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[VCSParser beginVCSEntity:withParseState:].cold.1();
    }
  }
  else
  {
    if (v7 == 1)
    {
      if (v11 == 4)
      {
        v12 = objc_opt_new();
        objc_msgSend(v5, "setContext:", 2);
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v5, "setCurrentEntity:", v12);
LABEL_19:

LABEL_20:
      v14 = 0;
      goto LABEL_21;
    }
    VCSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[VCSParser beginVCSEntity:withParseState:].cold.3();
  }

  v14 = 1;
LABEL_21:
  objc_msgSend(v5, "setStatus:", v14);
  v15 = objc_msgSend(v5, "status");

  return v15;
}

+ (unint64_t)endVCSEntity:(id)a3 withParseState:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  VCSProperty *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v40 = 0;
  v7 = objc_msgSend(v6, "context");
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 1);

  v11 = +[VCSParsedLine tokenizeNSStringKeyword:withType:](VCSParsedLine, "tokenizeNSStringKeyword:withType:", v10, &v40);
  if (v40 != 2)
  {
    VCSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[VCSParser endVCSEntity:withParseState:].cold.5();
    goto LABEL_9;
  }
  if (v11 == 5)
  {
    if (v7 != 3)
    {
      VCSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        +[VCSParser endVCSEntity:withParseState:].cold.3();
      goto LABEL_35;
    }
    objc_msgSend(v6, "currentEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (v11 == 4)
  {
    if (v7 != 2)
    {
      VCSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        +[VCSParser endVCSEntity:withParseState:].cold.4();
      goto LABEL_35;
    }
    objc_msgSend(v6, "currentEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ensureDurationAlarms");
    if (objc_msgSend(v16, "hasPropertyWithName:", CFSTR("DTSTART"))
      && (objc_msgSend(v16, "hasPropertyWithName:", CFSTR("DTEND")) & 1) == 0)
    {
      objc_msgSend(v16, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateByAddingDays:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEndDate:", v18);

      objc_msgSend(v16, "setFullDayEvent:", 1);
    }
    if (objc_msgSend(v16, "hasPropertyWithName:", CFSTR("EXDATE")))
    {
      v34 = v10;
      v35 = v5;
      v19 = (void *)objc_opt_new();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v16, "propertyForName:", CFSTR("EXDATE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "values");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "value", v34, v35);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "dateWithTimeComponentsFromDate:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "addObject:", v28);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v23);
      }

      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v16, "removePropertyForName:", CFSTR("EXDATE"));
        v29 = -[VCSProperty initWithName:rawValues:type:]([VCSProperty alloc], "initWithName:rawValues:type:", CFSTR("EXDATE"), v19, 7);
        objc_msgSend(v16, "setProperty:", v29);

      }
      v10 = v34;
      v5 = v35;
    }
LABEL_28:
    objc_msgSend(v6, "currentCalendar", v34, v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addChildEntity:", v16);

    objc_msgSend(v6, "currentCalendar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrentEntity:", v31);

    v15 = 1;
    objc_msgSend(v6, "setContext:", 1);

    goto LABEL_36;
  }
  if (v11 != 3)
  {
    VCSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[VCSParser endVCSEntity:withParseState:].cold.1();
LABEL_35:

    v15 = 0;
    goto LABEL_36;
  }
  if (v7 != 1)
  {
    VCSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[VCSParser endVCSEntity:withParseState:].cold.2();
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v6, "calendars");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  objc_msgSend(v6, "setCurrentCalendar:", 0);
  objc_msgSend(v6, "setCurrentEntity:", 0);
  objc_msgSend(v6, "setContext:", 0);
LABEL_10:
  v15 = 1;
LABEL_36:

  return v15;
}

+ (void)parseVCSData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3456000, v0, v1, "Invalid NSData.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)parseVCSData:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D3456000, log, OS_LOG_TYPE_ERROR, "Fatal vCalendar parser error !", buf, 2u);
}

+ (void)decodeVCSLine:(void *)a1 withParseState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyword");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3456000, a2, OS_LOG_TYPE_ERROR, "Unexpeced token type: %@", v4, 0xCu);

  OUTLINED_FUNCTION_6();
}

+ (void)decodeVCSLine:withParseState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, v0, v1, "Wrong token as delimeter: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)beginVCSEntity:withParseState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, v0, v1, "Unnknown entity name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)beginVCSEntity:withParseState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3456000, v0, v1, "Wrong context to begin a calendar.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)beginVCSEntity:withParseState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3456000, v0, v1, "Wrong context to begin a todo or event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)beginVCSEntity:(NSObject *)a3 withParseState:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "lineNumber");
  _os_log_error_impl(&dword_1D3456000, a3, OS_LOG_TYPE_ERROR, "Unknown entity type: %@ at line %d.", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_6();
}

+ (void)endVCSEntity:withParseState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, v0, v1, "Unkown entity name: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)endVCSEntity:withParseState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3456000, v0, v1, "Wrong context to end a calendar.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)endVCSEntity:withParseState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3456000, v0, v1, "Wrong context to end a todo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)endVCSEntity:withParseState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3456000, v0, v1, "Wrong context to end an event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)endVCSEntity:withParseState:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, v0, v1, "Unknown entity type: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
