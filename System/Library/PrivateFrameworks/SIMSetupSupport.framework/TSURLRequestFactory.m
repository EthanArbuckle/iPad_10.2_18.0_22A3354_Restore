@implementation TSURLRequestFactory

+ (id)requestWithType:(unint64_t)a3 URL:(id)a4 postdata:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (v7
    && (objc_msgSend(v7, "absoluteString"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v10))
  {
    if (v8
      && (objc_msgSend(v8, "allKeys"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "count"),
          v11,
          v12))
    {
      switch(a3)
      {
        case 0uLL:
          _TSLogDomain();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.6(v26, v27, v28, v29, v30, v31, v32, v33);

          goto LABEL_27;
        case 1uLL:
        case 6uLL:
          +[TSURLRequestFactory _urlEncodedBodyWithPostdata:](TSURLRequestFactory, "_urlEncodedBodyWithPostdata:", v8);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 2uLL:
        case 5uLL:
          +[TSURLRequestFactory _jsonBodyWithPostdata:](TSURLRequestFactory, "_jsonBodyWithPostdata:", v8);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = CFSTR("application/json");
          if (!v24)
            goto LABEL_27;
          goto LABEL_20;
        case 3uLL:
          +[TSURLRequestFactory _urlEncodedBodyWithCarrierPostRawData:](TSURLRequestFactory, "_urlEncodedBodyWithCarrierPostRawData:", v8);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v24 = v13;
          v25 = CFSTR("application/x-www-form-urlencoded");
          if (!v13)
            goto LABEL_27;
LABEL_20:
          objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v7);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_setNonAppInitiated:", 1);
          objc_msgSend(v22, "setValue:forHTTPHeaderField:", v25, CFSTR("content-type"));
          objc_msgSend(v22, "setHTTPMethod:", CFSTR("POST"));
          objc_msgSend(v22, "setHTTPBody:", v24);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), -[NSObject length](v24, "length"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setValue:forHTTPHeaderField:", v34, CFSTR("content-length"));

          _TSLogDomain();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.5((uint64_t)v7, v22);

          _TSLogDomain();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.4((uint64_t)v25, v22);

          _TSLogDomain();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.3();

          break;
        default:
LABEL_27:
          _TSLogDomain();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[TSURLRequestFactory requestWithType:URL:postdata:].cold.2(v24, v38, v39, v40, v41, v42, v43, v44);
          v22 = 0;
          break;
      }

    }
    else
    {
      _TSLogDomain();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v7;
        v48 = 2080;
        v49 = "+[TSURLRequestFactory requestWithType:URL:postdata:]";
        _os_log_impl(&dword_21B647000, v23, OS_LOG_TYPE_INFO, "[I] No postdata for: %@ @%s", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_setNonAppInitiated:", 1);
    }
  }
  else
  {
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[TSURLRequestFactory requestWithType:URL:postdata:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    v22 = 0;
  }

  return v22;
}

+ (id)_urlEncodedBodyWithPostdata:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__TSURLRequestFactory__urlEncodedBodyWithPostdata___block_invoke;
  v11[3] = &unk_24DEF33D0;
  v12 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  v7 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v7, "setQueryItems:", v6);
  objc_msgSend(v7, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __51__TSURLRequestFactory__urlEncodedBodyWithPostdata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDD1838];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithName:value:", v7, v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

+ (id)_urlEncodedBodyWithCarrierPostRawData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = (id)*MEMORY[0x24BE158D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[TSURLRequestFactory _urlEncodedBodyWithCarrierPostRawData:].cold.1((uint64_t)v5, (uint64_t)v4, v6);

  }
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_jsonBodyWithPostdata:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[TSURLRequestFactory _jsonBodyWithPostdata:].cold.1();

  }
  return v3;
}

+ (void)requestWithType:(uint64_t)a3 URL:(uint64_t)a4 postdata:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Empty URL @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)requestWithType:(uint64_t)a3 URL:(uint64_t)a4 postdata:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Invalid request body @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)requestWithType:URL:postdata:.cold.3()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = "+[TSURLRequestFactory requestWithType:URL:postdata:]";
  _os_log_debug_impl(&dword_21B647000, v0, OS_LOG_TYPE_DEBUG, "[Db] postdata: %@ @%s", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)requestWithType:(uint64_t)a1 URL:(void *)a2 postdata:.cold.4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "HTTPBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_21B647000, v3, v4, "[Db] contentType %@, body: %@ @%s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_0();
}

+ (void)requestWithType:(uint64_t)a1 URL:(void *)a2 postdata:.cold.5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "allHTTPHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(&dword_21B647000, v3, v4, "[Db] http request %@ headers: %@ @%s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_0();
}

+ (void)requestWithType:(uint64_t)a3 URL:(uint64_t)a4 postdata:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Unknown request @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_urlEncodedBodyWithCarrierPostRawData:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = 138412802;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a2;
  v10 = 2080;
  v11 = "+[TSURLRequestFactory _urlEncodedBodyWithCarrierPostRawData:]";
  v5 = v7;
  _os_log_error_impl(&dword_21B647000, a3, OS_LOG_TYPE_ERROR, "[E]value type (%@) is unexpected for key (%@) @%s", (uint8_t *)&v6, 0x20u);

}

+ (void)_jsonBodyWithPostdata:.cold.1()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = "+[TSURLRequestFactory _jsonBodyWithPostdata:]";
  _os_log_error_impl(&dword_21B647000, v0, OS_LOG_TYPE_ERROR, "[E]Failed to create request body: %@ @%s", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
