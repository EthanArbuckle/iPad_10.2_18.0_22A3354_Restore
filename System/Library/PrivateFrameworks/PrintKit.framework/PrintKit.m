void sub_220F9C038(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9C088(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9C0D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9C128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9C234(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_220F9C438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9C62C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9C744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220F9C7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void PKLogXPCError(objc_selector *a1, NSError *a2)
{
  NSError *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  NSError *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _PKLogCategory(PKLogCategoryFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector((SEL)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_220F9A000, v4, OS_LOG_TYPE_ERROR, "%@ %@", (uint8_t *)&v8, 0x16u);

  }
  if (-[NSError code](v3, "code") == 4099)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector((SEL)a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_ERROR, "%@ Ensure the com.apple.PrintKit.PrinterTool XPCService is available.", (uint8_t *)&v8, 0xCu);

    }
  }

}

void sub_220F9C944(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220F9CA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220F9CAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9CB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9CC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220F9CCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9CD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220F9CE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220F9CEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9CF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_220F9D00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_220F9D0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_220F9D1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_220F9D260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220F9D2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9D3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220F9D450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9D560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220F9D5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9D6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220F9D788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9D86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220F9D8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9D968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220F9DA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_220F9DB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220F9DBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9DD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_220F9DDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9DE8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220F9DFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220F9E030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9E144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220F9E1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9E2DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9E364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220F9E468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220F9E598(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220F9E62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void PrintdRPC::RemoveKeychainItem(PrintdRPC *this, PKPrinterBonjourEndpoint *a2)
{
  void *v2;
  PrintdRPC *v3;

  v3 = this;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printerTool_removeKeychainItem:", v3);

}

void sub_220F9E708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void PrintdRPC::IdentifyPrinter(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "printerTool_identifyPrinter:message:actions:", v8, v5, v6);

}

void sub_220F9E7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void PrintdRPC::GetPrinterDescription(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a1;
  v5 = a3;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printerTool_getPrinterDescription:assertReachability:completionHandler:", v7, a2, v5);

}

void sub_220F9E840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void PrintdRPC::CheckAccessStateAsync(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printerTool_checkAccessState:completionHandler:", v5, v3);

}

void sub_220F9E8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void PrintdRPC::QueryPrinterWithAttributess(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  v6 = a3;
  +[PKPrinterTool_Client sharedClient](PKPrinterTool_Client, "sharedClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "printerTool_queryPrinter:attributes:completionHandler:", v8, v5, v6);

}

void sub_220F9E96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

NSString *internString(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  NSString *v4;
  NSString *v5;
  const char *v6;
  size_t v7;
  _QWORD *Value;
  NSString *v9;
  NSString *v10;
  _QWORD v12[4];

  v1 = a1;
  objc_msgSend(&unk_24E6E9E48, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
LABEL_9:
    v10 = v4;
    goto LABEL_10;
  }
  v5 = objc_retainAutorelease(v1);
  v6 = -[NSString UTF8String](v5, "UTF8String");
  v7 = strlen(v6);
  if (-[NSString length](v5, "length") != v7)
  {
    v4 = v5;
    v1 = v4;
    goto LABEL_9;
  }
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = dynamicHash(v6, v7);
  v12[3] = 0;
  if (internEntriesDict(void)::sOnce != -1)
    dispatch_once(&internEntriesDict(void)::sOnce, &__block_literal_global_0);
  Value = CFDictionaryGetValue((CFDictionaryRef)internEntriesDict(void)::sInternEntriesDict, v12);
  if (Value)
  {
    v9 = (NSString *)Value[3];
  }
  else if (isAsciiString(v6, v7))
  {
    forcedAsciiIntern(v5);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v5 = v9;
  }
  else
  {
    v9 = v5;
  }
  v10 = v9;
  v1 = v5;
LABEL_10:

  return v10;
}

void sub_220F9EADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t dynamicHash(const char *a1, uint64_t a2)
{
  if (a2)
    return 257 * dynamicHash(a1 + 1, a2 - 1) + *a1;
  else
    return 0;
}

BOOL isAsciiString(const char *a1, uint64_t a2)
{
  const char *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  unsigned int v6;

  v2 = a1;
  v3 = &a1[a2];
  v4 = MEMORY[0x24BDAC740];
  while (1)
  {
    v5 = v2;
    if (v2 >= v3)
      break;
    ++v2;
    v6 = *v5;
    if ((v6 & 0x80000000) != 0)
    {
      if (!__maskrune(v6, 0x40000uLL))
        return v5 >= v3;
    }
    else if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x40000) == 0)
    {
      return v5 >= v3;
    }
  }
  return v5 >= v3;
}

NSString *forcedAsciiIntern(NSString *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  unint64_t v8;
  NSString *v9;

  v1 = a1;
  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (void *)forcedAsciiIntern(NSString *)::sForced;
  if (!forcedAsciiIntern(NSString *)::sForced)
  {
    v4 = objc_opt_new();
    v5 = (void *)forcedAsciiIntern(NSString *)::sForced;
    forcedAsciiIntern(NSString *)::sForced = v4;

    v3 = (void *)forcedAsciiIntern(NSString *)::sForced;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v1);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v8 = objc_msgSend((id)forcedAsciiIntern(NSString *)::sForced, "count");
    v7 = v1;
    if (v8 <= 0x7F)
    {
      objc_msgSend((id)forcedAsciiIntern(NSString *)::sForced, "setObject:forKeyedSubscript:", v1, v1);
      v7 = v1;
    }
  }
  v9 = v7;

  objc_sync_exit(v2);
  return v9;
}

void sub_220F9EC70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

id internUTF8ByteString(const char *a1, uint64_t a2)
{
  id *Value;
  id v5;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = a1;
  v10 = a2;
  v11 = dynamicHash(a1, a2);
  v12 = 0;
  if (internEntriesDict(void)::sOnce != -1)
    dispatch_once(&internEntriesDict(void)::sOnce, &__block_literal_global_0);
  Value = (id *)CFDictionaryGetValue((CFDictionaryRef)internEntriesDict(void)::sInternEntriesDict, &v9);
  if (Value)
  {
    v5 = Value[3];
    return v5;
  }
  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = (id)objc_msgSend(v7, "initWithBytes:length:encoding:", a1, a2, 4, v9, v10, v11, v12);
  if (!v5 || !isAsciiString(a1, a2))
    return v5;
  forcedAsciiIntern((NSString *)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_220F9ED74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFDictionaryRef ___ZL17internEntriesDictv_block_invoke()
{
  CFDictionaryRef result;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;

  keyCallBacks.version = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)_ZZZL17internEntriesDictvEUb_EN3__08__invokeEPK13__CFAllocatorPKv;
  keyCallBacks.release = (CFDictionaryReleaseCallBack)_ZZZL17internEntriesDictvEUb_EN3__18__invokeEPK13__CFAllocatorPKv;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)_ZZZL17internEntriesDictvEUb_EN3__28__invokeEPKv;
  keyCallBacks.equal = (CFDictionaryEqualCallBack)_ZZZL17internEntriesDictvEUb_EN3__38__invokeEPKvS1_;
  keyCallBacks.hash = (CFDictionaryHashCallBack)_ZZZL17internEntriesDictvEUb_EN3__48__invokeEPKv;
  valueCallBacks.version = 0;
  valueCallBacks.retain = (CFDictionaryRetainCallBack)_ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv;
  valueCallBacks.release = (CFDictionaryReleaseCallBack)_ZZZL17internEntriesDictvEUb_EN3__68__invokeEPK13__CFAllocatorPKv;
  valueCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)_ZZZL17internEntriesDictvEUb_EN3__78__invokeEPKv;
  valueCallBacks.equal = (CFDictionaryEqualCallBack)_ZZZL17internEntriesDictvEUb_EN3__88__invokeEPKvS1_;
  if ((char **)sEntryPtrs != &sEntryValues)
    ___ZL17internEntriesDictv_block_invoke_cold_2();
  if ((char **)qword_255654C28 != &off_24E6CAD78)
    ___ZL17internEntriesDictv_block_invoke_cold_1();
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&sEntryPtrs, (const void **)&sEntryPtrs, 1337, &keyCallBacks, &valueCallBacks);
  internEntriesDict(void)::sInternEntriesDict = (uint64_t)result;
  return result;
}

uint64_t _ZZZL17internEntriesDictvEUb_EN3__08__invokeEPK13__CFAllocatorPKv(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef _ZZZL17internEntriesDictvEUb_EN3__28__invokeEPKv(char **a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  void *v4;
  CFStringRef v5;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = entryIndex(a1);
  entryString(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFStringCreateWithFormat(v2, 0, CFSTR("key<%d/%@>"), v3, v4);

  return v5;
}

void sub_220F9EEE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t entryIndex(char **a1)
{
  uint64_t v1;

  v1 = (char *)a1 - (char *)&sEntryValues;
  if (a1 < &sEntryValues || a1 >= (char **)&__block_descriptor_32_e28_B16__0__PK_ipp_attribute_t_8l)
    return 0xFFFFFFFFLL;
  if (&(&sEntryValues)[4 * (int)(v1 >> 5)] != a1)
    entryIndex();
  return (unint64_t)v1 >> 5;
}

id entryString(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = (void *)a1[3];
  if (v1)
    v2 = v1;
  else
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", *a1, a1[1], 4);
  return v2;
}

BOOL _ZZZL17internEntriesDictvEUb_EN3__38__invokeEPKvS1_(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t _ZZZL17internEntriesDictvEUb_EN3__48__invokeEPKv(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

char **_ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv(uint64_t a1, char **a2)
{
  if (entryIndex(a2) == -1)
    _ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv_cold_1();
  return a2;
}

CFStringRef _ZZZL17internEntriesDictvEUb_EN3__78__invokeEPKv(char **a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  void *v4;
  CFStringRef v5;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = entryIndex(a1);
  entryString(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFStringCreateWithFormat(v2, 0, CFSTR("val<%d/%@>"), v3, v4);

  return v5;
}

void sub_220F9F070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL _ZZZL17internEntriesDictvEUb_EN3__88__invokeEPKvS1_(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  return v2 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t ippReadIO(void *a1, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), PK_ipp_t *a3)
{
  PK_ipp_t *v5;
  PK_ipp_t *v6;
  uint64_t v7;
  ipp_state_e v9;
  ipp_tag_e v10;
  _BYTE v11[24];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v7 = 0xFFFFFFFFLL;
  if (a1 && v5)
  {
    IPPIOReader::IPPIOReader((IPPIOReader *)v11, a2, a1);
    v9 = IPP_STATE_IDLE;
    v10 = IPP_TAG_NOVALUE;
    ippReadWithReader((IPPIOReader *)v11, &v9, &v10, 0, v6);
    v7 = 3;

  }
  return v7;
}

void ippReadWithReader(IPPIOReader *a1, ipp_state_e *a2, ipp_tag_e *a3, int a4, PK_ipp_t *a5)
{
  ipp_state_e v9;
  PK_ipp_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  PK_ipp_t *v14;
  unsigned int v15;
  unint64_t v16;
  PK_ipp_attribute_t *v17;
  id v18;
  int v19;
  PK_ipp_attribute_t *v20;
  PK_ipp_attribute_t *v21;
  id v22;
  id v23;
  void *v24;
  PK_ipp_attribute_t *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  PK_ipp_attribute_t *v29;
  id v30;
  int v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  unsigned int v41;
  int v42;
  uint64_t v43;
  unsigned __int8 *v44;
  const void *v45;
  size_t v46;
  unint64_t v47;
  void *v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  unsigned int v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  unsigned __int8 *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  void *v64;
  void *v65;
  PK_ipp_t *v66;
  NSString *v67;
  NSString *v68;
  NSString *v69;
  NSString *v70;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  NSString *v76;
  NSString *v77;
  NSString *v78;
  NSString *v79;
  NSString *v80;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  NSString *v84;
  NSString *v85;
  NSString *v86;
  NSString *v87;
  NSString *v88;
  NSString *v89;
  NSString *v90;
  NSString *v91;
  NSString *v92;
  NSString *v93;
  NSString *v94;
  void *v95;
  uint64_t v96;
  const char *v97;
  NSString *v98;
  void *v99;
  const char *v100;
  NSString *v101;
  void *v102;
  const char *v103;
  NSString *v104;
  void *v105;
  const char *v106;
  NSString *v107;
  PK_ipp_t *v108;
  ipp_state_e *v109;
  PK_ipp_t *v110;
  ipp_state_e v111;
  _DWORD v112[2];
  _DWORD v113[2];
  unsigned int __dst[256];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v108 = a5;
  v109 = a2;
  v9 = *a2;
  if (*a2 == IPP_STATE_ATTRIBUTE)
  {
LABEL_8:
    v110 = v108;
    while (1)
    {
      v11 = (void *)MEMORY[0x227667A1C]();
      IPPIOReader::read(a1, (unsigned __int8 *)__dst, 1uLL);
      v12 = validate_enum<ipp_tag_e,unsigned char>(LOBYTE(__dst[0]));
      v13 = v12;
      if ((_DWORD)v12 != 3)
        break;
      v17 = 0;
      v18 = 0;
LABEL_26:
      *v109 = IPP_STATE_DATA;
      v19 = 1;
LABEL_104:

      objc_autoreleasePoolPop(v11);
      if (v19 && v19 != 3)
      {

        goto LABEL_107;
      }
    }
    if ((_DWORD)v12 == 127)
    {
      IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
      v13 = 0xFFFFFFFFLL;
LABEL_21:
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad tag 0x%02x."), v13);
        v67 = (NSString *)objc_claimAutoreleasedReturnValue();
        IPPIOReader::THROW_FAIL(a1, 662, CFSTR("Invalid group tag."), v67);
      }
      if (*a3 == (_DWORD)v13)
        ippAddSeparator(v110);
      v17 = 0;
      v18 = 0;
      *a3 = v13;
      v19 = 3;
      goto LABEL_104;
    }
    if (!(_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad tag 0x%02x."), 0);
      v68 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 651, CFSTR("Invalid group tag."), v68);
    }
    if ((int)v12 <= 15)
      goto LABEL_21;
    v14 = v110;
    IPPIOReader::read(a1, (unsigned __int8 *)__dst, 2uLL);
    v15 = bswap32(LOWORD(__dst[0]));
    v16 = HIWORD(v15);
    if (v16 > 0x8000)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad name length %d."), HIWORD(v15));
      v71 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 213, CFSTR("IPP name larger than 32767 bytes."), v71);
    }
    if (LOWORD(__dst[0]) && a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad attribute name in collection."));
      v70 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 220, CFSTR("Invalid named IPP attribute in collection."), v70);
    }
    if (LOWORD(__dst[0]))
    {
      if ((_DWORD)v13 != 55)
      {
        if ((_DWORD)v13 == 74)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: member name not empty."));
          v73 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 311, CFSTR("IPP member name is not empty."), v73);
        }
        goto LABEL_34;
      }
    }
    else
    {
      if ((_DWORD)v13 == 16)
      {
LABEL_34:
        IPPIOReader::readString((id *)a1, v16, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PK_ipp_t addNewEmptyAttribute:groupTag:valueTag:](v14, "addNewEmptyAttribute:groupTag:valueTag:", v24, *(unsigned int *)a3, v13);
        v25 = (PK_ipp_attribute_t *)(id)objc_claimAutoreleasedReturnValue();
        v21 = v25;
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: unable to allocate attribute."));
          v72 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 338, CFSTR("ippReadIO: unable to allocate attribute."), v72);
        }
        -[PK_ipp_attribute_t addNewEmptyValue](v25, "addNewEmptyValue");
        v23 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_57;
      }
      if ((_DWORD)v13 != 55)
      {
        if ((_DWORD)v13 == 74)
        {
          if ((a4 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: member attribute outside of collection."));
            v75 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 315, CFSTR("IPP member attribute outside of collection."), v75);
          }
          -[PK_ipp_t addNewEmptyAttribute:groupTag:valueTag:](v14, "addNewEmptyAttribute:groupTag:valueTag:", 0, *(unsigned int *)a3, 0);
          v20 = (PK_ipp_attribute_t *)(id)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: unable to allocate attribute."));
            v76 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 322, CFSTR("ippReadIO: unable to allocate attribute."), v76);
          }
          -[PK_ipp_attribute_t addNewEmptyValue](v20, "addNewEmptyValue");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[PK_ipp_t attrs](v14, "attrs");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastObject");
          v21 = (PK_ipp_attribute_t *)(id)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: Attribute without name and no current."));
            v74 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 231, CFSTR("IPP attribute has no name."), v74);
          }
          v27 = -[PK_ipp_attribute_t value_tag](v21, "value_tag");
          v28 = v27;
          if ((_DWORD)v27)
          {
            if ((v27 - 53) < 2 || (v27 - 65) <= 8)
            {
              if ((v13 - 55) <= 0xFFFFFFFD && (_DWORD)v13 != 19 && (v13 - 74) <= 0xFFFFFFF6)
              {
                v99 = (void *)MEMORY[0x24BDD17C8];
                v100 = ippTagString(v27);
                objc_msgSend(v99, "stringWithFormat:", CFSTR("ippReadIO: 1setOf value tag %x(%s) != %x(%s)"), v28, v100, v13, ippTagString(v13));
                v101 = (NSString *)objc_claimAutoreleasedReturnValue();
                IPPIOReader::THROW_FAIL(a1, 258, CFSTR("IPP 1setOf attribute with incompatible value tags."), v101);
              }
              if ((_DWORD)v27 != (_DWORD)v13 && !ippCoerceAttrToValue(v14, v21, v13))
              {
                v95 = (void *)MEMORY[0x24BDD17C8];
                -[PK_ipp_attribute_t name](v21, "name");
                v96 = objc_claimAutoreleasedReturnValue();
                v97 = ippTagString(v28);
                objc_msgSend(v95, "stringWithFormat:", CFSTR("ippReadIO: Failed to convert %@ attribute from %s to %s."), v96, v97, ippTagString(v13));
                v98 = (NSString *)objc_claimAutoreleasedReturnValue();
                IPPIOReader::THROW_FAIL(a1, 267, CFSTR("IPP 1setOf attribute with incompatible value tags."), v98);
              }
            }
            else if ((_DWORD)v27 == 51 || (_DWORD)v27 == 33)
            {
              if ((_DWORD)v13 != 33 && (_DWORD)v13 != 51)
              {
                v105 = (void *)MEMORY[0x24BDD17C8];
                v106 = ippTagString(v27);
                objc_msgSend(v105, "stringWithFormat:", CFSTR("ippReadIO: 1setOf value tag %x(%s) != %x(%s)"), v28, v106, v13, ippTagString(v13));
                v107 = (NSString *)objc_claimAutoreleasedReturnValue();
                IPPIOReader::THROW_FAIL(a1, 280, CFSTR("IPP 1setOf attribute with incompatible value tags."), v107);
              }
              if ((_DWORD)v13 == 51 && (_DWORD)v27 == 33)
                ippCoerceAttrToValue(v14, v21, 51);
            }
            else if ((_DWORD)v27 != (_DWORD)v13)
            {
              v102 = (void *)MEMORY[0x24BDD17C8];
              v103 = ippTagString(v27);
              objc_msgSend(v102, "stringWithFormat:", CFSTR("ippReadIO: value tag %x(%s) != %x(%s)"), v28, v103, v13, ippTagString(v13));
              v104 = (NSString *)objc_claimAutoreleasedReturnValue();
              IPPIOReader::THROW_FAIL(a1, 295, CFSTR("IPP 1setOf attribute with incompatible value tags."), v104);
            }
          }
          else
          {
            -[PK_ipp_attribute_t setValueTag:](v21, "setValueTag:", v13);
          }
          -[PK_ipp_attribute_t addNewEmptyValue](v21, "addNewEmptyValue");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v22;
        goto LABEL_57;
      }
    }
    v21 = 0;
    v23 = 0;
LABEL_57:

    v29 = v21;
    v30 = v23;
    v17 = v29;
    v18 = v30;
    IPPIOReader::read(a1, (unsigned __int8 *)__dst, 2uLL);
    v31 = LOWORD(__dst[0]);
    v32 = __rev16(LOWORD(__dst[0]));
    if (v32 > 0x8000)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad value length %d."), v32);
      v69 = (NSString *)objc_claimAutoreleasedReturnValue();
      IPPIOReader::THROW_FAIL(a1, 372, CFSTR("IPP value larger than 32767 bytes."), v69);
    }
    switch((int)v13)
    {
      case 16:
      case 17:
      case 18:
      case 19:
      case 21:
      case 22:
      case 23:
        if (-[PK_ipp_attribute_t value_tag](v17, "value_tag") != (_DWORD)v13)
          goto LABEL_62;
        if (!v31)
          goto LABEL_67;
        -[PK_ipp_attribute_t setValueTag:](v17, "setValueTag:", 65);
LABEL_62:
        v33 = (void *)objc_msgSend(v18, "string");
        v35 = v34;
        IPPIOReader::readString((id *)a1, v32, ((v13 - 67) < 7) & (0x73u >> (v13 - 67)));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = v33;
        v38 = v36;
        v39 = v38;
        if (v18)
        {
          objc_msgSend(v18, "setString:", v33, v38);
        }
        else
        {

        }
LABEL_66:

LABEL_67:
        if ((_DWORD)v13 == 16)
        {
          -[PK_ipp_attribute_t values](v17, "values");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "removeAllObjects");

        }
LABEL_103:
        v19 = 0;
        break;
      case 33:
      case 35:
        if (LOWORD(__dst[0]) != 1024)
        {
          if ((_DWORD)v13 == 33)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad integer value length %d."), v32);
            v83 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 382, CFSTR("IPP integer value not 4 bytes."), v83);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad integer value length %d."), v32);
          v85 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 384, CFSTR("IPP enum value not 4 bytes."), v85);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        v41 = __dst[0];
        v42 = -[PK_ipp_attribute_t value_tag](v17, "value_tag");
        v43 = bswap32(v41);
        if (v42 == 51)
        {
          v113[0] = v43;
          v113[1] = v43;
          objc_msgSend(v18, "setRange:", v113);
        }
        else
        {
          objc_msgSend(v18, "setInteger:", v43);
        }
        goto LABEL_102;
      case 34:
        if (LOWORD(__dst[0]) != 256)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad BOOLean value length %d."), v32);
          v93 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 398, CFSTR("IPP BOOLean value not 1 byte."), v93);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 1uLL);
        objc_msgSend(v18, "setBoolean:", LOBYTE(__dst[0]) != 0);
        goto LABEL_102;
      case 49:
        if (LOWORD(__dst[0]) != 2816)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad date value length %d."), v32);
          v92 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 446, CFSTR("IPP date value not 11 bytes."), v92);
        }
        v59 = (unsigned __int8 *)IPPIOReader::autoAlloc((id *)a1, 0xCuLL);
        IPPIOReader::read(a1, v59, 0xBuLL);
        goto LABEL_102;
      case 50:
        if (LOWORD(__dst[0]) != 2304)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad resolution value length %d."), v32);
          v91 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 455, CFSTR("IPP resolution value not 9 bytes."), v91);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        v61 = __dst[0];
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        v62 = __dst[0];
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 1uLL);
        objc_msgSend(v18, "setResolution:", bswap64(v62 | (v61 << 32)), validate_enum<ipp_res_e,unsigned char>(LOBYTE(__dst[0])));
        goto LABEL_102;
      case 51:
        if (LOWORD(__dst[0]) != 2048)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad rangeOfInteger value length %d."), v32);
          v90 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 470, CFSTR("IPP rangeOfInteger value not 8 bytes."), v90);
        }
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        v63 = __dst[0];
        IPPIOReader::read(a1, (unsigned __int8 *)__dst, 4uLL);
        v112[0] = bswap32(v63);
        v112[1] = bswap32(__dst[0]);
        objc_msgSend(v18, "setRange:", v112);
        goto LABEL_102;
      case 52:
        v64 = (void *)objc_opt_new();
        objc_msgSend(v18, "setCollection:", v64);

        if (v31)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: begCollection tag with value length > 0."));
          v89 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 557, CFSTR("IPP begCollection value not 0 bytes."), v89);
        }
        __dst[0] = 19;
        v111 = IPP_STATE_IDLE;
        v65 = (void *)MEMORY[0x227667A1C]();
        objc_msgSend(v18, "collection");
        v66 = (PK_ipp_t *)objc_claimAutoreleasedReturnValue();
        ippReadWithReader(a1, &v111, (ipp_tag_e *)__dst, 1, v66);

        objc_autoreleasePoolPop(v65);
        goto LABEL_102;
      case 53:
      case 54:
        if (v32 <= 3)
        {
          if ((_DWORD)v13 == 53)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad stringWithLanguage value length %d."), v32);
            v82 = (NSString *)objc_claimAutoreleasedReturnValue();
            IPPIOReader::THROW_FAIL(a1, 485, CFSTR("IPP textWithLanguage value less than minimum 4 bytes."), v82);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad stringWithLanguage value length %d."), v32);
          v84 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 487, CFSTR("IPP nameWithLanguage value less than minimum 4 bytes."), v84);
        }
        v44 = (unsigned __int8 *)IPPIOReader::autoAlloc((id *)a1, v32 + 1);
        IPPIOReader::read(a1, v44, v32);
        v45 = v44 + 2;
        v46 = __rev16(*(unsigned __int16 *)v44);
        if (v46 > 0x3FF || (v47 = (unint64_t)&v44[v32], (unint64_t)v45 + v46 > v47))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad language value length %d."), v46);
          v81 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 510, CFSTR("IPP language length overflows value."), v81);
        }
        if (v46 >= 0x40)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad language value length %d."), v46);
          v80 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 514, CFSTR("IPP language length too large."), v80);
        }
        memcpy(__dst, v45, v46);
        *((_BYTE *)__dst + v46) = 0;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __dst);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v48)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: language value length %d."), v46);
          v79 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 522, CFSTR("IPP string langauge invalid UTF8."), v79);
        }
        v49 = &v44[v46];
        v51 = *((unsigned __int16 *)v49 + 1);
        v50 = v49 + 2;
        v52 = __rev16(v51);
        if ((unint64_t)&v50[v52 + 2] > v47)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad string value length %d."), v52);
          v78 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 530, CFSTR("IPP string length overflows value."), v78);
        }
        v50[v52 + 2] = 0;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v53)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: string value length %d."), v52);
          v77 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 537, CFSTR("IPP string text invalid UTF8."), v77);
        }
        v54 = v48;
        v55 = v53;
        v56 = v54;
        v57 = v55;
        v58 = v57;
        if (v18)
        {
          objc_msgSend(v18, "setString:", v56, v57);
        }
        else
        {

        }
        goto LABEL_102;
      case 55:
        if (LOWORD(__dst[0]))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: endCollection tag with value length > 0."));
          v88 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 572, CFSTR("IPP endCollection value not 0 bytes."), v88);
        }

        goto LABEL_26;
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
        goto LABEL_62;
      case 74:
        if (!v17)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: Member name without attribute."));
          v87 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 586, CFSTR("IPP memberName with no attribute."), v87);
        }
        if (!LOWORD(__dst[0]))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: Empty member name value."));
          v86 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 591, CFSTR("IPP memberName value is empty."), v86);
        }
        IPPIOReader::readString((id *)a1, v32, 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[PK_ipp_attribute_t setNSName:](v17, "setNSName:", v60);

        -[PK_ipp_attribute_t toss_last_value](v17, "toss_last_value");
LABEL_102:

        goto LABEL_103;
      default:
        if ((_DWORD)v13 == 48 && (v32 & 0x8000) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ippReadIO: bad octetString value length %d."), 0x8000);
          v94 = (NSString *)objc_claimAutoreleasedReturnValue();
          IPPIOReader::THROW_FAIL(a1, 610, CFSTR("IPP octetString length too large."), v94);
        }
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v32);
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        IPPIOReader::read(a1, (unsigned __int8 *)objc_msgSend(v37, "bytes"), v32);
        objc_msgSend(v18, "setUnknown:", v37);
        goto LABEL_66;
    }
    goto LABEL_104;
  }
  if (v9 == IPP_STATE_HEADER)
  {
LABEL_5:
    v10 = v108;
    if ((a4 & 1) == 0)
    {
      IPPIOReader::read(a1, (unsigned __int8 *)__dst, 8uLL);
      -[PK_ipp_t setOp_or_status:](v10, "setOp_or_status:", bswap32(HIWORD(__dst[0])) >> 16);
      -[PK_ipp_t setRequest_id:](v10, "setRequest_id:", bswap32(__dst[1]));
    }
    *v109 = IPP_STATE_ATTRIBUTE;
    *a3 = IPP_TAG_ZERO;

    goto LABEL_8;
  }
  if (v9 == IPP_STATE_IDLE)
  {
    *a2 = IPP_STATE_HEADER;
    goto LABEL_5;
  }
