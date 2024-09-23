@implementation WFMeasure

- (WFMeasure)initWithType:(unint64_t)a3 andReason:(id)a4 prevTestedOptions:(unint64_t)a5 andInterfaceName:(id)a6
{
  id v10;
  id v11;
  char *v12;
  dispatch_group_t v13;
  uint64_t v14;
  WFMeasure *v15;
  WFMeasureResult *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  char *v21;
  _QWORD v22[4];
  char *v23;
  _QWORD v24[4];
  char *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  objc_super v36;

  v10 = a4;
  v11 = a6;
  v36.receiver = self;
  v36.super_class = (Class)WFMeasure;
  v12 = -[WFMeasure init](&v36, sel_init);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  *(_DWORD *)(v12 + 9) = 0;
  v12[13] = 0;
  NSLog(CFSTR("%s: Requesting test type: %lu for Reason: %@ prevTestedOptions: %lx using interface: %@"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", a3, v10, a5, v11);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    NSLog(CFSTR("%s: feature not enabled"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");
    goto LABEL_25;
  }
  if (MGGetBoolAnswer())
  {
    *((_BYTE *)v29 + 24) = 1;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke;
    v27[3] = &unk_1E881D9A0;
    v27[4] = &v28;
    objc_msgSend(v12, "getLazyNSNumberPreference:exists:", CFSTR("behave_as_internal"), v27);
  }
  if (MGGetBoolAnswer())
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_2;
    v26[3] = &unk_1E881D9A0;
    v26[4] = &v32;
    objc_msgSend(v12, "getLazyNSNumberPreference:exists:", CFSTR("behave_as_seed"), v26);
  }
  if (MGGetBoolAnswer())
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_3;
    v24[3] = &unk_1E881D9C8;
    v25 = v12;
    objc_msgSend(v25, "getLazyNSNumberPreference:exists:", CFSTR("behave_as_paris"), v24);

  }
  objc_msgSend(v12, "setIsInProgress:", 0);
  objc_msgSend(v12, "setOptions:", 0);
  objc_msgSend(v12, "setInterfaceName:", v11);
  objc_msgSend(v12, "setTestReason:", v10);
  v13 = dispatch_group_create();
  objc_msgSend(v12, "setDispatchGroup:", v13);

  objc_msgSend(v12, "setTclass:", 700);
  if (objc_msgSend(v10, "containsString:", CFSTR("periodicTestHourly")))
    v12[9] = 1;
  if (objc_msgSend(v10, "containsString:", CFSTR("Siri Timed Out")))
    v12[10] = 1;
  if (objc_msgSend(v10, "containsString:", CFSTR("Apsd Timed Out")))
    v12[11] = 1;
  if (a5)
  {
    NSLog(CFSTR("%s: Because prevTestedOptions is nonzero, assuming this is a retest"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");
    v12[12] = 1;
  }
  if (MGGetBoolAnswer())
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_4;
    v22[3] = &unk_1E881D9C8;
    v23 = v12;
    objc_msgSend(v23, "getLazyNSNumberPreference:exists:", CFSTR("behave_as_retest"), v22);

  }
  if (v12[12])
  {
    NSLog(CFSTR("%s: Because _isRetest using previous test options 0x%lx"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", a5);
    objc_msgSend(v12, "setOptions:", a5);
  }
  switch(a3)
  {
    case 0xFFFFFFFFuLL:
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 1);
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 2);
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 4);
      if (!*((_BYTE *)v29 + 24) && !*((_BYTE *)v33 + 24))
        break;
LABEL_32:
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 8);
      v14 = objc_msgSend(v12, "options") | 0x10;
      goto LABEL_33;
    case 2uLL:
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 2);
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 4);
      if (v12[13] && !*((_BYTE *)v29 + 24) && !*((_BYTE *)v33 + 24))
        break;
      goto LABEL_32;
    case 1uLL:
      v14 = objc_msgSend(v12, "options") | 1;
