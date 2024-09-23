@implementation POXMLHelper

+ (id)loadXMLDocument:(id)a3
{
  id v3;
  POXMLContext *v4;
  id v5;
  const char *v6;
  int v7;
  POXMLContext *v8;
  NSObject *v9;

  v3 = a3;
  v4 = objc_alloc_init(POXMLContext);
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  -[POXMLContext setXmldoc:](v4, "setXmldoc:", xmlParseMemory(v6, v7));
  if (-[POXMLContext xmldoc](v4, "xmldoc"))
  {
    v8 = v4;
  }
  else
  {
    PO_LOG_POXMLHelper();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[POXMLHelper loadXMLDocument:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (void)loadXMLDocument:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Error: failed to parse xml document", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
