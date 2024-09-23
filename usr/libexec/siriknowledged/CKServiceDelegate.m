@implementation CKServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  const __CFString *v18;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.siriknowledged")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_TtC13CoreKnowledge21CoreKnowledgeXPCUtils CKServiceXPCInterface](_TtC13CoreKnowledge21CoreKnowledgeXPCUtils, "CKServiceXPCInterface"));
    objc_msgSend(v4, "setExportedInterface:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    objc_msgSend(v4, "setExportedObject:", v7);

    objc_msgSend(v4, "resume");
    v8 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      v13 = 136315394;
      v14 = "-[CKServiceDelegate listener:shouldAcceptNewConnection:]";
      v15 = 1024;
      v16 = objc_msgSend(v4, "processIdentifier");
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s New connection established to process %d", (uint8_t *)&v13, 0x12u);

    }
  }
  else
  {
    v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v12 = v10;
      v13 = 136315650;
      v14 = "-[CKServiceDelegate listener:shouldAcceptNewConnection:]";
      v15 = 1024;
      v16 = objc_msgSend(v4, "processIdentifier");
      v17 = 2112;
      v18 = CFSTR("com.apple.siriknowledged");
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Trying to establish a connection from a process (%d) not entitled for %@", (uint8_t *)&v13, 0x1Cu);

    }
  }

  return v5 != 0;
}

@end
