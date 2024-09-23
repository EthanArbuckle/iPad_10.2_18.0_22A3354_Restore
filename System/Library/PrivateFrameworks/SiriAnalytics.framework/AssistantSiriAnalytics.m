@implementation AssistantSiriAnalytics

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1)
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global_1482);
  return (id)sharedAnalytics_shared;
}

- (AssistantSiriAnalytics)init
{
  AssistantSiriAnalytics *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  SiriAnalyticsRemoteService *v5;
  SiriAnalyticsRemoteService *remoteService;
  SiriAnalyticsClientMessageStream *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AssistantSiriAnalytics;
  v2 = -[AssistantSiriAnalytics init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.siri.analytics.assistant", v3);
    v5 = -[SiriAnalyticsRemoteService initWithMachServiceName:]([SiriAnalyticsRemoteService alloc], "initWithMachServiceName:", CFSTR("com.apple.siri.analytics.assistant"));
    remoteService = v2->_remoteService;
    v2->_remoteService = v5;

    v7 = -[SiriAnalyticsClientMessageStream initWithQueue:analyticsService:delegate:]([SiriAnalyticsClientMessageStream alloc], "initWithQueue:analyticsService:delegate:", v4, v2->_remoteService, v2);
    -[SiriAnalyticsClient setDefaultMessageStream:](v2, "setDefaultMessageStream:", v7);
    if (SiriAnalyticsIsInternalInstall_onceToken != -1)
      dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_874);
    v2->_isInternalInstall = SiriAnalyticsIsInternalInstall_isInternal;

  }
  return v2;
}

