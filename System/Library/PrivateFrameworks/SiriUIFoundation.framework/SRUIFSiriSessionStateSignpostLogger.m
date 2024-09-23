@implementation SRUIFSiriSessionStateSignpostLogger

- (void)sessionStateHandler:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 forEvent:(int64_t)a6 machAbsoluteTime:(double)a7
{
  id v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t thinkingIntervalID;
  char v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (a6 == 6)
  {
    if (self->_thinkingIntervalID)
    {
      v17 = (id)*MEMORY[0x24BE08FB0];
      v18 = v17;
      thinkingIntervalID = self->_thinkingIntervalID;
      if (thinkingIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(v26) = 0;
        _os_signpost_emit_with_name_impl(&dword_219F26000, v18, OS_SIGNPOST_INTERVAL_END, thinkingIntervalID, "ThinkingStateTransition", (const char *)&unk_219F5A3CE, (uint8_t *)&v26, 2u);
      }

      self->_thinkingIntervalID = 0;
    }
  }
  else if (a6 == 2)
  {
    v13 = (id *)MEMORY[0x24BE08FB0];
    self->_thinkingIntervalID = os_signpost_id_generate((os_log_t)*MEMORY[0x24BE08FB0]);
    v14 = *v13;
    v15 = v14;
    v16 = self->_thinkingIntervalID;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_219F26000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "ThinkingStateTransition", (const char *)&unk_219F5A3CE, (uint8_t *)&v26, 2u);
    }

  }
  switch(a5)
  {
    case 0:
      v20 = 0;
      v21 = 1416;
      break;
    case 1:
      v20 = 0;
      v21 = 1417;
      break;
    case 2:
      v20 = 0;
      v21 = 1418;
      break;
    case 3:
      v20 = 0;
      v21 = 1419;
      break;
    default:
      v21 = 0;
      v20 = 1;
      break;
  }
  if (a4 != a5)
  {
    v22 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      AFAnalyticsEventTypeGetName();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "-[SRUIFSiriSessionStateSignpostLogger sessionStateHandler:didTransitionFromState:toState:forEvent:machAbsoluteTime:]";
      v28 = 2112;
      v29 = v24;
      _os_log_impl(&dword_219F26000, v23, OS_LOG_TYPE_DEFAULT, "%s logging event %@", (uint8_t *)&v26, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logEventWithType:machAbsoluteTime:context:", v21, (unint64_t)a7, 0);

    if ((v20 & 1) == 0)
      kdebug_trace();
  }

}

@end
