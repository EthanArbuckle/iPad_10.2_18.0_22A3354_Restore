@implementation MessageSPI

+ (BOOL)canSendIMessage:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v4 = (id *)getIMSPIiMessageServiceSymbolLoc_ptr;
  v16 = (void *)getIMSPIiMessageServiceSymbolLoc_ptr;
  if (!getIMSPIiMessageServiceSymbolLoc_ptr)
  {
    v5 = (void *)IMCoreLibrary();
    v4 = (id *)dlsym(v5, "IMSPIiMessageService");
    v14[3] = (uint64_t)v4;
    getIMSPIiMessageServiceSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v13, 8);
  if (!v4)
    +[MessageSPI canSendIMessage:].cold.1();
  v6 = *v4;
  v7 = v3;
  v8 = v6;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v9 = getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr;
  v16 = getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr;
  if (!getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr)
  {
    v10 = (void *)IMCoreLibrary();
    v9 = dlsym(v10, "IMSPIHasActiveAliasForSendingOnService");
    v14[3] = (uint64_t)v9;
    getIMSPIHasActiveAliasForSendingOnServiceSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v13, 8);
  if (!v9)
    +[MessageSPI canSendIMessage:].cold.1();
  v11 = ((uint64_t (*)(id, id))v9)(v7, v8);

  return v11;
}

+ (void)canSendIMessage:.cold.1()
{
  dlerror();
  abort_report_np();
  sub_1C0746D9C();
}

@end
