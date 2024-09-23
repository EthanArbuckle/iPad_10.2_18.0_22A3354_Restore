@implementation SCDAInstrumentation

- (SCDAInstrumentation)init
{
  SCDAInstrumentation *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  SCDAArbitrationParticipationController *v5;
  SCDAArbitrationParticipationController *arbitrationParticipationController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCDAInstrumentation;
  v2 = -[SCDAInstrumentation init](&v8, sel_init);
  if (v2)
  {
    SCDADispatchSerialQueueWithRelativePriority("com.apple.assistant.myriad.instrumentation", QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    if (objc_msgSend(MEMORY[0x24BE091E0], "isCrossDeviceArbitrationFeedbackEnabled"))
    {
      v5 = objc_alloc_init(SCDAArbitrationParticipationController);
      arbitrationParticipationController = v2->_arbitrationParticipationController;
      v2->_arbitrationParticipationController = v5;

    }
  }
  return v2;
}

- (void)logCDADeviceStateActivityStartedOrChanged:(int)a3 withTrigger:(int)a4 withCdaId:(id)a5 withTimestamp:(unint64_t)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  int v16;
  int v17;

  v10 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __101__SCDAInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke;
  v13[3] = &unk_251749C00;
  v13[4] = self;
  v14 = v10;
  v16 = a3;
  v17 = a4;
  v15 = a6;
  v12 = v10;
  dispatch_async(queue, v13);

}

- (void)logCDADeviceStateActivityEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__SCDAInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_251749C28;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionAdvertisingStarted:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__SCDAInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_251749C28;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionAdvertisingStarting:(int)a3 withDelay:(float)a4 withInterval:(float)a5 withVoiceTriggerLatency:(float)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8
{
  id v14;
  NSObject *queue;
  id v16;
  _QWORD block[5];
  id v18;
  unint64_t v19;
  int v20;
  float v21;
  float v22;
  float v23;

  v14 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __128__SCDAInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withVoiceTriggerLatency_withCdaId_withTimestamp___block_invoke;
  block[3] = &unk_251749C50;
  block[4] = self;
  v18 = v14;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v19 = a8;
  v16 = v14;
  dispatch_async(queue, block);

}

- (void)logCDAElectionAdvertisingEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__SCDAInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_251749C28;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionAdvertisingEnding:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__SCDAInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_251749C28;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionTimerEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__SCDAInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_251749C28;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionDecisionMade:(int)a3 withDecision:(int)a4 withPreviousDecision:(int)a5 timeSincePreviousDecision:(unint64_t)a6 withWinningDevice:(id)a7 withThisDevice:(id)a8 withParticipants:(id)a9 withRawScore:(unsigned int)a10 withBoost:(id)a11 withCdaId:(id)a12 currentRequestId:(id)a13 withTimestamp:(unint64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *queue;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __224__SCDAInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke;
  block[3] = &unk_251749C78;
  block[4] = self;
  v34 = v22;
  v42 = a4;
  v43 = a5;
  v35 = v18;
  v36 = v19;
  v37 = v21;
  v38 = v20;
  v44 = a10;
  v45 = a3;
  v40 = a6;
  v41 = a14;
  v39 = v23;
  v25 = v23;
  v26 = v20;
  v27 = v21;
  v28 = v19;
  v29 = v18;
  v30 = v22;
  dispatch_async(queue, block);

}

- (void)logCDAElectionDecisionMadeDebug:(int)a3 withCrossDeviceArbitrationAllowed:(BOOL)a4 advertisementData:(id)a5 withDeviceGroup:(unsigned int)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8
{
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  unsigned int v23;
  int v24;
  BOOL v25;

  v14 = a5;
  v15 = a7;
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __147__SCDAInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke;
  v19[3] = &unk_251749CA0;
  v19[4] = self;
  v20 = v15;
  v25 = a4;
  v23 = a6;
  v24 = a3;
  v21 = v14;
  v22 = a8;
  v17 = v14;
  v18 = v15;
  dispatch_async(queue, v19);

}

- (void)_sendAndLogClientEvent:(id)a3 stState:(int)a4 atTimestamp:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BE909B0];
  v7 = a3;
  objc_msgSend(v6, "sharedStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitMessage:timestamp:", v7, a5);

}

- (id)_boostTypeAsString:(unsigned __int8)a3
{
  if ((a3 - 1) > 6)
    return CFSTR("SCDABoostTypeUnknown");
  else
    return off_251749DB8[(a3 - 1)];
}