LABEL_33:
      objc_msgSend(v12, "setOptions:", v14);
      break;
  }
  if (MGGetBoolAnswer())
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_5;
    v20[3] = &unk_1E881D9C8;
    v21 = v12;
    objc_msgSend(v21, "getLazyNSNumberPreference:exists:", CFSTR("test_options"), v20);

  }
  NSLog(CFSTR("%s: Will test type: %lu for Reason: %@ prevTestedOptions: 0x%lx options: 0x%lx using interface: %@"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", a3, v10, a5, objc_msgSend(v12, "options"), v11);
  if (objc_msgSend(v12, "options"))
  {
    objc_msgSend(v12, "setPublicDNSAddress:", CFSTR("1.1.1.1"));
    objc_msgSend(v12, "setTestDNSHostname:", CFSTR("www.apple.com"));
    v16 = -[WFMeasureResult initWithType:]([WFMeasureResult alloc], "initWithType:", a3);
    objc_msgSend(v12, "setResult:", v16);

    v17 = objc_msgSend(v12, "options");
    objc_msgSend(v12, "result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOptions:", v17);

    objc_msgSend(v12, "retrieveNetworkConfigurations");
    NSLog(CFSTR("%s: LQM-WiFi: %@"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", v12);
    v12 = v12;
    v15 = (WFMeasure *)v12;
    goto LABEL_38;
  }
  NSLog(CFSTR("%s: options not specified"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");

  v12 = 0;
LABEL_25:
  v15 = 0;
LABEL_38:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: Setting isInternal from %u to %u"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke", v3, objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: Setting isSeedBuild from %u to %u"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_2", v3, objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 13);
  v4 = a2;
  NSLog(CFSTR("%s: Setting _isParis from %u to %u"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_3", v3, objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12);
  v4 = a2;
  NSLog(CFSTR("%s: Setting _isRetest from %u to %u"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_4", v3, objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = v3;
}

uint64_t __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceTestOptions self.options from 0x%lx to 0x%x"), "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_5", objc_msgSend(v3, "options"), objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  return objc_msgSend(*(id *)(a1 + 32), "setOptions:", v3);
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentDomainForName:", CFSTR("com.apple.wifipolicy.wfmeasure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[WFMeasure getLazyNSNumberPreference:exists:]", CFSTR("com.apple.wifipolicy.wfmeasure"), v9);
    v5[2](v5, v8);
  }

}

- (void)getLazyNSStringPreference:(id)a3 exists:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentDomainForName:", CFSTR("com.apple.wifipolicy.wfmeasure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[WFMeasure getLazyNSStringPreference:exists:]", CFSTR("com.apple.wifipolicy.wfmeasure"), v9);
    v5[2](v5, v8);
  }

}

- (BOOL)shouldPeriodicSampleSiriTCP
{
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke;
    v8[3] = &unk_1E881D9A0;
    v8[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("periodic_sampling_siri_numerator"), v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke_2;
    v7[3] = &unk_1E881D9A0;
    v7[4] = &v9;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("periodic_sampling_siri_denominator"), v7);
  }
  v4 = arc4random_uniform(*((_DWORD *)v10 + 6));
  v5 = *((_DWORD *)v14 + 6);
  if (v4 >= v5)
    NSLog(CFSTR("%s: Periodic Test Not Selected for Siri TCP sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldPeriodicSampleSiriTCP]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  else
    NSLog(CFSTR("%s: PERIODIC TEST SELECTED for Siri TCP sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldPeriodicSampleSiriTCP]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4 < v5;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateNumerator samplingNumerator from %u to %u"), "-[WFMeasure shouldPeriodicSampleSiriTCP]_block_invoke", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateDenominator samplingDenominator from %u to %u"), "-[WFMeasure shouldPeriodicSampleSiriTCP]_block_invoke_2", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

- (BOOL)shouldPeriodicSampleSiriTLS
{
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke;
    v8[3] = &unk_1E881D9A0;
    v8[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("periodic_sampling_siri_numerator"), v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke_2;
    v7[3] = &unk_1E881D9A0;
    v7[4] = &v9;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("periodic_sampling_siri_denominator"), v7);
  }
  v4 = arc4random_uniform(*((_DWORD *)v10 + 6));
  v5 = *((_DWORD *)v14 + 6);
  if (v4 >= v5)
    NSLog(CFSTR("%s: Periodic Test Not Selected for Siri TLS sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldPeriodicSampleSiriTLS]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  else
    NSLog(CFSTR("%s: PERIODIC TEST SELECTED for Siri TLS sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldPeriodicSampleSiriTLS]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4 < v5;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateNumerator samplingNumerator from %u to %u"), "-[WFMeasure shouldPeriodicSampleSiriTLS]_block_invoke", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateDenominator samplingDenominator from %u to %u"), "-[WFMeasure shouldPeriodicSampleSiriTLS]_block_invoke_2", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

- (unsigned)getPeriodicSampleTrafficClass
{
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  arc4random_uniform(0);
  NSLog(CFSTR("%s: Perodic Traffic Class for Siri to use BE"), "-[WFMeasure getPeriodicSampleTrafficClass]");
  *((_DWORD *)v7 + 6) = 0;
  if (MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__WFMeasure_getPeriodicSampleTrafficClass__block_invoke;
    v5[3] = &unk_1E881D9A0;
    v5[4] = &v6;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("periodic_siri_tclass"), v5);
  }
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__WFMeasure_getPeriodicSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;

  v3 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriTrafficClass to %u"), "-[WFMeasure getPeriodicSampleTrafficClass]_block_invoke", objc_msgSend(v3, "unsignedIntValue"));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

- (BOOL)shouldTimeoutSampleSiriTCP
{
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke;
    v8[3] = &unk_1E881D9A0;
    v8[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("siri_timeout_sampling_numerator"), v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke_2;
    v7[3] = &unk_1E881D9A0;
    v7[4] = &v9;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("siri_timeout_sampling_denominator"), v7);
  }
  v4 = arc4random_uniform(*((_DWORD *)v10 + 6));
  v5 = *((_DWORD *)v14 + 6);
  if (v4 >= v5)
    NSLog(CFSTR("%s: Timeout Test Not Selected for Siri TCP sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldTimeoutSampleSiriTCP]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  else
    NSLog(CFSTR("%s: Timeout Test Selected for Siri TCP sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldTimeoutSampleSiriTCP]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4 < v5;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateNumerator samplingNumerator from %u to %u"), "-[WFMeasure shouldTimeoutSampleSiriTCP]_block_invoke", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateDenominator samplingDenominator from %u to %u"), "-[WFMeasure shouldTimeoutSampleSiriTCP]_block_invoke_2", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

- (BOOL)shouldTimeoutSampleSiriTLS
{
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke;
    v8[3] = &unk_1E881D9A0;
    v8[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("siri_timeout_sampling_numerator"), v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke_2;
    v7[3] = &unk_1E881D9A0;
    v7[4] = &v9;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("siri_timeout_sampling_denominator"), v7);
  }
  v4 = arc4random_uniform(*((_DWORD *)v10 + 6));
  v5 = *((_DWORD *)v14 + 6);
  if (v4 >= v5)
    NSLog(CFSTR("%s: Timeout Test Not Selected for Siri TLS sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldTimeoutSampleSiriTLS]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  else
    NSLog(CFSTR("%s: Timeout Test Selected for Siri TLS sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldTimeoutSampleSiriTLS]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4 < v5;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateNumerator samplingNumerator from %u to %u"), "-[WFMeasure shouldTimeoutSampleSiriTLS]_block_invoke", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateDenominator samplingDenominator from %u to %u"), "-[WFMeasure shouldTimeoutSampleSiriTLS]_block_invoke_2", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

- (unsigned)getTimeoutSampleTrafficClass
{
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  arc4random_uniform(0);
  NSLog(CFSTR("%s: Timeout Traffic Class Class for Siri to use BE"), "-[WFMeasure getTimeoutSampleTrafficClass]");
  *((_DWORD *)v7 + 6) = 0;
  if (MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__WFMeasure_getTimeoutSampleTrafficClass__block_invoke;
    v5[3] = &unk_1E881D9A0;
    v5[4] = &v6;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("siri_timeout_tclass"), v5);
  }
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__WFMeasure_getTimeoutSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;

  v3 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutTrafficClass to %u"), "-[WFMeasure getTimeoutSampleTrafficClass]_block_invoke", objc_msgSend(v3, "unsignedIntValue"));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

- (BOOL)shouldApsdSampleSiriTCP
{
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke;
    v8[3] = &unk_1E881D9A0;
    v8[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("apsd_sampling_numerator"), v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke_2;
    v7[3] = &unk_1E881D9A0;
    v7[4] = &v9;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("apsd_sampling_denominator"), v7);
  }
  v4 = arc4random_uniform(*((_DWORD *)v10 + 6));
  v5 = *((_DWORD *)v14 + 6);
  if (v4 >= v5)
    NSLog(CFSTR("%s: Apsd Test Not Selected for Siri TCP sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldApsdSampleSiriTCP]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  else
    NSLog(CFSTR("%s: Apsd Test Selected for Siri TCP sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldApsdSampleSiriTCP]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4 < v5;
}

void __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateNumerator samplingNumerator from %u to %u"), "-[WFMeasure shouldApsdSampleSiriTCP]_block_invoke", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateDenominator samplingDenominator from %u to %u"), "-[WFMeasure shouldApsdSampleSiriTCP]_block_invoke_2", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

- (BOOL)shouldApsdSampleSiriTLS
{
  uint64_t v3;
  uint32_t v4;
  uint32_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (MGGetBoolAnswer())
  {
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke;
    v8[3] = &unk_1E881D9A0;
    v8[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("apsd_sampling_numerator"), v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke_2;
    v7[3] = &unk_1E881D9A0;
    v7[4] = &v9;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("apsd_sampling_denominator"), v7);
  }
  v4 = arc4random_uniform(*((_DWORD *)v10 + 6));
  v5 = *((_DWORD *)v14 + 6);
  if (v4 >= v5)
    NSLog(CFSTR("%s: Apsd Test Not Selected for Siri TLS sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldApsdSampleSiriTLS]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  else
    NSLog(CFSTR("%s: Apsd Test Selected for Siri TLS sampling via odds of numerator %u denominator %u"), "-[WFMeasure shouldApsdSampleSiriTLS]", *((unsigned int *)v14 + 6), *((unsigned int *)v10 + 6));
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4 < v5;
}

void __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateNumerator samplingNumerator from %u to %u"), "-[WFMeasure shouldApsdSampleSiriTLS]_block_invoke", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateDenominator samplingDenominator from %u to %u"), "-[WFMeasure shouldApsdSampleSiriTLS]_block_invoke_2", v3, objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = objc_msgSend(v4, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

- (unsigned)getApsdSampleTrafficClass
{
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  arc4random_uniform(0);
  NSLog(CFSTR("%s: Apsd Traffic Class Class for Siri to use BE"), "-[WFMeasure getApsdSampleTrafficClass]");
  *((_DWORD *)v7 + 6) = 0;
  if (MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__WFMeasure_getApsdSampleTrafficClass__block_invoke;
    v5[3] = &unk_1E881D9A0;
    v5[4] = &v6;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", CFSTR("apsd_tclass"), v5);
  }
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__WFMeasure_getApsdSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;

  v3 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdTrafficClass to %u"), "-[WFMeasure getApsdSampleTrafficClass]_block_invoke", objc_msgSend(v3, "unsignedIntValue"));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

- (void)retrieveNetworkConfigurations
{
  const __CFAllocator *v3;
  const __SCDynamicStore *v4;
  const __SCPreferences *v5;
  const __SCPreferences *v6;
  BOOL v7;
  void *v8;
  void *v9;
  const __SCNetworkSet *v10;
  const __SCNetworkSet *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex v14;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkService *v16;
  const __SCNetworkInterface *Interface;
  CFStringRef BSDName;
  const __CFString *v19;
  __CFString *v20;
  CFComparisonResult v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *ServiceID;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *NetworkServiceEntity;
  const __CFString *v32;
  const __CFDictionary *v33;
  const __CFDictionary *v34;
  const void *Value;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CFTypeID v41;
  CFTypeID v42;
  const __CFDictionary *v43;
  const __CFDictionary *v44;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.wifi.wfmeasure"), 0, 0);
  v5 = SCPreferencesCreateWithAuthorization(v3, CFSTR("com.apple.wifi.wfmeasure"), 0, 0);
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    -[WFMeasure gatewayAddress](self, "gatewayAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMeasure dnsServers](self, "dnsServers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: CRITICAL No SCDynamicStoreCreate found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v8, v9);

    if (v4)
      goto LABEL_24;
LABEL_7:
    if (!v6)
      return;
LABEL_8:
    CFRelease(v6);
    return;
  }
  v10 = SCNetworkSetCopyCurrent(v5);
  if (!v10)
  {
    -[WFMeasure gatewayAddress](self, "gatewayAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMeasure dnsServers](self, "dnsServers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: CRITICAL No SCNetworkSetCopyCurrent found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v24, v25);

    goto LABEL_24;
  }
  v11 = v10;
  v12 = SCNetworkSetCopyServices(v10);
  if (v12)
  {
    v13 = v12;
    if (CFArrayGetCount(v12) < 1)
    {
LABEL_18:
      -[WFMeasure gatewayAddress](self, "gatewayAddress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMeasure dnsServers](self, "dnsServers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: CRITICAL No matchingService found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v22, v23);
    }
    else
    {
      v14 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v13, v14);
        if (ValueAtIndex)
        {
          v16 = ValueAtIndex;
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            BSDName = SCNetworkInterfaceGetBSDName(Interface);
            if (BSDName)
            {
              v19 = BSDName;
              -[WFMeasure interfaceName](self, "interfaceName");
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v21 = CFStringCompare(v19, v20, 0);

              if (v21 == kCFCompareEqualTo)
                break;
            }
          }
        }
        if (++v14 >= CFArrayGetCount(v13))
          goto LABEL_18;
      }
      ServiceID = SCNetworkServiceGetServiceID(v16);
      if (ServiceID)
      {
        v29 = ServiceID;
        v30 = (const __CFString *)*MEMORY[0x1E0CE8B30];
        NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, (CFStringRef)*MEMORY[0x1E0CE8B30], ServiceID, (CFStringRef)*MEMORY[0x1E0CE8B70]);
        v32 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v30, v29, (CFStringRef)*MEMORY[0x1E0CE8B78]);
        if (!NetworkServiceEntity)
        {
          -[WFMeasure dnsServers](self, "dnsServers");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%s: WARNING No DNS Servers found dnsKey = nil self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v39);

          goto LABEL_44;
        }
        v33 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, NetworkServiceEntity);
        if (!v33)
        {
          -[WFMeasure dnsServers](self, "dnsServers");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%s: CRITICAL No DNS Servers found dnsValue = nil kSCEntNetDNS dnsKey %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", NetworkServiceEntity, v40);

LABEL_43:
          CFRelease(NetworkServiceEntity);
LABEL_44:
          if (v32)
          {
            v43 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, v32);
            if (v43)
            {
              v44 = v43;
              -[WFMeasure setGatewayAddress:](self, "setGatewayAddress:", CFDictionaryGetValue(v43, (const void *)*MEMORY[0x1E0CE8D10]));
              CFRelease(v44);
            }
            else
            {
              NSLog(CFSTR("%s: WARNING No gatewayAddress found ipv4Value = nil"), "-[WFMeasure retrieveNetworkConfigurations]");
            }
            CFRelease(v32);
          }
          else
          {
            NSLog(CFSTR("%s: WARNING No gatewayAddress found ipv4Key = nil"), "-[WFMeasure retrieveNetworkConfigurations]");
          }
          goto LABEL_20;
        }
        v34 = v33;
        Value = CFDictionaryGetValue(v33, (const void *)*MEMORY[0x1E0CE8C28]);
        -[WFMeasure dnsServers](self, "dnsServers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (Value)
        {

          if (v37)
          {
            -[WFMeasure dnsServers](self, "dnsServers");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "removeAllObjects");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFMeasure setDnsServers:](self, "setDnsServers:", v38);
          }

          v41 = CFGetTypeID(Value);
          if (v41 == CFArrayGetTypeID())
          {
            -[WFMeasure dnsServers](self, "dnsServers");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObjectsFromArray:", Value);
          }
          else
          {
            v42 = CFGetTypeID(Value);
            if (v42 != CFStringGetTypeID())
            {
LABEL_42:
              CFRelease(v34);
              goto LABEL_43;
            }
            -[WFMeasure dnsServers](self, "dnsServers");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", Value);
          }
        }
        else
        {
          NSLog(CFSTR("%s: CRITICAL No DNS Servers found dnsServers = nil kSCEntNetDNS dnsValue is %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v34, v36);
        }

        goto LABEL_42;
      }
      -[WFMeasure gatewayAddress](self, "gatewayAddress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMeasure dnsServers](self, "dnsServers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: CRITICAL No matchingServiceID found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v22, v23);
    }

LABEL_20:
    CFRelease(v13);
    goto LABEL_23;
  }
  -[WFMeasure gatewayAddress](self, "gatewayAddress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasure dnsServers](self, "dnsServers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: CRITICAL No SCNetworkSetCopyServices found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@"), "-[WFMeasure retrieveNetworkConfigurations]", v26, v27);

LABEL_23:
  CFRelease(v11);
  if (!v4)
    goto LABEL_7;
LABEL_24:
  CFRelease(v4);
  if (v6)
    goto LABEL_8;
}

- (void)doThroughputTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  char v17;
  id location;

  if (!objc_opt_class())
  {
    v4 = 0;
    NSLog(CFSTR("%s: NPTPerformanceTestConfiguration is nil"), "-[WFMeasure doThroughputTest]");
LABEL_11:
    NSLog(CFSTR("%s: Download task exited without running"), "-[WFMeasure doThroughputTest]");
    -[WFMeasure dispatchGroup](self, "dispatchGroup");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v11);

    goto LABEL_6;
  }
  if (!objc_opt_class())
  {
    v4 = 0;
    NSLog(CFSTR("%s: NPTPerformanceTest is nil"), "-[WFMeasure doThroughputTest]");
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D51410], "defaultConfigurationWiFi");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    NSLog(CFSTR("%s: _performanceTestWithConfig is nil"), "-[WFMeasure doThroughputTest]");
    goto LABEL_11;
  }
  objc_msgSend(v3, "setDownloadSize:", 10);
  objc_msgSend(v4, "setClientName:", CFSTR("wifid"));
  objc_msgSend(MEMORY[0x1E0D51408], "performanceTestWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasure setPerformanceTest:](self, "setPerformanceTest:", v5);

  -[WFMeasure performanceTest](self, "performanceTest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    NSLog(CFSTR("%s: _performanceTest is nil"), "-[WFMeasure doThroughputTest]");
    goto LABEL_11;
  }
  -[WFMeasure testReason](self, "testReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SlowWiFi"));

  v9 = (void *)MEMORY[0x1D17AC818]();
  objc_initWeak(&location, self);
  NSLog(CFSTR("%s: Download Metadata task starting..."), "-[WFMeasure doThroughputTest]");
  -[WFMeasure performanceTest](self, "performanceTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __29__WFMeasure_doThroughputTest__block_invoke;
  v15 = &unk_1E881DA18;
  objc_copyWeak(&v16, &location);
  v17 = v8;
  objc_msgSend(v10, "startMetadataCollectionWithCompletion:", &v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v9);
  NSLog(CFSTR("%s: Download task will run"), "-[WFMeasure doThroughputTest]", v12, v13, v14, v15);
LABEL_6:

}

void __29__WFMeasure_doThroughputTest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  char v13;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17AC818]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_initWeak(&location, WeakRetained);
  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "networkActivityStart:activate:", 2, 1);

  NSLog(CFSTR("%s: Download task starting..."), "-[WFMeasure doThroughputTest]_block_invoke");
  objc_msgSend(WeakRetained, "performanceTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __29__WFMeasure_doThroughputTest__block_invoke_2;
  v11[3] = &unk_1E881D9F0;
  objc_copyWeak(&v12, &location);
  v13 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v10, "startDownloadWithCompletion:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v7);
}

void __29__WFMeasure_doThroughputTest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17AC818]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = objc_msgSend(v5, "fileSize");
  objc_msgSend(v5, "speed");
  v11 = v10;
  objc_msgSend(WeakRetained, "performanceTest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopMetadataCollection");

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
    v15 = 3;
  else
    v15 = 2;
  objc_msgSend(v13, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 2, v15, 0, 0, v6);

  objc_msgSend(WeakRetained, "dispatchGroup");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v16);

  if (v6)
  {
    NSLog(CFSTR("%s: Download task errored out (%@)"), "-[WFMeasure doThroughputTest]_block_invoke_2", v6);
  }
  else
  {
    NSLog(CFSTR("%s: LQM-WiFi: Download task completed, downloaded %llu bytes in %f seconds, throughput %f Mbps"), "-[WFMeasure doThroughputTest]_block_invoke_2", v9, (double)(unint64_t)(8 * v9) / (v11 * 1000000.0), *(_QWORD *)&v11);
    objc_msgSend(WeakRetained, "performanceTest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "save");

    objc_msgSend(WeakRetained, "performanceTest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getTransformedDataForCoreAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("isSlowWiFi"));

    v22 = v20;
    AnalyticsSendEventLazy();

  }
  objc_msgSend(WeakRetained, "result");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackhaulThroughput:", v11);

  objc_msgSend(WeakRetained, "result");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDownloadError:", v6);

  objc_msgSend(WeakRetained, "result");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackhaulResultsValid:", 1);

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 2, v15, 0, 0, 0);

  objc_autoreleasePoolPop(v7);
}

id __29__WFMeasure_doThroughputTest__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dispatchThroughputTest
{
  NSObject *v3;
  _QWORD block[5];

  -[WFMeasure internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WFMeasure_dispatchThroughputTest__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __35__WFMeasure_dispatchThroughputTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doThroughputTest");
}

- (BOOL)doPing:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 size:(int64_t)a6 class:(int64_t)a7 minRTT:(int64_t *)a8 maxRTT:(int64_t *)a9 successCount:(int64_t *)a10
{
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  BOOL v24;
  double v25;
  double v26;
  uint64_t v27;
  BOOL v28;
  int64_t v30;
  int64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v38;
  _QWORD v39[3];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  if (!v38)
  {
    NSLog(CFSTR("%s: null address"), "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]");
LABEL_29:
    v28 = 0;
    goto LABEL_23;
  }
  if ((unint64_t)(a4 - 0x7FFFFFFF) < 0xFFFFFFFF80000002)
  {
    NSLog(CFSTR("%s: invalid count(%d)"), "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a4);
    goto LABEL_29;
  }
  if ((unint64_t)(a5 - 0x7FFFFFFF) < 0xFFFFFFFF80000002)
  {
    NSLog(CFSTR("%s: invalid timeout(%d)"), "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a5);
    goto LABEL_29;
  }
  if ((unint64_t)(a6 - 0x7FFFFFFF) < 0xFFFFFFFF80000002)
  {
    NSLog(CFSTR("%s: invalid size(%d)"), "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a6);
    goto LABEL_29;
  }
  if ((unint64_t)a7 > 0x7FFFFFFE)
  {
    NSLog(CFSTR("%s: invalid traffic class(%d)"), "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a7);
    goto LABEL_29;
  }
  v31 = a8;
  v13 = 0;
  v34 = *MEMORY[0x1E0C93110];
  v35 = *MEMORY[0x1E0C93118];
  v32 = *MEMORY[0x1E0C93120];
  v33 = *MEMORY[0x1E0C93108];
  v14 = 0xFFFFFFFF80000000;
  v15 = 0x7FFFFFFFLL;
  v30 = a4;
  do
  {
    v39[0] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v16;
    v40[1] = &unk_1E88623A0;
    v39[1] = v34;
    v39[2] = v33;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v32);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v22 = v21;
    v23 = CFNetDiagnosticPingWithOptions();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v24 = v23 == 0;
    v26 = (v25 - v22) * 1000.0;
    v27 = (uint64_t)v26;
    if (!v24)
      ++v13;
    if (v14 <= v27)
      v14 = (uint64_t)v26;
    if (v15 >= v27)
      v15 = (uint64_t)v26;

    --a4;
  }
  while (a4);
  NSLog(CFSTR("%s: LQM-WiFi: ping: address %@, count %d, timeout %d, size %d, class %d, duration %d, success-count %d"), "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", v38, v30, a5, a6, a7, v27, v13);
  if (a9)
    *a9 = v14;
  if (v31)
    *v31 = v15;
  if (a10)
    *a10 = v13;
  v28 = 1;
LABEL_23:

  return v28;
}

- (void)dispatchPingTest:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  WFMeasure *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E8863F80);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E8863F98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 8)
  {
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    objc_msgSend(v12, "networkActivityStart:activate:", 6, 1);

    -[WFMeasure publicDNSAddress](self, "publicDNSAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 5;
  }
  else
  {
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 4)
    {
      v8 = 5;
      objc_msgSend(v7, "networkActivityStart:activate:", 5, 1);

      -[WFMeasure dnsServers](self, "dnsServers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 3;
    }
    else
    {
      v11 = 1;
      objc_msgSend(v7, "networkActivityStart:activate:", 4, 1);

      -[WFMeasure gatewayAddress](self, "gatewayAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", &unk_1E8863FB0);
      v8 = 1;
    }
    objc_msgSend(v6, "addObjectsFromArray:", &unk_1E8863FC8);
  }
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__WFMeasure_dispatchPingTest___block_invoke;
  block[3] = &unk_1E881DA90;
  v18 = v6;
  v19 = v5;
  v20 = self;
  v21 = v10;
  v22 = v11;
  v23 = v8;
  v24 = a3;
  v14 = v10;
  v15 = v5;
  v16 = v6;
  dispatch_async(v13, block);

}

void __30__WFMeasure_dispatchPingTest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _BYTE *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  int64_t v61;
  _QWORD block[4];
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int64_t v68;
  uint64_t v69;
  uint8_t buf;
  _BYTE v71[7];
  _QWORD v72[6];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v89 = 0;
  v88 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    v53 = *(_QWORD *)v81;
    v54 = v2;
    v60 = 0x7FFFFFFFLL;
    v61 = 0xFFFFFFFF80000000;
    while (1)
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v81 != v53)
          objc_enumerationMutation(obj);
        v59 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v56 = *(id *)(a1 + 40);
        v5 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        if (!v5)
          goto LABEL_83;
        v58 = *(_QWORD *)v77;
        while (2)
        {
          v6 = 0;
          v57 = v5;
          do
          {
            if (*(_QWORD *)v77 != v58)
              objc_enumerationMutation(v56);
            v7 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v6);
            v8 = *(void **)(a1 + 48);
            v9 = *(_QWORD *)(a1 + 56);
            v10 = *(_QWORD *)(a1 + 64);
            v11 = *(_QWORD *)(a1 + 72);
            v12 = objc_msgSend(v59, "integerValue");
            v13 = objc_msgSend(v7, "integerValue");
            v14 = objc_msgSend(v8, "doPing:count:timeout:size:class:minRTT:maxRTT:successCount:", v9, v10, v11, v12, v13, &v89, &v88, v85 + 3);
            if (MGGetBoolAnswer() && *(_QWORD *)(a1 + 80) == 4)
            {
              v15 = *(void **)(a1 + 48);
              v75[0] = MEMORY[0x1E0C809B0];
              v75[1] = 3221225472;
              v75[2] = __30__WFMeasure_dispatchPingTest___block_invoke_2;
              v75[3] = &unk_1E881D9A0;
              v75[4] = &v84;
              objc_msgSend(v15, "getLazyNSNumberPreference:exists:", CFSTR("local_dns_result"), v75);
            }
            if (MGGetBoolAnswer() && *(_QWORD *)(a1 + 80) == 8)
            {
              v16 = *(void **)(a1 + 48);
              v74[0] = MEMORY[0x1E0C809B0];
              v74[1] = 3221225472;
              v74[2] = __30__WFMeasure_dispatchPingTest___block_invoke_3;
              v74[3] = &unk_1E881D9A0;
              v74[4] = &v84;
              objc_msgSend(v16, "getLazyNSNumberPreference:exists:", CFSTR("public_dns_result"), v74);
            }
            if (MGGetBoolAnswer() && *(_QWORD *)(a1 + 80) == 2)
            {
              v17 = *(void **)(a1 + 48);
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = __30__WFMeasure_dispatchPingTest___block_invoke_4;
              v73[3] = &unk_1E881D9A0;
              v73[4] = &v84;
              objc_msgSend(v17, "getLazyNSNumberPreference:exists:", CFSTR("gateway_result"), v73);
            }
            if (MGGetBoolAnswer())
            {
              v18 = *(_QWORD *)(a1 + 80);
              if (v18 <= 8 && ((1 << v18) & 0x114) != 0)
              {
                v19 = *(void **)(a1 + 48);
                v72[0] = MEMORY[0x1E0C809B0];
                v72[1] = 3221225472;
                v72[2] = __30__WFMeasure_dispatchPingTest___block_invoke_5;
                v72[3] = &unk_1E881DA40;
                v72[4] = v7;
                v72[5] = &v84;
                objc_msgSend(v19, "getLazyNSNumberPreference:exists:", CFSTR("fail_pings_ac"), v72);
              }
            }
            v20 = v85[3];
            if (v60 >= v89)
              v21 = v89;
            else
              v21 = v60;
            v22 = v61;
            if (v61 <= v88)
              v22 = v88;
            v60 = v21;
            v61 = v22;
            if ((_DWORD)v14)
            {
              v23 = objc_msgSend(v7, "integerValue");
              if (v23 > 699)
              {
                if (v23 == 700)
                {
                  v33 = objc_msgSend(v59, "integerValue");
                  v34 = *(void **)(a1 + 48);
                  if (v33 == 300)
                  {
                    objc_msgSend(v34, "result");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setTrafficClassVIAttemptedSmall:", *(_QWORD *)(a1 + 64) + objc_msgSend(v35, "trafficClassVIAttemptedSmall"));
                  }
                  else
                  {
                    objc_msgSend(v34, "result");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setTrafficClassVIAttemptedLarge:", *(_QWORD *)(a1 + 64) + objc_msgSend(v35, "trafficClassVIAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    v43 = objc_msgSend(v59, "integerValue");
                    v44 = *(void **)(a1 + 48);
                    if (v43 == 300)
                    {
                      objc_msgSend(v44, "result");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setTrafficClassVISucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassVISucceededSmall"));
                    }
                    else
                    {
                      objc_msgSend(v44, "result");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setTrafficClassVISucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassVISucceededLarge"));
                    }
                    goto LABEL_63;
                  }
                }
                else if (v23 == 800)
                {
                  v27 = objc_msgSend(v59, "integerValue");
                  v28 = *(void **)(a1 + 48);
                  if (v27 == 300)
                  {
                    objc_msgSend(v28, "result");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setTrafficClassVOAttemptedSmall:", *(_QWORD *)(a1 + 64) + objc_msgSend(v29, "trafficClassVOAttemptedSmall"));
                  }
                  else
                  {
                    objc_msgSend(v28, "result");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setTrafficClassVOAttemptedLarge:", *(_QWORD *)(a1 + 64) + objc_msgSend(v29, "trafficClassVOAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    v39 = objc_msgSend(v59, "integerValue");
                    v40 = *(void **)(a1 + 48);
                    if (v39 == 300)
                    {
                      objc_msgSend(v40, "result");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setTrafficClassVOSucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassVOSucceededSmall"));
                    }
                    else
                    {
                      objc_msgSend(v40, "result");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setTrafficClassVOSucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassVOSucceededLarge"));
                    }
                    goto LABEL_63;
                  }
                }
              }
              else if (v23)
              {
                if (v23 == 200)
                {
                  v24 = objc_msgSend(v59, "integerValue");
                  v25 = *(void **)(a1 + 48);
                  if (v24 == 300)
                  {
                    objc_msgSend(v25, "result");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setTrafficClassBKAttemptedSmall:", *(_QWORD *)(a1 + 64) + objc_msgSend(v26, "trafficClassBKAttemptedSmall"));
                  }
                  else
                  {
                    objc_msgSend(v25, "result");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "setTrafficClassBKAttemptedLarge:", *(_QWORD *)(a1 + 64) + objc_msgSend(v26, "trafficClassBKAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    v36 = objc_msgSend(v59, "integerValue");
                    v37 = *(void **)(a1 + 48);
                    if (v36 == 300)
                    {
                      objc_msgSend(v37, "result");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setTrafficClassBKSucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassBKSucceededSmall"));
                    }
                    else
                    {
                      objc_msgSend(v37, "result");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setTrafficClassBKSucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassBKSucceededLarge"));
                    }
LABEL_63:

                  }
                }
              }
              else
              {
                v30 = objc_msgSend(v59, "integerValue");
                v31 = *(void **)(a1 + 48);
                if (v30 == 300)
                {
                  objc_msgSend(v31, "result");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setTrafficClassBEAttemptedSmall:", *(_QWORD *)(a1 + 64) + objc_msgSend(v32, "trafficClassBEAttemptedSmall"));
                }
                else
                {
                  objc_msgSend(v31, "result");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setTrafficClassBEAttemptedLarge:", *(_QWORD *)(a1 + 64) + objc_msgSend(v32, "trafficClassBEAttemptedLarge"));
                }

                if (v85[3] >= 1)
                {
                  v41 = objc_msgSend(v59, "integerValue");
                  v42 = *(void **)(a1 + 48);
                  if (v41 == 300)
                  {
                    objc_msgSend(v42, "result");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "setTrafficClassBESucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassBESucceededSmall"));
                  }
                  else
                  {
                    objc_msgSend(v42, "result");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "setTrafficClassBESucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassBESucceededLarge"));
                  }
                  goto LABEL_63;
                }
              }
            }
            v45 = *(_BYTE **)(a1 + 48);
            if (v45[13] && !v85[3])
            {
              objc_msgSend(v45, "result");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setSeenSpecificAcFailure:", 1);

            }
            v47 = *(_QWORD *)(a1 + 80);
            switch(v47)
            {
              case 2:
                objc_msgSend(*(id *)(a1 + 48), "result");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setGatewayResultsValid:", v14);
                goto LABEL_73;
              case 8:
                objc_msgSend(*(id *)(a1 + 48), "result");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setPublicResultsValid:", v14);
                goto LABEL_73;
              case 4:
                objc_msgSend(*(id *)(a1 + 48), "result");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setLocalResultsValid:", v14);
LABEL_73:

                goto LABEL_75;
            }
            NSLog(CFSTR("%s: not a recognizable ping option. Ignoring results"), "-[WFMeasure dispatchPingTest:]_block_invoke");
LABEL_75:
            v3 += v10;
            v4 += v20;
            if ((v14 & 1) == 0)
            {
              if (!*(_QWORD *)(a1 + 56))
              {
                if (MGGetBoolAnswer())
                {
                  NSLog(CFSTR("%s: Pinging LocalDNS PublicDNS or Gateway failed due to no pingAddress"), "-[WFMeasure dispatchPingTest:]_block_invoke");
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                    __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(&buf, v71);
                }
              }
              goto LABEL_83;
            }
            ++v6;
          }
          while (v57 != v6);
          v5 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
          if (v5)
            continue;
          break;
        }
LABEL_83:

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      if (!v54)
        goto LABEL_87;
    }
  }
  v3 = 0;
  v4 = 0;
  v60 = 0x7FFFFFFFLL;
  v61 = 0xFFFFFFFF80000000;
LABEL_87:

  objc_msgSend(*(id *)(a1 + 48), "internalQueue");
  v49 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__WFMeasure_dispatchPingTest___block_invoke_267;
  block[3] = &unk_1E881DA68;
  v65 = v3;
  v66 = v4;
  v50 = *(id *)(a1 + 56);
  v67 = v60;
  v68 = v61;
  v69 = *(_QWORD *)(a1 + 80);
  v51 = *(_QWORD *)(a1 + 48);
  v63 = v50;
  v64 = v51;
  dispatch_sync(v49, block);

  _Block_object_dispose(&v84, 8);
}

void __30__WFMeasure_dispatchPingTest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceLocalDNSResult result from %ld to %ld"), "-[WFMeasure dispatchPingTest:]_block_invoke_2", v3, objc_msgSend(v4, "integerValue"));
  LODWORD(v3) = objc_msgSend(v4, "BOOLValue");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePublicDNSResult result from %ld to %ld"), "-[WFMeasure dispatchPingTest:]_block_invoke_3", v3, objc_msgSend(v4, "integerValue"));
  LODWORD(v3) = objc_msgSend(v4, "BOOLValue");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceGatewayResult result from %ld to %ld"), "-[WFMeasure dispatchPingTest:]_block_invoke_4", v3, objc_msgSend(v4, "integerValue"));
  LODWORD(v3) = objc_msgSend(v4, "BOOLValue");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  if (v3 == objc_msgSend(v4, "integerValue"))
  {
    NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceFailPingsOnACResult to fail for this AC %ld from %ld to %ld"), "-[WFMeasure dispatchPingTest:]_block_invoke_5", objc_msgSend(v4, "integerValue"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), objc_msgSend(v4, "integerValue"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __30__WFMeasure_dispatchPingTest___block_invoke_267(uint64_t a1)
{
  double v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;

  v2 = (double)(uint64_t)(*(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 56)) / (double)*(uint64_t *)(a1 + 48) * 100.0;
  NSLog(CFSTR("%s: LQM-WiFi: Ping test completed for %@, minRTT=%d maxRTT=%d PER=%f"), "-[WFMeasure dispatchPingTest:]_block_invoke", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)&v2);
  if (*(uint64_t *)(a1 + 56) > 0)
    v3 = 2;
  else
    v3 = 3;
  v4 = *(_QWORD *)(a1 + 80);
  switch(v4)
  {
    case 2:
      v15 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 40), "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGatewayMinRTT:", v15);

      v17 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "result");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setGatewayMaxRTT:", v17);

      objc_msgSend(*(id *)(a1 + 40), "result");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setGatewayPacketLoss:", (uint64_t)v2);

      objc_msgSend(*(id *)(a1 + 40), "result");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v20, "gatewayResultsValid");

      if ((_DWORD)v19)
        v11 = v3;
      else
        v11 = 3;
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 4;
      break;
    case 8:
      v21 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 40), "result");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPublicDNSMinRTT:", v21);

      v23 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "result");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPublicDNSMaxRTT:", v23);

      objc_msgSend(*(id *)(a1 + 40), "result");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPublicDNSPacketLoss:", (uint64_t)v2);

      objc_msgSend(*(id *)(a1 + 40), "result");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = objc_msgSend(v26, "publicResultsValid");

      if ((_DWORD)v25)
        v11 = v3;
      else
        v11 = 3;
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 6;
      break;
    case 4:
      v5 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 40), "result");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLocalDNSMinRTT:", v5);

      v7 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocalDNSMaxRTT:", v7);

      objc_msgSend(*(id *)(a1 + 40), "result");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocalDNSPacketLoss:", (uint64_t)v2);

      objc_msgSend(*(id *)(a1 + 40), "result");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v10, "gatewayResultsValid");

      if ((_DWORD)v9)
        v11 = v3;
      else
        v11 = 3;
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 5;
      break;
    default:
      NSLog(CFSTR("%s: not a recognizable ping option. Ignoring results"), "-[WFMeasure dispatchPingTest:]_block_invoke");
      goto LABEL_21;
  }
  objc_msgSend(v12, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", v14, v11, 0, 0, 0);

LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "dispatchGroup");
  v27 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v27);

}

