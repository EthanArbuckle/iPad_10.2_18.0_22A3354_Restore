@implementation VTPhraseSpotterControlRemote

- (VTPhraseSpotterControlRemote)initWithDelegate:(id)a3
{
  id v4;
  VTPhraseSpotterControlRemote *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  VTPeerRemoteConnection *v8;
  VTPeerRemoteConnection *peerConnection;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VTPhraseSpotterControlRemote;
  v5 = -[VTPhraseSpotterControlRemote init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("VTPhraseSpotterControlRemote", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = -[VTPeerRemoteConnection initWithServiceIdentifier:]([VTPeerRemoteConnection alloc], "initWithServiceIdentifier:", CFSTR("com.apple.private.alloy.siri.phrasespotter"));
    peerConnection = v5->_peerConnection;
    v5->_peerConnection = v8;

    -[VTPeerRemoteConnection setDelegate:](v5->_peerConnection, "setDelegate:", v5);
  }

  return v5;
}

- (void)remoteConnection:(id)a3 handleMessageType:(unint64_t)a4 completion:(id)a5
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id WeakRetained;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "voiceTriggerEnabled");

  if (v8)
  {
    v9 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = v9;
      objc_msgSend(v10, "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_INFO, "Remote received incoming IDS message: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    switch(a4)
    {
      case 0uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "phraseSpotterControl:didUpdateEnabled:", self, 1);
        goto LABEL_10;
      case 1uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "phraseSpotterControl:didUpdateEnabled:", self, 0);
        goto LABEL_10;
      case 2uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "phraseSpotterControlDidReceiveEarlyDetect:", self);
        goto LABEL_10;
      case 3uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "phraseSpotterControlDidReceiveTrigger:", self);
        goto LABEL_10;
      case 4uLL:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "phraseSpotterControlDidReceiveDismissal:", self);
LABEL_10:

        break;
      default:
        return;
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