- (BOOL)clientMessageStream:(id)a3 shouldEmitMessage:(id)a4 timestamp:(unint64_t)a5 isolatedStreamUUID:(id)a6
{
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (self->_isInternalInstall || !objc_msgSend(v7, "isProvisional"))
  {
    v10 = 1;
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v9 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[AssistantSiriAnalytics clientMessageStream:shouldEmitMessage:timestamp:isolatedStreamUUID:]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A025F000, v9, OS_LOG_TYPE_INFO, "%s Dropping provisional message: %@ for seed/customer images.", (uint8_t *)&v12, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  -[SiriAnalyticsRemoteService sensitiveCondition:startedAt:completion:](self->_remoteService, "sensitiveCondition:startedAt:completion:", *(_QWORD *)&a3, a4, a5);
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  -[SiriAnalyticsRemoteService sensitiveCondition:endedAt:completion:](self->_remoteService, "sensitiveCondition:endedAt:completion:", *(_QWORD *)&a3, a4, a5);
}

- (void)createTag:(id)a3 completion:(id)a4
{
  SiriAnalyticsRemoteService *remoteService;
  id v6;
  id v7;

  remoteService = self->_remoteService;
  v6 = a4;
  objc_msgSend(a3, "shim");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriAnalyticsRemoteService createTag:completion:](remoteService, "createTag:completion:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

+ (id)sharedStream
{
  void *v2;
  void *v3;

  +[AssistantSiriAnalytics sharedAnalytics](AssistantSiriAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultMessageStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)derivedIdentifierForComponent:(int)a3 fromSourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, _QWORD);
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__AssistantSiriAnalytics_derivedIdentifierForComponent_fromSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E4357BF8;
  v15 = v8;
  v9 = v8;
  v10 = a4;
  v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(a1, "derivedIdentifierForComponent:fromSourceIdentifier:", v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = 0;
  ((void (**)(void *, void *))v11)[2](v11, v13);

}

+ (id)derivedIdentifierForComponentName:(int)a3 fromSourceIdentifier:(id)a4
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = CFSTR("COMPONENTNAME_ORCHESTRATOR");
  switch(a3)
  {
    case 0:
      if (SiriAnalyticsLoggingInit_once != -1)
        dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
      v7 = SiriAnalyticsLogContextAssistant;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315138;
        v16 = "+[AssistantSiriAnalytics derivedIdentifierForComponentName:fromSourceIdentifier:]";
        _os_log_error_impl(&dword_1A025F000, v7, OS_LOG_TYPE_ERROR, "%s Unknown component name provided", (uint8_t *)&v15, 0xCu);
      }
      v8 = 0;
      goto LABEL_69;
    case 1:
      goto LABEL_61;
    case 2:
      v6 = CFSTR("COMPONENTNAME_UEI");
      goto LABEL_61;
    case 3:
      v6 = CFSTR("COMPONENTNAME_FLOW");
      goto LABEL_61;
    case 4:
      v6 = CFSTR("COMPONENTNAME_CAM");
      goto LABEL_61;
    case 5:
      v6 = CFSTR("COMPONENTNAME_GRR");
      goto LABEL_61;
    case 6:
      v6 = CFSTR("COMPONENTNAME_MODALITY");
      goto LABEL_61;
    case 7:
      v6 = CFSTR("COMPONENTNAME_NLX");
      goto LABEL_61;
    case 8:
      v6 = CFSTR("COMPONENTNAME_ASR");
      goto LABEL_61;
    case 9:
      v6 = CFSTR("COMPONENTNAME_MH");
      goto LABEL_61;
    case 10:
      v6 = CFSTR("COMPONENTNAME_IH");
      goto LABEL_61;
    case 11:
      v6 = CFSTR("COMPONENTNAME_NONE");
      goto LABEL_61;
    case 12:
      v6 = CFSTR("COMPONENTNAME_ANNOUNCE");
      goto LABEL_61;
    case 13:
      v6 = CFSTR("COMPONENTNAME_TTS");
      goto LABEL_61;
    case 14:
      v6 = CFSTR("COMPONENTNAME_CONVERSATION");
      goto LABEL_61;
    case 15:
      v6 = CFSTR("COMPONENTNAME_REFERENCE_RESOLUTION");
      goto LABEL_61;
    case 16:
      v6 = CFSTR("COMPONENTNAME_CURARE");
      goto LABEL_61;
    case 17:
      v6 = CFSTR("COMPONENTNAME_HAL");
      goto LABEL_61;
    case 18:
      v6 = CFSTR("COMPONENTNAME_NETWORK");
      goto LABEL_61;
    case 19:
      v6 = CFSTR("COMPONENTNAME_PLUS");
      goto LABEL_61;
    case 20:
      v6 = CFSTR("COMPONENTNAME_SIRI_STATES");
      goto LABEL_61;
    case 21:
      v6 = CFSTR("COMPONENTNAME_POMMES");
      goto LABEL_61;
    case 22:
      v6 = CFSTR("COMPONENTNAME_GROUP_ACTIVITY");
      goto LABEL_61;
    case 23:
      v6 = CFSTR("COMPONENTNAME_CDA");
      goto LABEL_61;
    case 24:
      v6 = CFSTR("COMPONENTNAME_PEGASUS");
      goto LABEL_61;
    case 25:
      v6 = CFSTR("COMPONENTNAME_MWT");
      goto LABEL_61;
    case 26:
      v6 = CFSTR("COMPONENTNAME_SUT");
      goto LABEL_61;
    case 27:
      v6 = CFSTR("COMPONENTNAME_INFERENCE");
      goto LABEL_61;
    case 28:
      v6 = CFSTR("COMPONENTNAME_RF");
      goto LABEL_61;
    case 29:
      v6 = CFSTR("COMPONENTNAME_SIC");
      goto LABEL_61;
    case 30:
      v6 = CFSTR("COMPONENTNAME_CAAR");
      goto LABEL_61;
    case 31:
      v6 = CFSTR("COMPONENTNAME_SIRI_CORRECTIONS");
      goto LABEL_61;
    case 32:
      v6 = CFSTR("COMPONENTNAME_SIRI_SUGGESTIONS");
      goto LABEL_61;
    case 33:
      v6 = CFSTR("COMPONENTNAME_SIRI_SETUP");
      goto LABEL_61;
    case 34:
      v6 = CFSTR("COMPONENTNAME_ACTIVATION");
      goto LABEL_61;
    case 35:
      v6 = CFSTR("COMPONENTNAME_IA");
      goto LABEL_61;
    case 36:
      v6 = CFSTR("COMPONENTNAME_NLG");
      goto LABEL_61;
    case 37:
      v6 = CFSTR("COMPONENTNAME_TTM");
      goto LABEL_61;
    case 38:
      v6 = CFSTR("COMPONENTNAME_IDENTITY");
      goto LABEL_61;
    case 39:
      v6 = CFSTR("COMPONENTNAME_HOMEKIT");
      goto LABEL_61;
    case 40:
      v6 = CFSTR("COMPONENTNAME_READ");
      goto LABEL_61;
    case 41:
      v6 = CFSTR("COMPONENTNAME_RTS");
      goto LABEL_61;
    case 42:
      v6 = CFSTR("COMPONENTNAME_NLROUTER");
      goto LABEL_61;
    case 43:
      v6 = CFSTR("COMPONENTNAME_ORCH_SUBREQUEST");
      goto LABEL_61;
    case 44:
      v6 = CFSTR("COMPONENTNAME_SIRI_SELF_REFLECTION");
      goto LABEL_61;
    case 45:
      v6 = CFSTR("COMPONENTNAME_IF_REQUEST");
      goto LABEL_61;
    case 46:
      v6 = CFSTR("COMPONENTNAME_TRACE");
      goto LABEL_61;
    case 47:
      v6 = CFSTR("COMPONENTNAME_CACHE_MANAGER");
      goto LABEL_61;
    case 48:
      v6 = CFSTR("COMPONENTNAME_PNR_ON_DEVICE");
      goto LABEL_61;
    case 49:
      v6 = CFSTR("COMPONENTNAME_JOINT_RESOLVER");
      goto LABEL_61;
    case 50:
      v6 = CFSTR("COMPONENTNAME_QUERY_DECORATION");
      goto LABEL_61;
    case 51:
      v6 = CFSTR("COMPONENTNAME_PLAN_GENERATION");
      goto LABEL_61;
    case 52:
      v6 = CFSTR("COMPONENTNAME_DIALOGENGINE");
      goto LABEL_61;
    case 53:
      v6 = CFSTR("COMPONENTNAME_IF_SESSION");
      goto LABEL_61;
    case 54:
      v6 = CFSTR("COMPONENTNAME_FEEDBACK_LEARNING");
      goto LABEL_61;
    default:
      v6 = CFSTR("COMPONENTNAME_UNKNOWN");
LABEL_61:
      v9 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(CFSTR("SiriAnalytics.Component"), "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString dataUsingEncoding:](v6, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sa_deterministicUUIDv5ForNamespace:name:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "sa_deterministicUUIDv5ForNamespaceUUID:sourceUUID:", v12, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (SiriAnalyticsLoggingInit_once != -1)
          dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
        v13 = SiriAnalyticsLogContextAssistant;
        if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_ERROR))
        {
          v15 = 136315394;
          v16 = "+[AssistantSiriAnalytics derivedIdentifierForComponentName:fromSourceIdentifier:]";
          v17 = 1024;
          v18 = a3;
          _os_log_error_impl(&dword_1A025F000, v13, OS_LOG_TYPE_ERROR, "%s ComponentName: %d did not map to a component identifier", (uint8_t *)&v15, 0x12u);
        }
        v8 = 0;
      }

LABEL_69:
      return v8;
  }
}

uint64_t __88__AssistantSiriAnalytics_derivedIdentifierForComponent_fromSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __41__AssistantSiriAnalytics_sharedAnalytics__block_invoke()
{
  AssistantSiriAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(AssistantSiriAnalytics);
  v1 = (void *)sharedAnalytics_shared;
  sharedAnalytics_shared = (uint64_t)v0;

}

@end
