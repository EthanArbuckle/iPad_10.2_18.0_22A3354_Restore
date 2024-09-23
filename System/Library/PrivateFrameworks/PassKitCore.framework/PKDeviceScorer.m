@implementation PKDeviceScorer

+ (BOOL)deviceScoringSupported
{
  return 1;
}

- (PKDeviceScorer)init
{
  return -[PKDeviceScorer initWithContext:](self, "initWithContext:", 0);
}

- (PKDeviceScorer)initWithContext:(id)a3
{
  id v4;
  PKDeviceScorer *v5;
  uint64_t v6;
  PKDSPContext *context;
  uint64_t v8;
  NSMutableDictionary *scoreCompletions;
  uint64_t v10;
  CdQwUTvJnDEPQgR8 *scorer;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDeviceScorer;
  v5 = -[PKDeviceScorer init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (PKDSPContext *)v6;

    v5->_deviceScoreTimeout = 1.8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    scoreCompletions = v5->_scoreCompletions;
    v5->_scoreCompletions = (NSMutableDictionary *)v8;

    -[PKDeviceScorer _createScorer](v5, "_createScorer");
    v10 = objc_claimAutoreleasedReturnValue();
    scorer = v5->_scorer;
    v5->_scorer = (CdQwUTvJnDEPQgR8 *)v10;

    -[CdQwUTvJnDEPQgR8 prepareScoreMessage](v5->_scorer, "prepareScoreMessage");
  }

  return v5;
}

- (void)deviceScoreWithCryptogram:(id)a3 challengeResponse:(id)a4 nonce:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
    goto LABEL_15;
  if (v10)
  {
    if (v11)
      goto LABEL_4;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v20 = CFSTR("no cryptogram supplied for DSP");
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }

    if (v11)
    {
LABEL_4:
      if (v12)
      {
LABEL_5:
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __79__PKDeviceScorer_deviceScoreWithCryptogram_challengeResponse_nonce_completion___block_invoke;
        v17[3] = &unk_1E2AC8BE0;
        v18 = v13;
        -[PKDeviceScorer _getScoreWithNonce:cryptogram:challengeResponse:completion:](self, "_getScoreWithNonce:cryptogram:challengeResponse:completion:", v12, v10, v11, v17);

        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
  PKLogFacilityTypeGetObject(6uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = CFSTR("no challengeResponse supplied for DSP");
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
  }

  if (v12)
    goto LABEL_5;
LABEL_12:
  PKLogFacilityTypeGetObject(6uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = CFSTR("no nonce supplied for DSP");
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
LABEL_15:

}

uint64_t __79__PKDeviceScorer_deviceScoreWithCryptogram_challengeResponse_nonce_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)peerPaymentDeviceScoreWithCryptogram:(id)a3 challengeResponse:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        -[PKDeviceScorer _getScoreWithNonce:cryptogram:challengeResponse:completion:](self, "_getScoreWithNonce:cryptogram:challengeResponse:completion:", 0, v8, v9, v10);
        goto LABEL_11;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138477827;
        v13 = CFSTR("no challengeResponse supplied for DSP");
        goto LABEL_9;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138477827;
        v13 = CFSTR("no cryptogram supplied for DSP");
LABEL_9:
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v12, 0xCu);
      }
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }
LABEL_11:

}

- (void)_getScoreWithNonce:(id)a3 cryptogram:(id)a4 challengeResponse:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0C80D38];
  v15 = MEMORY[0x1E0C80D38];
  if (PKProvisioningSecurityEnhancementsDisableDeviceScore())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v31 = CFSTR("DSP disabled by setting");
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke;
    block[3] = &unk_1E2ABD9A0;
    v29 = v13;
    v17 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v18 = v29;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2;
    v22[3] = &unk_1E2AC8C58;
    v22[4] = self;
    v20 = v14;
    v23 = v14;
    v27 = v13;
    v24 = v10;
    v25 = v11;
    v26 = v12;
    v21 = v13;
    dispatch_async(v19, v22);

    v18 = v23;
  }

}