- (void)updateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  NSObject *queue;
  _QWORD v5[5];
  unsigned int v6;
  unsigned __int8 v7;

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__SCDAInstrumentation_updateBoost_value___block_invoke;
  v5[3] = &unk_251749CC8;
  v5[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (void)updateIsTrump:(BOOL)a3 withReason:(int)a4
{
  NSObject *queue;
  _QWORD v5[5];
  int v6;
  BOOL v7;

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SCDAInstrumentation_updateIsTrump_withReason___block_invoke;
  v5[3] = &unk_251749CC8;
  v5[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (id)_createSchemaClientEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BE94A08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v4);

  v7 = objc_alloc_init(MEMORY[0x24BE94A10]);
  objc_msgSend(v7, "setCdaId:", v6);
  objc_msgSend(v5, "setEventMetadata:", v7);

  return v5;
}

- (void)_logRequestLinkMessageRequestId:(id)a3 cdaId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__SCDAInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke;
    v11[3] = &unk_25174A620;
    v12 = v7;
    v13 = v6;
    dispatch_async(queue, v11);

  }
  else
  {
    v10 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SCDAInstrumentation _logRequestLinkMessageRequestId:cdaId:]";
      _os_log_debug_impl(&dword_246211000, v10, OS_LOG_TYPE_DEBUG, "%s Skipped emitting RequestLinkEvent as requestId or cdaId is nil", buf, 0xCu);
    }
  }

}

- (void)userFeedbackPublishArbitrationParticipationContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SCDAInstrumentation *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SCDAInstrumentation_userFeedbackPublishArbitrationParticipationContext___block_invoke;
  v7[3] = &unk_25174A620;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBoost, 0);
  objc_storeStrong((id *)&self->_arbitrationParticipationController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __74__SCDAInstrumentation_userFeedbackPublishArbitrationParticipationContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateBoosts:triggerType:lastWin:lastDecision:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "publishArbitrationParticipationContext:", *(_QWORD *)(a1 + 32));
}

void __61__SCDAInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE95C78]);
  v3 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);
  v6 = (void *)objc_msgSend(v2, "initWithNSUUID:", v5);

  v7 = objc_alloc_init(MEMORY[0x24BE95B68]);
  objc_msgSend(v7, "setUuid:", v6);
  objc_msgSend(v7, "setComponent:", 23);
  v8 = objc_alloc(MEMORY[0x24BE95C78]);
  v9 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  v12 = (void *)objc_msgSend(v8, "initWithNSUUID:", v11);

  v13 = objc_alloc_init(MEMORY[0x24BE95B68]);
  objc_msgSend(v13, "setUuid:", v12);
  objc_msgSend(v13, "setComponent:", 1);
  v14 = objc_alloc_init(MEMORY[0x24BE95B60]);
  objc_msgSend(v14, "setSource:", v7);
  objc_msgSend(v14, "setTarget:", v13);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitMessage:", v14);

  v16 = SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v19 = 136315650;
    v20 = "-[SCDAInstrumentation _logRequestLinkMessageRequestId:cdaId:]_block_invoke";
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_246211000, v16, OS_LOG_TYPE_DEBUG, "%s Emitting Myriad RequestLinkEvent with requestId: %@, cdaId: %@", (uint8_t *)&v19, 0x20u);
  }

}

void __48__SCDAInstrumentation_updateIsTrump_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  unsigned int v8;
  const __CFString *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE94A80]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "setIsTrump:", *(unsigned __int8 *)(a1 + 44));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTrumpReason:", *(unsigned int *)(a1 + 40));
  v6 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(unsigned __int8 *)(a1 + 44);
    v8 = *(_DWORD *)(a1 + 40) - 1;
    if (v8 > 7)
      v9 = CFSTR("CDATRUMPREASON_UNKNOWN");
    else
      v9 = off_251749DF0[v8];
    v11 = 136315650;
    v12 = "-[SCDAInstrumentation updateIsTrump:withReason:]_block_invoke";
    v13 = 1024;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v10 = v6;
    _os_log_debug_impl(&dword_246211000, v10, OS_LOG_TYPE_DEBUG, "%s trump: %d, with Reason:%@", (uint8_t *)&v11, 0x1Cu);

  }
}

