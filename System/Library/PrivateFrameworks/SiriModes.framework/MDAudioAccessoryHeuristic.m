@implementation MDAudioAccessoryHeuristic

- (MDAudioAccessoryHeuristic)init
{
  MDAudioAccessoryHeuristic *v2;
  uint64_t v3;
  AVOutputContext *sharedSystemAudioContext;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDAudioAccessoryHeuristic;
  v2 = -[MDAudioAccessoryHeuristic init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB25D8], "sharedSystemAudioContext");
    v3 = objc_claimAutoreleasedReturnValue();
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v3;

    -[MDAudioAccessoryHeuristic _fetchConnectedAudioAccessoryState](v2, "_fetchConnectedAudioAccessoryState");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__connectedOutputDevicesDidChange_, *MEMORY[0x24BDB1F00], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__connectedOutputDevicesDidChange_, *MEMORY[0x24BDB1F08], 0);

  }
  return v2;
}

- (id)determineCurrentMode
{
  if (-[MDAudioAccessoryHeuristic isConnectedToAudioAccessory](self, "isConnectedToAudioAccessory"))
    return -[MDModeDecision initWithMode:]([MDModeDecision alloc], "initWithMode:", 0);
  else
    return 0;
}

- (BOOL)isConnectedToAudioAccessory
{
  return self->_connectedToAudioAccessory;
}

- (void)_fetchConnectedAudioAccessoryState
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AVOutputContext outputDevices](self->_sharedSystemAudioContext, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_connectedToAudioAccessory = 0;
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "deviceType", (_QWORD)v12);
        if (v9 <= 4 && ((1 << v9) & 0x13) != 0)
        {
          self->_connectedToAudioAccessory = 1;
          if (v9 <= 4 && ((1 << v9) & 0x13) != 0)
            break;
        }
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__MDAudioAccessoryHeuristic__connectedOutputDevicesDidChange___block_invoke;
  v3[3] = &unk_24D472128;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__MDAudioAccessoryHeuristic__connectedOutputDevicesDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[MDAudioAccessoryHeuristic _connectedOutputDevicesDidChange:]_block_invoke";
    _os_log_impl(&dword_215D0F000, v2, OS_LOG_TYPE_DEFAULT, "%s #modes: output devices changed, re-fetching connected audio accessory state", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchConnectedAudioAccessoryState");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeDecisionBasedOnAudioAccessory, 0);
  objc_storeStrong((id *)&self->_sharedSystemAudioContext, 0);
  objc_storeStrong((id *)&self->_connectedOutputDevicesObserver, 0);
}

@end
