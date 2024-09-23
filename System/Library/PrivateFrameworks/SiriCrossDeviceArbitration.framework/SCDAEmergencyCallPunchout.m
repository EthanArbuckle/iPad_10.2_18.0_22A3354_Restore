@implementation SCDAEmergencyCallPunchout

- (SCDAEmergencyCallPunchout)init
{
  SCDAEmergencyCallPunchout *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *myriadEmergencyCallingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCDAEmergencyCallPunchout;
  v2 = -[SCDAEmergencyCallPunchout init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.myriad_emergncy_call", 0);
    myriadEmergencyCallingQueue = v2->_myriadEmergencyCallingQueue;
    v2->_myriadEmergencyCallingQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)initiateEmergencyCallMyriad
{
  dispatch_async((dispatch_queue_t)self->_myriadEmergencyCallingQueue, &__block_literal_global);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadEmergencyCallingQueue, 0);
}

void __56__SCDAEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  objc_class *v3;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE buf[24];
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s Punching out to Phone app to make emergency call", buf, 0xCu);
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v1 = (void *)getTUCallProviderManagerClass_softClass;
  v18 = getTUCallProviderManagerClass_softClass;
  v2 = MEMORY[0x24BDAC760];
  if (!getTUCallProviderManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getTUCallProviderManagerClass_block_invoke;
    v20 = &unk_25174AB98;
    v21 = &v15;
    __getTUCallProviderManagerClass_block_invoke((uint64_t)buf);
    v1 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v15, 8);
  v4 = objc_alloc_init(v3);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getTUDialRequestClass_softClass;
  v18 = getTUDialRequestClass_softClass;
  if (!getTUDialRequestClass_softClass)
  {
    *(_QWORD *)buf = v2;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getTUDialRequestClass_block_invoke;
    v20 = &unk_25174AB98;
    v21 = &v15;
    __getTUDialRequestClass_block_invoke((uint64_t)buf);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v7 = [v6 alloc];
  objc_msgSend(v4, "emergencyProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithProvider:", v8);

  objc_msgSend(v9, "setPerformDialAssist:", 0);
  objc_msgSend(v9, "setDialType:", 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v10 = (_QWORD *)getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr;
  v18 = getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr;
  if (!getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr)
  {
    *(_QWORD *)buf = v2;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getTUCallSourceIdentifierSpeakerRouteSymbolLoc_block_invoke;
    v20 = &unk_25174AB98;
    v21 = &v15;
    __getTUCallSourceIdentifierSpeakerRouteSymbolLoc_block_invoke((uint64_t)buf);
    v10 = (_QWORD *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v10)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  objc_msgSend(v9, "setAudioSourceIdentifier:", *v10);
  v11 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s Emergency beacon handling created dial request %@", buf, 0x16u);
  }
  v13[0] = v2;
  v13[1] = 3221225472;
  v13[2] = __56__SCDAEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_5;
  v13[3] = &unk_25174AB48;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v4, "launchAppForDialRequest:completion:", v12, v13);

}

void __56__SCDAEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = SCDALogContextCore;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_246211000, v4, OS_LOG_TYPE_ERROR, "%s Emergency beacon initiated call failed, error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = 136315394;
    v7 = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s Emergency beacon initiated call created: %@", (uint8_t *)&v6, 0x16u);
  }

}

@end