uint64_t __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  FZf7GLuluME5TMqw *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  id v32;
  __int128 *p_buf;
  id v34[2];
  _QWORD handler[5];
  NSObject *v36;
  void *v37;
  uint8_t v38[4];
  void *v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v3 = (void *)mach_absolute_time();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x2020000000;
    v42 = 0;
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 40));
    v5 = *(double *)(*(_QWORD *)(a1 + 32) + 24);
    if (v5 <= 0.0)
      v6 = -1;
    else
      v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer(v4, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v12 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_3;
    handler[3] = &unk_1E2AC5810;
    v13 = *(_QWORD *)(a1 + 32);
    v37 = v3;
    handler[4] = v13;
    v14 = v4;
    v36 = v14;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(v14);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(*(id *)(a1 + 72), "copy");
    v17 = _Block_copy(v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v17, v15);

    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "serverEndpointIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Fetching DSP for: %@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138477827;
      v39 = v21;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "%{private}@", v38, 0xCu);

    }
    v22 = objc_alloc_init(FZf7GLuluME5TMqw);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "secureElementID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FZf7GLuluME5TMqw setSeid:](v22, "setSeid:", v23);

    -[FZf7GLuluME5TMqw setNonce:](v22, "setNonce:", *(_QWORD *)(a1 + 48));
    -[FZf7GLuluME5TMqw setHostChallenge:](v22, "setHostChallenge:", *(_QWORD *)(a1 + 56));
    -[FZf7GLuluME5TMqw setChallengeResponse:](v22, "setChallengeResponse:", *(_QWORD *)(a1 + 64));
    objc_initWeak((id *)v38, *(id *)(a1 + 32));
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_109;
    v29[3] = &unk_1E2AC8C30;
    v30 = *(id *)(a1 + 40);
    p_buf = &buf;
    v25 = v14;
    v31 = v25;
    v34[1] = v3;
    objc_copyWeak(v34, (id *)v38);
    v26 = v15;
    v32 = v26;
    objc_msgSend(v24, "scoreWithScoreRequest:completionHandler:", v22, v29);

    objc_destroyWeak(v34);
    objc_destroyWeak((id *)v38);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(v2 + 32), "serverEndpointIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Error: Could not generate scorer for DSP requested by: %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&buf, 0xCu);

    }
    v11 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_123;
    block[3] = &unk_1E2ABD9A0;
    v28 = *(id *)(a1 + 72);
    dispatch_async(v11, block);

  }
}

uint64_t __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  v3 = PKSecondsFromMachTimeInterval(v2 - *(_QWORD *)(a1 + 48));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "serverEndpointIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Timeout fetching DSP for: %@, time taken(seconds):%f "), v6, *(_QWORD *)&v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v10 = v7;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

  }
  AnalyticsSendEvent();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stop");
}

void __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_109(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2_110;
  v16[3] = &unk_1E2AC8C08;
  v22 = *(_QWORD *)(a1 + 56);
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(void **)(a1 + 72);
  v17 = v11;
  v23[1] = v12;
  objc_copyWeak(v23, (id *)(a1 + 64));
  v18 = v9;
  v19 = v8;
  v20 = v7;
  v21 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  v15 = v9;
  dispatch_async(v10, v16);

  objc_destroyWeak(v23);
}

void __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2_110(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  id *WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    v3 = mach_absolute_time();
    v4 = PKSecondsFromMachTimeInterval(v3 - *(_QWORD *)(a1 + 88));
    v21 = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
    v8 = *(void **)(a1 + 40);
    if (v8 || (v13 = *(void **)(a1 + 48)) == 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained[4], "serverEndpointIdentifier");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("no-self");
      }
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Error: Fetching DSP: %@ for: %@ time taken(seconds):%f "), v11, v12, *(_QWORD *)&v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v20 = v15;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "hexEncoding");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained[4], "serverEndpointIdentifier");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("no-self");
      }
      objc_msgSend(v14, "stringWithFormat:", CFSTR("DSP: %@ for: %@ time taken(seconds): %f"), v11, v12, *(_QWORD *)&v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v20 = v15;
    }
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    if (WeakRetained)

LABEL_17:
    if (*(_QWORD *)(a1 + 56))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "bytes"));
      if (!WeakRetained)
        goto LABEL_24;
    }
    else
    {
      v16 = 0;
      if (!WeakRetained)
      {
LABEL_24:

        return;
      }
    }
    objc_msgSend(WeakRetained[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v17 + 16))(v17, v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained[2], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 64));

    goto LABEL_24;
  }
}