LABEL_107:

}

void sub_220FA02A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void IPPIOReader::IPPIOReader(IPPIOReader *this, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), void *a3)
{
  uint64_t v4;
  void *v5;

  *(_QWORD *)this = a3;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = v4;

}

void sub_220FA05B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

uint64_t IPPIOReader::read(IPPIOReader *this, unsigned __int8 *__b, size_t a3)
{
  uint64_t result;
  NSObject *v7;
  id v8;
  uint8_t v9[16];

  memset(__b, 120, a3);
  result = (*((uint64_t (**)(_QWORD, unsigned __int8 *, size_t))this + 1))(*(_QWORD *)this, __b, a3);
  if (result != a3)
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_ERROR, "Failed to read data from ipp record", v9, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("failed to read enough"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  *((_QWORD *)this + 2) += a3;
  return result;
}

void IPPIOReader::THROW_FAIL(IPPIOReader *this, uint64_t a2, NSString *a3, NSString *a4)
{
  NSString *v6;
  NSString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PKLogCategory(PKLogCategoryDefault[0]);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    v15 = a2;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_ERROR, "IPPIOReader: Failure on line %d: %{public}@ - %{public}@", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2, CFSTR("line"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = v6;
  v12[1] = CFSTR("msg");
  v12[2] = CFSTR("log");
  v13[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), v6, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v11);
}

void sub_220FA07EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id IPPIOReader::readString(id *this, unint64_t a2, int a3)
{
  unsigned __int8 *p_b;
  void *v7;
  unsigned __int8 __b;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 0x101)
    p_b = (unsigned __int8 *)IPPIOReader::autoAlloc(this, a2);
  else
    p_b = &__b;
  IPPIOReader::read((IPPIOReader *)this, p_b, a2);
  if (a3)
  {
    internUTF8ByteString((const char *)p_b, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", p_b, a2, 4);
  }
  if (!v7)
    IPPIOReader::THROW_FAIL((IPPIOReader *)this, 91, CFSTR("Invalid UTF8 bytes"), CFSTR("Invalid UTF8 bytes"));
  return v7;
}

uint64_t IPPIOReader::autoAlloc(id *this, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  if (objc_msgSend(this[3], "count"))
  {
    objc_msgSend(this[3], "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length") + a2 < 0x400)
      goto LABEL_10;
  }
  else
  {
    v5 = 0;
  }
  if (a2 <= 0x400)
    v6 = 1024;
  else
    v6 = a2;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v7;
  objc_msgSend(this[3], "addObject:", v7);
LABEL_10:
  v8 = objc_msgSend(v5, "length");
  objc_msgSend(v5, "setLength:", v8 + a2);
  v9 = objc_retainAutorelease(v5);
  v10 = objc_msgSend(v9, "mutableBytes") + v8;

  return v10;
}

void sub_220FA09E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t withNamedAttrGet<BOOL>(void *a1, uint64_t a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
    v8 = v5[2](v5, v7);
  else
    v8 = 0;

  return v8;
}

void sub_220FA0A78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___Z12getNamedAttrIbET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLean");

  return v4;
}

void sub_220FA0AE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t withNamedAttrGet<int>(void *a1, uint64_t a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
    v8 = v5[2](v5, v7);
  else
    v8 = 0;

  return v8;
}

void sub_220FA0B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___Z12getNamedAttrIiET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integer");

  return v4;
}

void sub_220FA0BF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t getNamedAttr<ipp_orient_e>(void *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = withNamedAttrGet<int>(v3, (uint64_t)v4, &__block_literal_global_2);
  v6 = validate_enum<ipp_orient_e,unsigned char>(v5);

  return v6;
}

void sub_220FA0C70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void withNamedAttrGet<ipp_value_range_t>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "num_values"))
    v9[2](v9, v8);
  else
    *a4 = 0;

}

void sub_220FA0D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrI17ipp_value_range_tET_P8PK_ipp_tP8NSString_block_invoke(void *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "range");
  else
    *a2 = 0;

}

void sub_220FA0D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id getNamedAttr<PK_ipp_collection_t * {__strong}>(void *a1, uint64_t a2)
{
  withNamedAttrGet<PK_ipp_collection_t * {__strong}>(a1, a2, &__block_literal_global_11);
  return (id)objc_claimAutoreleasedReturnValue();
}

id withNamedAttrGet<PK_ipp_collection_t * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    v5[2](v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_220FA0E54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP19PK_ipp_collection_tET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_220FA0EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSString * {__strong}>(void *a1, uint64_t a2)
{
  withNamedAttrGet<NSString * {__strong}>(a1, a2, &__block_literal_global_15);
  return (id)objc_claimAutoreleasedReturnValue();
}

id withNamedAttrGet<NSString * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    v5[2](v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_220FA0F88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP8NSStringET_P8PK_ipp_tS1__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v2 = a2;
  objc_msgSend(v2, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "string");
  v7 = v6;

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _PKLogCategory(PKLogCategoryFramework);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_ERROR, "attribute value expected to be a string", v10, 2u);
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return v7;
}

void sub_220FA1098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSURL * {__strong}>(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;

  getNamedAttr<NSString * {__strong}>(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_220FA1128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSString *> * {__strong}>(void *a1, uint64_t a2)
{
  withNamedAttrGet<NSArray<NSString *> * {__strong}>(a1, a2, &__block_literal_global_18);
  return (id)objc_claimAutoreleasedReturnValue();
}

id withNamedAttrGet<NSArray<NSString *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    v5[2](v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_220FA11DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSStringEET_P8PK_ipp_tS2__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSStringEET_P8PK_ipp_tS2__block_invoke_2;
  v6[3] = &unk_24E6CAF00;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateValues:", v6);

  return v4;
}

void sub_220FA1288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSStringEET_P8PK_ipp_tS2__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v9 = v4;
  v6 = (void *)objc_msgSend(v4, "string");
  v8 = v7;
  objc_msgSend(v5, "addObject:", v7);

}

void sub_220FA1308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSNumber *> * {__strong}>(void *a1, uint64_t a2)
{
  withNamedAttrGet<NSArray<NSNumber *> * {__strong}>(a1, a2, &__block_literal_global_21);
  return (id)objc_claimAutoreleasedReturnValue();
}

id withNamedAttrGet<NSArray<NSNumber *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    v5[2](v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_220FA13D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSNumberEET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSNumberEET_P8PK_ipp_tP8NSString_block_invoke_2;
  v6[3] = &unk_24E6CAF00;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateValues:", v6);

  return v4;
}

void sub_220FA147C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP8NSNumberEET_P8PK_ipp_tP8NSString_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)objc_msgSend(v4, "integer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void sub_220FA1504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<NSData *> * {__strong}>(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke;
  v9[3] = &unk_24E6CAF50;
  v10 = v4;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  withNamedAttrGet<NSArray<NSData *> * {__strong}>(v5, (uint64_t)v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_220FA15D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id withNamedAttrGet<NSArray<NSData *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    v5[2](v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_220FA167C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke_2;
  v13 = &unk_24E6CAF28;
  v15 = &v16;
  v5 = v4;
  v14 = v5;
  objc_msgSend(v3, "enumerateValues:", &v10);
  if (*((_BYTE *)v17 + 24) && objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_ERROR, "Expected ipp record with empty data value to be completely empty for %@ (%@)", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v16, 8);

  return v5;
}

void sub_220FA1804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP6NSDataEET_P8PK_ipp_tP8NSString_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "unknown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "unknown");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void sub_220FA18C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<PK_ipp_collection_t *> * {__strong}>(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke;
  v9[3] = &unk_24E6CAF50;
  v10 = v4;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  withNamedAttrGet<NSArray<PK_ipp_collection_t *> * {__strong}>(v5, (uint64_t)v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_220FA1990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id withNamedAttrGet<NSArray<PK_ipp_collection_t *> * {__strong}>(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a1, "_findAttribute0:valueTag:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "num_values"))
  {
    v5[2](v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_220FA1A38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke_2;
  v13 = &unk_24E6CAF28;
  v15 = &v16;
  v5 = v4;
  v14 = v5;
  objc_msgSend(v3, "enumerateValues:", &v10);
  if (*((_BYTE *)v17 + 24) && objc_msgSend(v5, "count", v10, v11, v12, v13))
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_ERROR, "Expected ipp record with empty collection value to be completely empty for %@ (%@)", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v16, 8);

  return v5;
}

void sub_220FA1BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___Z12getNamedAttrIU8__strongP7NSArrayIP19PK_ipp_collection_tEET_P8PK_ipp_tP8NSString_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void sub_220FA1C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

PKMediaSize *getNamedAttr<PKMediaSize * {__strong}>(void *a1, uint64_t a2)
{
  void *v2;
  PKMediaSize *v3;

  getNamedAttr<PK_ipp_collection_t * {__strong}>(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[PKCollectionSpecialization initWithCollection:]([PKMediaSize alloc], "initWithCollection:", v2);
  else
    v3 = 0;

  return v3;
}

void sub_220FA1CEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id getNamedMediaAttrArray(PK_ipp_t *a1, NSString *a2, objc_class *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  objc_class *v11;

  -[PK_ipp_t _findAttribute0:valueTag:](a1, "_findAttribute0:valueTag:", a2, 52);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "num_values"))
  {
    v6 = (void *)objc_opt_new();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZL22getNamedMediaAttrArrayP8PK_ipp_tP8NSStringP10objc_class_block_invoke;
    v9[3] = &unk_24E6CAF78;
    v7 = v6;
    v10 = v7;
    v11 = a3;
    objc_msgSend(v5, "enumerateValues:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_220FA1DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

id getNamedAttr<NSArray<PKMediaCol *> * {__strong}>(void *a1, void *a2)
{
  PK_ipp_t *v3;
  NSString *v4;
  objc_class *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  getNamedMediaAttrArray(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_220FA1E50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

PKMediaSourceProperties *getNamedAttr<PKMediaSourceProperties * {__strong}>(void *a1, uint64_t a2)
{
  void *v2;
  PKMediaSourceProperties *v3;

  getNamedAttr<PK_ipp_collection_t * {__strong}>(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[PKCollectionSpecialization initWithCollection:]([PKMediaSourceProperties alloc], "initWithCollection:", v2);
  else
    v3 = 0;

  return v3;
}

void sub_220FA1EB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL Printd_Parameters::_has_LandscapeOrientationRequestedPreferred(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("landscape-orientation-requested-preferred"), 35) != 0;
}

uint64_t Printd_Parameters::_get_LandscapeOrientationRequestedPreferred(void **this)
{
  return getNamedAttr<ipp_orient_e>(*this, CFSTR("landscape-orientation-requested-preferred"));
}

BOOL Printd_Parameters::_has_DocumentPasswordSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("document-password-supported"), 33) != 0;
}

BOOL Printd_Parameters::_has_JpegFeaturesSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("jpeg-features-supported"), 68) != 0;
}

id Printd_Parameters::_get_JpegFeaturesSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("jpeg-features-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrintScalingSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("print-scaling-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterMandatoryJobAttributes(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("printer-mandatory-job-attributes"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterStateReasons(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("printer-state-reasons"));
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL Printd_Parameters::_has_CopiesSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("copies-supported"), 51) != 0;
}

double __copy_helper_block_ea8_32c23_ZTS17ipp_value_range_t(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 32);
  *(double *)(a1 + 32) = result;
  return result;
}

void Printd_Parameters::_get_CopiesSupported(void **this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, (uint64_t)CFSTR("copies-supported"), &__block_literal_global_4, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_JpegKOctetsSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("jpeg-k-octets-supported"), 51) != 0;
}

void Printd_Parameters::_get_JpegKOctetsSupported(void **this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, (uint64_t)CFSTR("jpeg-k-octets-supported"), &__block_literal_global_4, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_JpegXDimensionSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("jpeg-x-dimension-supported"), 51) != 0;
}

void Printd_Parameters::_get_JpegXDimensionSupported(void **this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, (uint64_t)CFSTR("jpeg-x-dimension-supported"), &__block_literal_global_4, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_JpegYDimensionSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("jpeg-y-dimension-supported"), 51) != 0;
}

void Printd_Parameters::_get_JpegYDimensionSupported(void **this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, (uint64_t)CFSTR("jpeg-y-dimension-supported"), &__block_literal_global_4, v3);
  *a2 = v3[0];
}

BOOL Printd_Parameters::_has_PdfKOctetsSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("pdf-k-octets-supported"), 51) != 0;
}

void Printd_Parameters::_get_PdfKOctetsSupported(void **this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  withNamedAttrGet<ipp_value_range_t>(*this, (uint64_t)CFSTR("pdf-k-octets-supported"), &__block_literal_global_4, v3);
  *a2 = v3[0];
}

