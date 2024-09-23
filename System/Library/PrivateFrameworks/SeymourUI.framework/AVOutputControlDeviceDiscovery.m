@implementation AVOutputControlDeviceDiscovery

- (AVOutputControlDeviceDiscovery)init
{
  AVOutputControlDeviceDiscovery *v2;
  uint64_t v3;
  AVOutputDeviceDiscoverySession *session;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVOutputControlDeviceDiscovery;
  v2 = -[AVOutputControlDeviceDiscovery init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDB25F0]), "initWithDeviceFeatures:", 8);
    session = v2->_session;
    v2->_session = (AVOutputDeviceDiscoverySession *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AVOutputControlDeviceDiscovery deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)AVOutputControlDeviceDiscovery;
  -[AVOutputControlDeviceDiscovery dealloc](&v3, sel_dealloc);
}

- (BOOL)supportsFitnessDataDestinationForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AVOutputControlDeviceDiscovery session](self, "session", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableOutputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "deviceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v4))
        {
          v14 = objc_msgSend(v12, "supportsFitnessDataDestination");

          v9 |= v14;
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (void)activate
{
  id v2;

  -[AVOutputControlDeviceDiscovery session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:", 2);

}

- (void)deactivate
{
  id v2;

  -[AVOutputControlDeviceDiscovery session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDiscoveryMode:", 0);

}

- (AVOutputDeviceDiscoverySession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