- (BOOL)doDNSResolution:(id)a3 timeout:(int64_t)a4
{
  __CFString *v4;
  __CFHost *v5;
  int started;
  dispatch_time_t v7;
  NSObject *v8;
  const __CFArray *Addressing;
  BOOL v10;
  const void *v11;
  _QWORD block[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  CFHostRef v17;
  CFStreamError error;

  v4 = (__CFString *)a3;
  error.domain = 0;
  *(_QWORD *)&error.error = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v17 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
  v5 = (__CFHost *)v15[3];
  if (v5)
  {
    started = CFHostStartInfoResolution(v5, kCFHostAddresses, &error);
    CFRetain((CFTypeRef)v15[3]);
    v7 = dispatch_time(0, 5000000);
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__WFMeasure_doDNSResolution_timeout___block_invoke;
    block[3] = &unk_1E881D958;
    block[4] = &v14;
    dispatch_after(v7, v8, block);

    if (started)
    {
      Addressing = CFHostGetAddressing((CFHostRef)v15[3], 0);
      if (Addressing)
      {
        v10 = CFArrayGetCount(Addressing) != 0;
        goto LABEL_8;
      }
    }
    else
    {
      NSLog(CFSTR("%s: CFHostStartInfoResolution returned error %d"), "-[WFMeasure doDNSResolution:timeout:]", error.error);
    }
  }
  else
  {
    NSLog(CFSTR("%s: hostRef is NULL"), "-[WFMeasure doDNSResolution:timeout:]");
  }
  v10 = 0;
LABEL_8:
  v11 = (const void *)v15[3];
  if (v11)
    CFRelease(v11);
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __37__WFMeasure_doDNSResolution_timeout___block_invoke(uint64_t a1)
{
  CFHostCancelInfoResolution(*(CFHostRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), kCFHostAddresses);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)dispatchDNSTest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "networkActivityStart:activate:", 7, 1);

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__WFMeasure_dispatchDNSTest___block_invoke;
  v8[3] = &unk_1E881C8C0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __29__WFMeasure_dispatchDNSTest___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "doDNSResolution:timeout:", *(_QWORD *)(a1 + 40), 5);
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WFMeasure_dispatchDNSTest___block_invoke_2;
  block[3] = &unk_1E881CF48;
  v7 = v2;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_sync(v3, block);

}