id Printd_Parameters::_get_PrinterDeviceId(void **this)
{
  getNamedAttr<NSString * {__strong}>(*this, (uint64_t)CFSTR("printer-device-id"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterChargeInfoUri(void **this)
{
  getNamedAttr<NSURL * {__strong}>(*this, (uint64_t)CFSTR("printer-charge-info-uri"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterMoreInfo(void **this)
{
  getNamedAttr<NSURL * {__strong}>(*this, (uint64_t)CFSTR("printer-more-info"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterSupplyInfoURI(void **this)
{
  getNamedAttr<NSURL * {__strong}>(*this, (uint64_t)CFSTR("printer-supply-info-uri"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_JobPresetsSupported(void **this)
{
  getNamedAttr<NSArray<PK_ipp_collection_t *> * {__strong}>(*this, CFSTR("job-presets-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_DocumentFormatSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("document-format-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaColSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("media-col-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaColReady(void **this)
{
  getNamedAttr<NSArray<PKMediaCol *> * {__strong}>(*this, CFSTR("media-col-ready"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaColDatabase(void **this)
{
  getNamedAttr<NSArray<PKMediaCol *> * {__strong}>(*this, CFSTR("media-col-database"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrintColorModeSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("print-color-mode-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrintQualitySupported(void **this)
{
  getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, (uint64_t)CFSTR("print-quality-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_SidesSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("sides-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_FinishingsSupported(void **this)
{
  getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, (uint64_t)CFSTR("finishings-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_FinishingsColDatabase(void **this)
{
  getNamedAttr<NSArray<PK_ipp_collection_t *> * {__strong}>(*this, CFSTR("finishings-col-database"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_OutputBinDefault(void **this)
{
  getNamedAttr<NSString * {__strong}>(*this, (uint64_t)CFSTR("output-bin-default"));
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL Printd_Parameters::_has_JobAccountIDSupported(id *this)
{
  return objc_msgSend(*this, "_findAttribute0:valueTag:", CFSTR("job-account-id-supported"), 34) != 0;
}

uint64_t Printd_Parameters::_get_JobAccountIDSupported(void **this)
{
  return withNamedAttrGet<BOOL>(*this, (uint64_t)CFSTR("job-account-id-supported"), &__block_literal_global_1);
}

id Printd_Parameters::_get_IdentifyActionsSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("identify-actions-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaTypeSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("media-type-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_OutputBinSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("output-bin-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterOutputTray(void **this)
{
  getNamedAttr<NSArray<NSData *> * {__strong}>(*this, CFSTR("printer-output-tray"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaSourceSupported(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("media-source-supported"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_PrinterInputTray(void **this)
{
  getNamedAttr<NSArray<NSData *> * {__strong}>(*this, CFSTR("printer-input-tray"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MarkerNames(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("marker-names"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MarkerColors(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("marker-colors"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MarkerTypes(void **this)
{
  getNamedAttr<NSArray<NSString *> * {__strong}>(*this, (uint64_t)CFSTR("marker-types"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MarkerLevels(void **this)
{
  getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, (uint64_t)CFSTR("marker-levels"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MarkerHighLevels(void **this)
{
  getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, (uint64_t)CFSTR("marker-high-levels"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MarkerLowLevels(void **this)
{
  getNamedAttr<NSArray<NSNumber *> * {__strong}>(*this, (uint64_t)CFSTR("marker-low-levels"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaSize(void **this)
{
  getNamedAttr<PKMediaSize * {__strong}>(*this, (uint64_t)CFSTR("media-size"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaSourceProperties(void **this)
{
  getNamedAttr<PKMediaSourceProperties * {__strong}>(*this, (uint64_t)CFSTR("media-source-properties"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaSource(void **this)
{
  getNamedAttr<NSString * {__strong}>(*this, (uint64_t)CFSTR("media-source"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaType(void **this)
{
  getNamedAttr<NSString * {__strong}>(*this, (uint64_t)CFSTR("media-type"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_MediaKey(void **this)
{
  getNamedAttr<NSString * {__strong}>(*this, (uint64_t)CFSTR("media-key"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id Printd_Parameters::_get_FeedDirection(void **this)
{
  getNamedAttr<NSString * {__strong}>(*this, (uint64_t)CFSTR("media-source-feed-direction"));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t Printd_Parameters::_get_FeedOrientation(void **this)
{
  return getNamedAttr<ipp_orient_e>(*this, CFSTR("media-source-feed-orientation"));
}

void ___ZL22getNamedMediaAttrArrayP8PK_ipp_tP8NSStringP10objc_class_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_alloc(*(Class *)(a1 + 40));
    objc_msgSend(v9, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCollection:", v7);
    objc_msgSend(v5, "addObject:", v8);

  }
}

void sub_220FA511C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t ippWriteIO(void *a1, uint64_t (*a2)(void *, unsigned __int8 *, unint64_t), PK_ipp_t *a3)
{
  PK_ipp_t *v5;
  PK_ipp_t *v6;
  uint64_t v7;
  void *v9[2];
  char *v10;
  char *v11;
  char *v12;
  ipp_state_e v13;
  ipp_tag_e v14[7];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v13 = IPP_STATE_IDLE;
  v14[0] = IPP_TAG_NOVALUE;
  v7 = 0xFFFFFFFFLL;
  if (a1 && v5)
  {
    v9[0] = a1;
    v9[1] = a2;
    v10 = (char *)malloc_type_malloc(0x8001uLL, 0x11478DC1uLL);
    v11 = v10;
    v12 = v10 + 32769;
    ippWriteWithWriter((IPPIOWriter *)v9, &v13, v14, 0, v6);
    v7 = 3;
    IPPIOWriter::~IPPIOWriter(v9);
  }

  return v7;
}

void ippWriteWithWriter(IPPIOWriter *a1, ipp_state_e *a2, ipp_tag_e *a3, char a4, PK_ipp_t *a5)
{
  PK_ipp_t *v9;
  PK_ipp_t *v10;
  ipp_state_e v11;
  PK_ipp_t *v12;
  uint64_t v13;
  unsigned __int16 v14;
  unsigned int v15;
  PK_ipp_t *v16;
  uint64_t v17;
  PK_ipp_t *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  PK_ipp_t *v24;
  ipp_tag_e *v25;
  IPPIOWriter *v26;
  ipp_state_e *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, _BYTE *);
  void *v32;
  char *v33;

  v9 = a5;
  v10 = v9;
  v11 = *a2;
  if (*a2 != IPP_STATE_ATTRIBUTE)
  {
    if (v11 != IPP_STATE_HEADER)
    {
      if (v11)
        goto LABEL_12;
      *a2 = IPP_STATE_HEADER;
    }
    v12 = v9;
    if ((a4 & 1) == 0)
    {
      LOBYTE(v29) = 2;
      v13 = MEMORY[0x24BDAC760];
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      LOBYTE(v29) = 0;
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      v14 = -[PK_ipp_t op_or_status](v12, "op_or_status");
      LOBYTE(v29) = HIBYTE(v14);
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      LOBYTE(v29) = v14;
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      v15 = -[PK_ipp_t request_id](v12, "request_id");
      LOBYTE(v29) = HIBYTE(v15);
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      LOBYTE(v29) = BYTE2(v15);
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      LOBYTE(v29) = BYTE1(v15);
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
      LOBYTE(v29) = v15;
      v20 = v13;
      v21 = 3221225472;
      v22 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v23 = &__block_descriptor_40_e8_v16__0_8l;
      v24 = (PK_ipp_t *)&v29;
      IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v20);
    }
    IPPIOWriter::flush((uint64_t)a1);
    *a2 = IPP_STATE_ATTRIBUTE;
    *a3 = IPP_TAG_ZERO;

    IPPIOWriter::flush((uint64_t)a1);
  }
  v16 = v10;
  v17 = MEMORY[0x24BDAC760];
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = ___ZL25writeAllCurrentAttributesR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP8PK_ipp_tb_block_invoke;
  v23 = &unk_24E6CAFC0;
  v28 = a4;
  v25 = a3;
  v26 = a1;
  v27 = a2;
  v18 = v16;
  v24 = v18;
  -[PK_ipp_t enumerateAttributes:](v18, "enumerateAttributes:", &v20);
  if ((a4 & 1) != 0)
  {
    v19 = 55;
    v29 = v17;
    v30 = 3221225472;
    v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v32 = &__block_descriptor_40_e8_v16__0_8l;
    v33 = &v19;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v29);
    v19 = 0;
    v29 = v17;
    v30 = 3221225472;
    v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v32 = &__block_descriptor_40_e8_v16__0_8l;
    v33 = &v19;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v29);
    v19 = 0;
    v29 = v17;
    v30 = 3221225472;
    v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v32 = &__block_descriptor_40_e8_v16__0_8l;
    v33 = &v19;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v29);
    v19 = 0;
    v29 = v17;
    v30 = 3221225472;
    v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v32 = &__block_descriptor_40_e8_v16__0_8l;
    v33 = &v19;
    IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v29);
    v19 = 0;
  }
  else
  {
    v19 = 3;
  }
  v29 = v17;
  v30 = 3221225472;
  v31 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v32 = &__block_descriptor_40_e8_v16__0_8l;
  v33 = &v19;
  IPPIOWriter::withBufferN((uint64_t)a1, 1uLL, &v29);
  IPPIOWriter::flush((uint64_t)a1);
  *a2 = IPP_STATE_DATA;

  IPPIOWriter::flush((uint64_t)a1);
LABEL_12:

}

void sub_220FA569C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

uint64_t IPPIOWriter::flush(uint64_t this)
{
  uint64_t v1;
  id v2;

  if ((uint64_t)(*(_QWORD *)(this + 24) - *(_QWORD *)(this + 16)) >= 1)
  {
    v1 = this;
    this = (*(uint64_t (**)(_QWORD))(this + 8))(*(_QWORD *)this);
    if (this <= 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("ipp stream write failure"), 0);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v2);
    }
    *(_QWORD *)(v1 + 24) = *(_QWORD *)(v1 + 16);
  }
  return this;
}

void IPPIOWriter::withBufferN(uint64_t a1, size_t a2, void *a3)
{
  char *v5;
  void (**v6)(void);

  v6 = a3;
  v5 = *(char **)(a1 + 24);
  if ((unint64_t)&v5[a2] >= *(_QWORD *)(a1 + 32))
  {
    IPPIOWriter::flush(a1);
    v5 = *(char **)(a1 + 24);
    if ((unint64_t)&v5[a2] >= *(_QWORD *)(a1 + 32))
    {
      free(*(void **)(a1 + 16));
      v5 = (char *)malloc_type_malloc(a2, 0x69155969uLL);
      *(_QWORD *)(a1 + 16) = v5;
      *(_QWORD *)(a1 + 24) = v5;
      *(_QWORD *)(a1 + 32) = &v5[a2];
    }
  }
  *(_QWORD *)(a1 + 24) = &v5[a2];
  v6[2]();

}

void sub_220FA5824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZN11IPPIOWriterlsERKh_block_invoke(uint64_t result, _BYTE *a2)
{
  *a2 = **(_BYTE **)(result + 32);
  return result;
}

void ___ZL25writeAllCurrentAttributesR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP8PK_ipp_tb_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  char *v57;
  id v58;
  id v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  char *v65;
  uint64_t v66;

  v3 = a2;
  v4 = v3;
  v5 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 64))
    goto LABEL_2;
  v25 = **(_DWORD **)(a1 + 40);
  if (v25 == objc_msgSend(v3, "group_tag"))
  {
    if (!objc_msgSend(v4, "group_tag"))
      goto LABEL_29;
  }
  else
  {
    **(_DWORD **)(a1 + 40) = objc_msgSend(v4, "group_tag");
    if (!objc_msgSend(v4, "group_tag"))
      goto LABEL_29;
    v28 = *(_QWORD *)(a1 + 48);
    v60 = objc_msgSend(v4, "group_tag");
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v28, 1uLL, &v61);
  }
  if (*(_BYTE *)(a1 + 64))
  {
LABEL_2:
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 >= 32758)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("'attr.name' value length too large"), 0);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v58);
    }
    v8 = *(_QWORD *)(a1 + 48);
    v60 = 74;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v8, 1uLL, &v61);
    v9 = *(_QWORD *)(a1 + 48);
    v60 = 0;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v9, 1uLL, &v61);
    v10 = *(_QWORD *)(a1 + 48);
    v60 = 0;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v10, 1uLL, &v61);
    v11 = *(_QWORD *)(a1 + 48);
    v60 = BYTE1(v7);
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v11, 1uLL, &v61);
    v12 = *(_QWORD *)(a1 + 48);
    v60 = v7;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v12, 1uLL, &v61);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "name");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (char *)objc_msgSend(v14, "UTF8String");
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    v64 = &__block_descriptor_48_e8_v16__0_8l;
    v65 = v15;
    v66 = v7;
    IPPIOWriter::withBufferN(v13, v7, &v61);

    v16 = objc_msgSend(v4, "value_tag");
    v17 = *(_QWORD *)(a1 + 48);
    if (v16 >= 128)
    {
      v60 = 127;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v17, 1uLL, &v61);
      v18 = *(_QWORD *)(a1 + 48);
      v60 = objc_msgSend(v4, "value_tag") >> 24;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v18, 1uLL, &v61);
      v19 = *(_QWORD *)(a1 + 48);
      v60 = objc_msgSend(v4, "value_tag") >> 16;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v19, 1uLL, &v61);
      v20 = *(_QWORD *)(a1 + 48);
      v60 = (unsigned __int16)objc_msgSend(v4, "value_tag") >> 8;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v20, 1uLL, &v61);
      v17 = *(_QWORD *)(a1 + 48);
    }
    v60 = objc_msgSend(v4, "value_tag");
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v17, 1uLL, &v61);
    v21 = *(_QWORD *)(a1 + 48);
    v60 = 0;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v21, 1uLL, &v61);
    v22 = *(_QWORD *)(a1 + 48);
    v60 = 0;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v22, 1uLL, &v61);
    IPPIOWriter::flush(*(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v4, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30 >= 32762)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("'attr name' value length too large"), 0);
      v59 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v59);
    }
    v31 = objc_msgSend(v4, "value_tag");
    v32 = *(_QWORD *)(a1 + 48);
    if (v31 >= 128)
    {
      v60 = 127;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v32, 1uLL, &v61);
      v33 = *(_QWORD *)(a1 + 48);
      v60 = objc_msgSend(v4, "value_tag") >> 24;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v33, 1uLL, &v61);
      v34 = *(_QWORD *)(a1 + 48);
      v60 = objc_msgSend(v4, "value_tag") >> 16;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v34, 1uLL, &v61);
      v35 = *(_QWORD *)(a1 + 48);
      v60 = (unsigned __int16)objc_msgSend(v4, "value_tag") >> 8;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v35, 1uLL, &v61);
      v32 = *(_QWORD *)(a1 + 48);
    }
    v60 = objc_msgSend(v4, "value_tag");
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v32, 1uLL, &v61);
    v41 = *(_QWORD *)(a1 + 48);
    v60 = BYTE1(v30);
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v41, 1uLL, &v61);
    v42 = *(_QWORD *)(a1 + 48);
    v60 = v30;
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v64 = &__block_descriptor_40_e8_v16__0_8l;
    v65 = &v60;
    IPPIOWriter::withBufferN(v42, 1uLL, &v61);
    v43 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "name");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = (char *)objc_msgSend(v44, "UTF8String");
    v61 = v5;
    v62 = 3221225472;
    v63 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    v64 = &__block_descriptor_48_e8_v16__0_8l;
    v65 = v45;
    v66 = v30;
    IPPIOWriter::withBufferN(v43, v30, &v61);

    IPPIOWriter::flush(*(_QWORD *)(a1 + 48));
  }
  switch(objc_msgSend(v4, "value_tag"))
  {
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
      v26 = *(_QWORD *)(a1 + 48);
      v60 = 0;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v26, 1uLL, &v61);
      v27 = *(_QWORD *)(a1 + 48);
      v60 = 0;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZN11IPPIOWriterlsERKh_block_invoke;
      v64 = &__block_descriptor_40_e8_v16__0_8l;
      v65 = &v60;
      IPPIOWriter::withBufferN(v27, 1uLL, &v61);
      goto LABEL_28;
    case 0x21u:
    case 0x23u:
      v36 = *(_QWORD *)(a1 + 48);
      v37 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL20writeIntegersOrEnumsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v66 = v36;
      v38 = (char *)v37;
      v65 = v38;
      objc_msgSend(v38, "enumerateValues:", &v61);
      IPPIOWriter::flush(v36);
      goto LABEL_27;
    case 0x22u:
      v54 = *(_QWORD *)(a1 + 48);
      v55 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL13writeBooleansR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v66 = v54;
      v38 = (char *)v55;
      v65 = v38;
      objc_msgSend(v38, "enumerateValues:", &v61);
      IPPIOWriter::flush(v54);
LABEL_27:

      goto LABEL_28;
    case 0x31u:
      v48 = *(_QWORD *)(a1 + 48);
      v49 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL10writeDatesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v49;
      v66 = v48;
      objc_msgSend(v49, "enumerateValues:", &v61);
      goto LABEL_8;
    case 0x32u:
      v52 = *(_QWORD *)(a1 + 48);
      v53 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL16writeResolutionsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v53;
      v66 = v52;
      objc_msgSend(v53, "enumerateValues:", &v61);
      goto LABEL_8;
    case 0x33u:
      v50 = *(_QWORD *)(a1 + 48);
      v51 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL11writeRangesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v51;
      v66 = v50;
      objc_msgSend(v51, "enumerateValues:", &v61);
      goto LABEL_8;
    case 0x34u:
      v46 = *(_QWORD *)(a1 + 48);
      v47 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL20writeBeginCollectionR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP18PK_ipp_attribute_tP8PK_ipp_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v47;
      v66 = v46;
      objc_msgSend(v47, "enumerateValues:", &v61);
      goto LABEL_8;
    case 0x35u:
    case 0x36u:
      v39 = *(_QWORD *)(a1 + 48);
      v40 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL14writeTextLangsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v40;
      v66 = v39;
      objc_msgSend(v40, "enumerateValues:", &v61);
      goto LABEL_8;
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
      v23 = *(_QWORD *)(a1 + 48);
      v24 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL12writeStringsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v24;
      v66 = v23;
      objc_msgSend(v24, "enumerateValues:", &v61);
      goto LABEL_8;
    default:
      v56 = *(_QWORD *)(a1 + 48);
      v57 = v4;
      v61 = v5;
      v62 = 3221225472;
      v63 = ___ZL19writeDefaultUnknownR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke;
      v64 = &unk_24E6CB008;
      v65 = v57;
      v66 = v56;
      objc_msgSend(v57, "enumerateValues:", &v61);
LABEL_8:

LABEL_28:
      IPPIOWriter::flush(*(_QWORD *)(a1 + 48));
      break;
  }
LABEL_29:

}

void sub_220FA6190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void ___ZL20writeIntegersOrEnumsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _BYTE *);
  void *v20;
  char *v21;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v16 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v17 = v6;
    v18 = 3221225472;
    v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v20 = &__block_descriptor_40_e8_v16__0_8l;
    v21 = &v16;
    IPPIOWriter::withBufferN(v7, 1uLL, &v17);
    v8 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    v17 = v6;
    v18 = 3221225472;
    v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v20 = &__block_descriptor_40_e8_v16__0_8l;
    v21 = &v16;
    IPPIOWriter::withBufferN(v8, 1uLL, &v17);
    v9 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    v17 = v6;
    v18 = 3221225472;
    v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v20 = &__block_descriptor_40_e8_v16__0_8l;
    v21 = &v16;
    IPPIOWriter::withBufferN(v9, 1uLL, &v17);
  }
  v10 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v10, 1uLL, &v17);
  v11 = *(_QWORD *)(a1 + 40);
  v16 = 4;
  v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v11, 1uLL, &v17);
  v12 = *(_QWORD *)(a1 + 40);
  v16 = objc_msgSend(v5, "integer") >> 24;
  v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v12, 1uLL, &v17);
  v13 = *(_QWORD *)(a1 + 40);
  v16 = objc_msgSend(v5, "integer") >> 16;
  v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v13, 1uLL, &v17);
  v14 = *(_QWORD *)(a1 + 40);
  v16 = (unsigned __int16)objc_msgSend(v5, "integer") >> 8;
  v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v14, 1uLL, &v17);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = objc_msgSend(v5, "integer");
  v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v15, 1uLL, &v17);

}

void sub_220FA64A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL13writeBooleansR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, _BYTE *);
  void *v17;
  char *v18;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v13 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v14 = v6;
    v15 = 3221225472;
    v16 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v17 = &__block_descriptor_40_e8_v16__0_8l;
    v18 = &v13;
    IPPIOWriter::withBufferN(v7, 1uLL, &v14);
    v8 = *(_QWORD *)(a1 + 40);
    v13 = 0;
    v14 = v6;
    v15 = 3221225472;
    v16 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v17 = &__block_descriptor_40_e8_v16__0_8l;
    v18 = &v13;
    IPPIOWriter::withBufferN(v8, 1uLL, &v14);
    v9 = *(_QWORD *)(a1 + 40);
    v13 = 0;
    v14 = v6;
    v15 = 3221225472;
    v16 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v17 = &__block_descriptor_40_e8_v16__0_8l;
    v18 = &v13;
    IPPIOWriter::withBufferN(v9, 1uLL, &v14);
  }
  v10 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v14 = v6;
  v15 = 3221225472;
  v16 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v17 = &__block_descriptor_40_e8_v16__0_8l;
  v18 = &v13;
  IPPIOWriter::withBufferN(v10, 1uLL, &v14);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = 1;
  v14 = v6;
  v15 = 3221225472;
  v16 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v17 = &__block_descriptor_40_e8_v16__0_8l;
  v18 = &v13;
  IPPIOWriter::withBufferN(v11, 1uLL, &v14);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = objc_msgSend(v5, "BOOLean");
  v14 = v6;
  v15 = 3221225472;
  v16 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v17 = &__block_descriptor_40_e8_v16__0_8l;
  v18 = &v13;
  IPPIOWriter::withBufferN(v12, 1uLL, &v14);

}

void sub_220FA6650(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL12writeStringsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char *v29;
  uint64_t v30;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v24 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v25 = v6;
    v26 = 3221225472;
    v27 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v28 = &__block_descriptor_40_e8_v16__0_8l;
    v29 = &v24;
    IPPIOWriter::withBufferN(v7, 1uLL, &v25);
    v8 = *(_QWORD *)(a1 + 40);
    v24 = 0;
    v25 = v6;
    v26 = 3221225472;
    v27 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v28 = &__block_descriptor_40_e8_v16__0_8l;
    v29 = &v24;
    IPPIOWriter::withBufferN(v8, 1uLL, &v25);
    v9 = *(_QWORD *)(a1 + 40);
    v24 = 0;
    v25 = v6;
    v26 = 3221225472;
    v27 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v28 = &__block_descriptor_40_e8_v16__0_8l;
    v29 = &v24;
    IPPIOWriter::withBufferN(v9, 1uLL, &v25);
  }
  v10 = (void *)objc_msgSend(v5, "string");
  v12 = v11;

  if (v12)
  {
    v13 = (void *)objc_msgSend(v5, "string");
    v15 = v14;
    LODWORD(v12) = strlen((const char *)objc_msgSend(v14, "UTF8String"));

    if ((int)v12 >= 0x8000)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("'text' value length too large"), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
  }
  v16 = *(_QWORD *)(a1 + 40);
  v24 = BYTE1(v12);
  v25 = v6;
  v26 = 3221225472;
  v27 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v28 = &__block_descriptor_40_e8_v16__0_8l;
  v29 = &v24;
  IPPIOWriter::withBufferN(v16, 1uLL, &v25);
  v17 = *(_QWORD *)(a1 + 40);
  v24 = (char)v12;
  v25 = v6;
  v26 = 3221225472;
  v27 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v28 = &__block_descriptor_40_e8_v16__0_8l;
  v29 = &v24;
  IPPIOWriter::withBufferN(v17, 1uLL, &v25);
  if ((int)v12 >= 1)
  {
    v18 = *(_QWORD *)(a1 + 40);
    v19 = (void *)objc_msgSend(v5, "string");
    v21 = v20;
    v22 = objc_msgSend(v20, "UTF8String");
    v25 = v6;
    v26 = 3221225472;
    v27 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    v28 = &__block_descriptor_48_e8_v16__0_8l;
    v29 = (char *)v22;
    v30 = v12;
    IPPIOWriter::withBufferN(v18, v12, &v25);

  }
  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));

}

void sub_220FA68A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL10writeDatesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    LOBYTE(v22) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v16 = v6;
    v17 = 3221225472;
    v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v19 = &__block_descriptor_40_e8_v16__0_8l;
    v20 = &v22;
    IPPIOWriter::withBufferN(v7, 1uLL, &v16);
    v8 = *(_QWORD *)(a1 + 40);
    LOBYTE(v22) = 0;
    v16 = v6;
    v17 = 3221225472;
    v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v19 = &__block_descriptor_40_e8_v16__0_8l;
    v20 = &v22;
    IPPIOWriter::withBufferN(v8, 1uLL, &v16);
    v9 = *(_QWORD *)(a1 + 40);
    LOBYTE(v22) = 0;
    v16 = v6;
    v17 = 3221225472;
    v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v19 = &__block_descriptor_40_e8_v16__0_8l;
    v20 = &v22;
    IPPIOWriter::withBufferN(v9, 1uLL, &v16);
  }
  v10 = *(_QWORD *)(a1 + 40);
  LOBYTE(v22) = 0;
  v16 = v6;
  v17 = 3221225472;
  v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v19 = &__block_descriptor_40_e8_v16__0_8l;
  v20 = &v22;
  IPPIOWriter::withBufferN(v10, 1uLL, &v16);
  v11 = *(_QWORD *)(a1 + 40);
  LOBYTE(v22) = 11;
  v16 = v6;
  v17 = 3221225472;
  v18 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v19 = &__block_descriptor_40_e8_v16__0_8l;
  v20 = &v22;
  IPPIOWriter::withBufferN(v11, 1uLL, &v16);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = objc_msgSend(v5, "date");
  v23 = v14;
  v24 = v15;
  v16 = v6;
  v17 = 3221225472;
  v18 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
  v19 = &__block_descriptor_48_e8_v16__0_8l;
  v20 = &v22;
  v21 = 11;
  v22 = v13;
  IPPIOWriter::withBufferN(v12, 0xBuLL, &v16);
  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));

}

void sub_220FA6AC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL16writeResolutionsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, _BYTE *);
  void *v26;
  char *v27;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v22 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v23 = v6;
    v24 = 3221225472;
    v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v26 = &__block_descriptor_40_e8_v16__0_8l;
    v27 = &v22;
    IPPIOWriter::withBufferN(v7, 1uLL, &v23);
    v8 = *(_QWORD *)(a1 + 40);
    v22 = 0;
    v23 = v6;
    v24 = 3221225472;
    v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v26 = &__block_descriptor_40_e8_v16__0_8l;
    v27 = &v22;
    IPPIOWriter::withBufferN(v8, 1uLL, &v23);
    v9 = *(_QWORD *)(a1 + 40);
    v22 = 0;
    v23 = v6;
    v24 = 3221225472;
    v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v26 = &__block_descriptor_40_e8_v16__0_8l;
    v27 = &v22;
    IPPIOWriter::withBufferN(v9, 1uLL, &v23);
  }
  v10 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v10, 1uLL, &v23);
  v11 = *(_QWORD *)(a1 + 40);
  v22 = 9;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v11, 1uLL, &v23);
  v12 = *(_QWORD *)(a1 + 40);
  v22 = objc_msgSend(v5, "resolution") >> 24;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v12, 1uLL, &v23);
  v13 = *(_QWORD *)(a1 + 40);
  v22 = objc_msgSend(v5, "resolution") >> 16;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v13, 1uLL, &v23);
  v14 = *(_QWORD *)(a1 + 40);
  v22 = (unsigned __int16)objc_msgSend(v5, "resolution") >> 8;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v14, 1uLL, &v23);
  v15 = *(_QWORD *)(a1 + 40);
  v22 = objc_msgSend(v5, "resolution");
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v15, 1uLL, &v23);
  v16 = *(_QWORD *)(a1 + 40);
  v22 = (unint64_t)objc_msgSend(v5, "resolution") >> 56;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v16, 1uLL, &v23);
  v17 = *(_QWORD *)(a1 + 40);
  v22 = (unint64_t)objc_msgSend(v5, "resolution") >> 48;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v17, 1uLL, &v23);
  v18 = *(_QWORD *)(a1 + 40);
  v22 = (unsigned __int16)((unint64_t)objc_msgSend(v5, "resolution") >> 32) >> 8;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v18, 1uLL, &v23);
  v19 = *(_QWORD *)(a1 + 40);
  v22 = (unint64_t)objc_msgSend(v5, "resolution") >> 32;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v19, 1uLL, &v23);
  v20 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "resolution");
  v22 = v21;
  v23 = v6;
  v24 = 3221225472;
  v25 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v26 = &__block_descriptor_40_e8_v16__0_8l;
  v27 = &v22;
  IPPIOWriter::withBufferN(v20, 1uLL, &v23);
  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));

}

void sub_220FA6E34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL11writeRangesR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, _BYTE *);
  void *v33;
  uint64_t *v34;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    LOBYTE(v28) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v30 = v6;
    v31 = 3221225472;
    v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v33 = &__block_descriptor_40_e8_v16__0_8l;
    v34 = &v28;
    IPPIOWriter::withBufferN(v7, 1uLL, &v30);
    v8 = *(_QWORD *)(a1 + 40);
    LOBYTE(v28) = 0;
    v30 = v6;
    v31 = 3221225472;
    v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v33 = &__block_descriptor_40_e8_v16__0_8l;
    v34 = &v28;
    IPPIOWriter::withBufferN(v8, 1uLL, &v30);
    v9 = *(_QWORD *)(a1 + 40);
    LOBYTE(v28) = 0;
    v30 = v6;
    v31 = 3221225472;
    v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v33 = &__block_descriptor_40_e8_v16__0_8l;
    v34 = &v28;
    IPPIOWriter::withBufferN(v9, 1uLL, &v30);
  }
  v10 = *(_QWORD *)(a1 + 40);
  LOBYTE(v28) = 0;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = &v28;
  IPPIOWriter::withBufferN(v10, 1uLL, &v30);
  v11 = *(_QWORD *)(a1 + 40);
  LOBYTE(v28) = 8;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = &v28;
  IPPIOWriter::withBufferN(v11, 1uLL, &v30);
  v12 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v13 = BYTE3(v28);
  }
  else
  {
    v13 = 0;
    v28 = 0;
  }
  v29 = v13;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v12, 1uLL, &v30);
  v14 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v15 = BYTE2(v28);
  }
  else
  {
    v15 = 0;
    v28 = 0;
  }
  v29 = v15;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v14, 1uLL, &v30);
  v16 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v17 = BYTE1(v28);
  }
  else
  {
    v17 = 0;
    v28 = 0;
  }
  v29 = v17;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v16, 1uLL, &v30);
  v18 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v19 = v28;
  }
  else
  {
    v19 = 0;
    v28 = 0;
  }
  v29 = v19;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v18, 1uLL, &v30);
  v20 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v21 = HIBYTE(v28);
  }
  else
  {
    v21 = 0;
    v28 = 0;
  }
  v29 = v21;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v20, 1uLL, &v30);
  v22 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v23 = BYTE6(v28);
  }
  else
  {
    v23 = 0;
    v28 = 0;
  }
  v29 = v23;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v22, 1uLL, &v30);
  v24 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v25 = HIDWORD(v28) >> 8;
  }
  else
  {
    LOBYTE(v25) = 0;
    v28 = 0;
  }
  v29 = v25;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v24, 1uLL, &v30);
  v26 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "range");
    v27 = BYTE4(v28);
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  v29 = v27;
  v30 = v6;
  v31 = 3221225472;
  v32 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v33 = &__block_descriptor_40_e8_v16__0_8l;
  v34 = (uint64_t *)&v29;
  IPPIOWriter::withBufferN(v26, 1uLL, &v30);
  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));

}

void sub_220FA7240(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL14writeTextLangsR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  char *v55;
  uint64_t v56;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v50 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v51 = v6;
    v52 = 3221225472;
    v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v54 = &__block_descriptor_40_e8_v16__0_8l;
    v55 = &v50;
    IPPIOWriter::withBufferN(v7, 1uLL, &v51);
    v8 = *(_QWORD *)(a1 + 40);
    v50 = 0;
    v51 = v6;
    v52 = 3221225472;
    v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v54 = &__block_descriptor_40_e8_v16__0_8l;
    v55 = &v50;
    IPPIOWriter::withBufferN(v8, 1uLL, &v51);
    v9 = *(_QWORD *)(a1 + 40);
    v50 = 0;
    v51 = v6;
    v52 = 3221225472;
    v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v54 = &__block_descriptor_40_e8_v16__0_8l;
    v55 = &v50;
    IPPIOWriter::withBufferN(v9, 1uLL, &v51);
  }
  v10 = (void *)objc_msgSend(v5, "string");

  if (v10)
  {
    v12 = (void *)objc_msgSend(v5, "string");
    v14 = v13;
    v15 = strlen((const char *)objc_msgSend(v12, "UTF8String")) + 4;

  }
  else
  {
    v15 = 4;
  }
  v16 = (void *)objc_msgSend(v5, "string");
  v18 = v17;

  if (v18)
  {
    v19 = (void *)objc_msgSend(v5, "string");
    v21 = v20;
    v15 += strlen((const char *)objc_msgSend(v20, "UTF8String"));

  }
  if (v15 >= 0x8000)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("'text' value length too large"), 0);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v49);
  }
  v22 = *(_QWORD *)(a1 + 40);
  v50 = BYTE1(v15);
  v51 = v6;
  v52 = 3221225472;
  v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v54 = &__block_descriptor_40_e8_v16__0_8l;
  v55 = &v50;
  IPPIOWriter::withBufferN(v22, 1uLL, &v51);
  v23 = *(_QWORD *)(a1 + 40);
  v50 = v15;
  v51 = v6;
  v52 = 3221225472;
  v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v54 = &__block_descriptor_40_e8_v16__0_8l;
  v55 = &v50;
  IPPIOWriter::withBufferN(v23, 1uLL, &v51);
  v24 = (void *)objc_msgSend(v5, "string");

  if (v24)
  {
    v26 = (void *)objc_msgSend(v5, "string");
    v28 = v27;
    LODWORD(v24) = strlen((const char *)objc_msgSend(v26, "UTF8String"));

  }
  v29 = *(_QWORD *)(a1 + 40);
  v50 = BYTE1(v24);
  v51 = v6;
  v52 = 3221225472;
  v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v54 = &__block_descriptor_40_e8_v16__0_8l;
  v55 = &v50;
  IPPIOWriter::withBufferN(v29, 1uLL, &v51);
  v30 = *(_QWORD *)(a1 + 40);
  v50 = (char)v24;
  v51 = v6;
  v52 = 3221225472;
  v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v54 = &__block_descriptor_40_e8_v16__0_8l;
  v55 = &v50;
  IPPIOWriter::withBufferN(v30, 1uLL, &v51);
  if ((int)v24 >= 1)
  {
    v31 = *(_QWORD *)(a1 + 40);
    v32 = (void *)objc_msgSend(v5, "string");
    v34 = v33;
    v35 = objc_msgSend(v32, "UTF8String");
    v51 = v6;
    v52 = 3221225472;
    v53 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    v54 = &__block_descriptor_48_e8_v16__0_8l;
    v55 = (char *)v35;
    v56 = v24;
    IPPIOWriter::withBufferN(v31, v24, &v51);

  }
  v36 = (void *)objc_msgSend(v5, "string");
  v38 = v37;

  if (v38)
  {
    v39 = (void *)objc_msgSend(v5, "string");
    v41 = v40;
    LODWORD(v38) = strlen((const char *)objc_msgSend(v40, "UTF8String"));

  }
  v42 = *(_QWORD *)(a1 + 40);
  v50 = BYTE1(v38);
  v51 = v6;
  v52 = 3221225472;
  v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v54 = &__block_descriptor_40_e8_v16__0_8l;
  v55 = &v50;
  IPPIOWriter::withBufferN(v42, 1uLL, &v51);
  v43 = *(_QWORD *)(a1 + 40);
  v50 = (char)v38;
  v51 = v6;
  v52 = 3221225472;
  v53 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v54 = &__block_descriptor_40_e8_v16__0_8l;
  v55 = &v50;
  IPPIOWriter::withBufferN(v43, 1uLL, &v51);
  if ((int)v38 >= 1)
  {
    v44 = *(_QWORD *)(a1 + 40);
    v45 = (void *)objc_msgSend(v5, "string");
    v47 = v46;
    v48 = objc_msgSend(v46, "UTF8String");
    v51 = v6;
    v52 = 3221225472;
    v53 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    v54 = &__block_descriptor_48_e8_v16__0_8l;
    v55 = (char *)v48;
    v56 = v38;
    IPPIOWriter::withBufferN(v44, v38, &v51);

  }
  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));

}

void sub_220FA766C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL20writeBeginCollectionR11IPPIOWriterR11ipp_state_eR9ipp_tag_eP18PK_ipp_attribute_tP8PK_ipp_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  IPPIOWriter *v13;
  PK_ipp_t *v14;
  id v15;
  ipp_state_e v16;
  ipp_tag_e v17[2];
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _BYTE *);
  void *v20;
  ipp_state_e *v21;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    LOBYTE(v16) = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    *(_QWORD *)v17 = v6;
    v18 = 3221225472;
    v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v20 = &__block_descriptor_40_e8_v16__0_8l;
    v21 = &v16;
    IPPIOWriter::withBufferN(v7, 1uLL, v17);
    v8 = *(_QWORD *)(a1 + 40);
    LOBYTE(v16) = 0;
    *(_QWORD *)v17 = v6;
    v18 = 3221225472;
    v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v20 = &__block_descriptor_40_e8_v16__0_8l;
    v21 = &v16;
    IPPIOWriter::withBufferN(v8, 1uLL, v17);
    v9 = *(_QWORD *)(a1 + 40);
    LOBYTE(v16) = 0;
    *(_QWORD *)v17 = v6;
    v18 = 3221225472;
    v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v20 = &__block_descriptor_40_e8_v16__0_8l;
    v21 = &v16;
    IPPIOWriter::withBufferN(v9, 1uLL, v17);
  }
  v10 = *(_QWORD *)(a1 + 40);
  LOBYTE(v16) = 0;
  *(_QWORD *)v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v10, 1uLL, v17);
  v11 = *(_QWORD *)(a1 + 40);
  LOBYTE(v16) = 0;
  *(_QWORD *)v17 = v6;
  v18 = 3221225472;
  v19 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v20 = &__block_descriptor_40_e8_v16__0_8l;
  v21 = &v16;
  IPPIOWriter::withBufferN(v11, 1uLL, v17);
  objc_msgSend(v5, "collection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("IPP Value nil"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v16 = IPP_STATE_IDLE;
  v17[0] = IPP_TAG_NOVALUE;
  v13 = *(IPPIOWriter **)(a1 + 40);
  objc_msgSend(v5, "collection");
  v14 = (PK_ipp_t *)objc_claimAutoreleasedReturnValue();
  ippWriteWithWriter(v13, &v16, v17, 1, v14);

  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));
}

void sub_220FA78C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL19writeDefaultUnknownR11IPPIOWriterP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v18 = objc_msgSend(*(id *)(a1 + 32), "value_tag");
    v19 = v6;
    v20 = 3221225472;
    v21 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v22 = &__block_descriptor_40_e8_v16__0_8l;
    v23 = &v18;
    IPPIOWriter::withBufferN(v7, 1uLL, &v19);
    v8 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    v19 = v6;
    v20 = 3221225472;
    v21 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v22 = &__block_descriptor_40_e8_v16__0_8l;
    v23 = &v18;
    IPPIOWriter::withBufferN(v8, 1uLL, &v19);
    v9 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    v19 = v6;
    v20 = 3221225472;
    v21 = ___ZN11IPPIOWriterlsERKh_block_invoke;
    v22 = &__block_descriptor_40_e8_v16__0_8l;
    v23 = &v18;
    IPPIOWriter::withBufferN(v9, 1uLL, &v19);
  }
  objc_msgSend(v5, "unknown");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11 >= 0x8000)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IPPInternal"), CFSTR("'unknown' value length too large"), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v12 = *(_QWORD *)(a1 + 40);
  v18 = BYTE1(v11);
  v19 = v6;
  v20 = 3221225472;
  v21 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v22 = &__block_descriptor_40_e8_v16__0_8l;
  v23 = &v18;
  IPPIOWriter::withBufferN(v12, 1uLL, &v19);
  v13 = *(_QWORD *)(a1 + 40);
  v18 = v11;
  v19 = v6;
  v20 = 3221225472;
  v21 = ___ZN11IPPIOWriterlsERKh_block_invoke;
  v22 = &__block_descriptor_40_e8_v16__0_8l;
  v23 = &v18;
  IPPIOWriter::withBufferN(v13, 1uLL, &v19);
  if (v11 >= 1)
  {
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "unknown");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "bytes");
    v19 = v6;
    v20 = 3221225472;
    v21 = ___ZN11IPPIOWriter9addOctetsEPKhm_block_invoke;
    v22 = &__block_descriptor_48_e8_v16__0_8l;
    v23 = (char *)v16;
    v24 = v11;
    IPPIOWriter::withBufferN(v14, v11, &v19);

  }
  IPPIOWriter::flush(*(_QWORD *)(a1 + 40));

}

