@implementation VTPhraseSpotterControlConnection

- (VTPhraseSpotterControlConnection)init
{
  VTPhraseSpotterControlConnection *v2;
  VTPhraseSpotterControlConnection *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  VTPeerRemoteConnection *v6;
  VTPeerRemoteConnection *peerConnection;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VTPhraseSpotterControlConnection;
  v2 = -[VTPhraseSpotterControlConnection init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_remotePhraseSpotterEnabled = 1;
    v4 = dispatch_queue_create("VTPhraseSpotterControlConnection", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = -[VTPeerRemoteConnection initWithServiceIdentifier:requireNearbyPeer:]([VTPeerRemoteConnection alloc], "initWithServiceIdentifier:requireNearbyPeer:", CFSTR("com.apple.private.alloy.siri.phrasespotter"), 1);
    peerConnection = v3->_peerConnection;
    v3->_peerConnection = v6;

    -[VTPeerRemoteConnection setDelegate:](v3->_peerConnection, "setDelegate:", v3);
  }
  return v3;
}

- (void)updateRemotePhraseSpotterEnabled:(BOOL)a3
{
  int v3;
  int remotePhraseSpotterEnabled;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "voiceTriggerEnabled"))
  {
    remotePhraseSpotterEnabled = self->_remotePhraseSpotterEnabled;

    if (remotePhraseSpotterEnabled != v3)
    {
      v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v7 = CFSTR("disabled");
        if (v3)
          v7 = CFSTR("enabled");
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Notifying connection that remote phrase spotter should be %{public}@", buf, 0xCu);
      }
      self->_remotePhraseSpotterEnabled = v3;
      -[VTPeerRemoteConnection sendRequestType:nonWaking:](self->_peerConnection, "sendRequestType:nonWaking:", v3 ^ 1u, 1);
    }
  }
  else
  {

  }
}

- (void)notifyRemoteOfEarlyDetect
{
  -[VTPeerRemoteConnection sendRequestType:nonWaking:](self->_peerConnection, "sendRequestType:nonWaking:", 2, 0);
}

- (void)notifyRemoteOfTriggerEvent
{
  -[VTPeerRemoteConnection sendRequestType:nonWaking:](self->_peerConnection, "sendRequestType:nonWaking:", 3, 0);
}

- (void)notifyRemoteOfDismissal
{
  -[VTPeerRemoteConnection sendRequestType:nonWaking:](self->_peerConnection, "sendRequestType:nonWaking:", 4, 0);
}

- (void)remoteConnection:(id)a3 handleMessageType:(unint64_t)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Connection received incoming IDS message: {%{public}@} - dropping it on the floor.", (uint8_t *)&v10, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
