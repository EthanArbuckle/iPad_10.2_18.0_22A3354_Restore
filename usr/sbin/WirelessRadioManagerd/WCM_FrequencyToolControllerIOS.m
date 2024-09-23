@implementation WCM_FrequencyToolControllerIOS

- (WCM_FrequencyToolControllerIOS)init
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCM_FrequencyToolControllerIOS;
  v2 = -[WCM_FrequencyToolController init](&v7, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sacManager"));
  v5 = *(void **)(v2 + 20);
  *(_QWORD *)(v2 + 20) = v4;

  return (WCM_FrequencyToolControllerIOS *)v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_FrequencyToolControllerIOS;
  -[WCM_FrequencyToolController dealloc](&v2, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCM_FrequencyToolControllerIOS;
  -[WCM_FrequencyToolController handlePowerState:](&v3, "handlePowerState:", a3);
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;
  id v5;

  v5 = a3;
  uint64 = xpc_dictionary_get_uint64(v5, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Frequency Tool Controller handleMessage messageId = %lld"), uint64);
  if (uint64 == 2402)
  {
    -[WCM_FrequencyToolControllerIOS handleFrequencyToolQuery:](self, "handleFrequencyToolQuery:", v5);
  }
  else if (uint64 == 2401)
  {
    -[WCM_FrequencyToolControllerIOS handleFrequencyToolOperation:](self, "handleFrequencyToolOperation:", v5);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Frequency Tool Controller dropping message-id %lld"), uint64);
  }

}

- (void)handleFrequencyToolQuery:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  xpc_object_t v8;
  BOOL v9;
  BOOL v10;
  xpc_object_t v11;
  void *v12;
  void *v13;
  uint64_t uint64;
  id v15;
  id v16;
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  id v23;
  uint64_t v24;
  xpc_object_t v25;
  BOOL v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  id v30;
  uint64_t v31;
  xpc_object_t v32;
  void *v33;
  xpc_object_t v34;
  xpc_object_t xdict;
  void *v36;
  xpc_object_t value;
  WCM_FrequencyToolControllerIOS *v38;
  uint64_t v39;

  xdict = a3;
  v38 = self;
  v4 = *(_QWORD *)(&self->super.super.mProcessId + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeCoexFeatures"));
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("SacPolicySupport"));

  v8 = xpc_dictionary_create(0, 0, 0);
  if (v7)
    v9 = v4 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v11 = xpc_dictionary_get_value(xdict, "kMessageArgs");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
    {
      uint64 = xpc_dictionary_get_uint64(v12, "KWCMFrequencyToolOperation");
      v10 = uint64 != 6;
      if (uint64 != 1)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v10 = 1;
    }
    v33 = v13;
    v34 = v8;
    v15 = objc_alloc_init((Class)NSMutableArray);
    v16 = objc_alloc_init((Class)NSMutableArray);
    value = xpc_array_create(0, 0);
    v17 = xpc_array_create(0, 0);
    v18 = 0;
    v36 = v17;
    do
    {
      v39 = v18;
      v19 = dword_1001FB6F8[v18];
      objc_msgSend(*(id *)(&v38->super.super.mProcessId + 1), "frequencyToolGetJasperResult:generalSacResult:client:", v15, v16, v19);
      if (objc_msgSend(v15, "count"))
      {
        v20 = 0;
        v21 = 1;
        do
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v20));
          v23 = objc_msgSend(v22, "centerFreq");
          v24 = (unint64_t)objc_msgSend(v22, "bw") >> 1;
          v25 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v25, "KWCMFrequencyToolResponse_Client", v19);
          xpc_dictionary_set_uint64(v25, "KWCMFrequencyToolResponse_Frequency", (uint64_t)v23);
          xpc_dictionary_set_uint64(v25, "KWCMFrequencyToolResponse_Bandwidth", v24);
          xpc_array_append_value(value, v25);

          v20 = v21;
          v26 = (unint64_t)objc_msgSend(v15, "count") > v21++;
        }
        while (v26);
      }
      if (objc_msgSend(v16, "count"))
      {
        v27 = 0;
        v28 = 1;
        do
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v27));
          v30 = objc_msgSend(v29, "centerFreq");
          v31 = (unint64_t)objc_msgSend(v29, "bw") >> 1;
          v32 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v32, "KWCMFrequencyToolResponse_Client", v19);
          xpc_dictionary_set_uint64(v32, "KWCMFrequencyToolResponse_Frequency", (uint64_t)v30);
          xpc_dictionary_set_uint64(v32, "KWCMFrequencyToolResponse_Bandwidth", v31);
          xpc_array_append_value(v36, v32);

          v27 = v28;
          v26 = (unint64_t)objc_msgSend(v16, "count") > v28++;
        }
        while (v26);
      }
      v18 = v39 + 1;
    }
    while (v39 != 2);
    v8 = v34;
    xpc_dictionary_set_value(v34, "kWCMFrequencyToolResponse_ListOfFrequencies_Jasper", value);
    xpc_dictionary_set_value(v34, "kWCMFrequencyToolResponse_ListOfFrequencies_NonJasper", v36);

    v13 = v33;
    goto LABEL_20;
  }
  v10 = 0;