void sub_220FA7AFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void IPPIOWriter::~IPPIOWriter(void **this)
{
  IPPIOWriter::flush((uint64_t)this);
  free(this[2]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t urfWriteLine(uint64_t a1, void *__src, int a3, int a4, int a5)
{
  uint64_t result;
  unsigned int v8;
  unsigned int v9;
  const void *v11;
  int v12;
  size_t v13;
  unsigned int v14;
  int v15;
  const void *v16;
  void *v17;
  int v18;
  unint64_t __n;

  result = 0;
  if (a1 && a3 >= 1 && a4 >= 1)
  {
    v8 = *(_DWORD *)(a1 + 80);
    v9 = *(_DWORD *)(a1 + 40);
    if (v9 <= v8)
    {
      result = 0;
      *(_QWORD *)(a1 + 112) = "Too many lines in page image";
      return result;
    }
    v11 = __src;
    if (v8 + a4 <= v9)
      v12 = a4;
    else
      v12 = v9 - v8;
    v13 = *(_QWORD *)(a1 + 72);
    v14 = v12 + v8;
    *(_DWORD *)(a1 + 80) = v12 + v8;
    v15 = *(_DWORD *)(a1 + 84);
    __n = v13 / a3;
    if (v15)
    {
      if (*(_DWORD *)(a1 + 88) == a3)
      {
        v16 = *(const void **)(a1 + 64);
        if (!memcmp(__src, v16, __n))
        {
          *(_DWORD *)(a1 + 84) = v15 + v12;
          if (a5)
          {
            *(_QWORD *)(a1 + 64) = v11;
          }
          else
          {
            v17 = *(void **)(a1 + 56);
            if (v16 != v17)
            {
              memcpy(v17, v11, v13);
              *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 56);
              v14 = *(_DWORD *)(a1 + 80);
              v9 = *(_DWORD *)(a1 + 40);
            }
          }
          if (v14 >= v9)
          {
            while (*(_DWORD *)(a1 + 84))
            {
              v18 = urf_compress(a1);
              result = 0;
              if (!v18)
                return result;
            }
          }
          return 1;
        }
      }
      while (*(_DWORD *)(a1 + 84))
      {
        result = urf_compress(a1);
        if (!(_DWORD)result)
          return result;
      }
    }
    *(_DWORD *)(a1 + 84) = v12;
    *(_DWORD *)(a1 + 88) = a3;
    if (!a5 && *(_DWORD *)(a1 + 80) < *(_DWORD *)(a1 + 40))
    {
      memcpy(*(void **)(a1 + 56), v11, __n);
      v11 = *(const void **)(a1 + 56);
    }
    *(_QWORD *)(a1 + 64) = v11;
    if (*(_DWORD *)(a1 + 80) >= *(_DWORD *)(a1 + 40))
    {
      while (*(_DWORD *)(a1 + 84))
      {
        result = urf_compress(a1);
        if (!(_DWORD)result)
          return result;
      }
    }
    return 1;
  }
  return result;
}

uint64_t urf_compress(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;
  unsigned int v5;
  _BYTE *v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  unint64_t v14;
  int v15;
  size_t v16;
  uint64_t v17;
  _BYTE *v18;
  int v19;
  _BOOL4 v20;
  unint64_t v21;
  _BOOL4 v22;
  _BYTE *v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  _BYTE *v27;
  _BYTE *v28;
  _BYTE *v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  _BYTE *v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  size_t v41;
  unint64_t v42;
  unsigned __int8 *v43;
  unsigned __int8 *v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  unsigned __int8 *v48;
  int v49;
  _BOOL4 v50;
  unint64_t v51;
  _BOOL4 v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  unsigned __int8 *v59;
  int v60;
  size_t v61;
  unint64_t v62;
  size_t v63;
  unint64_t v64;
  BOOL v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t result;
  uint64_t v70;
  _BYTE *v72;
  _BYTE *v73;
  int v74;
  unint64_t v75;
  unsigned __int8 *v76;
  unint64_t v77;
  int v78;

  v1 = *(unsigned __int8 *)(a1 + 24) - 16;
  v2 = v1 > 0x30;
  v3 = (1 << v1) & 0x1000100000001;
  if (v2 || v3 == 0)
  {
    v36 = *(_DWORD *)(a1 + 84);
    if (v36 >= 0x100)
      v36 = 256;
    v37 = *(_BYTE **)(a1 + 96);
    *v37 = v36 - 1;
    v38 = v37 + 1;
    v39 = *(unsigned int *)(a1 + 88);
    *(_DWORD *)(a1 + 84) -= v36;
    v40 = *(_QWORD *)(a1 + 72) / v39;
    if (v40 >= 1)
    {
      v41 = (unint64_t)*(unsigned __int8 *)(a1 + 24) >> 3;
      v42 = *(_QWORD *)(a1 + 64);
      v43 = (unsigned __int8 *)(v42 + v40);
      v44 = (unsigned __int8 *)(v42 + v40 - v41);
      if (*(_BYTE *)(a1 + 25) == 6)
        v45 = 0;
      else
        v45 = 255;
      v78 = v45;
      v46 = 2 * v41;
      v47 = 0x80 / v39;
      v76 = v43;
      while (v78 != *(unsigned __int8 *)v42 || memcmp((const void *)v42, (const void *)(v42 + 1), (size_t)&v43[~v42]))
      {
        v48 = (unsigned __int8 *)(v42 + v41);
        if ((unsigned __int8 *)(v42 + v41) == v43)
        {
          *v38 = v39 - 1;
          v68 = v38 + 1;
          memcpy(v68, (const void *)v42, v41);
          v38 = &v68[v41];
          goto LABEL_99;
        }
        v49 = memcmp((const void *)v42, (const void *)(v42 + v41), v41);
        v50 = v48 < v44;
        if (v49)
        {
          v51 = 1;
          if (v39 > 0x40)
          {
            v52 = v39 < 0x41;
          }
          else
          {
            v52 = v39 < 0x41;
            if (v48 < v44)
            {
              v53 = v42;
              v51 = 1;
              while (1)
              {
                v48 = (unsigned __int8 *)(v53 + v41);
                v54 = v53 + v46;
                if (!memcmp((const void *)(v53 + v41), (const void *)(v53 + v46), v41))
                  break;
                ++v51;
                v50 = v54 < (unint64_t)v44;
                v52 = v51 < v47;
                if (v51 < v47)
                {
                  v53 = (unint64_t)v48;
                  if (v54 < (unint64_t)v44)
                    continue;
                }
                v48 += v41;
                goto LABEL_79;
              }
              v52 = 1;
              v50 = 1;
            }
          }
LABEL_79:
          v60 = v50 || !v52;
          if (v60)
            v61 = 0;
          else
            v61 = v41;
          v59 = &v48[v61];
          v62 = v51 + (v60 ^ 1u);
          *v38++ = 1 - v62 * v39;
          if ((_DWORD)v39 == 1)
          {
            v63 = v62 * v41;
            memcpy(v38, (const void *)v42, v63);
            v38 += v63;
          }
          else
          {
            do
            {
              v64 = v39;
              do
              {
                memcpy(v38, (const void *)v42, v41);
                v38 += v41;
                --v64;
              }
              while (v64);
              v42 += v41;
              --v62;
            }
            while (v62);
          }
        }
        else
        {
          LOBYTE(v55) = 2;
          if (v39 <= 0x2A && v48 < v44)
          {
            v56 = v42;
            v55 = 2;
            while (1)
            {
              v48 = (unsigned __int8 *)(v56 + v41);
              v57 = v56 + v46;
              if (memcmp((const void *)(v56 + v41), (const void *)(v56 + v46), v41))
                break;
              if (++v55 < v47)
              {
                v56 = (unint64_t)v48;
                if (v57 < (unint64_t)v44)
                  continue;
              }
              v48 += v41;
              break;
            }
          }
          *v38 = v55 * v39 - 1;
          v58 = v38 + 1;
          memcpy(v58, (const void *)v42, v41);
          v38 = &v58[v41];
          v59 = &v48[v41];
        }
        v42 = (unint64_t)v59;
        v65 = v59 >= v76;
        v43 = v76;
        if (v65)
          goto LABEL_99;
      }
      *v38++ = 0x80;
    }
LABEL_99:
    v66 = a1;
    v67 = &v38[-*(_QWORD *)(a1 + 96)];
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 84);
    if (v5 >= 0x100)
      v5 = 256;
    v6 = *(_BYTE **)(a1 + 96);
    *v6 = v5 - 1;
    v7 = v6 + 1;
    v8 = *(unsigned int *)(a1 + 88);
    *(_DWORD *)(a1 + 84) -= v5;
    v9 = *(_QWORD *)(a1 + 72) / v8;
    if (v9 < 1)
    {
LABEL_94:
      v29 = v7;
    }
    else
    {
      v10 = *(unsigned __int8 *)(a1 + 24);
      v11 = v10 >> 4;
      v12 = *(_BYTE **)(a1 + 64);
      v13 = &v12[v9];
      v14 = (unint64_t)&v12[v9 + -2 * (v10 >> 4)];
      if (*(_BYTE *)(a1 + 25) == 6)
        v15 = 0;
      else
        v15 = 0xFFFF;
      v72 = &v12[v9];
      v73 = v13 - 2;
      v16 = 2 * v11;
      v74 = v15;
      v17 = 4 * v11;
      v70 = v11 + 1;
      v75 = v10 >> 4;
      v77 = 0x80 / v8;
      while (1)
      {
        if (v74 == *(unsigned __int16 *)v12 && !memcmp(v12, v12 + 2, v73 - v12))
        {
          *v7++ = 0x80;
          goto LABEL_94;
        }
        v18 = &v12[2 * v75];
        if (v18 == v13)
          break;
        v19 = memcmp(v12, &v12[2 * v75], v16);
        v20 = (unint64_t)v18 < v14;
        if (v19)
        {
          LOBYTE(v21) = 1;
          if (v8 > 0x40)
          {
            v22 = v8 < 0x41;
          }
          else
          {
            v22 = v8 < 0x41;
            if ((unint64_t)v18 < v14)
            {
              v23 = v12;
              v21 = 1;
              while (1)
              {
                v18 = &v23[v16];
                v24 = (unint64_t)&v23[v17];
                if (!memcmp(&v23[v16], &v23[v17], v16))
                  break;
                ++v21;
                v20 = v24 < v14;
                v22 = v21 < v77;
                if (v21 < v77)
                {
                  v23 = v18;
                  if (v24 < v14)
                    continue;
                }
                v18 += v16;
                goto LABEL_38;
              }
              v22 = 1;
              v20 = 1;
LABEL_38:
              v13 = v72;
            }
          }
          v31 = v20 || !v22;
          v32 = v10 >> 4;
          if (v31)
            v32 = 0;
          v28 = &v18[2 * v32];
          *v7 = 1 - (v21 + (v31 ^ 1)) * v8;
          v29 = v7 + 1;
          while (v12 < v28)
          {
            v33 = v8;
            do
            {
              if (v10 >= 0x10)
              {
                v34 = 0;
                do
                {
                  v35 = &v29[v34];
                  *v35 = v12[v34 + 1];
                  v35[1] = v12[v34];
                  v34 += 2;
                }
                while (v16 != v34);
                v29 += v34;
              }
              --v33;
            }
            while (v33);
            v12 += v16;
          }
        }
        else
        {
          LOBYTE(v25) = 2;
          if (v8 <= 0x2A && (unint64_t)v18 < v14)
          {
            v25 = 2;
            while (1)
            {
              v18 = &v12[v16];
              v26 = &v12[v17];
              if (memcmp(&v12[v16], &v12[v17], v16))
                break;
              if (++v25 < v77)
              {
                v12 += v16;
                if ((unint64_t)v26 < v14)
                  continue;
              }
              v18 += v16;
              break;
            }
            v13 = v72;
          }
          *v7 = v25 * v8 - 1;
          v27 = v7 + 1;
          if (v10 >= 0x10)
          {
            v30 = v70;
            do
            {
              *v27 = v18[1];
              v28 = v18 + 2;
              v29 = v27 + 2;
              v27[1] = *v18;
              --v30;
              v27 += 2;
              v18 += 2;
            }
            while (v30 > 1);
          }
          else
          {
            v28 = v18;
            v29 = v27;
          }
        }
        v7 = v29;
        v12 = v28;
        if (v28 >= v13)
          goto LABEL_95;
      }
      *v7++ = v8 - 1;
      if (v10 < 0x10)
        goto LABEL_94;
      do
      {
        *v7 = v12[1];
        v29 = v7 + 2;
        v7[1] = *v12;
        v7 += 2;
        v12 += 2;
      }
      while (v12 < v13);
    }
LABEL_95:
    v66 = a1;
    v67 = &v29[-*(_QWORD *)(a1 + 96)];
    if ((unint64_t)v67 > *(_QWORD *)(a1 + 104))
      urf_compress();
  }
  if ((char *)(*(uint64_t (**)(_QWORD))v66)(*(_QWORD *)(v66 + 8)) == v67)
    return 1;
  result = 0;
  *(_QWORD *)(v66 + 112) = "Unable to write line";
  return result;
}

uint64_t urfWritePage(uint64_t result, uint64_t *a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  int8x8_t v12;
  unsigned int v13;
  uint64_t v14;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      v4 = *(_DWORD *)(result + 16);
      if (v4 && *(_DWORD *)(result + 20) >= v4)
      {
        result = 0;
        v9 = "Done writing all pages";
      }
      else
      {
        result = _urfSetLineSize(result, (unsigned __int8 *)a2);
        if (!(_DWORD)result)
          return result;
        v10 = *a2;
        v11 = *((_DWORD *)a2 + 2);
        v12 = vrev32_s8(*(int8x8_t *)((char *)a2 + 12));
        v5 = bswap32(*((_DWORD *)a2 + 5));
        v14 = 0;
        v13 = v5;
        if ((*(uint64_t (**)(_QWORD, uint64_t *, uint64_t))v3)(*(_QWORD *)(v3 + 8), &v10, 32) == 32)
        {
          ++*(_DWORD *)(v3 + 20);
          *(_QWORD *)(v3 + 80) = 0;
          v6 = 2 * *(_QWORD *)(v3 + 72) + 2;
          if (v6 <= *(_QWORD *)(v3 + 104))
            return 1;
          v7 = *(void **)(v3 + 96);
          if (v7)
          {
            v8 = malloc_type_realloc(v7, 2 * *(_QWORD *)(v3 + 72) + 2, 0xF73AE04CuLL);
            if (v8)
            {
LABEL_10:
              *(_QWORD *)(v3 + 96) = v8;
              *(_QWORD *)(v3 + 104) = v6;
              return 1;
            }
          }
          else
          {
            v8 = malloc_type_malloc(2 * *(_QWORD *)(v3 + 72) + 2, 0x5EA8BDB2uLL);
            if (v8)
              goto LABEL_10;
          }
          free(*(void **)(v3 + 96));
          result = 0;
          *(_QWORD *)(v3 + 96) = 0;
          *(_QWORD *)(v3 + 104) = 0;
          v9 = "Unable to allocate memory for compression buffer";
        }
        else
        {
          result = 0;
          v9 = "Unable to write page header";
        }
      }
    }
    else
    {
      result = 0;
      v9 = "NULL page header";
    }
    *(_QWORD *)(v3 + 112) = v9;
  }
  return result;
}

uint64_t urfWriteStart(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v2 = result;
    *(_DWORD *)(result + 16) = a2;
    v3 = 0x54534152494E55;
    v4 = HIBYTE(a2);
    v5 = BYTE2(a2);
    v6 = BYTE1(a2);
    v7 = a2;
    if ((*(uint64_t (**)(_QWORD, uint64_t *, uint64_t))result)(*(_QWORD *)(result + 8), &v3, 12) == 12)
    {
      return 1;
    }
    else
    {
      result = 0;
      *(_QWORD *)(v2 + 112) = "Unable to write file header";
    }
  }
  return result;
}

id getPrintdRPCProtocolInterface(void)
{
  if (getPrintdRPCProtocolInterface(void)::sOnce != -1)
    dispatch_once(&getPrintdRPCProtocolInterface(void)::sOnce, &__block_literal_global_2);
  return (id)getPrintdRPCProtocolInterface(void)::sInterface;
}

void ___Z29getPrintdRPCProtocolInterfacev_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25565D278);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", sel_getRecentJobsReply_, 1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getRecentJobsReply_, 1, 1);

  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", sel_getJobUpdateStatus_includeThumbnail_reply_, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getJobUpdateStatus_includeThumbnail_reply_, 0, 1);

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", sel_browseInfoForPrinter_timeout_reply_, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_browseInfoForPrinter_timeout_reply_, 0, 0);

  objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", sel_browseInfoForPrinter_timeout_reply_, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_browseInfoForPrinter_timeout_reply_, 0, 1);

  v12 = (void *)getPrintdRPCProtocolInterface(void)::sInterface;
  getPrintdRPCProtocolInterface(void)::sInterface = (uint64_t)v0;

}

void sub_220FA8830(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id getPrintdRPCBrowseProtocolInterface(void)
{
  void *v0;
  void *v1;
  uint64_t v2;
  char v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25565B330);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = v3;
    objc_msgSend(v0, "classesForSelector:argumentIndex:ofReply:", sel_browserAdded_removed_, v2, 0, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setByAddingObjectsFromArray:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_browserAdded_removed_, v2, 0);

    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);

  return v0;
}

void sub_220FA8A18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FA8C10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FA8F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FA9064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FA91D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FA92E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FA9434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FA9520(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FA9694(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FA9D48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FA9EB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FA9F04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FA9F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FAA050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FAA18C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FAA2E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_220FAA3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAA58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_220FAA63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

const char *ippTagString(int a1)
{
  if (a1 > 74)
    return "UNKNOWN";
  else
    return (const char *)-[__CFString UTF8String](objc_retainAutorelease(ipp_tag_names[a1]), "UTF8String");
}

void sub_220FAA720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FAA7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_220FAA8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAA91C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAA988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAAA0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAAB4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FAAC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAACDC(void *a1)
{
  uint64_t v1;
  char v2;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 16) = v2;
  objc_exception_rethrow();
}

void sub_220FAACEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_220FAAD80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FAADF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FAAEB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAAF58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FAB0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  v19 = v18;

  _Unwind_Resume(a1);
}

void sub_220FAB180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAB210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_220FAB320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FAB394(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAB4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

unint64_t _read_cb(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  v6 = objc_msgSend(*(id *)(a1 + 8), "length");
  if (v6 - *(_QWORD *)a1 < a3)
    a3 = v6 - *(_QWORD *)a1;
  objc_msgSend(*(id *)(a1 + 8), "getBytes:range:", a2);
  *(_QWORD *)a1 += a3;
  return a3;
}

void sub_220FAB5EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _write_cb(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  objc_msgSend(a1, "appendBytes:length:", a2, a3);
  return a3;
}

void sub_220FAB694(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FAB6F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAB74C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAB80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FAB8B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FAB974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FABAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FABB68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_220FABBFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FABCD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FABDF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FABF58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FAC074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_220FAC274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

__CFString *ipp_lang_code(NSString *a1)
{
  NSString *v1;
  __CFString *v2;

  v1 = a1;
  if (-[NSString caseInsensitiveCompare:](v1, "caseInsensitiveCompare:", CFSTR("c")))
  {
    -[NSString stringByReplacingOccurrencesOfString:withString:](v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("en");
  }

  return v2;
}

void sub_220FAC32C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAC3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c24_ZTS18ipp_value_string_t(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(a1 + 32) = *(id *)(a2 + 32);
  result = *(id *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c24_ZTS18ipp_value_string_t(uint64_t a1)
{

}

void sub_220FAC4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FAC564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_220FAC648(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAC77C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAC848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FAC8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAC9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FACA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FACAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FACBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_220FACD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FACE40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FACFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_220FAD0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FAD17C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAD244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_220FAD3D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FAD654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v3;

  _Unwind_Resume(a1);
}

void sub_220FAD9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void ippAddSeparator(PK_ipp_t *a1)
{
  id v1;
  PK_ipp_t *v2;

  v2 = a1;
  if (v2)
    v1 = -[PK_ipp_t addNewEmptyAttribute:groupTag:valueTag:](v2, "addNewEmptyAttribute:groupTag:valueTag:", 0, 0, 0);

}

void sub_220FADAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id ippGetIXCollection(PK_ipp_attribute_t *a1, unsigned int a2)
{
  PK_ipp_attribute_t *v3;
  PK_ipp_attribute_t *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  v5 = -[PK_ipp_attribute_t value_tag](v3, "value_tag");
  v6 = 0;
  if ((a2 & 0x80000000) == 0 && v5 == 52)
  {
    v7 = a2;
    if (-[PK_ipp_attribute_t num_values](v4, "num_values") > a2)
    {
      -[PK_ipp_attribute_t values](v4, "values");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
LABEL_6:
    v6 = 0;
  }
LABEL_7:

  return v6;
}

void sub_220FADB74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t ippGetIXInteger(PK_ipp_attribute_t *a1, unsigned int a2)
{
  PK_ipp_attribute_t *v3;
  PK_ipp_attribute_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  if (-[PK_ipp_attribute_t value_tag](v3, "value_tag") == 33)
  {
    if ((a2 & 0x80000000) != 0)
      goto LABEL_9;
  }
  else
  {
    v5 = -[PK_ipp_attribute_t value_tag](v4, "value_tag");
    v6 = 0;
    if ((a2 & 0x80000000) != 0 || v5 != 35)
      goto LABEL_10;
  }
  v7 = a2;
  if (-[PK_ipp_attribute_t num_values](v4, "num_values") <= a2)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  -[PK_ipp_attribute_t values](v4, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "integer");

LABEL_10:
  return v6;
}

void sub_220FADC50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t ippGetIXRange(PK_ipp_attribute_t *a1, unsigned int a2, int *a3)
{
  PK_ipp_attribute_t *v5;
  PK_ipp_attribute_t *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v17;
  int v18;

  v5 = a1;
  v6 = v5;
  if (v5
    && (v7 = -[PK_ipp_attribute_t value_tag](v5, "value_tag"), (a2 & 0x80000000) == 0)
    && v7 == 51
    && -[PK_ipp_attribute_t num_values](v6, "num_values") > a2)
  {
    if (a3)
    {
      -[PK_ipp_attribute_t values](v6, "values");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "range");
        v11 = v18;
      }
      else
      {
        v11 = 0;
        v17 = 0;
      }
      *a3 = v11;

    }
    -[PK_ipp_attribute_t values](v6, "values");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "range");
      v12 = v17;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
    if (a3)
      *a3 = 0;
  }

  return v12;
}

void sub_220FADD94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id ippGetIXString(PK_ipp_attribute_t *a1, unsigned int a2)
{
  PK_ipp_attribute_t *v3;
  PK_ipp_attribute_t *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = v3;
  v5 = 0;
  if (v3 && (a2 & 0x80000000) == 0)
  {
    v6 = a2;
    if (-[PK_ipp_attribute_t num_values](v3, "num_values") > a2
      && ((v7 = -[PK_ipp_attribute_t value_tag](v4, "value_tag"), (v7 - 55) > 0xFFFFFFFD)
       || (v7 - 74) >= 0xFFFFFFF7))
    {
      -[PK_ipp_attribute_t values](v4, "values");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "string");
      v5 = v11;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

void sub_220FADE8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL ippCoerceAttrToValue(PK_ipp_t *a1, PK_ipp_attribute_t *a2, uint64_t a3)
{
  PK_ipp_t *v5;
  PK_ipp_attribute_t *v6;
  PK_ipp_attribute_t *v7;
  _BOOL8 v8;
  int v9;
  void *v10;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PK_ipp_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  PK_ipp_t *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _DWORD v52[2];

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_11;
  if (-[PK_ipp_attribute_t value_tag](v6, "value_tag") == (_DWORD)a3)
  {
LABEL_10:
    v8 = 1;
    goto LABEL_11;
  }
  v9 = -[PK_ipp_attribute_t value_tag](v7, "value_tag");
  v8 = 0;
  if ((int)a3 > 50)
  {
    if ((int)a3 <= 53)
    {
      if ((_DWORD)a3 == 51)
      {
        if (v9 == 33)
        {
          v28 = -[PK_ipp_attribute_t num_values](v7, "num_values");
          if (v28)
          {
            v29 = 0;
            do
            {
              -[PK_ipp_attribute_t values](v7, "values");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectAtIndexedSubscript:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "integer");

              -[PK_ipp_attribute_t values](v7, "values");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectAtIndexedSubscript:", v29);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = v32;
              v52[1] = v32;
              objc_msgSend(v34, "setRange:", v52);

              ++v29;
            }
            while (v28 != v29);
          }
          -[PK_ipp_attribute_t setValueTag:](v7, "setValueTag:", 51);
          goto LABEL_10;
        }
        goto LABEL_41;
      }
      if ((_DWORD)a3 != 53)
        goto LABEL_11;
      if (v9 != 65)
        goto LABEL_41;
    }
    else
    {
      if ((_DWORD)a3 != 54)
      {
        if ((_DWORD)a3 != 66)
        {
          if ((_DWORD)a3 == 68)
            v8 = v9 == 66 || v9 == 54;
          goto LABEL_11;
        }
        if (v9 == 68)
        {
          a3 = 66;
LABEL_9:
          -[PK_ipp_attribute_t setValueTag:](v7, "setValueTag:", a3);
          goto LABEL_10;
        }
LABEL_41:
        v8 = 0;
        goto LABEL_11;
      }
      if (v9 != 66 && v9 != 68)
        goto LABEL_41;
    }
    -[PK_ipp_t attrs](v5, "attrs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") >= 3)
    {
      -[PK_ipp_t attrs](v5, "attrs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "compare:", CFSTR("attributes-natural-language")))
      {
        -[PK_ipp_t attrs](v5, "attrs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v5;
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "value_tag") == 72)
        {
          -[PK_ipp_t attrs](v18, "attrs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v21, "num_values");

          v5 = v18;
          if (v50)
          {
            -[PK_ipp_t attrs](v18, "attrs");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v23, "num_values"))
            {
              objc_msgSend(v23, "values");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)objc_msgSend(v25, "string");
              v51 = v27;

            }
            else
            {
              v51 = 0;
            }
            goto LABEL_46;
          }
LABEL_45:
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKey:", *MEMORY[0x24BDBCB20]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          ipp_lang_code((NSString *)v23);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

          v36 = -[PK_ipp_attribute_t num_values](v7, "num_values");
          if (v36)
          {
            v37 = 0;
            do
            {
              -[PK_ipp_attribute_t values](v7, "values");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectAtIndexedSubscript:", v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (void *)objc_msgSend(v39, "string");
              v42 = v41;

              v43 = v51;
              -[PK_ipp_attribute_t values](v7, "values");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v5;
              objc_msgSend(v44, "objectAtIndexedSubscript:", v37);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v43;
              v48 = v42;
              v49 = v48;
              if (v46)
              {
                objc_msgSend(v46, "setString:", v51, v42);
              }
              else
              {

              }
              ++v37;
              v5 = v45;
            }
            while (v36 != v37);
          }
          -[PK_ipp_attribute_t setValueTag:](v7, "setValueTag:", 54);

          goto LABEL_10;
        }

        v5 = v18;
      }

    }
    goto LABEL_45;
  }
  if ((a3 - 16) < 4 || (a3 - 21) < 3)
  {
    if (-[PK_ipp_attribute_t num_values](v7, "num_values"))
    {
      -[PK_ipp_attribute_t values](v7, "values");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

    }
    goto LABEL_9;
  }
LABEL_11:

  return v8;
}

void sub_220FAE33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t validate_enum<ipp_tag_e,unsigned char>(int a1)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  switch(a1)
  {
    case 0:
      result = 0;
      break;
    case 1:
      result = 1;
      break;
    case 2:
      result = 2;
      break;
    case 3:
      result = 3;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 5;
      break;
    case 6:
      result = 6;
      break;
    case 7:
      result = 7;
      break;
    case 8:
      result = 8;
      break;
    case 9:
      result = 9;
      break;
    case 10:
      result = 10;
      break;
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 20:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
      return result;
    case 16:
      result = 16;
      break;
    case 17:
      result = 17;
      break;
    case 18:
      result = 18;
      break;
    case 19:
      result = 19;
      break;
    case 21:
      result = 21;
      break;
    case 22:
      result = 22;
      break;
    case 23:
      result = 23;
      break;
    case 33:
      result = 33;
      break;
    case 34:
      result = 34;
      break;
    case 35:
      result = 35;
      break;
    case 48:
      result = 48;
      break;
    case 49:
      result = 49;
      break;
    case 50:
      result = 50;
      break;
    case 51:
      result = 51;
      break;
    case 52:
      result = 52;
      break;
    case 53:
      result = 53;
      break;
    case 54:
      result = 54;
      break;
    case 55:
      result = 55;
      break;
    case 65:
      result = 65;
      break;
    case 66:
      result = 66;
      break;
    case 67:
      result = 67;
      break;
    case 68:
      result = 68;
      break;
    case 69:
      result = 69;
      break;
    case 70:
      result = 70;
      break;
    case 71:
      result = 71;
      break;
    case 72:
      result = 72;
      break;
    case 73:
      result = 73;
      break;
    case 74:
      result = 74;
      break;
    default:
      if (a1 == 127)
        result = 127;
      else
        result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

uint64_t validate_enum<ipp_res_e,unsigned char>(int a1)
{
  if (a1 == 3)
    return 3;
  else
    return 4;
}

uint64_t validate_enum<ipp_orient_e,unsigned char>(char a1)
{
  if (((a1 - 4) & 0xFC) != 0)
    return 3;
  else
    return (a1 - 4) + 4;
}

void ___ZL17pretty_data_linesP6NSData_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %@"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void sub_220FAE6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id PKLocalizedString(NSString *a1, const char *a2)
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.PrintKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_220FAE720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void urfDelete(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)a1[7];
    if (v2)
      free(v2);
    v3 = (void *)a1[12];
    if (v3)
      free(v3);
    v4 = (void *)a1[15];
    if (v4)
      free(v4);
    free(a1);
  }
}