uint64_t __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_123(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

- (id)_createScorer
{
  jprL7AuZZkLkFoBK *v3;
  void *v4;
  jprL7AuZZkLkFoBK *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  PawuKFL8icsLHMZd *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PawuKFL8icsLHMZd *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  NSObject *p_super;
  uint64_t v20;
  PawuKFL8icsLHMZd *v21;
  unint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = [jprL7AuZZkLkFoBK alloc];
  -[PKDSPContext serverEndpointIdentifier](self->_context, "serverEndpointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[jprL7AuZZkLkFoBK initWithServerEndpointIdentifier:](v3, "initWithServerEndpointIdentifier:", v4);

  if (!v5)
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138477827;
      v28 = CFSTR("Could not generate context for DSP");
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDSPContext cardholderName](self->_context, "cardholderName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[PawuKFL8icsLHMZd initWithFullName:source:]([PawuKFL8icsLHMZd alloc], "initWithFullName:source:", v8, 2);
    objc_msgSend(v7, "addObject:", v9);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v9 = (PawuKFL8icsLHMZd *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138477827;
      v28 = CFSTR("no card holder name supplied for DSP");
      _os_log_impl(&dword_18FC92000, &v9->super, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }

  -[PKDSPContext primaryAppleAccountFirstName](self->_context, "primaryAppleAccountFirstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDSPContext primaryAppleAccountLastName](self->_context, "primaryAppleAccountLastName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 && v11)
  {
    v13 = -[PawuKFL8icsLHMZd initWithFirstName:lastName:source:]([PawuKFL8icsLHMZd alloc], "initWithFirstName:lastName:source:", v10, v11, 1);
    objc_msgSend(v7, "addObject:", v13);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v13 = (PawuKFL8icsLHMZd *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138477827;
      v28 = CFSTR("no account supplied for DSP");
      _os_log_impl(&dword_18FC92000, &v13->super, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }

  -[PKDSPContext peerPaymentRecipientAddress](self->_context, "peerPaymentRecipientAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    PKIDSNormalizedAddress(v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = -[NSObject hasPrefix:](v16, "hasPrefix:", CFSTR("mailto:"));
    v18 = -[NSObject hasPrefix:](v16, "hasPrefix:", CFSTR("tel:"));
    if ((v17 & 1) != 0 || v18)
    {
      if (v17)
      {
        -[NSObject substringFromIndex:](v16, "substringFromIndex:", objc_msgSend(CFSTR("mailto:"), "length"));
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = -[PawuKFL8icsLHMZd initWithEmailAddress:source:]([PawuKFL8icsLHMZd alloc], "initWithEmailAddress:source:", v20, 3);
      }
      else
      {
        -[NSObject substringFromIndex:](v16, "substringFromIndex:", objc_msgSend(CFSTR("tel:"), "length"));
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = -[PawuKFL8icsLHMZd initWithPhoneNumber:source:]([PawuKFL8icsLHMZd alloc], "initWithPhoneNumber:source:", v20, 3);
      }
      p_super = &v21->super;
      v16 = v20;
      -[PawuKFL8icsLHMZd setType:](v21, "setType:", 1);
      objc_msgSend(v7, "addObject:", p_super);
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138477827;
        v28 = CFSTR("unknown peer payment recipient address type supplied for DSP");
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138477827;
      v28 = CFSTR("no peer payment recipient address supplied for DSP");
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }

  -[jprL7AuZZkLkFoBK setIdentities:](v5, "setIdentities:", v7);
  v22 = -[PKDSPContext eventFrequency](self->_context, "eventFrequency");
  if (v22 <= 2)
    -[jprL7AuZZkLkFoBK setEventFrequency:](v5, "setEventFrequency:", v22);
  -[PKDSPContext phoneNumber](self->_context, "phoneNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[jprL7AuZZkLkFoBK setPhoneNumber:](v5, "setPhoneNumber:", v23);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138477827;
      v28 = CFSTR("no phonenumber supplied for DSP");
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }

  }
  +[CdQwUTvJnDEPQgR8 scorerWithContext:](CdQwUTvJnDEPQgR8, "scorerWithContext:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (double)deviceScoreTimeout
{
  return self->_deviceScoreTimeout;
}

- (void)setDeviceScoreTimeout:(double)a3
{
  self->_deviceScoreTimeout = a3;
}

- (PKDSPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_scoreCompletions, 0);
  objc_storeStrong((id *)&self->_scorer, 0);
}

@end
