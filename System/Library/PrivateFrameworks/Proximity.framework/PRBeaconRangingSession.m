@implementation PRBeaconRangingSession

- (PRBeaconRangingSession)init
{
  -[PRBeaconRangingSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRBeaconRangingSession)initWithQueue:(id)a3
{
  id v5;
  PRBeaconRangingSession *v6;
  os_log_t v7;
  OS_os_log *logger;
  PRBeaconListener *v9;
  PRBeaconListener *beaconListener;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRBeaconRangingSession;
  v6 = -[PRBeaconRangingSession init](&v12, sel_init);
  if (v6)
  {
    v7 = os_log_create("com.apple.Proximity", "Beacon");
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    v9 = -[PRBeaconListener initWithDelegate:queue:]([PRBeaconListener alloc], "initWithDelegate:queue:", v6, v6->_queue);
    beaconListener = v6->_beaconListener;
    v6->_beaconListener = v9;

    v6->_beaconListenerState = 0;
  }

  return v6;
}

- (void)startRangingWithBeaconsMatchingDescriptor:(id)a3
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_activeDescriptor, a3);
  if (self->_beaconListenerState)
  {
    -[PRBeaconRangingSession startRangingInternal](self, "startRangingInternal");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 999, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "beaconRangingSession:didFailWithError:", self, v6);

  }
}

- (void)stopRangingWithBeaconsMatchingDescriptor:(id)a3
{
  -[PRBeaconListener clearBeaconAllowlistWithCompletionHandler:](self->_beaconListener, "clearBeaconAllowlistWithCompletionHandler:", &__block_literal_global);
}

void __67__PRBeaconRangingSession_stopRangingWithBeaconsMatchingDescriptor___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  NSLog(CFSTR("success: %d, error: %@"), a2, a3);
}

- (void)startRangingInternal
{
  PRRemoteDevice *v3;
  void *v4;
  PRRemoteDevice *v5;
  PRBeaconListener *beaconListener;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_activeDescriptor)
  {
    v3 = [PRRemoteDevice alloc];
    -[PRBeaconDescriptor UUID](self->_activeDescriptor, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PRRemoteDevice initWithCompanionUUID:](v3, "initWithCompanionUUID:", v4);

    beaconListener = self->_beaconListener;
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__PRBeaconRangingSession_startRangingInternal__block_invoke;
    v8[3] = &unk_1E3D043C0;
    v8[4] = self;
    -[PRBeaconListener pushBeaconAllowlist:completionHandler:](beaconListener, "pushBeaconAllowlist:completionHandler:", v7, v8);

  }
}

void __46__PRBeaconRangingSession_startRangingInternal__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19BF46000, v6, OS_LOG_TYPE_INFO, "allowlist beacon success: %d, error: %@", (uint8_t *)v7, 0x12u);
  }

}

- (void)stopRangingInternal
{
  PRBeaconListener *beaconListener;
  PRBeaconDescriptor *activeDescriptor;
  _QWORD v5[5];

  if (self->_activeDescriptor)
  {
    beaconListener = self->_beaconListener;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__PRBeaconRangingSession_stopRangingInternal__block_invoke;
    v5[3] = &unk_1E3D043C0;
    v5[4] = self;
    -[PRBeaconListener clearBeaconAllowlistWithCompletionHandler:](beaconListener, "clearBeaconAllowlistWithCompletionHandler:", v5);
    activeDescriptor = self->_activeDescriptor;
    self->_activeDescriptor = 0;

  }
}

void __45__PRBeaconRangingSession_stopRangingInternal__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19BF46000, v6, OS_LOG_TYPE_INFO, "unallowlist beacon success: %d, error: %@", (uint8_t *)v7, 0x12u);
  }

}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *logger;
  id WeakRetained;

  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    -[PRBeaconRangingSession didFailWithError:].cold.1((uint64_t)v4, logger);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "beaconRangingSession:didFailWithError:", self, v4);

}

- (void)beaconListener:(id)a3 didOutputRangeResults:(id)a4
{
  id v6;
  NSObject *logger;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id WeakRetained;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    -[PRBeaconRangingSession beaconListener:didOutputRangeResults:].cold.1((uint64_t)v6, logger);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "range_m", v27);
        v14 = v13;
        objc_msgSend(v12, "range_unc_m");
        +[PRRangeMeasurement measurementWithRange:uncertainty:](PRRangeMeasurement, "measurementWithRange:uncertainty:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "az_valid"))
        {
          objc_msgSend(v12, "az_deg");
          v18 = v17;
          objc_msgSend(v12, "az_unc_deg");
          +[PRAngleMeasurement measurementWithAngle:uncertainty:](PRAngleMeasurement, "measurementWithAngle:uncertainty:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        if (objc_msgSend(v12, "el_valid"))
        {
          objc_msgSend(v12, "el_deg");
          v22 = v21;
          objc_msgSend(v12, "el_unc_deg");
          +[PRAngleMeasurement measurementWithAngle:uncertainty:](PRAngleMeasurement, "measurementWithAngle:uncertainty:", v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        objc_msgSend(v12, "mach_absolute_time_sec");
        +[PRRelativePosition relativePositionWithTimestamp:range:azimuth:elevation:](PRRelativePosition, "relativePositionWithTimestamp:range:azimuth:elevation:", v16, v20, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "beaconRangingSession:didMeasureBeaconMatchingDescriptor:atPosition:", self, self->_activeDescriptor, v25);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

}

- (void)beaconListener:(id)a3 didChangeState:(unint64_t)a4
{
  void *v5;
  id WeakRetained;

  if (a4 == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 999, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "beaconRangingSession:didFailWithError:", self, v5);

  }
}

- (void)beaconListener:(id)a3 didFailWithError:(id)a4
{
  -[PRBeaconRangingSession didFailWithError:](self, "didFailWithError:", a4);
}

- (PRBeaconRangingSessionDelegate)delegate
{
  return (PRBeaconRangingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeDescriptor, 0);
  objc_storeStrong((id *)&self->_beaconListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)didFailWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19BF46000, a2, OS_LOG_TYPE_ERROR, "daemon session failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)beaconListener:(uint64_t)a1 didOutputRangeResults:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19BF46000, a2, OS_LOG_TYPE_DEBUG, "received new results: %@", (uint8_t *)&v2, 0xCu);
}

@end