uint64_t urfErrorString(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

_QWORD *urfNew(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x90uLL, 0x10D00403A2F05C1uLL);
  if (result)
  {
    *result = a1;
    result[1] = a2;
  }
  return result;
}

uint64_t _urfSetLineSize(uint64_t a1, unsigned __int8 *a2)
{
  __int128 v3;
  unsigned int v4;
  uint64_t result;
  const char *v7;
  unsigned int v8;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v3 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 40) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  switch(a2[1])
  {
    case 0u:
    case 4u:
      v4 = *a2;
      if (v4 == 8 || v4 == 16)
        goto LABEL_19;
      goto LABEL_32;
    case 1u:
      v4 = *a2;
      if (v4 != 24)
        goto LABEL_32;
      goto LABEL_19;
    case 2u:
      v4 = *a2;
      if (v4 != 32)
        goto LABEL_32;
      goto LABEL_19;
    case 3u:
    case 5u:
      v4 = *a2;
      if (v4 == 24)
        goto LABEL_19;
      goto LABEL_18;
    case 6u:
      v4 = *a2;
      if (v4 != 32 && v4 != 64)
        goto LABEL_32;
      goto LABEL_19;
    case 7u:
      v4 = *a2;
LABEL_18:
      if (v4 == 48)
        goto LABEL_19;
      goto LABEL_32;
    case 8u:
      v4 = *a2;
      if (v4 != 16)
      {
LABEL_32:
        result = 0;
        v7 = "Bad bitsPerPixel in page header";
        goto LABEL_33;
      }
LABEL_19:
      if (a2[2] >= 4u)
      {
        result = 0;
        v7 = "Bad duplexMode in page header";
LABEL_33:
        *(_QWORD *)(a1 + 112) = v7;
        return result;
      }
      v8 = a2[3];
      if (v8 > 5 || v8 - 1 <= 1)
      {
        result = 0;
        v7 = "Bad printQuality in page header";
        goto LABEL_33;
      }
      v10 = *((_DWORD *)a2 + 3);
      if (!v10)
      {
        result = 0;
        v7 = "Bad width in page header";
        goto LABEL_33;
      }
      if (!*((_DWORD *)a2 + 4))
      {
        result = 0;
        v7 = "Bad height in page header";
        goto LABEL_33;
      }
      if (!*((_DWORD *)a2 + 5))
      {
        result = 0;
        v7 = "Bad resolution in page header";
        goto LABEL_33;
      }
      v11 = v4 >> 3;
      v12 = v10 * (unint64_t)v11;
      v13 = *(void **)(a1 + 56);
      if (v13)
        v14 = malloc_type_realloc(v13, v10 * (unint64_t)v11, 0x9092D853uLL);
      else
        v14 = malloc_type_malloc(v10 * (unint64_t)v11, 0x62CE6984uLL);
      if (!v14)
      {
        free(*(void **)(a1 + 56));
        result = 0;
        *(_QWORD *)(a1 + 56) = 0;
        *(_QWORD *)(a1 + 72) = 0;
        v7 = "Unable to allocate memory for line buffer";
        goto LABEL_33;
      }
      *(_QWORD *)(a1 + 56) = v14;
      *(_QWORD *)(a1 + 72) = v12;
      return 1;
    default:
      result = 0;
      v7 = "Bad colorSpace in page header";
      goto LABEL_33;
  }
}

CGFloat _lite_page_transform@<D0>(CGRect a1@<0:D0, 8:D1, 16:D2, 24:D3>, unint64_t a2@<X0>, unint64_t a3@<X1>, int a4@<W2>, int a5@<W3>, int a6@<W4>, uint64_t a7@<X8>)
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v16;
  double v17;
  unint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat c;
  double MinX;
  double MinY;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGFloat result;
  CGFloat a;
  CGFloat b;
  CGFloat d;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  __int128 v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a1.size.height;
  width = a1.size.width;
  y = a1.origin.y;
  x = a1.origin.x;
  if (a6)
    v16 = a3;
  else
    v16 = a2;
  v17 = (double)v16 * -0.5;
  if (a6)
    v18 = a2;
  else
    v18 = a3;
  CGAffineTransformMakeTranslation(&v47, v17, (double)v18 * -0.5);
  switch(a4)
  {
    case 2:
      v48.a = 0.0;
      v48.b = 0.0;
      v19 = -1.0;
      v20 = 1.0;
      goto LABEL_12;
    case 3:
      v48.a = 0.0;
      v48.b = 0.0;
      v20 = -1.0;
      v21 = 0.0;
      v22 = 0.0;
      v19 = -1.0;
      break;
    case 4:
      v48.a = 0.0;
      v48.b = 0.0;
      v19 = 1.0;
      v20 = -1.0;
LABEL_12:
      v21 = 0.0;
      v22 = 0.0;
      break;
    case 5:
      v48.a = 0.0;
      v48.b = 0.0;
      v20 = 0.0;
      v21 = -1.0;
      v22 = -1.0;
      goto LABEL_17;
    case 6:
      v48.a = 0.0;
      v48.b = 0.0;
      v20 = 0.0;
      v22 = 1.0;
      v21 = -1.0;
      goto LABEL_17;
    case 7:
      v48.a = 0.0;
      v48.b = 0.0;
      v20 = 0.0;
      v21 = 1.0;
      v22 = 1.0;
      goto LABEL_17;
    case 8:
      v48.a = 0.0;
      v48.b = 0.0;
      v20 = 0.0;
      v22 = -1.0;
      v21 = 1.0;
LABEL_17:
      v19 = 0.0;
      break;
    default:
      v19 = *MEMORY[0x24BDBD8B8];
      v21 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
      v22 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
      v20 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
      *(_OWORD *)&v48.a = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      break;
  }
  v49 = *(_OWORD *)&v48.a;
  if (a5 == 1 || a5 == -1)
  {
    memset(&v48, 0, sizeof(v48));
    CGAffineTransformMakeRotation(&v48, (double)a5 * 3.14159265 * 0.5);
    t1.a = v19;
    t1.b = v21;
    t1.c = v22;
    t1.d = v20;
    *(_OWORD *)&t1.tx = v49;
    t2 = v48;
    CGAffineTransformConcat(&v46, &t1, &t2);
    c = v46.c;
    a = v46.a;
    b = v46.b;
    d = v46.d;
    v49 = *(_OWORD *)&v46.tx;
  }
  else
  {
    b = v21;
    d = v20;
    a = v19;
    c = v22;
  }
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  MinX = CGRectGetMinX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  MinY = CGRectGetMinY(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v26 = CGRectGetWidth(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  v27 = CGRectGetHeight(v53);
  v28 = v26 / (double)a2;
  if (v28 >= v27 / (double)a3)
    v28 = v27 / (double)a3;
  CGAffineTransformMakeScale(&v48, v28, v28);
  CGAffineTransformMakeTranslation(&v46, MinX + v26 * 0.5, MinY + v27 * 0.5);
  v43 = v47;
  v42.a = a;
  v42.b = b;
  v42.c = c;
  v42.d = d;
  *(_OWORD *)&v42.tx = v49;
  CGAffineTransformConcat((CGAffineTransform *)a7, &v43, &v42);
  v29 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)&v40.a = *(_OWORD *)a7;
  *(_OWORD *)&v40.c = v29;
  *(_OWORD *)&v40.tx = *(_OWORD *)(a7 + 32);
  v39 = v48;
  CGAffineTransformConcat(&v41, &v40, &v39);
  v30 = *(_OWORD *)&v41.c;
  *(_OWORD *)a7 = *(_OWORD *)&v41.a;
  *(_OWORD *)(a7 + 16) = v30;
  *(_OWORD *)(a7 + 32) = *(_OWORD *)&v41.tx;
  v31 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)&v38.a = *(_OWORD *)a7;
  *(_OWORD *)&v38.c = v31;
  *(_OWORD *)&v38.tx = *(_OWORD *)(a7 + 32);
  v37 = v46;
  CGAffineTransformConcat(&v41, &v38, &v37);
  v32 = *(_OWORD *)&v41.c;
  *(_OWORD *)a7 = *(_OWORD *)&v41.a;
  *(_OWORD *)(a7 + 16) = v32;
  result = v41.tx;
  *(_OWORD *)(a7 + 32) = *(_OWORD *)&v41.tx;
  return result;
}

void _liteDrawImageToSheet(CGContext *a1, CGImageRef image, int a3, CGSize a4, CGRect a5)
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  unsigned int v14;
  unsigned int v15;
  int v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  BOOL v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v14 = CGImageGetWidth(image);
  v15 = CGImageGetHeight(image);
  v16 = v15;
  if (x <= v10 - (x + width))
    v17 = v10 - (x + width);
  else
    v17 = x;
  if (v9 - (y + height) <= y)
    v18 = y;
  else
    v18 = v9 - (y + height);
  if (a3 <= 4)
    v19 = v14;
  else
    v19 = v15;
  if (a3 <= 4)
    v20 = v15;
  else
    v20 = v14;
  v21 = (double)(int)v20;
  v22 = (double)(int)v19;
  v23 = v10 > v9 && v22 < v21;
  if (v23 || v10 < v9 && v22 > v21)
  {
    v24 = v17;
    v25 = v10;
  }
  else
  {
    v24 = v18;
    v18 = v17;
    v25 = v9;
    v9 = v10;
  }
  if (v18 == 0.0 && v24 == 0.0 && v20 < 2 * v19 && 2 * v20 > v19 && (v9 >= v22 ? (v26 = v25 < v21) : (v26 = 1), !v26))
  {
    v27 = 1;
    v28 = v9;
    v29 = v25;
  }
  else
  {
    v27 = 0;
    v28 = v9 - v18 - v18;
    v29 = v25 - v24 - v24;
  }
  v30 = v28 / v22;
  v31 = v29 / v21;
  if (v30 <= v31)
    v32 = v31;
  else
    v32 = v30;
  if (v30 >= v31)
    v30 = v31;
  if (v27)
    v30 = v32;
  v33 = (v9 - v22 * v30) * 0.5;
  v34 = (v25 - v21 * v30) * 0.5;
  v35 = v30 * v22;
  v36 = v30 * v21;
  CGContextSaveGState(a1);
  v38.origin.x = v33;
  v38.origin.y = v34;
  v38.size.width = v35;
  v38.size.height = v36;
  _lite_page_transform(v38, v19, v20, a3, 0, a3 > 4, (uint64_t)&v37);
  CGContextConcatCTM(a1, &v37);
  v39.size.width = (double)(int)v14;
  v39.size.height = (double)v16;
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  CGContextDrawImage(a1, v39, image);
  CGContextRestoreGState(a1);
}

uint64_t liteFigureOutDriverSetupInfo(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  BOOL (*v20)(void *, uint64_t, int);
  uint64_t v21;
  uint64_t i;
  void *v23;
  const __CFString *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  char v34;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  unint64_t v42;
  uint64_t v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a2 + 2040);
  *(_QWORD *)(a2 + 2040) = CFSTR("application/octet-stream");

  v47 = v5;
  if (!v5)
  {
    v10 = 0;
    v8 = 0;
    v12 = 0;
LABEL_31:
    v25 = 0;
    *(_QWORD *)(a2 + 2020) = 0x2580000012CLL;
    *(_BYTE *)(a2 + 120) |= 3u;
    *(int32x4_t *)(a2 + 972) = vdupq_n_s32(0x27Bu);
    *(_OWORD *)(a2 + 988) = xmmword_220FE0AA0;
    *(_DWORD *)(a2 + 128) = 1;
    *(_OWORD *)(a2 + 1988) = xmmword_220FE0AB0;
LABEL_32:
    *(_QWORD *)a1 |= *(_QWORD *)(a2 + 120);
    objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 2040));
    v26 = objc_opt_new();
    v27 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v26;

    objc_msgSend(*(id *)(a1 + 8), "addObject:", CFSTR("application/octet-stream"));
    objc_msgSend(*(id *)(a1 + 8), "addObjectsFromArray:", *(_QWORD *)(a1 + 16));
    v28 = v25 ^ 1;
    if (((objc_msgSend(*(id *)(a1 + 8), "containsObject:", CFSTR("application/pdf")) | v25 ^ 1 | v8) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 8), "addObject:", CFSTR("application/pdf"));
    if (((objc_msgSend(*(id *)(a1 + 8), "containsObject:", CFSTR("image/jpeg"), v42, v43) | v28 | v10) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 8), "addObject:", CFSTR("image/jpeg"));
    if (((objc_msgSend(*(id *)(a1 + 8), "containsObject:", CFSTR("image/png")) | v28 | v12) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 8), "addObject:", CFSTR("image/png"));
    if ((v25 & (objc_msgSend(*(id *)(a1 + 8), "containsObject:", CFSTR("image/urf")) ^ 1)) == 1)
      objc_msgSend(*(id *)(a1 + 8), "addObject:", CFSTR("image/urf"));
    v29 = *(_DWORD *)(a2 + 1508);
    if (v29 >= 21590)
    {
      v30 = *(_DWORD *)(a2 + 1512);
      if (v30 < 27940)
      {
LABEL_44:
        if (v30 >= 15240)
          *(_DWORD *)(a2 + 988) = 5;
      }
    }
    else if (v29 >= 10160)
    {
      v30 = *(_DWORD *)(a2 + 1512);
      goto LABEL_44;
    }
    if (*(int *)(a2 + 140) < 1)
    {
LABEL_68:
      if (*(_DWORD *)(a2 + 548))
      {
        v36 = (void *)objc_opt_new();
        if (*(int *)(a2 + 548) >= 1)
        {
          v37 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", MediaSourceStrings[*(unsigned int *)(a2 + 752 + 4 * v37)]);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v38);

            ++v37;
          }
          while (v37 < *(int *)(a2 + 548));
        }
        v39 = *(NSObject **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v36;
      }
      else
      {
        v39 = *(NSObject **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = &unk_24E6EB288;
      }
      v40 = 1;
      goto LABEL_75;
    }
    v31 = 0;
    while (1)
    {
      v32 = *(_DWORD *)(a2 + 144 + 4 * v31);
      if ((v32 & 0xFFFFFFFC) == 0x14 || ((v32 - 28) >= 8 ? (v33 = v32 == 4) : (v33 = 1), v33))
      {
        v34 = 64;
      }
      else if (v32 != 5 && (v32 - 70) >= 0x14)
      {
        if (v32 == 6)
        {
          v34 = 16;
        }
        else
        {
          if (v32 != 7 && (v32 - 50) > 3)
            goto LABEL_56;
          v34 = 8;
        }
      }
      else
      {
        v34 = 32;
      }
      *(_BYTE *)a1 |= v34;
LABEL_56:
      if (++v31 >= *(int *)(a2 + 140))
        goto LABEL_68;
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("TEST-NO-PDF"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  objc_msgSend(v5, "objectForKey:", CFSTR("TEST-NO-JPEG"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  objc_msgSend(v5, "objectForKey:", CFSTR("TEST-NO-PNG"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("COMMAND SET"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CMD"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = objc_msgSend(v46, "count");
      goto LABEL_7;
    }
  }
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(","));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v46, "count");
LABEL_7:
  if (!v15)
  {

    goto LABEL_31;
  }
  v16 = objc_opt_new();
  v44 = v8;
  v17 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v16;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v18 = v46;
  v45 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  v42 = __PAIR64__(v12, v10);
  v43 = a2;
  v20 = 0;
  if (!v19)
    goto LABEL_27;
  v21 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v50 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("URF"), v42, v43))
      {
        objc_msgSend(*(id *)(a1 + 16), "addObject:", CFSTR("image/urf"));
        v20 = liteInitURF;
        continue;
      }
      if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("PDF")))
      {
        v24 = CFSTR("application/pdf");
LABEL_24:
        objc_msgSend(*(id *)(a1 + 16), "addObject:", v24);
        continue;
      }
      if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("JPEG")))
      {
        v24 = CFSTR("image/jpeg");
        goto LABEL_24;
      }
      if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("PNG")))
      {
        v24 = CFSTR("image/png");
        goto LABEL_24;
      }
      if (objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("application/octet-stream"))
        && objc_msgSend(v23, "containsString:", CFSTR("/")))
      {
        objc_msgSend(*(id *)(a1 + 16), "addObject:", v23);
      }
    }
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  }
  while (v19);
LABEL_27:

  a2 = v43;
  v10 = v42;
  v12 = HIDWORD(v42);
  v8 = v44;

  if (!v20)
    goto LABEL_31;
  if (v20(v47, v43, 1))
  {
    v25 = 1;
    goto LABEL_32;
  }
  _PKLogCategory(PKLogCategoryProgress[0]);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220F9A000, v39, OS_LOG_TYPE_ERROR, "Driver initialization failed.", buf, 2u);
  }
  v40 = 0;
LABEL_75:

  return v40;
}

void sub_220FAF5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void XDriverSetupInfo::~XDriverSetupInfo(id *this)
{

}

char **pwgMediaForPWG(void *a1, char *a2)
{
  MediaArray *v3;
  char **PWGMedia;
  NSString *v5;
  char *v6;
  char *v7;
  char *v8;
  const char *v9;
  char *v10;
  char *v11;
  const char *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char *v21;
  char v22[32];
  char __str[32];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  PWGMedia = 0;
  if (v3)
  {
    if (a2)
    {
      bzero(a2, 0x90uLL);
      PWGMedia = MediaArray::findPWGMedia(v3, v5);
      if (!PWGMedia)
      {
        v6 = (char *)-[MediaArray UTF8String](objc_retainAutorelease(v3), "UTF8String");
        v7 = strchr(v6, 95);
        if (!v7)
          goto LABEL_21;
        v8 = strchr(v7 + 1, 95);
        if (!v8)
          goto LABEL_21;
        v9 = v8;
        v10 = v8 + 1;
        v11 = strchr(v8 + 1, 95);
        if (!v11)
          v11 = (char *)&v9[strlen(v9)];
        v12 = v11 - 2;
        v21 = v10;
        if (v11 - 2 >= v10 && (!strcmp(v11 - 2, "in") || !strncmp(v12, "in_", 3uLL)))
        {
          v14 = 0;
          v13 = 2540;
        }
        else
        {
          v13 = 100;
          v14 = 1;
        }
        v15 = pwg_scan_measurement(v10, &v21, v13, 1);
        if (v21 && *v21 == 120 && (v16 = v15, v17 = pwg_scan_measurement(v21 + 1, &v21, v13, 1), v21))
        {
          v18 = v17;
          if (!strncmp(v6, "disc_", 5uLL))
            v19 = v18;
          else
            v19 = v16;
          *((_DWORD *)a2 + 6) = v19;
          *((_DWORD *)a2 + 7) = v18;
          strlcpy(a2 + 32, v6, 0x41uLL);
          *(_QWORD *)a2 = a2 + 32;
          if (v14)
          {
            pwg_format_millimeters(__str, 0x20uLL, v19);
            pwg_format_millimeters(v22, 0x20uLL, v18);
            snprintf(a2 + 97, 0x29uLL, "%sx%smm");
          }
          else
          {
            pwg_format_inches(__str, 0x20uLL, v19);
            pwg_format_inches(v22, 0x20uLL, v18);
            snprintf(a2 + 97, 0x29uLL, "%sx%s");
          }
          *((_QWORD *)a2 + 2) = a2 + 97;
          PWGMedia = (char **)a2;
        }
        else
        {
LABEL_21:
          PWGMedia = 0;
        }
      }
    }
  }

  return PWGMedia;
}

void sub_220FAF8C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char **MediaArray::findPWGMedia(MediaArray *this, NSString *a2)
{
  MediaArray *v2;
  char **Media;

  v2 = objc_retainAutorelease(this);
  Media = MediaArray::findMedia((const char *)-[MediaArray UTF8String](v2, "UTF8String"), (uint64_t)&__block_literal_global_535);

  return Media;
}

void sub_220FAF928(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t pwg_scan_measurement(char *a1, char **a2, int a3, int a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  const char *v9;
  int v10;
  int i;
  int v12;
  int v13;

  v4 = *a1;
  if ((v4 - 48) > 9)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = *a1;
    do
    {
      v7 = *++a1;
      v4 = v7;
      v5 = v6 + 10 * v5 - 48;
      v6 = v7;
    }
    while ((v7 - 48) < 0xA);
  }
  if (v4 == 46)
  {
    v8 = 10 * a3 * a4;
    v9 = a1 + 1;
    if (v8 < 2)
    {
      v10 = 0;
      i = 1;
    }
    else
    {
      v10 = 0;
      for (i = 1; i < v8; i *= 10)
      {
        v12 = *(unsigned __int8 *)v9;
        if ((v12 - 48) > 9)
          break;
        v10 = v12 + 10 * v10 - 48;
        ++v9;
      }
    }
    a1 = (char *)(v9 - 1);
    do
      v13 = *++a1;
    while ((v13 - 48) < 0xA);
  }
  else
  {
    v10 = 0;
    i = 1;
  }
  if (a2)
    *a2 = a1;
  return (v10 * a3 / a4 / i + v5 * a3 / a4);
}

char *pwg_format_millimeters(char *__str, size_t a2, int a3)
{
  if (a3 % 100)
  {
    if ((a3 % 100) == 10
                                      * ((((103 * (a3 % 100)) & 0x8000) != 0)
                                       + ((103 * (a3 % 100)) >> 10)))
      snprintf(__str, a2, "%d.%01d");
    else
      snprintf(__str, a2, "%d.%02d");
  }
  else
  {
    snprintf(__str, a2, "%d");
  }
  return __str;
}

char *pwg_format_inches(char *__str, size_t a2, int a3)
{
  int v4;

  v4 = (1000 * a3 + 1270) / 2540 % 1000;
  if (v4)
  {
    if ((__int16)v4 % 10)
    {
      snprintf(__str, a2, "%d.%03d");
    }
    else if ((__int16)v4 % 100)
    {
      snprintf(__str, a2, "%d.%02d");
    }
    else
    {
      snprintf(__str, a2, "%d.%01d");
    }
  }
  else
  {
    snprintf(__str, a2, "%d");
  }
  return __str;
}

char *pwgMediaForSize(const char *a1, uint64_t a2, char *a3)
{
  char *result;
  int v7;
  const char *v8;
  int v9;
  unsigned int v10;
  int v11;
  char **v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  char v21[32];
  char __str[32];
  uint64_t v23;

  result = 0;
  v23 = *MEMORY[0x24BDAC8D0];
  if ((int)a1 >= 1 && (int)a2 >= 1 && a3)
  {
    bzero(a3, 0x90uLL);
    result = 0;
    v9 = 999;
    v10 = 177;
    v11 = 999;
    v12 = &cups_pwg_media;
    do
    {
      v13 = *((_DWORD *)v12 + 7);
      v14 = *((_DWORD *)v12 + 6) - (_DWORD)a1;
      if (v14)
        v15 = 0;
      else
        v15 = v13 == (_DWORD)a2;
      if (v15)
        return (char *)v12;
      v16 = v13 - a2;
      if (v16 < 0)
        v16 = -v16;
      if (v14 < 0)
        v14 = (_DWORD)a1 - *((_DWORD *)v12 + 6);
      if (v14 <= 0x32 && v16 <= 0x32 && v14 <= v11 && v16 <= v9)
      {
        result = (char *)v12;
        v11 = v14;
        v9 = v16;
      }
      v12 += 4;
      --v10;
    }
    while (v10 > 1);
    if (!result)
    {
      pwgFormatSizeName(a3 + 32, "custom", 0, a1, a2, v7, v8);
      *(_QWORD *)a3 = a3 + 32;
      *((_DWORD *)a3 + 6) = (_DWORD)a1;
      *((_DWORD *)a3 + 7) = a2;
      if ((a2 % 0x27B) | (a1 % 0x27B))
      {
        pwg_format_millimeters(__str, 0x20uLL, (int)a1);
        pwg_format_millimeters(v21, 0x20uLL, a2);
        snprintf(a3 + 97, 0x29uLL, "%sx%smm");
      }
      else
      {
        pwg_format_inches(__str, 0x20uLL, (int)a1);
        pwg_format_inches(v21, 0x20uLL, a2);
        snprintf(a3 + 97, 0x29uLL, "%sx%s");
      }
      *((_QWORD *)a3 + 2) = a3 + 97;
      return a3;
    }
  }
  return result;
}

char **MediaArray::findMedia(const char *a1, uint64_t a2)
{
  char **v4;
  const char *v5;

  v4 = &cups_pwg_media;
  while (1)
  {
    v5 = (const char *)(*(uint64_t (**)(uint64_t, char **))(a2 + 16))(a2, v4);
    if (v5)
    {
      if (!strcmp(v5, a1))
        break;
    }
    v4 += 4;
    if (v4 >= (char **)&__block_literal_global_535)
      return 0;
  }
  return v4;
}

void pwgFormatSizeName(char *a1, char *__s1, const char *a3, const char *a4, uint64_t a5, int a6, const char *a7)
{
  uint64_t v8;
  const char *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint8_t *v16;
  const char *v17;
  int v18;
  int v19;
  int v20;
  char *(*v21)(char *, size_t, int);
  size_t v22;
  const char *v23;
  char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!a1 || (v8 = (uint64_t)a4, *a1 = 0, ((a5 | a4) & 0x80000000) != 0))
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      return;
    }
    *(_DWORD *)buf = 136315650;
    v32 = "pwgFormatSizeName";
    v33 = 1024;
    v34 = 1280;
    v35 = 2080;
    v36 = "Invalid media name arguments.";
    v16 = buf;
LABEL_17:
    _os_log_impl(&dword_220F9A000, v15, OS_LOG_TYPE_ERROR, "%s: setting ipp status %d error message %s", v16, 0x1Cu);
    goto LABEL_18;
  }
  v10 = a3;
  v11 = __s1;
  if (a3)
  {
    v12 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      v13 = 1;
      while ((v12 - 97) < 0x1A || (v12 - 48) < 0xA || (v12 - 45) < 2)
      {
        v12 = a3[v13++];
        if (!v12)
          goto LABEL_10;
      }
      _PKLogCategory(PKLogCategoryDefault[0]);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v25 = 136315650;
      v26 = "pwgFormatSizeName";
      v27 = 1024;
      v28 = 1280;
      v29 = 2080;
      v30 = "Invalid media name arguments.";
      v16 = (uint8_t *)&v25;
      goto LABEL_17;
    }
LABEL_10:
    if (__s1)
      goto LABEL_11;
  }
  else
  {
    v10 = (const char *)buf;
    if (__s1)
    {
LABEL_11:
      if (!strcmp(__s1, "disc"))
        v8 = 4000;
      else
        v8 = v8;
      v14 = v11;
      goto LABEL_21;
    }
  }
  v14 = "oe";
  v11 = "om";
