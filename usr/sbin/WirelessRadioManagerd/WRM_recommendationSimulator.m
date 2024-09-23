@implementation WRM_recommendationSimulator

- (WRM_recommendationSimulator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_recommendationSimulator;
  return -[WCM_Controller init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_recommendationSimulator;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WRM_recommendationSimulator: received message: %@"), a3);
  switch(uint64)
  {
    case 4uLL:
      -[WRM_recommendationSimulator triggerGetMeadowModeTimer:](self, "triggerGetMeadowModeTimer:", a3);
      break;
    case 3uLL:
      -[WRM_recommendationSimulator triggerSetMeadowModeTimer:](self, "triggerSetMeadowModeTimer:", a3);
      break;
    case 2uLL:
      -[WRM_recommendationSimulator triggerTerminiousRecommendation:](self, "triggerTerminiousRecommendation:", a3);
      break;
  }
}

- (void)triggerSetMeadowModeTimer:(id)a3
{
  xpc_object_t value;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (xpc_dictionary_get_value(value, "kSetMeadowModeTimer"))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WRM_recommendationSimulator: SetMeadowModeTimer %llu seconds"), xpc_dictionary_get_uint64(value, "kSetMeadowModeTimer"));
}

- (void)triggerTerminiousRecommendation:(id)a3
{
  xpc_object_t value;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  size_t count;
  size_t v14;
  uint64_t v15;
  xpc_object_t v16;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (xpc_dictionary_get_value(value, "kBTRecommendationEnabled"))
    v5 = xpc_dictionary_get_uint64(value, "kBTRecommendationEnabled") != 0;
  else
    v5 = 0;
  if (xpc_dictionary_get_value(value, "kWIFIRecommendationEnabled"))
    v6 = xpc_dictionary_get_uint64(value, "kWIFIRecommendationEnabled") != 0;
  else
    v6 = 0;
  if (xpc_dictionary_get_value(value, "kdirectWIFIRecommendationEnabled"))
    v7 = xpc_dictionary_get_uint64(value, "kWIFIRecommendationEnabled") != 0;
  else
    v7 = 0;
  v8 = xpc_array_create(0, 0);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "kWRMProximityLinkRecommendationType", 1uLL);
  xpc_dictionary_set_BOOL(v9, "kWRMProximityLinkisRecommended", v5);
  xpc_array_append_value(v8, v9);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "kWRMProximityLinkRecommendationType", 0);
  xpc_dictionary_set_BOOL(v10, "kWRMProximityLinkisRecommended", v6);
  xpc_array_append_value(v8, v10);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "kWRMProximityLinkRecommendationType", 2uLL);
  xpc_dictionary_set_BOOL(v11, "kWRMProximityLinkisRecommended", v7);
  xpc_array_append_value(v8, v11);
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v12, "kWRMApplicationTypeList", v8);
  -[WRM_recommendationSimulator sendMessageForProcess:withArgs:forProcess:](self, "sendMessageForProcess:withArgs:forProcess:", 1305, v12, 19);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WRM_recommendationSimulator: Sending terminious recommendation"));
  count = xpc_array_get_count(v8);
  if (count << 32)
  {
    v14 = 0;
    if ((unint64_t)(int)count <= 1)
      v15 = 1;
    else
      v15 = (int)count;
    do
    {
      v16 = xpc_array_get_value(v8, v14);
      xpc_release(v16);
      ++v14;
    }
    while (v15 != v14);
  }
  xpc_release(v12);
  xpc_release(v8);
}

- (void)sendMessageForProcess:(unint64_t)a3 withArgs:(id)a4 forProcess:(int)a5
{
  uint64_t v5;
  xpc_object_t v7;
  id v8;
  xpc_object_t values[2];
  char *keys[2];

  v5 = *(_QWORD *)&a5;
  *(_OWORD *)keys = *(_OWORD *)off_100201B78;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  v8 = objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionSync:", v5);
  if (v8)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WRM_recommendationSimulator: found session-> Sending message: %@"), v7);
    objc_msgSend(v8, "sendMessage:", v7);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("WRM_recommendationSimulator: Sending message: %@"), v7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 26, CFSTR("no session for process id: %d"), v5);
  }
  xpc_release(values[0]);
  xpc_release(v7);
}

@end
