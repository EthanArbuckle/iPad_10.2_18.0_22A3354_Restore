@implementation SASHeater

- (void)prepareForUseAfterTimeInterval:(double)a3
{
  _QWORD v4[4];
  id v5[2];
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SASHeater_prepareForUseAfterTimeInterval___block_invoke;
  v4[3] = &unk_1E91FBE48;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  SiriInvokeOnMainQueue(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __44__SASHeater_prepareForUseAfterTimeInterval___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  objc_msgSend(WeakRetained, "_setPreparationStartTime:");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setPreheatTimeInterval:", *(double *)(a1 + 40));

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_cancelPreparation");

  if (*(double *)(a1 + 40) + -0.05 >= 0.0)
    v7 = *(double *)(a1 + 40) + -0.05;
  else
    v7 = 0.0;
  v8 = objc_loadWeakRetained(v2);
  v9 = (void *)MEMORY[0x1E0C99E88];
  v11 = v8;
  objc_msgSend(v9, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v11, sel__suggestPreheat, 0, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreheatTimer:", v10);

}

- (void)cancelPreparationForButtonIdentifier:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemUptime");
  v7 = v6;
  -[SASHeater _preparationStartTime](self, "_preparationStartTime");
  v9 = v7 - v8;

  -[SASHeater _cancelPreparation](self, "_cancelPreparation");
  -[SASHeater delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SASHeater preheatTimeInterval](self, "preheatTimeInterval");
  objc_msgSend(v11, "heater:cancelledPreparationWithButtonIdentifier:duration:targetDuration:", self, a3, v9, v10);

}

- (void)_cancelPreparation
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31__SASHeater__cancelPreparation__block_invoke;
  v2[3] = &unk_1E91FBE70;
  objc_copyWeak(&v3, &location);
  SiriInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __31__SASHeater__cancelPreparation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "preheatTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setPreheatTimer:", 0);

}

- (void)_suggestPreheat
{
  void *v3;

  -[SASHeater delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heaterSuggestsPreheating:", self);

  -[SASHeater updatePredictedRouteIsZLL](self, "updatePredictedRouteIsZLL");
}

- (void)updatePredictedRouteIsZLL
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (AFDeviceSupportsZLL())
  {
    -[SASHeater setPredictedRecordRouteIsZLL:](self, "setPredictedRecordRouteIsZLL:", 1);
    objc_initWeak(&location, self);
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__SASHeater_updatePredictedRouteIsZLL__block_invoke;
    v4[3] = &unk_1E91FBE70;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SASHeater setPredictedRecordRouteIsZLL:](self, "setPredictedRecordRouteIsZLL:", 0);
  }
}

void __38__SASHeater_updatePredictedRouteIsZLL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickableRoutesForCategory:andMode:", *MEMORY[0x1E0CFEB78], CFSTR("SpeechRecognition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    v7 = (_QWORD *)MEMORY[0x1E0D481C0];
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "objectForKeyedSubscript:", *v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if (v11)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D481E8]);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D480D8]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D481D0]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v28 = "-[SASHeater updatePredictedRouteIsZLL]_block_invoke";
            v29 = 2112;
            v30 = v9;
            _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s Picked record route: %@", buf, 0x16u);
          }
          goto LABEL_12;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
  v13 = 0;
LABEL_12:

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__SASHeater_updatePredictedRouteIsZLL__block_invoke_36;
  v18[3] = &unk_1E91FBE98;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  v19 = v5;
  v20 = v13;
  v21 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

  objc_destroyWeak(&v22);
}

void __38__SASHeater_updatePredictedRouteIsZLL__block_invoke_36(uint64_t a1)
{
  id WeakRetained;
  int v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D48028]);
    v4 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0D48108]) | ~v3;
    v5 = *(void **)(a1 + 48);
    objc_msgSend(WeakRetained, "_convertVirtualAudioSubTypeToString:", 1781740087);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    v7 = v4 & (v5 ^ 1);
    v8 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[SASHeater updatePredictedRouteIsZLL]_block_invoke";
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s Predicted record route ZLL: %{BOOL}d", (uint8_t *)&v9, 0x12u);
    }
    objc_msgSend(WeakRetained, "setPredictedRecordRouteIsZLL:", v7);
  }

}

- (id)_convertVirtualAudioSubTypeToString:(unsigned int)a3
{
  char cStr[5];

  if (!a3)
    return 0;
  cStr[0] = HIBYTE(a3);
  cStr[1] = BYTE2(a3);
  cStr[2] = BYTE1(a3);
  cStr[3] = a3;
  cStr[4] = 0;
  return (id)(id)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0);
}

- (SASHeaterDelegate)delegate
{
  return (SASHeaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)_preparationStartTime
{
  return self->_preparationStartTime;
}

- (void)_setPreparationStartTime:(double)a3
{
  self->_preparationStartTime = a3;
}

- (BOOL)predictedRecordRouteIsZLL
{
  return self->_predictedRecordRouteIsZLL;
}

- (void)setPredictedRecordRouteIsZLL:(BOOL)a3
{
  self->_predictedRecordRouteIsZLL = a3;
}

- (NSTimer)preheatTimer
{
  return self->_preheatTimer;
}

- (void)setPreheatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_preheatTimer, a3);
}

- (double)preheatTimeInterval
{
  return self->_preheatTimeInterval;
}

- (void)setPreheatTimeInterval:(double)a3
{
  self->_preheatTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preheatTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