LABEL_21:
  if ((v8 % 0x27B) | (a5 % 0x27B))
    v17 = "mm";
  else
    v17 = "in";
  v18 = *(unsigned __int16 *)v17;
  v19 = *((unsigned __int8 *)v17 + 2);
  v20 = v18 ^ 0x6E69 | v19;
  if (v20)
    v21 = pwg_format_millimeters;
  else
    v21 = pwg_format_inches;
  if (!v20)
    v11 = v14;
  v21((char *)buf, 28, v8);
  v22 = strlen((const char *)buf);
  buf[v22] = 120;
  v23 = (const char *)&buf[v22 + 1];
  v21((char *)v23, 27 - v22, a5);
  v24 = (char *)&v23[strlen(v23)];
  *(_WORD *)v24 = v18;
  v24[2] = v19;
  snprintf(a1, 0x41uLL, "%s_%s_%s", v11, v10, (const char *)buf);
}

uint64_t ___ZN10MediaArray12findPWGMediaEPKc_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2;
}

void sub_220FB0178(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB01F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB03AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB0488(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB0890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB0B20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

PKNotification *makeNotification<PKNotification>(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  PKNotification *v10;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = -[PKNotification initWithNotifier:notifyKind:]([PKNotification alloc], "initWithNotifier:notifyKind:", v7, a4);
  -[PKNotification setHeaderString:](v10, "setHeaderString:", v8);
  -[PKNotification setMessageString:](v10, "setMessageString:", v9);

  return v10;
}

void sub_220FB0BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FB0D08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_220FB0DBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB0E64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_220FB0FE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_220FB1104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_220FB12C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _notifyCallout(__CFUserNotification *a1, uint64_t a2)
{
  id v4;

  +[PKNotifier sharedNotifier](PKNotifier, "sharedNotifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notification:completedWithResult:", a1, a2);

}

void sub_220FB1348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB13C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

uint64_t PKCancelAlert(NSString *a1)
{
  pthread_mutex_lock(&pk_dialog_mutex);
  if (pk_dialog_ref)
  {
    CFUserNotificationCancel((CFUserNotificationRef)pk_dialog_ref);
    pk_dialog_ref = 0;
    pk_dialog_level = 0;
  }
  return pthread_mutex_unlock(&pk_dialog_mutex);
}

BOOL liteInitURF(void *a1, uint64_t a2, int a3)
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t i;
  id v8;
  const char *v9;
  int v10;
  _BOOL4 v11;
  int v12;
  int v13;
  unint64_t v14;
  int v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t j;
  id v21;
  const char *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  id v35;
  const char *v36;
  int v37;
  int v38;
  id v39;
  const char *v40;
  int v41;
  int v42;
  int v43;
  int *v44;
  int v45;
  uint64_t v49;
  unint64_t v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v62;
  uint64_t k;
  int v64;
  uint64_t m;
  int v66;
  id v67;
  const char *v68;
  int v69;
  id v70;
  const char *v71;
  _DWORD *v72;
  id v73;
  const char *v74;
  void *v75;
  void *v76;
  unint64_t n;
  id v78;
  const char *v79;
  double v80;
  int v81;
  int v82;
  int v83;
  BOOL v84;
  int v85;
  int v86;
  int *v87;
  uint64_t v88;
  _DWORD *v89;
  void *v90;
  _BOOL8 v91;
  _QWORD *v92;
  double v94;
  double v95;
  double v96;
  double v97;
  id v99;
  id v100;
  int v101;
  unsigned __int16 v102;
  unsigned __int8 v103;
  uint64_t v104;
  int v105[50];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v104 = 0;
  v100 = a1;
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("URF"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  for (i = 0; objc_msgSend(v6, "count") > i; ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    if (!strncmp(v9, "CP", 2uLL))
    {
      *(_DWORD *)(a2 + 128) = atoi(v9 + 2) > 1;
    }
    else if (!strncmp(v9, "DM", 2uLL))
    {
      v12 = v9[2];
      if (v12 >= 49)
      {
        *(_BYTE *)(a2 + 120) |= 1u;
        LOBYTE(v12) = v9[2];
      }
      if (v12 == 51)
      {
        *(_DWORD *)(a2 + 136) = 2;
      }
      else if (v12 == 50)
      {
        *(_DWORD *)(a2 + 136) = 1;
      }
    }
    else if (!strncmp(v9, "FN", 2uLL))
    {
      *(_DWORD *)(a2 + 140) = urf_parse_values(v9 + 2, (int *)(a2 + 144), 101);
    }
    else if (!strncmp(v9, "IS", 2uLL))
    {
      *(_DWORD *)(a2 + 548) = urf_parse_values(v9 + 2, (int *)(a2 + 752), 50);
    }
    else if (!strncmp(v9, "MT", 2uLL))
    {
      *(_DWORD *)(a2 + 1524) = urf_parse_values(v9 + 2, (int *)(a2 + 1528), 14);
    }
    else if (!strncmp(v9, "OB", 2uLL))
    {
      *(_DWORD *)(a2 + 1584) = urf_parse_values(v9 + 2, (int *)(a2 + 1788), 50);
    }
    else if (!strncmp(v9, "RS", 2uLL))
    {
      *(_DWORD *)(a2 + 2000) = urf_parse_values(v9 + 2, (int *)(a2 + 2020), 4);
    }
    else if (!strcmp(v9, "SRGB24"))
    {
      *(_BYTE *)(a2 + 120) |= 2u;
    }
    else if (!strncmp(v9, "ADOBERGB", 8uLL))
    {
      v13 = urf_parse_values(v9 + 8, v105, 4);
      if (v13 < 1)
      {
        v16 = 0;
      }
      else
      {
        v14 = 0;
        do
          v15 = v105[v14++];
        while (v14 < v13 && v15 != 48);
        v16 = v15 == 48;
      }
      *(_DWORD *)(a2 + 2008) = v16;
    }
    else if (!strncmp(v9, "P3E48", 5uLL))
    {
      *(_DWORD *)(a2 + 2012) = 1;
    }
    else if (!strncmp(v9, "WE16", 4uLL))
    {
      *(_DWORD *)(a2 + 2016) = 1;
    }
    else if (*v9 == 86)
    {
      v10 = urf_parse_values(v9 + 1, v105, 2);
      if (v10 >= 1)
      {
        v11 = v10 != 1;
        if (v105[0] != 1)
          v11 = 0;
        if (v105[1] <= 1)
          v11 = 0;
        if (v105[0] > 1 || v11)
          *(_DWORD *)(a2 + 2004) = 1;
      }
    }
  }
  v17 = *(unsigned int *)(a2 + 548);
  if ((int)v17 >= 2)
  {
    *(_DWORD *)(a2 + 548) = v17 + 1;
    *(_DWORD *)(a2 + 4 * v17 + 752) = 0;
  }
  v18 = *(unsigned int *)(a2 + 1524);
  if ((int)v18 >= 2)
  {
    *(_DWORD *)(a2 + 1524) = v18 + 1;
    *(_DWORD *)(a2 + 4 * v18 + 1528) = 0;
  }
  v19 = *(unsigned int *)(a2 + 1584);
  if ((int)v19 >= 2)
  {
    *(_DWORD *)(a2 + 1584) = v19 + 1;
    *(_DWORD *)(a2 + 4 * v19 + 1788) = 0;
  }
  for (j = 0; objc_msgSend(v6, "count") > j; ++j)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", j);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");

    if (!strncmp(v22, "OFU", 3uLL))
    {
      v23 = urf_parse_values(v22 + 3, v105, 50);
      if (v23 != 1 || v105[0])
      {
        if (v23 >= 1)
        {
          v25 = v23;
          v26 = v105;
          do
          {
            v28 = *v26++;
            v27 = v28;
            if ((int)v28 <= 49)
              *(_DWORD *)(a2 + 4 * v27 + 1588) = 1;
            --v25;
          }
          while (v25);
        }
      }
      else
      {
        v24 = *(unsigned int *)(a2 + 1584);
        if ((int)v24 >= 1)
          memset_pattern16((void *)(a2 + 1588), &unk_220FE0BC0, 4 * v24);
      }
    }
  }
  v29 = *(_DWORD *)(a2 + 2000);
  if (!v29)
  {
    v29 = 1;
    *(_DWORD *)(a2 + 2000) = 1;
    *(_DWORD *)(a2 + 2020) = 300;
  }
  *(_DWORD *)(a2 + 1996) = *(_DWORD *)(a2 + 4 * (v29 / 2) + 2020);
  v30 = *(unsigned int *)(a2 + 1524);
  if ((int)v30 < 1)
  {
    v31 = 1;
  }
  else if (*(_DWORD *)(a2 + 1528) == 3)
  {
    v31 = 0;
  }
  else
  {
    v32 = 0;
    do
    {
      v33 = v32;
      if (v30 - 1 == v32)
        break;
      v34 = *(_DWORD *)(a2 + 1532 + 4 * v32++);
    }
    while (v34 != 3);
    v31 = v33 + 1 >= v30;
  }
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("MAXSIZE"));
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36 = (const char *)objc_msgSend(v35, "UTF8String");

  if (!v36)
    goto LABEL_83;
  LOBYTE(v102) = 0;
  if (sscanf(v36, "%fx%f%2s", (char *)&v104 + 4, &v104, &v102) != 3)
    goto LABEL_83;
  if (!(v102 ^ 0x6E69 | v103))
  {
    v94 = *((float *)&v104 + 1);
    v95 = 2540.0;
LABEL_174:
    v38 = (int)(v94 * v95);
    v37 = (int)(*(float *)&v104 * v95);
    goto LABEL_84;
  }
  if (!(v102 ^ 0x6D6D | v103))
  {
    v94 = *((float *)&v104 + 1);
    v95 = 100.0;
    goto LABEL_174;
  }
LABEL_83:
  v37 = 35560;
  v38 = 21590;
LABEL_84:
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("MINSIZE"));
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = (const char *)objc_msgSend(v39, "UTF8String");

  if (!v40)
    goto LABEL_88;
  LOBYTE(v102) = 0;
  if (sscanf(v40, "%fx%f%2s", (char *)&v104 + 4, &v104, &v102) != 3)
    goto LABEL_88;
  if (!(v102 ^ 0x6E69 | v103))
  {
    v96 = *((float *)&v104 + 1);
    v97 = 2540.0;
LABEL_176:
    v42 = (int)(v96 * v97);
    v41 = (int)(*(float *)&v104 * v97);
    goto LABEL_89;
  }
  if (!(v102 ^ 0x6D6D | v103))
  {
    v96 = *((float *)&v104 + 1);
    v97 = 100.0;
    goto LABEL_176;
  }
LABEL_88:
  v41 = 27940;
  v42 = 21000;
LABEL_89:
  v43 = 0;
  v44 = &dword_220FE0ACC;
  do
  {
    v45 = *(v44 - 1);
    if (v45 >= v42 && v45 <= v38 && *v44 >= v41 && *v44 <= v37 && ((v43 - 19) >= 5 || !v31))
    {
      v49 = *(int *)(a2 + 992);
      *(_DWORD *)(a2 + 992) = v49 + 1;
      *(_DWORD *)(a2 + 4 * v49 + 996) = v43;
    }
    ++v43;
    v44 += 2;
  }
  while (v43 != 24);
  v50 = *(unsigned int *)(a2 + 548);
  if ((int)v50 < 1)
  {
    v55 = 0;
  }
  else
  {
    v51 = *(_DWORD *)(a2 + 752);
    v52 = v51 - 9;
    v53 = v51 - 40;
    if (v52 >= 2 && v53 >= 0xA)
    {
      v56 = 0;
      do
      {
        v57 = v56;
        if (v50 - 1 == v56)
          break;
        v58 = *(_DWORD *)(a2 + 756 + 4 * v56);
        v59 = v58 - 9;
        v60 = v58 - 40;
        v56 = v57 + 1;
      }
      while (v59 >= 2 && v60 > 9);
      v55 = v57 + 1 < v50;
    }
    else
    {
      v55 = 1;
    }
  }
  if (v42 != v38 || v41 != v37)
  {
    v62 = *(int *)(a2 + 992);
    *(_DWORD *)(a2 + 992) = v62 + 1;
    *(_DWORD *)(a2 + 4 * v62 + 996) = 24;
    *(_DWORD *)(a2 + 1520) = v41;
    *(_DWORD *)(a2 + 1512) = v37;
    if (v55)
    {
      for (k = 4u; k != -1; --k)
      {
        v64 = RollWidths[k];
        if (v64 >= v42)
          *(_DWORD *)(a2 + 1516) = v64;
      }
      for (m = 0; m != 5; ++m)
      {
        v66 = RollWidths[m];
        if (v66 <= v38)
          *(_DWORD *)(a2 + 1508) = v66;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 1516) = v42;
      *(_DWORD *)(a2 + 1508) = v38;
    }
  }
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("TEST-BORDERLESS"));
  v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v68 = (const char *)objc_msgSend(v67, "UTF8String");

  if (v68)
    v69 = atoi(v68);
  else
    v69 = 0;
  *(_DWORD *)(a2 + 952) = v69;
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("TEST-MARGINS"));
  v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v71 = (const char *)objc_msgSend(v70, "UTF8String");

  if (!v71)
  {
    *(_DWORD *)(a2 + 972) = 635;
    *(int32x2_t *)(a2 + 976) = vdup_n_s32(0x27Bu);
    v72 = (_DWORD *)(a2 + 984);
    goto LABEL_140;
  }
  v72 = (_DWORD *)(a2 + 984);
  if (sscanf(v71, "%d%d%d%d", a2 + 972, a2 + 976, a2 + 980, a2 + 984) != 4)
  {
    *(int32x2_t *)(a2 + 972) = vdup_n_s32(0x27Bu);
    *(_DWORD *)(a2 + 980) = 635;
LABEL_140:
    *v72 = 635;
  }
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("TEST-DUPLEX"));
  v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v74 = (const char *)objc_msgSend(v73, "UTF8String");

  if (v74 && sscanf(v74, "%d%d%d%d", a2 + 956, a2 + 960, a2 + 964, a2 + 968) != 4)
  {
    *(_QWORD *)(a2 + 956) = 0;
    *(_QWORD *)(a2 + 964) = 0;
  }
  objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("TEST-MEDIA-READY"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v99 = v75;
    objc_msgSend(v75, "componentsSeparatedByString:", CFSTR(","));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    for (n = 0; objc_msgSend(v76, "count") > n; ++n)
    {
      objc_msgSend(v76, "objectAtIndexedSubscript:", n);
      v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v79 = (const char *)objc_msgSend(v78, "UTF8String");

      LOBYTE(v102) = 0;
      v105[0] = 0;
      v101 = 0;
      if (sscanf(v79, "%fx%f%2s IS%d MT%d", (char *)&v104 + 4, &v104, &v102, v105, &v101) != 5)
        break;
      v80 = 2540.0;
      if (v102 ^ 0x6E69 | v103)
      {
        if (v102 ^ 0x6D6D | v103)
          break;
        v80 = 100.0;
      }
      v81 = 0;
      v82 = (int)(v80 * *(float *)&v104);
      v83 = (int)(v80 * *((float *)&v104 + 1));
      v84 = v83 <= v82;
      if (v83 >= v82)
        v85 = (int)(v80 * *(float *)&v104);
      else
        v85 = (int)(v80 * *((float *)&v104 + 1));
      if (v83 > v82)
        v82 = (int)(v80 * *((float *)&v104 + 1));
      if (v84)
        v86 = 3;
      else
        v86 = 4;
      v87 = &dword_220FE0ACC;
      do
      {
        if (*(v87 - 1) == v85 && *v87 == v82)
          break;
        ++v81;
        v87 += 2;
      }
      while (v81 != 24);
      v88 = *(int *)(a2 + 1096);
      v89 = (_DWORD *)(a2 + 4 * v88);
      v89[275] = v81;
      v89[325] = v105[0];
      v89[300] = v101;
      v89[350] = v86;
      *(_DWORD *)(a2 + 1096) = v88 + 1;
      if (v81 == 24)
      {
        *(_DWORD *)(a2 + 1500) = v85;
        *(_DWORD *)(a2 + 1504) = v82;
      }
    }

    v75 = v99;
  }

  *(_DWORD *)(a2 + 988) = 10;
  v90 = *(void **)(a2 + 2040);
  *(_QWORD *)(a2 + 2040) = CFSTR("image/urf");

  if (a3)
  {
    v91 = 1;
  }
  else
  {
    v92 = urfNew((uint64_t)urf_write_cb, a2);
    *(_QWORD *)(a2 + 2048) = v92;
    *(_QWORD *)(a2 + 2064) = urf_startjob;
    *(_QWORD *)(a2 + 2072) = urf_endjob;
    *(_QWORD *)(a2 + 2080) = urf_startpage;
    *(_QWORD *)(a2 + 2088) = urf_endpage;
    *(_QWORD *)(a2 + 2096) = urf_sendpixels;
    v91 = v92 != 0;
  }

  return v91;
}

void sub_220FB203C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  void *v19;

  _Unwind_Resume(a1);
}

uint64_t urf_parse_values(const char *a1, int *a2, int a3)
{
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v10;

  v3 = *a1;
  if (!*a1)
    return 0;
  v4 = 0;
  v5 = MEMORY[0x24BDAC740];
  do
  {
    if ((*(_DWORD *)(v5 + 4 * v3 + 60) & 0x400) != 0)
    {
      v6 = 0;
      do
      {
        v6 = 10 * v6 + (char)v3 - 48;
        v7 = *(unsigned __int8 *)++a1;
        v3 = v7;
      }
      while ((*(_DWORD *)(v5 + 4 * v7 + 60) & 0x400) != 0);
    }
    else
    {
      v6 = 0;
    }
    v8 = v4 + 1;
    a2[v4] = v6;
    if (*(unsigned __int8 *)a1 - 45 > 1 || v8 >= a3)
      break;
    v10 = *(unsigned __int8 *)++a1;
    v3 = v10;
    ++v4;
  }
  while (v10);
  return v8;
}

uint64_t urf_write_cb(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))a1)(*(_QWORD *)(a1 + 8));
}

uint64_t urf_startjob(uint64_t a1, int a2)
{
  return urfWriteStart(*(_QWORD *)(a1 + 2048), a2);
}

uint64_t urf_endjob(uint64_t a1)
{
  urfDelete(*(_QWORD **)(a1 + 2048));
  *(_QWORD *)(a1 + 2048) = 0;
  return 1;
}

uint64_t urf_startpage(uint64_t a1, uint64_t *a2)
{
  return urfWritePage(*(_QWORD *)(a1 + 2048), a2);
}

uint64_t urf_endpage()
{
  return 1;
}

uint64_t urf_sendpixels(uint64_t a1, void *a2, int a3)
{
  int v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)(a1 + 84) & 0xFFFFFFFE;
  v6 = *(_QWORD *)(a1 + 2048);
  v7 = 1;
  if (v5 == 4)
  {
    v8 = 1;
  }
  else
  {
    a3 = 1;
    v8 = v3;
  }
  if (!urfWriteLine(v6, a2, a3, v8, 0))
  {
    _PKLogCategory(PKLogCategoryProgress[0]);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 2048);
      v11 = *(_DWORD *)(v10 + 80);
      v12 = *(_DWORD *)(v10 + 40);
      v14 = 136316162;
      v15 = "urf_sendpixels";
      v16 = 1024;
      v17 = v3;
      v18 = 1024;
      v19 = v11;
      v20 = 1024;
      v21 = v12;
      v22 = 2080;
      v23 = urfErrorString(v10);
      _os_log_impl(&dword_220F9A000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to send %d lines at %d/%d: %s", (uint8_t *)&v14, 0x28u);
    }

    return 0;
  }
  return v7;
}

