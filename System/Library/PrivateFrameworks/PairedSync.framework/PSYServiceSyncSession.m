@implementation PSYServiceSyncSession

- (PSYServiceSyncSession)initWithQueue:(id)a3 supportsMigrationSync:(BOOL)a4
{
  id v7;
  PSYServiceSyncSession *v8;
  PSYServiceSyncSession *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSYServiceSyncSession;
  v8 = -[PSYServiceSyncSession init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_supportsMigrationSync = a4;
  }

  return v9;
}

- (NSUUID)pairingID
{
  void *v2;
  void *v3;

  -[PSYServiceSyncSession pdrPairedDevice](self, "pdrPairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NRDevice)pairedDevice
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSYServiceSyncSession pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceForPairingID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NRDevice *)v5;
}

- (void)syncDidCompleteSending
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PSYServiceSyncSession_syncDidCompleteSending__block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __47__PSYServiceSyncSession_syncDidCompleteSending__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncSessionDidCompleteSending:", *(_QWORD *)(a1 + 32));

}

- (void)syncDidComplete
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__PSYServiceSyncSession_syncDidComplete__block_invoke;
  block[3] = &unk_24C5E4FC8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__PSYServiceSyncSession_syncDidComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  psy_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    psy_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20CFE4000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator client called syncDidComplete", v6, 2u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncSessionDidComplete:", *(_QWORD *)(a1 + 32));

}

- (void)syncDidFailWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__PSYServiceSyncSession_syncDidFailWithError___block_invoke;
  v7[3] = &unk_24C5E4FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__PSYServiceSyncSession_syncDidFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncSession:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)reportProgress:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__PSYServiceSyncSession_reportProgress___block_invoke;
  v4[3] = &unk_24C5E51C0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

void __40__PSYServiceSyncSession_reportProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncSession:reportProgress:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

- (unint64_t)syncSessionType
{
  if (self->_syncSessionType == 2 && !self->_supportsMigrationSync)
    return 0;
  else
    return self->_syncSessionType;
}

- (PDRDevice)pdrPairedDevice
{
  return self->_pdrPairedDevice;
}

- (void)setPdrPairedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pdrPairedDevice, a3);
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (PSYSyncCoordinator)syncCoordinator
{
  return (PSYSyncCoordinator *)objc_loadWeakRetained((id *)&self->_syncCoordinator);
}

- (void)setSyncCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_syncCoordinator, a3);
}

- (unint64_t)switchID
{
  return self->_switchID;
}

- (void)setSwitchID:(unint64_t)a3
{
  self->_switchID = a3;
}

- (PSYServiceSyncSessionDelegate)delegate
{
  return (PSYServiceSyncSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_syncCoordinator);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pdrPairedDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