void __29__WFMeasure_dispatchDNSTest___block_invoke_2(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = *(_BYTE *)(a1 + 48);
  if (MGGetBoolAnswer())
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __29__WFMeasure_dispatchDNSTest___block_invoke_3;
    v11[3] = &unk_1E881DA40;
    v2 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = &v14;
    objc_msgSend(v2, "getLazyNSNumberPreference:exists:", CFSTR("resolve_apple_result"), v11);

  }
  if (*((_BYTE *)v15 + 24))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  NSLog(CFSTR("%s: LQM-WiFi: DNS test to resolve %@ completed, success=%@"), "-[WFMeasure dispatchDNSTest:]_block_invoke_2", *(_QWORD *)(a1 + 40), v3);
  v4 = *((unsigned __int8 *)v15 + 24);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDnsSuccess:", v4 != 0);

  objc_msgSend(*(id *)(a1 + 32), "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDnsResultsValid:", 1);

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*((_BYTE *)v15 + 24))
    v9 = 2;
  else
    v9 = 3;
  objc_msgSend(v7, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 7, v9, 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v10);

  _Block_object_dispose(&v14, 8);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceResolveAppleResult %@ result from %u to %u"), "-[WFMeasure dispatchDNSTest:]_block_invoke_3", v3, v4, objc_msgSend(v5, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (void)dispatchSiriTest:(int64_t)a3 trafficClass:(unsigned int)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[6];
  unsigned int v12;

  if (a3 == 2)
  {
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 10;
  }
  else if (a3 == 1)
  {
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 9;
  }
  else
  {
    if (a3)
      -[WFMeasure dispatchSiriTest:trafficClass:].cold.1();
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 8;
  }
  objc_msgSend(v7, "networkActivityStart:activate:", v9, 1);

  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke;
  block[3] = &unk_1E881DB08;
  v12 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v10, block);

}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke(uint64_t a1)
{
  SiriNWConnection *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SiriNWConnection *v6;
  _QWORD v7[6];
  int v8;

  v2 = [SiriNWConnection alloc];
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "testReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_2;
  v7[3] = &unk_1E881DAE0;
  v8 = *(_DWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = v5;
  v6 = -[SiriNWConnection initWithQueueAndCompletion:reason:callback:](v2, "initWithQueueAndCompletion:reason:callback:", v3, v4, v7);

  NSLog(CFSTR("SiriNWConnection Starting"));
  -[SiriNWConnection runSiriProbeWithDepth:trafficClass:](v6, "runSiriProbeWithDepth:trafficClass:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));

}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t *v9;
  void (*v10)(uint64_t, void *);
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[6];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  v5 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = a2;
  if (MGGetBoolAnswer())
  {
    v6 = *(_BYTE **)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    if (v6[10])
    {
      if (v6[12])
      {
        v42 = MEMORY[0x1E0C809B0];
        v8 = CFSTR("siri_timeout_retest_result");
        v9 = &v42;
        v10 = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_3;
      }
      else
      {
        v41 = MEMORY[0x1E0C809B0];
        v8 = CFSTR("siri_timeout_result");
        v9 = &v41;
        v10 = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_4;
      }
      v9[1] = 3221225472;
      v9[2] = (uint64_t)v10;
      v9[3] = (uint64_t)&unk_1E881DAB8;
      *((_BYTE *)v9 + 40) = a2;
      v9[4] = (uint64_t)&v43;
      objc_msgSend(v6, "getLazyNSNumberPreference:exists:", v8);
    }
    v11 = *(_BYTE **)(a1 + 32);
    if (v11[9])
    {
      if (v11[12])
      {
        v40[0] = v7;
        v40[1] = 3221225472;
        v40[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_5;
        v40[3] = &unk_1E881DA40;
        v40[4] = v11;
        v40[5] = &v43;
        objc_msgSend(v11, "getLazyNSNumberPreference:exists:", CFSTR("periodic_siri_retest_result"), v40);
      }
      else
      {
        v39[0] = v7;
        v39[1] = 3221225472;
        v39[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_6;
        v39[3] = &unk_1E881DA40;
        v39[4] = v11;
        v39[5] = &v43;
        objc_msgSend(v11, "getLazyNSNumberPreference:exists:", CFSTR("periodic_siri_result"), v39);
      }
    }
    v12 = *(_BYTE **)(a1 + 32);
    if (v12[11])
    {
      if (v12[12])
      {
        v38[0] = v7;
        v38[1] = 3221225472;
        v38[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_7;
        v38[3] = &unk_1E881DA40;
        v38[4] = v12;
        v38[5] = &v43;
        objc_msgSend(v12, "getLazyNSNumberPreference:exists:", CFSTR("apsd_retest_result"), v38);
      }
      else
      {
        v37[0] = v7;
        v37[1] = 3221225472;
        v37[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_8;
        v37[3] = &unk_1E881DA40;
        v37[4] = v12;
        v37[5] = &v43;
        objc_msgSend(v12, "getLazyNSNumberPreference:exists:", CFSTR("apsd_result"), v37);
      }
    }
  }
  if (!*((_BYTE *)v44 + 24))
  {
    NSLog(CFSTR("SiriNWConnection has failed with error %@"), v5);
    goto LABEL_28;
  }
  NSLog(CFSTR("SiriNWConnection has succeeded"));
  v13 = *(_DWORD *)(a1 + 48);
  if (v13 <= 599)
  {
    if (v13)
    {
      if (v13 != 200)
        goto LABEL_28;
      objc_msgSend(*(id *)(a1 + 32), "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTrafficClassBKAttemptedLarge:", objc_msgSend(v16, "trafficClassBKAttemptedLarge") + 1);

      objc_msgSend(*(id *)(a1 + 32), "result");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTrafficClassBKSucceededLarge:", objc_msgSend(v15, "trafficClassBKSucceededLarge") + 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "result");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTrafficClassBEAttemptedLarge:", objc_msgSend(v18, "trafficClassBEAttemptedLarge") + 1);

      objc_msgSend(*(id *)(a1 + 32), "result");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTrafficClassBESucceededLarge:", objc_msgSend(v15, "trafficClassBESucceededLarge") + 1);
    }
  }
  else if (v13 == 600 || v13 == 700)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTrafficClassVIAttemptedLarge:", objc_msgSend(v17, "trafficClassVIAttemptedLarge") + 1);

    objc_msgSend(*(id *)(a1 + 32), "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrafficClassVISucceededLarge:", objc_msgSend(v15, "trafficClassVISucceededLarge") + 1);
  }
  else
  {
    if (v13 != 800)
      goto LABEL_28;
    objc_msgSend(*(id *)(a1 + 32), "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTrafficClassVOAttemptedLarge:", objc_msgSend(v14, "trafficClassVOAttemptedLarge") + 1);

    objc_msgSend(*(id *)(a1 + 32), "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrafficClassVOSucceededLarge:", objc_msgSend(v15, "trafficClassVOSucceededLarge") + 1);
  }

LABEL_28:
  v19 = *(unsigned int *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSiriTrafficClass:", v19);

  v21 = *(_QWORD *)(a1 + 40);
  if (v21 == 2)
  {
    v32 = *((unsigned __int8 *)v44 + 24);
    objc_msgSend(*(id *)(a1 + 32), "result");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSiriACESuccess:", v32 != 0);

    objc_msgSend(*(id *)(a1 + 32), "result");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSiriACEResultsValid:", 1);

    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "siriACESuccess"))
      v35 = 2;
    else
      v35 = 3;
    objc_msgSend(v25, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 10, v35, 0, 0, 0);
  }
  else if (v21 == 1)
  {
    v28 = *((unsigned __int8 *)v44 + 24);
    objc_msgSend(*(id *)(a1 + 32), "result");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSiriTLSSuccess:", v28 != 0);

    objc_msgSend(*(id *)(a1 + 32), "result");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSiriTLSResultsValid:", 1);

    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "siriTLSSuccess"))
      v31 = 2;
    else
      v31 = 3;
    objc_msgSend(v25, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 9, v31, 0, 0, 0);
  }
  else
  {
    if (v21)
    {
      NSLog(CFSTR("dispatchSiriTest got results for invalid probeDepth"));
      __assert_rtn("-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_2", "WFMeasure.m", 1406, "false");
    }
    v22 = *((unsigned __int8 *)v44 + 24);
    objc_msgSend(*(id *)(a1 + 32), "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSiriTCPSuccess:", v22 != 0);

    objc_msgSend(*(id *)(a1 + 32), "result");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSiriTCPResultsValid:", 1);

    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "siriTCPSuccess"))
      v27 = 2;
    else
      v27 = 3;
    objc_msgSend(v25, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 8, v27, 0, 0, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v36 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v36);

  _Block_object_dispose(&v43, 8);
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutRetestResult success from %u to %u"), "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_3", v3, objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutTestResult success from %u to %u"), "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_4", v3, objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriRetestResult success from %u to %u"), "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_5", objc_msgSend(v3, "tclass"), objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferencePeriodicSiriTestResult success from %u to %u"), "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_6", objc_msgSend(v3, "tclass"), objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdRetestResult success from %u to %u"), "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_7", objc_msgSend(v3, "tclass"), objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSLog(CFSTR("%s: OVERRIDING kWFMeasurePreferenceApsdTestResult success from %u to %u"), "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_8", objc_msgSend(v3, "tclass"), objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

