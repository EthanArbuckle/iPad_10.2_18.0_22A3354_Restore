@implementation TUAudioFrequencyController

- (TUAudioFrequencyController)initWithDelegate:(id)a3 queue:(id)a4 binCount:(int64_t)a5
{
  __int16 v5;
  id v8;
  id v9;
  TUAudioFrequencyController *v10;
  TUAudioFrequencyController *v11;
  id v12;
  void *v13;
  uint64_t v14;
  AVCAudioPowerSpectrumMeter *powerSpectrumMeter;
  uint64_t v17;
  int v18;
  __int16 v19;
  __int16 v20;
  uint64_t v21;
  objc_super v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TUAudioFrequencyController;
  v10 = -[TUAudioFrequencyController init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    objc_storeWeak((id *)&v11->_delegate, v8);
    v12 = objc_alloc((Class)CUTWeakLinkClass());
    -[TUAudioFrequencyController queue](v11, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v17 = 0;
    v19 = v5;
    v20 = 0;
    v21 = 0x3FB1111111111111;
    v14 = objc_msgSend(v12, "initWithConfig:delegate:queue:", &v17, v11, v13);
    powerSpectrumMeter = v11->_powerSpectrumMeter;
    v11->_powerSpectrumMeter = (AVCAudioPowerSpectrumMeter *)v14;

  }
  return v11;
}

- (TUAudioFrequencyController)initWithDelegate:(id)a3 queue:(id)a4
{
  return -[TUAudioFrequencyController initWithDelegate:queue:binCount:](self, "initWithDelegate:queue:binCount:", a3, a4, 1);
}

- (void)registerParticipantPowerSpectrum:(int64_t)a3
{
  id v4;

  -[TUAudioFrequencyController powerSpectrumMeter](self, "powerSpectrumMeter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerPowerSpectrumForStreamToken:", a3);

}

- (void)unregisterParticipantPowerSpectrum:(int64_t)a3
{
  id v4;

  -[TUAudioFrequencyController powerSpectrumMeter](self, "powerSpectrumMeter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterPowerSpectrumForStreamToken:", a3);

}

- (void)registerCellularPowerSpectrum:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  int64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[TUAudioFrequencyController _avcTapTypeForTUTapType:](self, "_avcTapTypeForTUTapType:");
  -[TUAudioFrequencyController powerSpectrumMeter](self, "powerSpectrumMeter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "registerPowerSpectrumForCellularTapType:error:", v5, &v10);
  v8 = v10;

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v12 = a3;
    v13 = 1024;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Register for cellular power spectrum - type: %lu, success: %d, error: %@", buf, 0x1Cu);
  }

}

- (void)unregisterCellularPowerSpectrum:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  int64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[TUAudioFrequencyController _avcTapTypeForTUTapType:](self, "_avcTapTypeForTUTapType:");
  -[TUAudioFrequencyController powerSpectrumMeter](self, "powerSpectrumMeter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "unregisterPowerSpectrumForCellularTapType:error:", v5, &v10);
  v8 = v10;

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v12 = a3;
    v13 = 1024;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Unregister for cellular power spectrum - type: %lu, success: %d, error: %@", buf, 0x1Cu);
  }

}

- (unsigned)_avcTapTypeForTUTapType:(int64_t)a3
{
  return a3 == 1;
}

+ (float)normalizedPowerLevelForPowerSpectrum:(id)a3
{
  float v3;
  float v4;

  objc_msgSend(a1, "rawPowerLevelForPowerSpectrum:", a3);
  v4 = -40.0;
  if (v3 <= -40.0)
  {
    v4 = v3;
    if (v3 < -90.0)
      v4 = -90.0;
  }
  return (float)(v4 + 90.0) / 50.0;
}

+ (float)rawPowerLevelForPowerSpectrum:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  objc_msgSend(a3, "channels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "powerLevel");
  v8 = v7;

  return v8;
}

+ (id)normalizedSpectrumForPowerSpectrum:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;

  objc_msgSend(a3, "channels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "powerLevel");
      v10 = v9;

      LODWORD(v11) = -1038090240;
      if (v10 <= -40.0)
      {
        *(float *)&v11 = v10;
        if (v10 < -90.0)
          LODWORD(v11) = -1028390912;
      }
      *(float *)&v11 = (float)(*(float *)&v11 + 90.0) / 50.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v12, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

  return v6;
}

- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[TUAudioFrequencyController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[TUAudioFrequencyController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v29 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v29)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
          v13 = (void *)objc_opt_class();
          objc_msgSend(v8, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "normalizedPowerLevelForPowerSpectrum:", v14);
          v16 = v15;

          v17 = objc_msgSend(v12, "integerValue");
          LODWORD(v18) = v16;
          objc_msgSend(v7, "frequencyController:audioPowerChanged:forParticipantWithStreamToken:", self, v17, v18);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v19 = (void *)objc_opt_class();
            objc_msgSend(v8, "objectForKeyedSubscript:", v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "rawPowerLevelForPowerSpectrum:", v20);
            v22 = v21;

            v23 = objc_msgSend(v12, "integerValue");
            LODWORD(v24) = v22;
            objc_msgSend(v7, "frequencyController:rawValueForAudioPowerChanged:forParticipantWithStreamToken:", self, v23, v24);
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v25 = (void *)objc_opt_class();
            objc_msgSend(v8, "objectForKeyedSubscript:", v12);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "normalizedSpectrumForPowerSpectrum:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "frequencyController:spectrumChanged:forParticipantWithStreamToken:", self, v27, objc_msgSend(v12, "integerValue"));
          }
          ++v11;
        }
        while (v10 != v11);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    v5 = v28;
  }

}

- (void)meterServerDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  -[TUAudioFrequencyController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[TUAudioFrequencyController meterServerDidDisconnect:].cold.1((uint64_t)v4, v6);

}

- (TUAudioFrequencyControllerDelegate)delegate
{
  return (TUAudioFrequencyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AVCAudioPowerSpectrumMeter)powerSpectrumMeter
{
  return self->_powerSpectrumMeter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSpectrumMeter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)meterServerDidDisconnect:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Audio power spectrum meter died: %@", (uint8_t *)&v2, 0xCu);
}

@end
