@implementation RTCReportingAVCLegacySupport

- (RTCReportingAVCLegacySupport)init
{
  RTCReportingAVCLegacySupport *v2;
  NSObject *v3;
  NSObject *global_queue;
  os_log_t v5;
  objc_super v7;
  _QWORD block[5];

  v7.receiver = self;
  v7.super_class = (Class)RTCReportingAVCLegacySupport;
  v2 = -[RTCReportingAVCLegacySupport init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(9, 0);
    v2->_dispatchQ = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.rtcreporting.avclegacysupport", v3, global_queue);
    v2->_logger = (OS_os_log *)os_log_create("com.apple.rtcreporting", "AVCLegacySupport");
    v5 = os_log_create("com.apple.rtcreporting", "AVCLegacySupport");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __createAWDAdaptorInstance_block_invoke;
    block[3] = &unk_1E2EB2B10;
    block[4] = v5;
    if (createAWDAdaptorInstance_onceToken != -1)
      dispatch_once(&createAWDAdaptorInstance_onceToken, block);
    v2->_awdAdaptor = objc_alloc_init((Class)createAWDAdaptorInstance_awdAdaptorClass);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_dispatchQ = 0;
  self->_awdAdaptor = 0;
  v3.receiver = self;
  v3.super_class = (Class)RTCReportingAVCLegacySupport;
  -[RTCReportingAVCLegacySupport dealloc](&v3, sel_dealloc);
}

- (void)invokeAWDAdaptorForPayload:(id)a3 category:(unsigned __int16)a4 type:(unsigned __int16)a5
{
  SEL v9;
  id v10;
  NSObject *dispatchQ;
  _QWORD v12[7];
  unsigned __int16 v13;
  unsigned __int16 v14;

  v9 = NSSelectorFromString(CFSTR("sendMessageWithMethod:respCode:dict:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = a3;
    dispatchQ = self->_dispatchQ;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke;
    v12[3] = &unk_1E2EB2B88;
    v13 = a4;
    v14 = a5;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = v9;
    dispatch_async(dispatchQ, v12);
  }
}

void __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int16 v4;
  __int16 v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v5 = *(_WORD *)(a1 + 56);
  v4 = *(_WORD *)(a1 + 58);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", objc_msgSend(*(id *)(v2 + 24), "methodSignatureForSelector:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v3, "setSelector:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setTarget:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v3, "setArgument:atIndex:", &v5, 2);
  objc_msgSend(v3, "setArgument:atIndex:", &v4, 3);
  objc_msgSend(v3, "setArgument:atIndex:", &v6, 4);
  objc_msgSend(v3, "invoke");
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 40) + 16), OS_LOG_TYPE_DEBUG))
    __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke_cold_1();

}

- (void)sendPowerLogEventForClient:(id)a3 serviceName:(id)a4 payload:(id)a5 category:(unsigned __int16)a6 type:(unsigned __int16)a7 eventNumber:(unint64_t)a8
{
  uint64_t v10;
  void *v15;
  int v16;
  id v17;
  NSObject *dispatchQ;
  _QWORD v19[7];
  __int16 v20;
  unsigned __int16 v21;

  if (MEMORY[0x1E0D7FE20])
  {
    v10 = a6;
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVCVideoConference")))
    {
      if (objc_msgSend(a4, "isEqualToString:", CFSTR("FaceTime")))
        v15 = &unk_1E2EB53D8;
      else
        v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    else if (objc_msgSend(a3, "isEqualToString:", CFSTR("multiwayconference"))
           && ((objc_msgSend(a4, "isEqualToString:", CFSTR("session")) & 1) != 0
            || objc_msgSend(a4, "isEqualToString:", CFSTR("twoway"))))
    {
      v15 = &unk_1E2EB53F0;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    v16 = objc_msgSend(v15, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10));
    if ((_DWORD)v10 && v16)
    {
      if (objc_msgSend(a5, "count"))
      {
        v17 = a5;
        dispatchQ = self->_dispatchQ;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke;
        v19[3] = &unk_1E2EB2B88;
        v19[4] = a5;
        v19[5] = self;
        v20 = v10;
        v21 = a7;
        v19[6] = a8;
        dispatch_async(dispatchQ, v19);
      }
    }
  }
}

void __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ParametersPayload"));
  if (!v2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (!v2)
    {
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_2(v3);
      v2 = MEMORY[0x1E0C9AA70];
    }
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v2);
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned __int16 *)(a1 + 56)), CFSTR("method"));
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned __int16 *)(a1 + 58)), CFSTR("respCode"));
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)), CFSTR("event"));
  PLLogRegisteredEvent();
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_1((unsigned __int16 *)(a1 + 56), (uint64_t *)(a1 + 48), v5);

}

- (id)awdAdaptor
{
  return self->_awdAdaptor;
}

void __73__RTCReportingAVCLegacySupport_invokeAWDAdaptorForPayload_category_type___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1921BE000, v0, (uint64_t)v0, "dispatched message %hu/%hu to AWDAdaptor", v1);
  OUTLINED_FUNCTION_3();
}

void __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_1(unsigned __int16 *a1, uint64_t *a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 136315650;
  v6 = "-[RTCReportingAVCLegacySupport sendPowerLogEventForClient:serviceName:payload:category:type:eventNumber:]_block_invoke";
  v7 = 1024;
  v8 = v3;
  v9 = 2048;
  v10 = v4;
  OUTLINED_FUNCTION_7(&dword_1921BE000, a3, (uint64_t)a3, "%s: sendMessage %hu:%llu", (uint8_t *)&v5);
}

void __105__RTCReportingAVCLegacySupport_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber___block_invoke_cold_2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RTCReportingAVCLegacySupport sendPowerLogEventForClient:serviceName:payload:category:type:eventNumber:]_block_invoke";
  _os_log_debug_impl(&dword_1921BE000, log, OS_LOG_TYPE_DEBUG, "%s: payload data is empty", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