void sub_220FB2334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB2398(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB23F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB251C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FB2664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FB29B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_220FB2C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FB2D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB2E34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FB2F68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB3078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB31F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB32C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB336C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB3560(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FB3658(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB3798(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB3850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FB3914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FB3B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB3BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FB3D68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

void sub_220FB3EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_220FB406C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FB430C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FB4488(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSArray * {__strong}>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FB4580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_220FB497C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FB4B20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB50F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_220FB545C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSArray<NSDictionary *> * {__strong}>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FB55A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_220FB561C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB580C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB595C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void pk_iCloudPrintersChanged(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PRINTERTOOL_ICLOUDPRINTERS_CHANGED_NOTIFICATION"), 0);

}

void sub_220FB59B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB5A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB5AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB5B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB5C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FB5CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FB5D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB5DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB5F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB5FCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB6064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB61F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB6368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSURL * {__strong}>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FB647C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void unxferSize(NSMutableDictionary *a1, NSDictionary *a2, NSString *a3)
{
  NSMutableDictionary *v5;
  NSDictionary *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("width"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("height"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v16 = v12;
    v17 = v14;

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v16, "{CGSize=dd}");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, v7, v16, v17);

  }
}

void sub_220FB65CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

Class initMCProfileConnection(void)
{
  Class result;

  if (LoadManagedConfiguration(void)::loadPredicate != -1)
    dispatch_once(&LoadManagedConfiguration(void)::loadPredicate, &__block_literal_global_89);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)(void))MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction(void)
{
  return (id)classMCProfileConnection;
}

void ___ZL24LoadManagedConfigurationv_block_invoke()
{
  LoadManagedConfiguration(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  if (!LoadManagedConfiguration(void)::frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration"));
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_24E6CD060;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FB6750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke_2;
  v8[3] = &unk_24E6CD060;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FB683C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP7NSArrayIP12NSDictionaryEET_P8NSStringdU13block_pointerFvU13block_pointerFvS6_EE_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_24E6CD0B0;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FB6928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP5NSURLET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

double PKDrawImageToSheet(CGContext *a1, CGImage *a2, unsigned int a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  int v9;
  double v10;
  double result;

  if (a3 > 7)
    v9 = 1;
  else
    v9 = PKDrawImageToSheet::_UIImageOrientationToEXIFOrientationMapping[a3];
  v10 = a5 - (a7 + a9);
  _liteDrawImageToSheet(a1, a2, v9, *(CGSize *)&a4, *(CGRect *)&a6);
  return result;
}

void sub_220FB6A2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB6ADC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB6B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB6C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_220FB6D28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FB6DB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB6E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FB6F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<PKPrinter * {__strong}>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FB7094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_220FB71AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<PKJob * {__strong}>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FB72A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_220FB734C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FB748C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB75B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FB7770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FB78D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FB7988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FB7B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  void *v29;

  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_220FB7C90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB7D94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB7E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB7EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB7F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FB8028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FB8114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t withDebuggableSemaphore<PKStatus>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FB81E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FB8250(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8298(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB82E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB836C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB83B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB83F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB843C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8484(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB84CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8510(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8598(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB85E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8628(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8670(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB86B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8748(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8AB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB8F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void ___ZL27_initPrintKitNotificiationsv_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v1;

  notify_register_check("com.apple.printd.running", &printd_running_token);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_printkitJobListChanged, CFSTR("com.apple.printd.job-list"), 0, (CFNotificationSuspensionBehavior)0);
  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_printkitProgress, CFSTR("com.apple.printd.job-progress"), 0, (CFNotificationSuspensionBehavior)0);
}

void _printkitJobListChanged(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PKJobListNotification"), 0);

}

void sub_220FB91F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _printkitProgress(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PKJobProgressNotification"), 0);

}

void sub_220FB9254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_24E6CD5A8;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FB92F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP9PKPrinterET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_24E6CD5D0;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FB93DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP5PKJobET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke_2;
  v8[3] = &unk_24E6CD5F8;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FB94C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

intptr_t ___Z23withDebuggableSemaphoreI8PKStatusET_P8NSStringdU13block_pointerFvU13block_pointerFvS1_EE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_220FB953C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB97F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v8;

  _Unwind_Resume(a1);
}

void sub_220FB98C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB9918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB996C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB99C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB9A14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB9A68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB9ABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FB9B24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB9B98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FB9BF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBA0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,void *a21,void *a22)
{

  if (a21)
  {

  }
  _Unwind_Resume(a1);
}

id _PKLogCategory(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (logInit(void)::onceToken != -1)
    dispatch_once(&logInit(void)::onceToken, &__block_literal_global_7);
  objc_msgSend((id)pkLogCategories, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }

  return v2;
}

void sub_220FBA2B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void withDebuggableSemaphore(void *a1, void *a2, double a3)
{
  id v5;
  void (**v6)(id, NSObject *);
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  NSObject *v12;
  const char *v13;
  int v14;
  unsigned int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  do
    v7 = __ldaxr((unsigned int *)&withDebuggableSemaphore(NSString *,double,void({block_pointer})(NSObject  {objcproto21OS_dispatch_semaphore}*))::sSequence);
  while (__stlxr(v7 + 1, (unsigned int *)&withDebuggableSemaphore(NSString *,double,void({block_pointer})(NSObject  {objcproto21OS_dispatch_semaphore}*))::sSequence));
  _PKLogCategory(PKLogCategoryDefault[0]);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109378;
    v15 = v7;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_DEFAULT, "[%d] synchronous callout from %{public}@ - begin", (uint8_t *)&v14, 0x12u);
  }

  v9 = dispatch_semaphore_create(0);
  v6[2](v6, v9);
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v11 = dispatch_semaphore_wait(v9, v10);
  _PKLogCategory(PKLogCategoryDefault[0]);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "timed out";
    v14 = 67109634;
    v15 = v7;
    if (!v11)
      v13 = "completed";
    v16 = 2114;
    v17 = v5;
    v18 = 2082;
    v19 = v13;
    _os_log_impl(&dword_220F9A000, v12, OS_LOG_TYPE_DEFAULT, "[%d] synchronous callout from %{public}@ - %{public}s", (uint8_t *)&v14, 0x1Cu);
  }

}

void sub_220FBA48C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void ___ZL7logInitv_block_invoke()
{
  os_log_t v0;
  os_log_t v1;
  os_log_t v2;
  os_log_t v3;
  os_log_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v7[0] = PKLogCategoryDefault[0];
  v0 = os_log_create("com.apple.printing", (const char *)-[__CFString UTF8String](PKLogCategoryDefault[0], "UTF8String"));
  v8[0] = v0;
  v7[1] = PKLogCategoryNetwork[0];
  v1 = os_log_create("com.apple.printing", (const char *)-[__CFString UTF8String](PKLogCategoryNetwork[0], "UTF8String"));
  v8[1] = v1;
  v7[2] = PKLogCategoryDiscovery[0];
  v2 = os_log_create("com.apple.printing", (const char *)-[__CFString UTF8String](PKLogCategoryDiscovery[0], "UTF8String"));
  v8[2] = v2;
  v7[3] = PKLogCategoryProgress[0];
  v3 = os_log_create("com.apple.printing", (const char *)-[__CFString UTF8String](PKLogCategoryProgress[0], "UTF8String"));
  v8[3] = v3;
  v7[4] = PKLogCategoryFramework;
  v4 = os_log_create("com.apple.printing", (const char *)objc_msgSend(PKLogCategoryFramework, "UTF8String"));
  v8[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)pkLogCategories;
  pkLogCategories = v5;

}

void sub_220FBA61C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_220FBA6A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBA73C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBA7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKMediaName;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_220FBAA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_220FBAAB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBACD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBADEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBB224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FBB530(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBB794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FBBB4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FBBBF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_220FBBCC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FBBDB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FBBE70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBBEF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBC000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBC0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FBC204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBC490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_220FBC5CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FBC66C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBC718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBC808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FBC8DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBC994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBCAB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

PKPaper *genericSize(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString *v7;
  PKPaper *v8;

  v7 = a1;
  v8 = -[PKPaper initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:]([PKPaper alloc], "initWithWidth:Height:Left:Top:Right:Bottom:localizedName:codeName:mediaInfo:", a2, a3, 635, 635, 635, a4, 0, v7, 0);

  return v8;
}

void sub_220FBCB60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBCDF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBCEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBD088(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FBD160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FBD1BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FBD318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(a1);
}

void sub_220FBD368()
{
  JUMPOUT(0x220FBD350);
}

void sub_220FBD370()
{
  JUMPOUT(0x220FBD354);
}

void sub_220FBD378()
{
  JUMPOUT(0x220FBD358);
}

void sub_220FBD380()
{
  JUMPOUT(0x220FBD35CLL);
}

void sub_220FBD400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBD780(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_220FBD888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FBD924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FBD9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FBDA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FBDB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FBDE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  uint64_t v28;

  _Unwind_Resume(a1);
}

void sub_220FBE0A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FBE194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FBE734(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBE83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_220FBE92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FBEED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBEF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FBF01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_220FBF0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FBF18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FBF258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FBF304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FBF714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FBFBE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBFC68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FBFD28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FC0160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,void *a25)
{

  _Unwind_Resume(a1);
}

id GetLocalizedNameForOption(NSString *a1, NSString *a2)
{
  NSString *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.PrintKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_220FC02D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FC0360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC0480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_220FC065C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FC0838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC0A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC0B7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC0CA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC0DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FC0E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC1150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FC1264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC1450(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC1960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_220FC1C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{

  _Unwind_Resume(a1);
}

void sub_220FC1F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id _cupsGet1284Values(NSString *a1)
{
  NSString *v1;
  void *v2;
  NSString *v3;
  const char *v4;
  char v5;
  char v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  _BYTE *v10;
  _BYTE *v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  unsigned int v17;
  _BYTE *v18;
  int v19;
  uint64_t v20;
  _BOOL4 v22;
  uint64_t v23;
  char v24;
  _BYTE *v25;
  _BYTE *v26;
  unsigned int v27;
  uint64_t v28;
  void *v31;
  void *v32;
  _BYTE v34[256];
  _BYTE v35[256];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v3 = objc_retainAutorelease(v1);
  v4 = -[NSString UTF8String](v3, "UTF8String");
  v5 = *v4;
  if (*v4)
  {
LABEL_2:
    while (v5 <= 0x20 && ((1 << v5) & 0x100003600) != 0 || v5 == 11)
    {
      v6 = *++v4;
      v5 = v6;
    }
    if (v5)
    {
      v7 = 0;
      v8 = v4 + 2;
      while (v5)
      {
        if (v5 == 58)
        {
          v10 = &v35[v7];
          if (v7 >= 1)
          {
            do
            {
              v11 = v10 - 1;
              v12 = (char)*(v10 - 1);
              v13 = v12 > 0x20;
              v14 = (1 << v12) & 0x100003600;
              if ((v13 || v14 == 0) && *(v10 - 1) != 11)
                break;
              --v10;
            }
            while (v11 > v35);
          }
          *v10 = 0;
          do
          {
            v17 = *++v4;
            v18 = v8;
            v19 = v17;
            v20 = (1 << v17) & 0x100003600;
            v22 = v17 <= 0x20 && v20 != 0 || v19 == 11;
            v8 = v18 + 1;
          }
          while (v22);
          if (v19)
          {
            v23 = 0;
            v4 = v18;
            while ((_BYTE)v19)
            {
              if (v19 == 59)
              {
                v25 = &v34[v23];
                if (v23 >= 1)
                {
                  do
                  {
                    v26 = v25 - 1;
                    v27 = (char)*(v25 - 1);
                    v13 = v27 > 0x20;
                    v28 = (1 << v27) & 0x100003600;
                    if ((v13 || v28 == 0) && *(v25 - 1) != 11)
                      break;
                    --v25;
                  }
                  while (v26 > v34);
                }
                *v25 = 0;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v34);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v35);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "setObject:forKey:", v31, v32);

                v5 = *v4;
                if (*v4)
                  goto LABEL_2;
                goto LABEL_50;
              }
              if (v23 <= 254)
                v34[v23++] = v19;
              v24 = *v4++;
              LOBYTE(v19) = v24;
            }
          }
          break;
        }
        if (v7 <= 254)
          v35[v7++] = v5;
        v9 = *++v4;
        v5 = v9;
        ++v8;
      }
    }
  }
LABEL_50:

  return v2;
}

void sub_220FC21D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FC240C(_Unwind_Exception *a1)
{
  uint64_t v1;

  XDriverSetupInfo::~XDriverSetupInfo((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_220FC2960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_220FC2A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC2B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FC313C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC3228(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC3380(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC3430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC34F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FC364C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_220FC3834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC38F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC3B10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC3CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  void *v10;
  uint64_t i;

  for (i = 48; i != -16; i -= 16)
  _Unwind_Resume(a1);
}

void sub_220FC3DD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC3EA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC3FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  void *v10;
  uint64_t i;

  for (i = 48; i != -16; i -= 16)
  _Unwind_Resume(a1);
}

void sub_220FC4168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FC4264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL21convertIPPIntsToArrayP18PK_ipp_attribute_t_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "integer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void sub_220FC435C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL20ensureLowercasedKeysP12NSDictionaryIP8NSStringS1_E_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

void sub_220FC43D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC4440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC4714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FC4824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC490C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FC4978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC4A60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_220FC4B28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC4CDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_220FC4F7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_220FC5158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FC5234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC52E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC53E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_220FC54D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC5704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FC5BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v12;
  uint64_t i;
  uint64_t j;

  for (i = 16; i != -8; i -= 8)
  for (j = 16; j != -8; j -= 8)

  _Unwind_Resume(a1);
}

void sub_220FC5E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FC60C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_220FC6324(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC6570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC67CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FC68FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC699C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FC6A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FC6B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FC6C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FC6D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FC6DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FC6E58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC6F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FC7148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC7A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  void *v29;
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_220FC7C04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC7DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_220FC7EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void DescVisitor::visitProperties(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _BYTE *);
  void *v5;
  _BYTE v6[8];
  id v7;
  id v8;

  v3 = a1;
  v4 = a2;
  _DescVisitor::_DescVisitor((_DescVisitor *)v6);
  v5 = (void *)MEMORY[0x227667A1C]();
  objc_msgSend(v3, "visitProperties:", v6);
  objc_autoreleasePoolPop(v5);
  v4[2](v4, v6);

}

void sub_220FC8020(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _DescVisitor::~_DescVisitor(id *this)
{

}

{

  JUMPOUT(0x227667788);
}

void EncodeVisitor::visitProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void (**v6)(_EncodeVisitor *__hidden);
  id v7;

  v3 = a1;
  v4 = a2;
  v6 = &off_24E6C0060;
  v7 = v4;
  v5 = (void *)MEMORY[0x227667A1C](v4);
  objc_msgSend(v3, "visitProperties:", &v6);
  objc_autoreleasePoolPop(v5);

}

void sub_220FC80F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void _EncodeVisitor::~_EncodeVisitor(id *this)
{

}

{

  JUMPOUT(0x227667788);
}

void DecodeVisitor::visitProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void (**v6)(_DecodeVisitor *__hidden);
  id v7;

  v3 = a1;
  v4 = a2;
  v6 = &off_24E6BFF88;
  v7 = v4;
  v5 = (void *)MEMORY[0x227667A1C](v4);
  objc_msgSend(v3, "visitProperties:", &v6);
  objc_autoreleasePoolPop(v5);

}

void sub_220FC81B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void _DecodeVisitor::~_DecodeVisitor(id *this)
{

}

{

  JUMPOUT(0x227667788);
}

void CompareVisitor::visitProperties(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, void (***)(_CompareVisitor *__hidden));
  id v8;
  void *v9;
  void (**v10)(_CompareVisitor *__hidden);
  char v11;
  id v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v6;
  v10 = &off_24E6C0138;
  v12 = v8;
  v11 = 1;
  v9 = (void *)MEMORY[0x227667A1C]();
  objc_msgSend(v5, "visitProperties:", &v10);
  objc_autoreleasePoolPop(v9);
  v7[2](v7, &v10);

}

void sub_220FC829C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void _CompareVisitor::~_CompareVisitor(id *this)
{

}

{

  JUMPOUT(0x227667788);
}

void UserCodedSerializationVisitor::visitProperties(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void (**v5)(_UserCodedSerializationVisitor *__hidden);
  id v6;

  v3 = a1;
  v5 = &off_24E6C0218;
  v6 = (id)MEMORY[0x227667BF0](a2);
  v4 = (void *)MEMORY[0x227667A1C]();
  objc_msgSend(v3, "visitProperties:", &v5);
  objc_autoreleasePoolPop(v4);

}

void sub_220FC8350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::~_UserCodedSerializationVisitor(id *this)
{

}

{

  JUMPOUT(0x227667788);
}

void _DescVisitor::_DescVisitor(_DescVisitor *this)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = &off_24E6BFEA0;
  v2 = objc_opt_new();
  v3 = (void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v2;

  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v4;

}

void sub_220FC83F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, BOOL *a3)
{
  __CFString *v3;

  if (*a3)
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  _DescVisitor::addNamed(this, a2, &v3->isa);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, unsigned int *a3)
{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed(this, v6, v5);

}

void sub_220FC84D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, uint64_t *a3)
{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), *a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed(this, v6, v5);

}

void sub_220FC8564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _DescVisitor::visit(_DescVisitor *this, NSString *a2, unint64_t *a3)
{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed(this, v6, v5);

}

void sub_220FC85F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _DescVisitor::visit(id *a1, void *a2, NSObject **a3)
{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

{
  NSString *v5;
  NSString *v6;

  v6 = a2;
  _DescVisitor::see(a1, *a3);
  -[NSObject debugDescription](*a3, "debugDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  _DescVisitor::addNamed((_DescVisitor *)a1, v6, v5);

}

void sub_220FC8674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC86F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC877C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC898C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC8EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id _DescVisitor::lines(id *this)
{
  return this[2];
}

uint64_t _DescVisitor::seenClasses(id *this)
{
  return objc_msgSend(this[1], "allObjects");
}

void _DescVisitor::addNamed(_DescVisitor *this, NSString *a2, NSString *a3)
{
  void *v3;
  id v4;

  v3 = (void *)*((_QWORD *)this + 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");

}

void sub_220FC8F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void _DescVisitor::see(id *this, NSObject *a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(this[1], "addObject:", v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject allObjects](v9, "allObjects");
      v6 = objc_claimAutoreleasedReturnValue();
      _DescVisitor::see((_DescVisitor *)this, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10[0] = MEMORY[0x24BDAC760];
          v10[1] = 3221225472;
          v10[2] = ___ZN12_DescVisitor3seeEP8NSObject_block_invoke;
          v10[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
          v10[4] = this;
          -[NSObject enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v10);
        }
        goto LABEL_7;
      }
      v6 = v9;
      -[NSObject allKeys](v6, "allKeys");
      v7 = objc_claimAutoreleasedReturnValue();
      _DescVisitor::see((_DescVisitor *)this, v7);

      -[NSObject allValues](v6, "allValues");
      v8 = objc_claimAutoreleasedReturnValue();
      _DescVisitor::see((_DescVisitor *)this, v8);

    }
LABEL_7:

    v3 = v9;
  }

}

void sub_220FC90A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

uint64_t ___ZN12_DescVisitor3seeEP8NSObject_block_invoke(uint64_t a1, NSObject *a2)
{
  return _DescVisitor::see(*(_DescVisitor **)(a1 + 32), a2);
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, BOOL *a3)
{
  return objc_msgSend(this[1], "encodeBool:forKey:", *a3, a2);
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, unsigned int *a3)
{
  return objc_msgSend(this[1], "encodeInt:forKey:", *a3, a2);
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, uint64_t *a3)
{
  return objc_msgSend(this[1], "encodeInteger:forKey:", *a3, a2);
}

uint64_t _EncodeVisitor::visit(id *this, NSString *a2, unint64_t *a3)
{
  return objc_msgSend(this[1], "encodeInteger:forKey:", *a3, a2);
}

uint64_t _EncodeVisitor::visit(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

{
  return objc_msgSend(*(id *)(a1 + 8), "encodeObject:forKey:", *a3, a2);
}

void _EncodeVisitor::visit(uint64_t a1, void *a2, id *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 8);
  objc_msgSend(*a3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, v7);

}

void sub_220FC925C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _DecodeVisitor::visit(id *this, NSString *a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(this[1], "decodeBoolForKey:", a2);
  *a3 = result;
  return result;
}

uint64_t _DecodeVisitor::visit(id *this, NSString *a2, int *a3)
{
  uint64_t result;

  result = objc_msgSend(this[1], "decodeIntForKey:", a2);
  *a3 = result;
  return result;
}

uint64_t _DecodeVisitor::visit(id *this, NSString *a2, uint64_t *a3)
{
  uint64_t result;

  result = objc_msgSend(this[1], "decodeIntegerForKey:", a2);
  *a3 = result;
  return result;
}

unint64_t _DecodeVisitor::visit(id *this, NSString *a2, unint64_t *a3)
{
  unint64_t result;

  result = objc_msgSend(this[1], "decodeIntegerForKey:", a2);
  *a3 = result;
  return result;
}

void _DecodeVisitor::visit(uint64_t a1, void *a2, void **a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 8);
  v6 = objc_opt_class();
  objc_msgSend(v5, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  *a3 = (void *)v7;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 8), "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  *a3 = (void *)v7;

}

{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClasses:forKey:", v8, v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *a3;
  *a3 = (void *)v9;

}

{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 8);
  v6 = objc_opt_class();
  objc_msgSend(v5, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  *a3 = (void *)v7;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeObjectOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 8), "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  *a3 = (void *)v5;

}

void sub_220FC9438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC94B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC95A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC96A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC98B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FC99EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FC9A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *this, NSString *a2, BOOL *a3)
{
  NSString *v5;
  int v6;
  NSString *v7;

  v5 = a2;
  if (*((_BYTE *)this + 8))
  {
    v6 = *a3;
    v7 = v5;
    *((_BYTE *)this + 8) = v6 == _CompareVisitor::getProp<BOOL>((uint64_t)this, v5);
    v5 = v7;
  }

}

void sub_220FC9D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *this, NSString *a2, int *a3)
{
  NSString *v5;
  int v6;
  NSString *v7;

  v5 = a2;
  if (*((_BYTE *)this + 8))
  {
    v6 = *a3;
    v7 = v5;
    *((_BYTE *)this + 8) = v6 == _CompareVisitor::getProp<int>((uint64_t)this, v5);
    v5 = v7;
  }

}

void sub_220FC9E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *this, NSString *a2, id *a3)
{
  NSString *v5;
  id v6;
  NSString *v7;

  v5 = a2;
  if (*((_BYTE *)this + 8))
  {
    v6 = *a3;
    v7 = v5;
    *((_BYTE *)this + 8) = v6 == _CompareVisitor::getProp<long>((uint64_t)this, v5);
    v5 = v7;
  }

}

{
  NSString *v5;
  id v6;
  NSString *v7;

  v5 = a2;
  if (*((_BYTE *)this + 8))
  {
    v6 = *a3;
    v7 = v5;
    *((_BYTE *)this + 8) = v6 == _CompareVisitor::getProp<unsigned long>((uint64_t)this, v5);
    v5 = v7;
  }

}

void sub_220FC9E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FC9EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _CompareVisitor::visit(_CompareVisitor *a1, NSString *a2, NSObject **a3)
{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

{
  _CompareVisitor::equalObj(a1, a2, *a3);
}

uint64_t _CompareVisitor::wasEqual(_CompareVisitor *this)
{
  return *((unsigned __int8 *)this + 8);
}

id _CompareVisitor::getProp<BOOL>(uint64_t a1, void *a2)
{
  NSString *v3;
  id v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 16), NSSelectorFromString(v3));

  return v4;
}

void sub_220FC9FC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<int>(uint64_t a1, void *a2)
{
  NSString *v3;
  id v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 16), NSSelectorFromString(v3));

  return v4;
}

void sub_220FCA018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<long>(uint64_t a1, void *a2)
{
  NSString *v3;
  id v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 16), NSSelectorFromString(v3));

  return v4;
}

void sub_220FCA06C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<unsigned long>(uint64_t a1, void *a2)
{
  NSString *v3;
  id v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 16), NSSelectorFromString(v3));

  return v4;
}

void sub_220FCA0C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _CompareVisitor::equalObj(_CompareVisitor *this, NSString *a2, NSObject *a3)
{
  NSObject *v5;
  NSObject *v6;
  NSString *v7;

  v7 = a2;
  v5 = a3;
  if (*((_BYTE *)this + 8))
  {
    _CompareVisitor::getProp<NSObject * {__strong}>((uint64_t)this, v7);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6 != v5)
      *((_BYTE *)this + 8) = -[NSObject isEqual:](v5, "isEqual:", v6);

  }
}

void sub_220FCA150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id _CompareVisitor::getProp<NSObject * {__strong}>(uint64_t a1, void *a2)
{
  NSString *v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 16), NSSelectorFromString(v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_220FCA1BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, BOOL *a3)
{
  NSString *v5;
  id v6;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*((_QWORD *)this + 1) + 16))();
  *a3 = objc_msgSend(v6, "BOOLValue");

}

void sub_220FCA290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, unsigned int *a3)
{
  NSString *v5;
  id v6;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*((_QWORD *)this + 1) + 16))();
  *a3 = objc_msgSend(v6, "intValue");

}

void sub_220FCA340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, uint64_t *a3)
{
  NSString *v5;
  id v6;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*((_QWORD *)this + 1) + 16))();
  *a3 = objc_msgSend(v6, "integerValue");

}

void sub_220FCA3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _UserCodedSerializationVisitor::visit(_UserCodedSerializationVisitor *this, NSString *a2, unint64_t *a3)
{
  NSString *v5;
  id v6;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*((_QWORD *)this + 1) + 16))();
  *a3 = objc_msgSend(v6, "unsignedIntegerValue");

}

void sub_220FCA4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _UserCodedSerializationVisitor::visit(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

void _UserCodedSerializationVisitor::visit(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 8);
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSValue * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSValue * {__strong}>();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v5 + 16))(v5, v8, v6, v7, a3);

}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSNumber * {__strong}>();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSNumber * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);

}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSString * {__strong}>();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSString * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);

}

{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 8);
  XUserCodedSerializationVisitor::makeToUserCoded<NSSet<NSString *> * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeFromUserCoded<NSSet<NSString *> * {__strong}>();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v5 + 16))(v5, v8, v6, v7, a3);

}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSDictionary * {__strong}>();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSDictionary * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);

}

{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 8);
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKTray * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKTray * {__strong}>();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v5 + 16))(v5, v8, v6, v7, a3);

}

{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKPaper * {__strong}>();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKPaper * {__strong}>();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, uint64_t))(v4 + 16))(v4, v5, v7, v6, a3);

}

void sub_220FCA600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCA6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCA738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCA7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCA874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCA98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCAA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return a2;
  else
    return &unk_24E6EB168;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP8NSNumberEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP8NSStringEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP5NSURLEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "absoluteString");
  return (id)objc_claimAutoreleasedReturnValue();
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP5NSURLEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6NSDataEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6NSDataEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v2, 0);

  return v3;
}

void sub_220FCAB40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6NSUUIDEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "UUIDString");
  return (id)objc_claimAutoreleasedReturnValue();
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6NSUUIDEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v2);

  return v3;
}

void sub_220FCABAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6NSDateEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_220FCAC14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP6NSDateEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v2, "doubleValue");
  v4 = (void *)objc_msgSend(v3, "initWithTimeIntervalSince1970:");

  return v4;
}

void sub_220FCAC70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSValue * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDCD0;
  v3 = &__block_literal_global_98;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_24E6CDA20;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void sub_220FCADDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

void sub_220FCAE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP7NSValueEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSRange v5;

  v2 = a2;
  v5.location = objc_msgSend(v2, "rangeValue");
  NSStringFromRange(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_220FCAE9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSValue * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7NSValueEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDD18;
  v3 = &__block_literal_global_100;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7NSValueEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

void sub_220FCB06C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP7NSValueEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  NSString *v2;
  void *v3;
  NSRange v4;
  void *v5;

  v2 = a2;
  v3 = (void *)MEMORY[0x24BDD1968];
  v4 = NSRangeFromString(v2);
  objc_msgSend(v3, "valueWithRange:", v4.location, v4.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_220FCB104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSNumber * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDCD0;
  v3 = &__block_literal_global_79;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_24E6CDA48;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void sub_220FCB248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSNumberEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

void sub_220FCB2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSNumber * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSNumberEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDD18;
  v3 = &__block_literal_global_82;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSNumberEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

void sub_220FCB490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSString * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDCD0;
  v3 = &__block_literal_global_83;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_24E6CDA70;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void sub_220FCB610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP8NSStringEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

void sub_220FCB684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSString * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSStringEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDD18;
  v3 = &__block_literal_global_86;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP8NSStringEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

void sub_220FCB858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeToUserCoded<NSSet<NSString *> * {__strong}>()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSString * {__strong}>();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS7_Ev_block_invoke;
  v4[3] = &unk_24E6CDD80;
  v5 = v0;
  v1 = v0;
  v2 = (void *)MEMORY[0x227667BF0](v4);

  return v2;
}

id XUserCodedSerializationVisitor::makeFromUserCoded<NSSet<NSString *> * {__strong}>()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSString * {__strong}>();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS7_Ev_block_invoke;
  v4[3] = &unk_24E6CDD18;
  v5 = v0;
  v1 = v0;
  v2 = (void *)MEMORY[0x227667BF0](v4);

  return v2;
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS7_Ev_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_220FCB9E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP5NSSetIP8NSStringEEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS7_Ev_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF20];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_220FCBA48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<NSDictionary * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDCD0;
  v3 = &__block_literal_global_95;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_24E6CDA98;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void sub_220FCBB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP12NSDictionaryEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

void sub_220FCBC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<NSDictionary * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDD18;
  v3 = &__block_literal_global_96;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP12NSDictionaryEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

void sub_220FCBDD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "userCodableDictionary");
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_220FCBE7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP11PKPaperListEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;

  v2 = a2;
  XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKPaper * {__strong}>();
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v2, "papers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

void sub_220FCBF08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKPaper * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDCD0;
  v3 = &__block_literal_global_102;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_24E6CDAC0;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void sub_220FCC05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP7PKPaperEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

void sub_220FCC0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor17makeFromUserCodedIU8__strongP11PKPaperListEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;

  v2 = a2;
  XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKPaper * {__strong}>();
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v3)[2](v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaperList paperListWithPapers:](PKPaperList, "paperListWithPapers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_220FCC154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKPaper * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7PKPaperEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDD18;
  v3 = &__block_literal_global_104;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP7PKPaperEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

void sub_220FCC334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP15PKPrintSettingsEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "userCodableDictionary");
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_220FCC3DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id XUserCodedSerializationVisitor::makeUserCodedFromTypedArray<PKTray * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDCD0;
  v3 = &__block_literal_global_111;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2;
  v9[3] = &unk_24E6CDAE8;
  v11 = *(id *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void sub_220FCC520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN30XUserCodedSerializationVisitor27makeUserCodedFromTypedArrayIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

void sub_220FCC594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id ___ZN30XUserCodedSerializationVisitor15makeToUserCodedIU8__strongP6PKTrayEEU13block_pointerFPU28objcproto17PKUserCodableType8NSObjectPS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "userCodableDictionary");
  return (id)objc_claimAutoreleasedReturnValue();
}

id XUserCodedSerializationVisitor::makeTypedArrayFromUserCoded<PKTray * {__strong}>()
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP6PKTrayEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke;
  v2[3] = &unk_24E6CDD18;
  v3 = &__block_literal_global_112;
  v0 = (void *)MEMORY[0x227667BF0](v2);

  return v0;
}

id ___ZN30XUserCodedSerializationVisitor27makeTypedArrayFromUserCodedIU8__strongP6PKTrayEEU13block_pointerFP8NSObjectPU28objcproto17PKUserCodableTypeS4_Ev_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

void sub_220FCC784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FCC810(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCC8D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCC964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FCC9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCCA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FCCB4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FCCBF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCCCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_220FCCD6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCCDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FCCE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCCF34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FCCFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FCD060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FCD130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_220FCD220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_220FCD7E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCD988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FCDB30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FCDE38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_220FCDFA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCE160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_220FCE234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _visitHexLines(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __n128 (*v30)(__n128 *, __n128 *);
  uint64_t (*v31)();
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x4812000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v33 = 0;
  v34 = 0;
  v32 = &unk_220FF53C5;
  v35 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  if (a2)
  {
    v7 = "/* ";
    v8 = ",";
    v9 = "0x";
    v10 = " */";
  }
  else
  {
    v10 = "";
    v9 = "";
    v8 = "";
    v7 = "";
  }
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke;
  v17[3] = &unk_24E6CDF10;
  v21 = v9;
  v22 = v8;
  v19 = &v27;
  v20 = v25;
  v23 = v7;
  v24 = v10;
  v12 = v6;
  v18 = v12;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke_2;
  v14[3] = &unk_24E6CDF38;
  v16 = &v27;
  v13 = (void (**)(_QWORD))(id)MEMORY[0x227667BF0](v17);
  v15 = v13;
  objc_msgSend(v5, "enumerateByteRangesUsingBlock:", v14);
  if ((v28[6] & 0x80000000) == 0)
    v13[2](v13);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

}

void sub_220FCE704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__5(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[4].n128_u32[0] = a2[4].n128_u32[0];
  a1[3] = result;
  return result;
}

void ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  char *v4;
  int v5;
  uint64_t v6;
  char *v7;
  int v8;
  size_t v9;
  size_t v10;
  size_t v11;
  char *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  char v19[256];
  char __str[256];
  _QWORD v21[2];

  v2 = 0;
  v21[0] = *MEMORY[0x24BDAC8D0];
  v3 = __str;
  v4 = v19;
  do
  {
    if ((v2 & 3) == 0)
      *v3++ = 32;
    if (v2 >= *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48))
    {
      v9 = strlen(*(const char **)(a1 + 56)) + 2;
      if (v9 + strlen(*(const char **)(a1 + 64)))
      {
        v10 = 0;
        do
        {
          v3[v10++] = 32;
          v11 = strlen(*(const char **)(a1 + 56));
        }
        while (v11 + strlen(*(const char **)(a1 + 64)) + 2 > v10);
        v3 += v10;
      }
      *v4 = 32;
    }
    else
    {
      v5 = snprintf(v3, (char *)v21 - v3, "%s", *(const char **)(a1 + 56));
      v6 = *(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v2 + 52);
      v7 = &v3[v5];
      *v7 = a0123456789abcd[*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + v2 + 52) >> 4];
      v7[1] = a0123456789abcd[v6 & 0xF];
      if (v6 < 0)
        v8 = __maskrune(v6, 0x40000uLL);
      else
        v8 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v6 + 60) & 0x40000;
      v12 = v7 + 2;
      if (v8)
        v13 = v6;
      else
        v13 = 46;
      *v4 = v13;
      v3 = &v12[snprintf(v12, (char *)v21 - v12, "%s", *(const char **)(a1 + 64))];
    }
    ++v4;
    ++v2;
  }
  while (v2 != 16);
  *v3 = 0;
  *v4 = 0;
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(_DWORD *)(v16 + 24);
  *(_DWORD *)(v16 + 24) = v17 + 1;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%s%8.8x%s  %s  %s%s%s"), v15, (16 * v17), *(_QWORD *)(a1 + 80), __str, v15, v19, *(_QWORD *)(a1 + 80));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = 0;

}

void sub_220FCE9A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___Z14_visitHexLinesP6NSDatabU13block_pointerFvP8NSStringE_block_invoke_2(uint64_t result, char *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (a4 >= 1)
  {
    v4 = a2;
    v5 = result;
    v6 = (unint64_t)&a2[a4];
    while (1)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8);
      v8 = *(int *)(v7 + 48);
      if ((int)v8 > 15)
        break;
      v9 = *v4++;
      *(_DWORD *)(v7 + 48) = v8 + 1;
      *(_BYTE *)(v7 + 48 + v8 + 4) = v9;
      if ((unint64_t)v4 >= v6)
      {
        if (*(int *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 48) >= 16)
          break;
LABEL_7:
        if ((unint64_t)v4 >= v6)
          return result;
      }
    }
    result = (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 32) + 16))();
    goto LABEL_7;
  }
  return result;
}