LABEL_21:
  xpc_dictionary_set_BOOL(v8, "KWCMFrequencyToolResponse_Status", v10);
  -[WCM_Controller sendMessage:withArgs:](v38, "sendMessage:withArgs:", 2403, v8);

}

- (void)handleFrequencyToolOperation:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  xpc_object_t value;
  void *v8;
  xpc_object_t v9;
  uint64_t uint64;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  xpc_object_t xdict;

  xdict = a3;
  if (*(_QWORD *)(&self->super.super.mProcessId + 1)
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeCoexFeatures")),
        v6 = objc_msgSend(v5, "containsObject:", CFSTR("SacPolicySupport")),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    value = xpc_dictionary_get_value(xdict, "kMessageArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    v9 = v8;
    if (v8)
    {
      uint64 = xpc_dictionary_get_uint64(v8, "KWCMFrequencyToolOperation");
      v11 = xpc_dictionary_get_uint64(v9, "kWCMFrequencyToolClient");
      v12 = xpc_dictionary_get_uint64(v9, "kWCMFrequencyToolFrequency");
      v13 = 2 * xpc_dictionary_get_uint64(v9, "kWCMFrequencyToolBandwidth");
      v14 = xpc_dictionary_get_uint64(v9, "kWCMFrequencyToolPriority");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received from Frequency Tool Operation (%llu), Client = (%llu), Frequency = (%llu), Bandwidth = (%llu), Priority = (%llu) "), uint64, v11, v12, v13, v14);
      switch(uint64)
      {
        case 0uLL:
          objc_msgSend(*(id *)(&self->super.super.mProcessId + 1), "frequencyToolClearFreq:", v11);
          break;
        case 2uLL:
          if (v14 < 3)
            v15 = (v14 + 1);
          else
            v15 = 3;
          objc_msgSend(*(id *)(&self->super.super.mProcessId + 1), "frequencyToolAddClientFreq:centerFreq:bandwidth:celluarCarrierType:", v11, v12, v13, v15);
          break;
        case 3uLL:
          objc_msgSend(*(id *)(&self->super.super.mProcessId + 1), "frequencyToolRemoveFreq:centerFreq:bandwidth:", v11, v12, v13);
          break;
        case 4uLL:
          v16 = *(void **)(&self->super.super.mProcessId + 1);
          v17 = 1;
          goto LABEL_15;
        case 5uLL:
          v16 = *(void **)(&self->super.super.mProcessId + 1);
          v17 = 0;
LABEL_15:
          objc_msgSend(v16, "setBlockReporting:", v17);
          break;
        default:
          break;
      }
    }
  }
  else
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v9, "KWCMFrequencyToolResponse_Status", 0);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 2403, v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super.super.mProcessId + 1), 0);
}

@end
