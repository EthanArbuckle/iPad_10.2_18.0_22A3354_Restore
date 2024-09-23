@implementation TUIInputAnalytics

+ (void)_sendSignal:(id)a3 toChannel:(id)a4 withThreadId:(id)a5 withPayload:(id)a6
{
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0D3AB50], "sendSignal:toChannel:withUniqueStringID:withPayload:", v9, a4, a5, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D3AB50], "sendSignal:toChannel:withPayload:", v9, a4, a6);
    TUIInputAnalyticsLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138477827;
      v12 = v9;
      _os_log_error_impl(&dword_18C785000, v10, OS_LOG_TYPE_ERROR, "%{private}@ sent without msgOrMailThreadId", (uint8_t *)&v11, 0xCu);
    }

  }
}

+ (void)didHandleSmartReplyAnalyticsEventOfType:(int64_t)a3 withBundleId:(id)a4 withInputContextHistoryRequestId:(id)a5 withMsgOrMailThreadId:(id)a6 withSmartReplyResponse:(id)a7
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  __CFString **v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  uint64_t SmartReplyStartTimeForRequest;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  if ((unint64_t)objc_msgSend(MEMORY[0x1E0D3AB58], "getSPIVersion") >= 9)
  {
    v13 = (__CFString *)(id)*MEMORY[0x1E0D3AB10];
    v14 = (__CFString *)(id)*MEMORY[0x1E0D3AB30];
    if (v12)
      goto LABEL_3;
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v13 = CFSTR("Intents");
  v14 = CFSTR("IntentGenerated");
  if (!v12)
    goto LABEL_11;
LABEL_3:
  v34 = v11;
  v15 = v10;
  v16 = v14;
  objc_msgSend(v12, "srResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "modelInfoString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  objc_msgSend(v12, "userFeedbackInputString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "responseTexts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D3AB08]);
  if (v21)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D3AAF8]);
  if (v22)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, v13);

  v14 = v16;
  v10 = v15;
  v11 = v34;
  v12 = v20;
LABEL_12:
  switch(a3)
  {
    case 0:
      v23 = mach_continuous_time();
      SetSmartReplyStartTimeForRequest(v10, v23);
      TUIInputAnalyticsLogger();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18C785000, v24, OS_LOG_TYPE_DEBUG, "Begin - SmartReplyGenerate", buf, 2u);
      }

      v25 = (__CFString **)MEMORY[0x1E0D3AB40];
      goto LABEL_30;
    case 1:
      TUIInputAnalyticsLogger();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 134349056;
        SmartReplyStartTimeForRequest = GetSmartReplyStartTimeForRequest(v10);
        _os_signpost_emit_with_name_impl(&dword_18C785000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SmartReplyGenerate", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      TUIInputAnalyticsLogger();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18C785000, v27, OS_LOG_TYPE_DEBUG, "End - SmartReplyGenerate - SmartReply Generated successfully", buf, 2u);
      }

      v28 = *MEMORY[0x1E0D3AAF0];
      v29 = v14;
      goto LABEL_31;
    case 2:
      TUIInputAnalyticsLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 134349056;
        SmartReplyStartTimeForRequest = GetSmartReplyStartTimeForRequest(v10);
        _os_signpost_emit_with_name_impl(&dword_18C785000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SmartReplyGenerateFailure", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      TUIInputAnalyticsLogger();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v32 = "End - SmartReplyGenerate - No SmartReply Generated";
      break;
    case 3:
      TUIInputAnalyticsLogger();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v33))
      {
        *(_DWORD *)buf = 134349056;
        SmartReplyStartTimeForRequest = GetSmartReplyStartTimeForRequest(v10);
        _os_signpost_emit_with_name_impl(&dword_18C785000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SmartReplyGenerateTimeout", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      TUIInputAnalyticsLogger();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v32 = "End - SmartReplyGenerate - No SmartReply Generated - Timeout";
      break;
    case 4:
      v25 = (__CFString **)MEMORY[0x1E0D3AB48];
      goto LABEL_30;
    default:
      goto LABEL_32;
  }
  _os_log_debug_impl(&dword_18C785000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 2u);
LABEL_28:

  v25 = (__CFString **)MEMORY[0x1E0D3AB38];
LABEL_30:
  v29 = *v25;
  v28 = *MEMORY[0x1E0D3AAF0];
LABEL_31:
  +[TUIInputAnalytics _sendSignal:toChannel:withThreadId:withPayload:](TUIInputAnalytics, "_sendSignal:toChannel:withThreadId:withPayload:", v29, v28, v11, v18);
LABEL_32:

}

@end
