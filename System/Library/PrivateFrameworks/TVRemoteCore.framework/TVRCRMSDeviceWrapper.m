@implementation TVRCRMSDeviceWrapper

void __49___TVRCRMSDeviceWrapper__connectWithPairingGUID___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromRMSResponseCode(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice connection got RMS response code %@", (uint8_t *)&v15, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == -2)
    {
      _TVRCRMSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice got AuthenticationError. Removing pairing record and attempting to re-pair...", (uint8_t *)&v15, 2u);
      }

      +[_TVRCRMSDeviceManager sharedInstance](_TVRCRMSDeviceManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "networkName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeStoredInfoForNetworkName:", v13);

      objc_msgSend(WeakRetained, "_initiatePairing");
    }
    else
    {
      if (a2 == 1)
      {
        _TVRCRMSLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Informing delegate we successfully connected", (uint8_t *)&v15, 2u);
        }

        objc_msgSend(WeakRetained, "controlSession");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "beginObservingNowPlaying");

        objc_msgSend(WeakRetained, "setConnected:", 1);
        objc_msgSend(WeakRetained, "_setupKeyboardController");
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "connectedToDevice:", WeakRetained);
      }
      else
      {
        _TVRCRMSLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Informing delegate we failed to connect", (uint8_t *)&v15, 2u);
        }

        TVRCMakeError(100, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_disconnectWithError:", v9);
      }

    }
  }

}

void __37___TVRCRMSDeviceWrapper__seekToTime___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a2 != 1)
  {
    v2 = a2;
    _TVRCRMSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v2;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "#LegacyDevice failed to seek to playback time with error code %d", (uint8_t *)v4, 8u);
    }

  }
}

@end