void __41__SCDAInstrumentation_updateBoost_value___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE94A80]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

  }
  v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(unsigned __int8 *)(a1 + 44);
    v8 = v5;
    objc_msgSend(v6, "_boostTypeAsString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_DWORD *)(a1 + 40);
    v11 = 136315650;
    v12 = "-[SCDAInstrumentation updateBoost:value:]_block_invoke";
    v13 = 2112;
    v14 = v9;
    v15 = 1024;
    v16 = v10;
    _os_log_debug_impl(&dword_246211000, v8, OS_LOG_TYPE_DEBUG, "%s boostType: %@, boostValue:%d", (uint8_t *)&v11, 0x1Cu);

  }
  switch(*(_BYTE *)(a1 + 44))
  {
    case 1:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDeviceBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRecentUnlockBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 3:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRecentRaiseToWakeBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 4:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRecentSiriRequestBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 5:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRecentMotionBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 6:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRecentPlaybackBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRecentAlarmBoost:", *(unsigned int *)(a1 + 40));
      break;
    default:
      return;
  }
}

void __147__SCDAInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  const __CFString *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A18]);
  objc_msgSend(v3, "setIsCrossDeviceArbitrationAllowed:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v3, "setDeviceGroup:", *(unsigned int *)(a1 + 64));
  objc_msgSend(v3, "setAdvertisementDatas:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setDebugElectionDecisionMade:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 56));
  v4 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 68) - 1;
    if (v6 > 0x11)
      v7 = CFSTR("CDASTATE_UNKNOWN");
    else
      v7 = off_251749D28[v6];
    v8 = *(unsigned __int8 *)(a1 + 72);
    v9 = *(_DWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = 136316418;
    v13 = "-[SCDAInstrumentation logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:with"
          "DeviceGroup:withCdaId:withTimestamp:]_block_invoke";
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v11 = v4;
    _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, arbitrationAllowed: %d, deviceGroup: %d, advertisements: %@", (uint8_t *)&v12, 0x36u);

  }
}

void __224__SCDAInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  int v24;
  uint64_t v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  int v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A68]);
  objc_msgSend(v3, "setDecision:", *(unsigned int *)(a1 + 104));
  objc_msgSend(v3, "setPreviousDecision:", *(unsigned int *)(a1 + 108));
  objc_msgSend(v3, "setWinningDevice:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setThisDevice:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setRawGoodnessScore:", *(unsigned int *)(a1 + 112));
  objc_msgSend(v3, "setTimeSinceLastDecisionInMs:", *(_QWORD *)(a1 + 88));
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "setGoodnessScoreBoosts:", v4);
  objc_msgSend(v3, "setHeardParticipants:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v2, "setElectionDecisionMade:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 116), *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "_logRequestLinkMessageRequestId:cdaId:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
  v5 = (id)SCDALogContextAnalytics;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_DWORD *)(a1 + 116) - 1;
    if (v9 > 0x11)
      v10 = CFSTR("CDASTATE_UNKNOWN");
    else
      v10 = off_251749D28[v9];
    v31 = v10;
    v11 = CFSTR("CDADECISION_UNKNOWN");
    v12 = *(_DWORD *)(a1 + 104);
    v13 = *(_DWORD *)(a1 + 108);
    if (v12 == 1)
      v14 = CFSTR("CDADECISION_WIN");
    else
      v14 = CFSTR("CDADECISION_UNKNOWN");
    if (v12 == 2)
      v15 = CFSTR("CDADECISION_LOSS");
    else
      v15 = v14;
    if (v13 == 1)
      v11 = CFSTR("CDADECISION_WIN");
    if (v13 == 2)
      v11 = CFSTR("CDADECISION_LOSS");
    v27 = v11;
    v28 = v15;
    v30 = *(_QWORD *)(a1 + 88);
    v16 = *(void **)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 40);
    v29 = objc_msgSend(v16, "goodnessScore");
    v17 = *(void **)(a1 + 56);
    v26 = objc_msgSend(v17, "goodnessScore");
    objc_msgSend(*(id *)(a1 + 72), "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_DWORD *)(a1 + 112);
    objc_msgSend(v3, "goodnessScoreBoosts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "goodnessScoreBoosts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "trumpReason") - 1;
    if (v22 > 7)
      v23 = CFSTR("CDATRUMPREASON_UNKNOWN");
    else
      v23 = off_251749DF0[v22];
    *(_DWORD *)buf = 136318466;
    v33 = "-[SCDAInstrumentation logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:w"
          "ithWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimesta"
          "mp:]_block_invoke";
    v34 = 2112;
    v35 = v25;
    v36 = 2112;
    v37 = v31;
    v38 = 2112;
    v39 = v28;
    v40 = 2112;
    v41 = v27;
    v42 = 2048;
    v43 = v30;
    v44 = 2112;
    v45 = v16;
    v46 = 1024;
    v47 = v29;
    v48 = 2112;
    v49 = v17;
    v50 = 1024;
    v51 = v26;
    v52 = 2112;
    v53 = v18;
    v54 = 1024;
    v55 = v24;
    v56 = 2112;
    v57 = v20;
    v58 = 2112;
    v59 = v23;
    _os_log_debug_impl(&dword_246211000, v5, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, withDecision: %@, withPreviousDecision: %@, timeSincePreviousDecision: %llu, withWinningDevice: %@ (score: %d), withThisDevice: %@ (score: %d), withParticipants: %@, withRawScore:%u, withBoost:%@, withTrumpReason:%@", buf, 0x82u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v8 = mach_absolute_time();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v8;
  if (*(_DWORD *)(a1 + 104) == 1)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v8;

}

void __72__SCDAInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  const __CFString *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A70]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  objc_msgSend(v2, "setElectionTimerEnded:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 56) - 1;
    if (v6 > 0x11)
      v7 = CFSTR("CDASTATE_UNKNOWN");
    else
      v7 = off_251749D28[v6];
    v9 = 136315650;
    v10 = "-[SCDAInstrumentation logCDAElectionTimerEnded:withCdaId:withTimestamp:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v8 = v4;
    _os_log_debug_impl(&dword_246211000, v8, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v9, 0x20u);

  }
}