void sub_220FCEAE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FCEC90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FCED24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FCEF08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FCF014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FCF0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FCF15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FCF2A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FCF40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_220FCF56C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_220FCF63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FCF6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_220FCF8D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FCF98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FCFA2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCFB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_220FCFBB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCFC10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCFCB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCFD50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCFDC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FCFE60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FCFED0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD009C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD01E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id withDebuggableSemaphore<NSDictionary * {__strong}>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__311;
  v16 = __Block_byref_object_dispose__312;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FD02D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_220FD0380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FD03E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FD04A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_220FD0508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FD0624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_220FD0928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,id location)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_220FD0A78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD0B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD0C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_220FD0F2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x227667BF0](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_220FD111C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FD12A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id PrinterStatusQueuePoll::requestedAttributess(PrinterStatusQueuePoll *this)
{
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = IPPNomenclature::keyPrinterStateReasons;
  v2[1] = IPPNomenclature::keyMediaSourceSupported;
  v2[2] = IPPNomenclature::keyPrinterInputTray;
  v2[3] = IPPNomenclature::keyPrinterMandatoryJobAttributes;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_220FD17EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD19C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD1B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD1BC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD1C28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD1C8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD1CF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD1D88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD1E1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FD20E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_220FD275C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void writeURLToPrinter(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a1;
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    writeRequestDataToPrinter(v9, v8, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void sub_220FD2918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FD29E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FD2CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t withDebuggableSemaphore<BOOL>(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke;
  v9[3] = &unk_24E6CD088;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  withDebuggableSemaphore(a1, v9, a3);
  v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_220FD2E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220FD2FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD3064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FD3110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FD3264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD3444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FD35B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD375C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD3A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD3CE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD3E18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD3EB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD3F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PKCloudResolveContext;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t ___ZL30makeLocalizedNamesOfEmptyTraysPK22PrinterStatusQueuePoll_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEmpty");
}

uint64_t initPUTIsPersistentURL(const __CFURL *a1)
{
  if (LoadPhotoLibraryServicesCore(void)::loadPredicate != -1)
    dispatch_once(&LoadPhotoLibraryServicesCore(void)::loadPredicate, &__block_literal_global_291);
  softLinkPUTIsPersistentURL = (uint64_t (*)(const __CFURL *))dlsym((void *)LoadPhotoLibraryServicesCore(void)::frameworkLibrary, "PUTIsPersistentURL");
  return softLinkPUTIsPersistentURL(a1);
}

void ___ZL28LoadPhotoLibraryServicesCorev_block_invoke()
{
  LoadPhotoLibraryServicesCore(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PhotoLibraryServicesCore.framework/PhotoLibraryServicesCore", 2);
  if (!LoadPhotoLibraryServicesCore(void)::frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/PhotoLibraryServicesCore.framework/PhotoLibraryServicesCore"));
}

void ___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1)
{
  id v2;
  void *PHAssetClass;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init((Class)getPHFetchOptionsClass());
  objc_msgSend(v2, "setWantsIncrementalChangeDetails:", 0);
  PHAssetClass = (void *)getPHAssetClass();
  v12[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PHAssetClass, "fetchAssetsWithALAssetURLs:options:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    objc_msgSend(v7, "setVersion:", 0);
    objc_msgSend(v7, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v7, "setDeliveryMode:", 1);
    objc_msgSend(v7, "setSynchronous:", 1);
    objc_msgSend((id)getPHImageManagerClass(), "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke_2;
    v9[3] = &unk_24E6CE350;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v8, "requestImageDataForAsset:options:resultHandler:", v6, v7, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_220FD429C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void ___ZL27writePersistentURLToPrinterP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke_2(uint64_t a1, void *a2)
{
  writeRequestDataToPrinter(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
}

void writeRequestDataToPrinter(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  _QWORD v16[4];
  id v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke;
  v16[3] = &unk_24E6CE200;
  v9 = v7;
  v17 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x227667BF0](v16);
  v11 = v10;
  if (v6)
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_304;
    v12[3] = &unk_24E6CE3E8;
    v15 = v10;
    v13 = v5;
    v14 = v6;
    objc_msgSend(v13, "startRequestCompletionHandler:", v12);

  }
  else
  {
    v10[2](v10, 0);
  }

}

void sub_220FD4438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

Class initPHFetchOptions(void)
{
  Class result;

  if (LoadPhotos(void)::loadPredicate != -1)
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_297);
  result = objc_getClass("PHFetchOptions");
  classPHFetchOptions = (uint64_t)result;
  getPHFetchOptionsClass = (uint64_t (*)(void))PHFetchOptionsFunction;
  return result;
}

id PHFetchOptionsFunction(void)
{
  return (id)classPHFetchOptions;
}

void ___ZL10LoadPhotosv_block_invoke()
{
  LoadPhotos(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  if (!LoadPhotos(void)::frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/Photos.framework/Photos"));
}

Class initPHAsset(void)
{
  Class result;

  if (LoadPhotos(void)::loadPredicate != -1)
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_297);
  result = objc_getClass("PHAsset");
  classPHAsset = (uint64_t)result;
  getPHAssetClass = (uint64_t (*)(void))PHAssetFunction;
  return result;
}

id PHAssetFunction(void)
{
  return (id)classPHAsset;
}

Class initPHImageRequestOptions(void)
{
  Class result;

  if (LoadPhotos(void)::loadPredicate != -1)
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_297);
  result = objc_getClass("PHImageRequestOptions");
  classPHImageRequestOptions = (uint64_t)result;
  getPHImageRequestOptionsClass = (uint64_t (*)(void))PHImageRequestOptionsFunction;
  return result;
}

id PHImageRequestOptionsFunction(void)
{
  return (id)classPHImageRequestOptions;
}

Class initPHImageManager(void)
{
  Class result;

  if (LoadPhotos(void)::loadPredicate != -1)
    dispatch_once(&LoadPhotos(void)::loadPredicate, &__block_literal_global_297);
  result = objc_getClass("PHImageManager");
  classPHImageManager = (uint64_t)result;
  getPHImageManagerClass = (uint64_t (*)(void))PHImageManagerFunction;
  return result;
}

id PHImageManagerFunction(void)
{
  return (id)classPHImageManager;
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (!v3)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_220F9A000, v4, OS_LOG_TYPE_ERROR, "writeRequestDataToPrinter: failed to stream data", v5, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_220FD46F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_304(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_2;
    v5[3] = &unk_24E6CE3C0;
    v7 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "writeRequestData:completionHandler:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void sub_220FD47BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{

  _Unwind_Resume(a1);
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if ((a2 & 1) != 0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_3;
    v3[3] = &unk_24E6CE200;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "finishRequest:completionHandler:", 0, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void sub_220FD4868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void ___ZL25writeRequestDataToPrinterP17PKPrintJobRequestP6NSDataU13block_pointerFvP8NSNumberE_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _PKLogCategory(PKLogCategoryFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_220F9A000, v4, OS_LOG_TYPE_DEFAULT, "writeRequestDataToPrinter: local job ID %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_220FD494C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFURL *jpegWithImageSource(CGImageSource *a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  CGImageDestination *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "globallyUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = CGImageDestinationCreateWithURL(v9, CFSTR("public.jpeg"), 1uLL, 0);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD9250]);
      LODWORD(v13) = 1062836634;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD9220]);

      if (a2)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD9238]);
      CGImageDestinationAddImageFromSource(v11, a1, 0, (CFDictionaryRef)v12);
      CGImageDestinationFinalize(v11);
      CFRelease(v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeItemAtURL:error:", v10, 0);

      v12 = v10;
      v10 = 0;
    }

  }
  return v10;
}

void sub_220FD4B14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void ___ZL34convertFromImageSourceAndWriteJPEGP17PKPrintJobRequestP13CGImageSourcebhU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_220FD4BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL21convertToSharableJPEGP17PKPrintJobRequestP5NSURLU13block_pointerFvP8NSNumberE_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_220FD4C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__311(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__312(uint64_t a1)
{

}

void ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2;
  v8[3] = &unk_24E6CE438;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FD4D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void ___Z23withDebuggableSemaphoreIU8__strongP12NSDictionaryET_P8NSStringdU13block_pointerFvU13block_pointerFvS3_EE_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke_2;
  v8[3] = &unk_24E6CE460;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_220FD4E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

intptr_t ___Z23withDebuggableSemaphoreIbET_P8NSStringdU13block_pointerFvU13block_pointerFvS0_EE_block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_220FD4EC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD50B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_220FD5134()
{
  JUMPOUT(0x220FD5128);
}

void sub_220FD52CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD5418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD553C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD56EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD5768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FD59FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FD5AA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD5B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FD5BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FD5C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD5D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FD629C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD6314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD653C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FD6630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)PKPrinterBrowser;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_220FD66D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FD6994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_sync_exit(v12);
  _Unwind_Resume(a1);
}

void sub_220FD6A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FD6C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  void *v23;
  void *v24;
  id *v25;
  id *v26;
  id *v27;

  v27 = v26;
  objc_destroyWeak(v27);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_220FD6D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FD6DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_220FD723C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  void *v19;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_220FD7428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FD75C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_220FD763C()
{
  JUMPOUT(0x220FD7630);
}

void sub_220FD76C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FD7A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_220FD7C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t _is_valid_color(const char *a1)
{
  if (*a1 != 35
    || a1[1] < 0
    || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)a1 + 1) + 60) & 0x10000) == 0
    || a1[2] < 0
    || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)a1 + 2) + 60) & 0x10000) == 0
    || a1[3] < 0
    || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)a1 + 3) + 60) & 0x10000) == 0
    || a1[4] < 0
    || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)a1 + 4) + 60) & 0x10000) == 0
    || a1[5] < 0
    || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)a1 + 5) + 60) & 0x10000) == 0
    || a1[6] < 0)
  {
    return 0;
  }
  else
  {
    return HIWORD(*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *((unsigned __int8 *)a1 + 6) + 60)) & 1;
  }
}

void sub_220FD80BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD834C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_220FD8640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

Class initUIColor(void)
{
  Class result;

  if (LoadUIKit(void)::loadPredicate != -1)
    dispatch_once(&LoadUIKit(void)::loadPredicate, &__block_literal_global_11);
  result = objc_getClass("UIColor");
  classUIColor = (uint64_t)result;
  getUIColorClass = (uint64_t (*)(void))UIColorFunction;
  return result;
}

id UIColorFunction(void)
{
  return (id)classUIColor;
}

void ___ZL9LoadUIKitv_block_invoke()
{
  LoadUIKit(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  if (!LoadUIKit(void)::frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/UIKit.framework/UIKit"));
}

void ___ZL21makeUserCodableColorsP7NSArray_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void sub_220FD8804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id SuppliesPoll::requestedAttributess(SuppliesPoll *this)
{
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = IPPNomenclature::keyMarkerColors;
  v2[1] = IPPNomenclature::keyMarkerHighLevels;
  v2[2] = IPPNomenclature::keyMarkerLevels;
  v2[3] = IPPNomenclature::keyMarkerLowLevels;
  v2[4] = IPPNomenclature::keyMarkerNames;
  v2[5] = IPPNomenclature::keyMarkerTypes;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id suppliesForPollResponse(void **a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  PKSupply *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  __int128 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  Printd_Parameters::_get_MarkerNames(a1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_get_MarkerColors(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_get_MarkerTypes(a1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_get_MarkerLevels(a1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_get_MarkerHighLevels(a1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_get_MarkerLowLevels(a1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 && v2 && v33 && v32)
  {
    if (objc_msgSend(v2, "count") == 1
      && (objc_msgSend(v2, "firstObject"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "compare:", CFSTR("none")),
          v3,
          !v4))
    {
      _PKLogCategory(PKLogCategoryFramework);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_WORD *)buf = 0;
      v26 = "marker-colors is \"none\"";
    }
    else
    {
      v5 = objc_msgSend(v34, "count");
      if (objc_msgSend(v2, "count") == v5
        && objc_msgSend(v33, "count") == v5
        && objc_msgSend(v32, "count") == v5
        && (!v30 || objc_msgSend(v30, "count") == v5)
        && (!v31 || objc_msgSend(v31, "count") == v5))
      {
        v6 = objc_opt_new();
        v29 = v5;
        if (v5)
        {
          v8 = 0;
          *(_QWORD *)&v7 = 136315138;
          v28 = v7;
          do
          {
            objc_msgSend(v34, "objectAtIndexedSubscript:", v8, v28);
            v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v10 = objc_msgSend(v9, "UTF8String");

            objc_msgSend(v2, "objectAtIndexedSubscript:", v8);
            v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v12 = objc_msgSend(v11, "UTF8String");

            objc_msgSend(v33, "objectAtIndexedSubscript:", v8);
            v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v14 = objc_msgSend(v13, "UTF8String");

            objc_msgSend(v32, "objectAtIndexedSubscript:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "integerValue");

            if (v31)
            {
              objc_msgSend(v31, "objectAtIndexedSubscript:", v8);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "integerValue");

            }
            else
            {
              v18 = 0;
            }
            if (v30)
            {
              objc_msgSend(v30, "objectAtIndexedSubscript:", v8);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "integerValue");

            }
            else
            {
              v20 = 100;
            }
            if (+[PKSupply isValidColorString:](PKSupply, "isValidColorString:", v12))
            {
              v21 = -[PKSupply initWithName:markerType:colors:level:lowLevel:highLevel:]([PKSupply alloc], "initWithName:markerType:colors:level:lowLevel:highLevel:", v10, v14, v12, v16, v18, v20);
              if (v21)
                -[NSObject addObject:](v6, "addObject:", v21);
            }
            else
            {
              _PKLogCategory(PKLogCategoryFramework);
              v21 = (PKSupply *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v28;
                v36 = v12;
                _os_log_impl(&dword_220F9A000, &v21->super, OS_LOG_TYPE_DEFAULT, "Ignoring invalid supply color: %s", buf, 0xCu);
              }
            }

            ++v8;
          }
          while (v29 != v8);
        }
        if (-[NSObject count](v6, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:

          goto LABEL_53;
        }
LABEL_51:
        v22 = 0;
        goto LABEL_52;
      }
      _PKLogCategory(PKLogCategoryFramework);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_WORD *)buf = 0;
      v26 = "Not all marker attributes contain the same number of values";
    }
LABEL_50:
    _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    goto LABEL_51;
  }
  if (!v34)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v23, OS_LOG_TYPE_DEFAULT, "marker-names attribute is missing", buf, 2u);
    }

  }
  if (!v2)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v24, OS_LOG_TYPE_DEFAULT, "marker-colors attribute is missing", buf, 2u);
    }

  }
  if (!v33)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v25, OS_LOG_TYPE_DEFAULT, "marker-types attribute is missing", buf, 2u);
    }

  }
  if (!v32)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v26 = "marker-levels attribute is missing";
    goto LABEL_50;
  }
  v22 = 0;
LABEL_53:

  return v22;
}

void sub_220FD8E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FD9008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD90C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD9180(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD9300(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD9414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_220FD94F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_220FD956C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD9608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FD96D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD97FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FD987C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD98D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD99A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD9A10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD9A80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD9C18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FD9CB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FD9E98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDA014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FDA100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FDA28C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FDA31C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FDA58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_220FDA694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PKTray;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_220FDA710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDA790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FDA7EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDA868(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDA8E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDA9B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FDAA70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FDAB18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FDABF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id dictionaryWithLowercasedKeys(NSDictionary *a1)
{
  NSDictionary *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  -[NSDictionary allKeys](v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "lowercaseString", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        if (objc_claimAutoreleasedReturnValue())
          __assert_rtn("dictionaryWithLowercasedKeys", "PKPrinterBrowseInfo.mm", 25, "dict[lck] == nil");
        -[NSDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v11 = objc_msgSend(v3, "count");
  if (v11 != -[NSDictionary count](v1, "count"))
    __assert_rtn("dictionaryWithLowercasedKeys", "PKPrinterBrowseInfo.mm", 29, "dict.count == src.count");

  return v3;
}

void sub_220FDADE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_220FDAEE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FDAFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_220FDB12C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_220FDB1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_220FDB220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDB26C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDB5E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_220FDB800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDB89C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDB9A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FDBA7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDBAC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDBB58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220FDBC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_220FDBCA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220FDBF60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id findOrMakePrinter(PKPrinterBrowseInfo *a1)
{
  PKPrinterBrowseInfo *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (findOrMakePrinter(PKPrinterBrowseInfo *)::sOnce != -1)
    dispatch_once(&findOrMakePrinter(PKPrinterBrowseInfo *)::sOnce, &__block_literal_global_13);
  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (findOrMakePrinter(PKPrinterBrowseInfo *)::sGen != gPrinterCacheGeneration)
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v12 = findOrMakePrinter(PKPrinterBrowseInfo *)::sGen;
      v13 = 1024;
      v14 = gPrinterCacheGeneration;
      _os_log_impl(&dword_220F9A000, v3, OS_LOG_TYPE_DEFAULT, "flushing printerInfo to printerCache: %d -> %d", buf, 0xEu);
    }

    findOrMakePrinter(PKPrinterBrowseInfo *)::sGen = gPrinterCacheGeneration;
    objc_msgSend((id)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict, "removeAllObjects");
  }
  objc_sync_exit(v2);

  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[PKPrinterBrowseInfo bonjourName](v1, "bonjourName", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PKPrinter initPKPrinterWithBrowseInfo:]([PKPrinter alloc], "initPKPrinterWithBrowseInfo:", v1);
    objc_msgSend((id)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict, "setObject:forKeyedSubscript:", v7, v6);
  }

  objc_sync_exit(v4);
  return v7;
}

void sub_220FDC1A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_220FDC2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_220FDC438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL17findOrMakePrinterP19PKPrinterBrowseInfo_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  if (!findOrMakePrinter(PKPrinterBrowseInfo *)::sDict)
  {
    v0 = objc_opt_new();
    v1 = (void *)findOrMakePrinter(PKPrinterBrowseInfo *)::sDict;
    findOrMakePrinter(PKPrinterBrowseInfo *)::sDict = v0;

  }
  findOrMakePrinter(PKPrinterBrowseInfo *)::sGen = gPrinterCacheGeneration;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.printkit.iCloudPrintersChanged.notification"), 0, 0, &__block_literal_global_162);

}

void sub_220FDC4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZL17findOrMakePrinterP19PKPrinterBrowseInfo_block_invoke_2()
{
  return +[PKPrinterBrowseInfo rollCacheGeneration](PKPrinterBrowseInfo, "rollCacheGeneration");
}

uint64_t PKParsePrinterStateReasons(void *a1)
{
  id v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v1 = a1;
  v2 = 0;
  v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v5), "lowercaseString", (_QWORD)v13);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "hasPrefix:", CFSTR("toner-empty")))
        {
          v2 |= 0x200u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("toner-low")))
        {
          v2 |= 8u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("marker-supply-empty")))
        {
          v2 |= 0x400u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("marker-supply-low")))
        {
          v2 |= 0x10u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("media-empty")))
        {
          v2 |= 0x40u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("media-jam")))
        {
          v2 |= 0x80u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("media-low")))
        {
          v2 |= 4u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("media-needed")))
        {
          v2 |= 0x100u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("input-tray-missing")))
        {
          v2 |= 0x800u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("door-open")))
        {
          v2 |= 0x1000u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("cover-open")))
        {
          v2 |= 0x2000u;
        }
        else if (objc_msgSend(v6, "hasPrefix:", CFSTR("paused"))
               || objc_msgSend(v6, "hasPrefix:", CFSTR("device-stopped")))
        {
          v2 |= 0x20000u;
        }
        else if ((objc_msgSend(v6, "hasSuffix:", CFSTR("-report")) & 1) == 0
               && (objc_msgSend(v6, "hasPrefix:", CFSTR("spool-area-full")) & 1) == 0
               && (objc_msgSend(v6, "hasPrefix:", CFSTR("connecting-to-device")) & 1) == 0
               && (objc_msgSend(v6, "hasPrefix:", CFSTR("stopped-partly")) & 1) == 0
               && !objc_msgSend(v6, "hasPrefix:", CFSTR("none")))
        {
          v2 |= 0x8000u;
        }

        ++v5;
      }
      while (v3 != v5);
      v7 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      v3 = v7;
    }
    while (v7);
  }

  v8 = v2 & 0xFFFFFFEF;
  if ((v2 & 0x400) == 0)
    v8 = v2;
  if ((v8 & 0x200) != 0)
    v9 = v8 & 0xFFFFFFF7;
  else
    v9 = v8;
  _PKLogCategory(PKLogCategoryFramework);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v11;
    v19 = 1024;
    v20 = v9;
    _os_log_impl(&dword_220F9A000, v10, OS_LOG_TYPE_DEFAULT, "Reasons [%@] => %8.8x", buf, 0x12u);

  }
  return v9;
}

void sub_220FDC8A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id PKCopyLocalizedPrinterStateReasons(void *a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  BOOL v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v21;
  int v22;
  id v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  v22 = PKParsePrinterStateReasons(a1);
  v23 = v21;
  v3 = (void *)objc_opt_new();
  if (v22)
  {
    v4 = v22;
    do
    {
      v24 = v4;
      v5 = 1;
      if (v4 >= 2)
      {
        do
        {
          v5 *= 2;
          v6 = v4 >= 4;
          v4 >>= 1;
        }
        while (v6);
        if ((v22 & 0x100) != 0 || v5 != 64)
        {
          if (v5 <= 511)
          {
            if (v5 <= 15)
            {
              if (v5 == 4)
              {
                PKLocalizedString(CFSTR("The printer is almost out of paper."), "Low paper notice.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 4;
              }
              else
              {
                if (v5 != 8)
                  goto LABEL_37;
                PKLocalizedString(CFSTR("The printer is low on toner."), "Low toner notice.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 8;
              }
            }
            else
            {
              switch(v5)
              {
                case 16:
                  PKLocalizedString(CFSTR("The printer is low on ink."), "Low ink notice.");
                  v19 = objc_claimAutoreleasedReturnValue();
                  v5 = 16;
                  break;
                case 128:
                  PKLocalizedString(CFSTR("The printer has a paper jam."), "Paper jam alert.");
                  v19 = objc_claimAutoreleasedReturnValue();
                  v5 = 128;
                  break;
                case 256:
                  PKLocalizedString(CFSTR("The printer needs paper."), "Paper needed alert.");
                  v19 = objc_claimAutoreleasedReturnValue();
                  v5 = 256;
                  break;
                default:
                  goto LABEL_37;
              }
            }
          }
          else if (v5 > 4095)
          {
            switch(v5)
            {
              case 0x1000:
                PKLocalizedString(CFSTR("The printer door is open."), "Door open alert.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 4096;
                break;
              case 0x2000:
                PKLocalizedString(CFSTR("The printer cover is open."), "Cover open alert.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 0x2000;
                break;
              case 0x20000:
                PKLocalizedString(CFSTR("The printer is paused."), "Paused/stopped printer alert.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 0x20000;
                break;
              default:
                goto LABEL_37;
            }
          }
          else
          {
            switch(v5)
            {
              case 512:
                PKLocalizedString(CFSTR("The printer may be out of toner."), "Out of toner alert.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 512;
                break;
              case 1024:
                PKLocalizedString(CFSTR("The printer may be out of ink."), "Out of ink alert.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 1024;
                break;
              case 2048:
                PKLocalizedString(CFSTR("A paper tray is missing."), "Input tray missing alert.");
                v19 = objc_claimAutoreleasedReturnValue();
                v5 = 2048;
                break;
              default:
                goto LABEL_37;
            }
          }
        }
        else
        {
          if (v23 && objc_msgSend(v23, "count"))
          {
            v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v8 = v23;
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v9; ++i)
                {
                  if (*(_QWORD *)v30 != v10)
                    objc_enumerationMutation(v8);
                  v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("auto")) & 1) == 0)
                  {
                    PKLocalizedString(CFSTR("The printer is out of paper (%@)."), "Out of paper alert with empty tray.");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v12);
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "addObject:", v14);

                  }
                }
                v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
              }
              while (v9);
            }

            if (!v7)
            {
              v5 = 64;
              goto LABEL_37;
            }
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v15 = v7;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v26;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v26 != v17)
                    objc_enumerationMutation(v15);
                  objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              }
              while (v16);
            }

            v5 = 64;
            goto LABEL_36;
          }
          PKLocalizedString(CFSTR("The printer is out of paper."), "Out of paper alert.");
          v19 = objc_claimAutoreleasedReturnValue();
          v5 = 64;
        }
        v15 = (id)v19;
        if (v19)
        {
          objc_msgSend(v3, "addObject:", v19);
LABEL_36:

        }
      }
LABEL_37:
      v4 = v24 & ~v5;
    }
    while (v4);
  }

  return v3;
}

void sub_220FDCDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

id PKDefaultPortForScheme(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24E6E9F10, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    _PKLogCategory(PKLogCategoryNetwork[0]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v1;
      _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_ERROR, "Unknown scheme %@ - defaulting to 631", (uint8_t *)&v7, 0xCu);
    }

    v4 = &unk_24E6EB240;
  }

  return v4;
}

void sub_220FDCF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id PKURLWithString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:encodingInvalidCharacters:", v1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:encodingInvalidCharacters:", v1, 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "port");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(v2, "scheme");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKDefaultPortForScheme(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setPort:", v5);

    }
    objc_msgSend(v2, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_220FDD150()
{
  objc_end_catch();
  JUMPOUT(0x220FDD158);
}

id PKURLWithUTF8String(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    PKURLWithString(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_220FDD1BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *toString(int a1)
{
  const __CFString *result;
  const __CFString *v3;

  result = CFSTR("Unknown");
  switch(a1)
  {
    case 1:
      result = CFSTR("Managed");
      break;
    case 2:
      result = CFSTR("Extension");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      result = CFSTR("Bonjour");
      break;
    case 8:
      result = CFSTR("Beacon");
      break;
    default:
      v3 = CFSTR("NAN");
      if (a1 != 32)
        v3 = CFSTR("Unknown");
      if (a1 == 16)
        result = CFSTR("Cups");
      else
        result = v3;
      break;
  }
  return result;
}

void ___ZL17internEntriesDictv_block_invoke_cold_1()
{
  __assert_rtn("internEntriesDict_block_invoke", "xcups_strings.mm", 185, "sEntryPtrs[sEntriesCount - 1] == &sEntryValues[sEntriesCount - 1]");
}

void ___ZL17internEntriesDictv_block_invoke_cold_2()
{
  __assert_rtn("internEntriesDict_block_invoke", "xcups_strings.mm", 184, "sEntryPtrs[0] == &sEntryValues[0]");
}

void entryIndex()
{
  __assert_rtn("entryIndex", "xcups_strings.mm", 124, "e == &sEntryValues[ix]");
}

void _ZZZL17internEntriesDictvEUb_EN3__58__invokeEPK13__CFAllocatorPKv_cold_1()
{
  __assert_rtn("operator()", "xcups_strings.mm", 168, "entryIndex(entry) != -1");
}

void urf_compress()
{
  __assert_rtn("urf_compress16", "urf-write.c", 578, "count <= context->compsize");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC940](userNotification);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9058](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9140](isrc, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x24BDD11C8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x24BEB0B70]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x24BEB0DD0]();
}

uint64_t SBShowNetworkPromptsIfNecessary()
{
  return MEMORY[0x24BEB0DD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x24BDBCFF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24E6BF880();
}

uint64_t operator new()
{
  return off_24E6BF888();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x24BDE0E48]();
}

nw_txt_record_t nw_endpoint_copy_txt_record(nw_endpoint_t endpoint)
{
  return (nw_txt_record_t)MEMORY[0x24BDE0E58](endpoint);
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E78](name, type, domain);
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0EB8](url);
}

uint64_t nw_endpoint_get_bonjour_fullname()
{
  return MEMORY[0x24BDE0ED8]();
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0EE0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0EE8](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F50](endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F68](endpoint);
}

BOOL nw_txt_record_apply(nw_txt_record_t txt_record, nw_txt_record_applier_t applier)
{
  return MEMORY[0x24BDE2618](txt_record, applier);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x24BEDD488](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