- (BOOL)start:(id)a3 withCompletionQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  dispatch_queue_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (-[WFMeasure isInProgress](self, "isInProgress"))
  {
    NSLog(CFSTR("%s: measurement already started"), "-[WFMeasure start:withCompletionQueue:]");
  }
  else
  {
    -[WFMeasure setCompletionHandler:](self, "setCompletionHandler:", v6);
    -[WFMeasure setCompletionQueue:](self, "setCompletionQueue:", v7);
    -[WFMeasure internalQueue](self, "internalQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = dispatch_queue_create("com.apple.wifi.wfmeasure", 0);
      -[WFMeasure setInternalQueue:](self, "setInternalQueue:", v9);

    }
    if ((-[WFMeasure options](self, "options") & 1) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v10);

      -[WFMeasure dispatchThroughputTest](self, "dispatchThroughputTest");
    }
    if ((-[WFMeasure options](self, "options") & 2) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v11);

      -[WFMeasure dispatchPingTest:](self, "dispatchPingTest:", 2);
    }
    if ((-[WFMeasure options](self, "options") & 4) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);

      -[WFMeasure dispatchPingTest:](self, "dispatchPingTest:", 4);
    }
    if ((-[WFMeasure options](self, "options") & 8) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v13 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v13);

      -[WFMeasure dispatchPingTest:](self, "dispatchPingTest:", 8);
    }
    if ((-[WFMeasure options](self, "options") & 0x10) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v14);

      -[WFMeasure testDNSHostname](self, "testDNSHostname");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMeasure dispatchDNSTest:](self, "dispatchDNSTest:", v15);

    }
    if ((-[WFMeasure options](self, "options") & 0x20) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v16 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v16);

      -[WFMeasure dispatchSiriTest:trafficClass:](self, "dispatchSiriTest:trafficClass:", 0, -[WFMeasure tclass](self, "tclass"));
    }
    if ((-[WFMeasure options](self, "options") & 0x40) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v17);

      -[WFMeasure dispatchSiriTest:trafficClass:](self, "dispatchSiriTest:trafficClass:", 1, -[WFMeasure tclass](self, "tclass"));
    }
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke;
    block[3] = &unk_1E881C8E8;
    block[4] = self;
    dispatch_async(v18, block);

    -[WFMeasure setIsInProgress:](self, "setIsInProgress:", 1);
  }
  v19 = -[WFMeasure isInProgress](self, "isInProgress");

  return v19;
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_time(0, 120000000000);
  v4 = dispatch_group_wait(v2, v3);

  if (v4)
    NSLog(CFSTR("%s: tests timed out"), "-[WFMeasure start:withCompletionQueue:]_block_invoke");
  else
    NSLog(CFSTR("%s: all tests completed"), "-[WFMeasure start:withCompletionQueue:]_block_invoke");
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke_2;
  block[3] = &unk_1E881C8E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v5, block);

}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setIsInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke_3;
      block[3] = &unk_1E881C8E8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v5, block);

    }
  }
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _BYTE *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  _BOOL4 v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(id, void *);

  v5 = *(_BYTE **)(a1 + 32);
  if (!v5[13])
  {
    objc_msgSend(v5, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSeenSpecificAcFailure:", 0);

    objc_msgSend(*(id *)(a1 + 32), "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "trafficClassBEAttemptedSmall");
    if (v9 <= 0
      && (objc_msgSend(*(id *)(a1 + 32), "result"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "trafficClassBEAttemptedLarge") < 1))
    {
      v12 = 0;
      v10 = 0;
      v11 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "result");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "trafficClassBESucceededSmall"))
      {
        v10 = 0;
        v11 = 0;
        v12 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "result");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "trafficClassBESucceededLarge") == 0;
        v12 = 1;
        v10 = 1;
      }
    }
    objc_msgSend(v7, "setSeenSpecificAcFailure:", v11 | objc_msgSend(v7, "seenSpecificAcFailure"));
    if (v10)

    if (v12)
    if (v9 <= 0)

    objc_msgSend(*(id *)(a1 + 32), "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "trafficClassBKAttemptedSmall");
    if (v15 <= 0
      && (objc_msgSend(*(id *)(a1 + 32), "result"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "trafficClassBKAttemptedLarge") < 1))
    {
      v18 = 0;
      v16 = 0;
      v17 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "result");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "trafficClassBKSucceededSmall"))
      {
        v16 = 0;
        v17 = 0;
        v18 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "result");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v3, "trafficClassBKSucceededLarge") == 0;
        v18 = 1;
        v16 = 1;
      }
    }
    objc_msgSend(v13, "setSeenSpecificAcFailure:", v17 | objc_msgSend(v13, "seenSpecificAcFailure"));
    if (v16)

    if (v18)
    if (v15 <= 0)

    objc_msgSend(*(id *)(a1 + 32), "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "trafficClassVOAttemptedSmall");
    if (v21 <= 0
      && (objc_msgSend(*(id *)(a1 + 32), "result"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "trafficClassVOAttemptedLarge") < 1))
    {
      v24 = 0;
      v22 = 0;
      v23 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "result");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "trafficClassVOSucceededSmall"))
      {
        v22 = 0;
        v23 = 0;
        v24 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "result");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v3, "trafficClassVOSucceededLarge") == 0;
        v24 = 1;
        v22 = 1;
      }
    }
    objc_msgSend(v19, "setSeenSpecificAcFailure:", v23 | objc_msgSend(v19, "seenSpecificAcFailure"));
    if (v22)

    if (v24)
    if (v21 <= 0)

    objc_msgSend(*(id *)(a1 + 32), "result");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "trafficClassVIAttemptedSmall");
    if (v27 <= 0
      && (objc_msgSend(*(id *)(a1 + 32), "result"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "trafficClassVIAttemptedLarge") < 1))
    {
      v30 = 0;
      v28 = 0;
      v29 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "result");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "trafficClassVISucceededSmall"))
      {
        v28 = 0;
        v29 = 0;
        v30 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "result");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v3, "trafficClassVISucceededLarge") == 0;
        v30 = 1;
        v28 = 1;
      }
    }
    objc_msgSend(v25, "setSeenSpecificAcFailure:", v29 | objc_msgSend(v25, "seenSpecificAcFailure"));
    if (v28)

    if (v30)
    if (v27 <= 0)

    objc_msgSend(*(id *)(a1 + 32), "result");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "numAcFailed");

    objc_msgSend(*(id *)(a1 + 32), "result");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "seenSpecificAcFailure");
    if (v32)
    {
      if ((v34 & 1) == 0)
        __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_2();
    }
    else if (v34)
    {
      __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_1();
    }

  }
  +[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *(_QWORD **)(a1 + 32);
  v38 = v37[13];
  objc_msgSend(v37, "interfaceName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "linkTestEvent:withReason:forInterface:", v36, v38, v39);

  objc_msgSend(*(id *)(a1 + 32), "dnsServers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDnsServers:", v40);

  objc_msgSend(*(id *)(a1 + 32), "gatewayAddress");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setGatewayAddress:", v42);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v46 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copy");
  v46[2](v46, v45);

}