void __79__SCDAInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A50]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x24BE94A20]);
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  objc_msgSend(v2, "setCdaAdvertisingEndChanged:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_251749D28[v7];
    v10 = 136315650;
    v11 = "-[SCDAInstrumentation logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_246211000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __78__SCDAInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A48]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x24BE94A20]);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "setCdaAdvertisingEndChanged:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_251749D28[v7];
    v10 = 136315650;
    v11 = "-[SCDAInstrumentation logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_246211000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __128__SCDAInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withVoiceTriggerLatency_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A60]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  LODWORD(v4) = *(_DWORD *)(a1 + 60);
  objc_msgSend(v3, "setAdvertisementDelay:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v3, "setAdvertisementInterval:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 68);
  objc_msgSend(v3, "setVoiceTriggerLatency:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BE94A28]);
  objc_msgSend(v7, "setStartedOrChanged:", v3);
  objc_msgSend(v2, "setCdaAdvertisingStartChanged:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v8 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 56) - 1;
    if (v10 > 0x11)
      v11 = CFSTR("CDASTATE_UNKNOWN");
    else
      v11 = off_251749D28[v10];
    v13 = 136315650;
    v14 = "-[SCDAInstrumentation logCDAElectionAdvertisingStarting:withDelay:withInterval:withVoiceTriggerLatency:withCda"
          "Id:withTimestamp:]_block_invoke";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    v12 = v8;
    _os_log_debug_impl(&dword_246211000, v12, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v13, 0x20u);

  }
}

void __80__SCDAInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A58]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x24BE94A28]);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "setCdaAdvertisingStartChanged:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_251749D28[v7];
    v10 = 136315650;
    v11 = "-[SCDAInstrumentation logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_246211000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __78__SCDAInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A30]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x24BE94A40]);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "setDeviceElectionStateContext:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_251749D28[v7];
    v10 = 136315650;
    v11 = "-[SCDAInstrumentation logCDADeviceStateActivityEnded:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_246211000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __101__SCDAInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BE94A38]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  if (*(_DWORD *)(a1 + 60))
  {
    objc_msgSend(v3, "setTrigger:");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_DWORD *)(a1 + 60);
  }
  v4 = objc_alloc_init(MEMORY[0x24BE94A40]);
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  objc_msgSend(v2, "setDeviceElectionStateContext:", v4);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitMessage:timestamp:", v2, *(_QWORD *)(a1 + 48));

  v6 = (void *)SCDALogContextAnalytics;
  if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_251749D28[v7];
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 60) - 1;
    if (v10 > 7)
      v11 = CFSTR("CDATRIGGER_UKNOWN");
    else
      v11 = off_251749CE8[v10];
    v13 = 136315906;
    v14 = "-[SCDAInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:]_block_invoke";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v11;
    v12 = v6;
    _os_log_debug_impl(&dword_246211000, v12, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, trigger: %@", (uint8_t *)&v13, 0x2Au);

  }
}

@end