- (id)description
{
  void *v3;
  const __CFString *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[WFMeasure isInProgress](self, "isInProgress"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = -[WFMeasure options](self, "options");
  -[WFMeasure interfaceName](self, "interfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasure gatewayAddress](self, "gatewayAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasure dnsServers](self, "dnsServers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("isInProgress=%@ options=0x%lx interfaceName=%@ gateway=%@ dnsServers=%@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)abort
{
  void *v3;
  void *v4;

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkActivityTracingCompleteConnectionsActivities");

  -[WFMeasure performanceTest](self, "performanceTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllNetworking");

  -[WFMeasure setIsInProgress:](self, "setIsInProgress:", 0);
}

- (BOOL)isInProgress
{
  return self->_isInProgress;
}

- (void)setIsInProgress:(BOOL)a3
{
  self->_isInProgress = a3;
}

- (NSString)gatewayAddress
{
  return self->_gatewayAddress;
}

- (void)setGatewayAddress:(id)a3
{
  objc_storeStrong((id *)&self->_gatewayAddress, a3);
}

- (NSMutableSet)dnsServers
{
  return self->_dnsServers;
}

- (void)setDnsServers:(id)a3
{
  objc_storeStrong((id *)&self->_dnsServers, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchGroup, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (NSString)publicDNSAddress
{
  return self->_publicDNSAddress;
}

- (void)setPublicDNSAddress:(id)a3
{
  objc_storeStrong((id *)&self->_publicDNSAddress, a3);
}

- (NSString)testDNSHostname
{
  return self->_testDNSHostname;
}

- (void)setTestDNSHostname:(id)a3
{
  objc_storeStrong((id *)&self->_testDNSHostname, a3);
}

- (NSString)testReason
{
  return self->_testReason;
}

- (void)setTestReason:(id)a3
{
  objc_storeStrong((id *)&self->_testReason, a3);
}

- (BOOL)isPeriodicTest
{
  return self->_isPeriodicTest;
}

- (void)setIsPeriodicTest:(BOOL)a3
{
  self->_isPeriodicTest = a3;
}

- (BOOL)isSiriTimeout
{
  return self->_isSiriTimeout;
}

- (void)setIsSiriTimeout:(BOOL)a3
{
  self->_isSiriTimeout = a3;
}

- (BOOL)isApsdTimeout
{
  return self->_isApsdTimeout;
}

- (void)setIsApsdTimeout:(BOOL)a3
{
  self->_isApsdTimeout = a3;
}

- (BOOL)isRetest
{
  return self->_isRetest;
}

- (void)setIsRetest:(BOOL)a3
{
  self->_isRetest = a3;
}

- (BOOL)isParis
{
  return self->_isParis;
}

- (void)setIsParis:(BOOL)a3
{
  self->_isParis = a3;
}

- (unsigned)tclass
{
  return self->_tclass;
}

- (void)setTclass:(unsigned int)a3
{
  self->_tclass = a3;
}

- (NPTPerformanceTest)performanceTest
{
  return self->_performanceTest;
}

- (void)setPerformanceTest:(id)a3
{
  objc_storeStrong((id *)&self->_performanceTest, a3);
}

- (WFMeasureResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_performanceTest, 0);
  objc_storeStrong((id *)&self->_testReason, 0);
  objc_storeStrong((id *)&self->_testDNSHostname, 0);
  objc_storeStrong((id *)&self->_publicDNSAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_dnsServers, 0);
  objc_storeStrong((id *)&self->_gatewayAddress, 0);
}

void __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Pinging LocalDNS PublicDNS or Gateway failed due to no pingAddress", buf, 2u);
}

- (void)dispatchSiriTest:trafficClass:.cold.1()
{
  NSLog(CFSTR("dispatchSiriTest got results for invalid probeDepth"));
  __assert_rtn("-[WFMeasure dispatchSiriTest:trafficClass:]", "WFMeasure.m", 1295, "false");
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_1()
{
  __assert_rtn("-[WFMeasure start:withCompletionQueue:]_block_invoke_3", "WFMeasure.m", 1484, "self.result.seenSpecificAcFailure == NO");
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_2()
{
  __assert_rtn("-[WFMeasure start:withCompletionQueue:]_block_invoke_3", "WFMeasure.m", 1482, "self.result.seenSpecificAcFailure == YES");
}

@end
