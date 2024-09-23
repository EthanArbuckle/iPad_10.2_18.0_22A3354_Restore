@implementation BTSmartRoutingWxDevice

- (void)_setFirstBannerShown:(BOOL)a3
{
  _BOOL4 firstBannerShown;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  firstBannerShown = self->firstBannerShown;
  if (firstBannerShown != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (firstBannerShown)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setFirstBannerShown:]", 30, "Setting firstBanner for Wx %@ %s -> %s", self->deviceAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        firstBannerShown = self->firstBannerShown;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->firstBannerShown = v4;
  }
}

- (void)_setHijackBackoffTick:(unint64_t)a3
{
  unint64_t hijackBackoffTicks;

  hijackBackoffTicks = self->hijackBackoffTicks;
  if (hijackBackoffTicks != a3)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_6;
        hijackBackoffTicks = self->hijackBackoffTicks;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setHijackBackoffTick:]", 30, "Setting hijackBackoffTicks for Wx %@ %u -> %u", self->deviceAddress, hijackBackoffTicks, a3);
    }
LABEL_6:
    self->hijackBackoffTicks = a3;
  }
}

- (void)_setManualRoute:(BOOL)a3
{
  _BOOL4 manuallyRouted;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  manuallyRouted = self->manuallyRouted;
  if (manuallyRouted != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (manuallyRouted)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setManualRoute:]", 30, "Setting manuallyRouted %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        manuallyRouted = self->manuallyRouted;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->manuallyRouted = v4;
  }
}

- (void)_setManualRouteChangeInProgress:(BOOL)a3
{
  _BOOL4 manualRouteChangeInProgress;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  manualRouteChangeInProgress = self->manualRouteChangeInProgress;
  if (manualRouteChangeInProgress != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (manualRouteChangeInProgress)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setManualRouteChangeInProgress:]", 30, "Setting manualRouteChangeInProgress %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        manualRouteChangeInProgress = self->manualRouteChangeInProgress;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->manualRouteChangeInProgress = v4;
  }
}

- (void)_setOtherTipiAudioCategory:(unsigned int)a3
{
  uint64_t otherTipiAudioCategory;
  uint64_t v4;

  otherTipiAudioCategory = self->otherTipiAudioCategory;
  if ((_DWORD)otherTipiAudioCategory != a3)
  {
    v4 = *(_QWORD *)&a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_6;
        otherTipiAudioCategory = self->otherTipiAudioCategory;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiAudioCategory:]", 30, "Setting OtherTipiAudioCategory for Wx %@ %d -> %d", self->deviceAddress, otherTipiAudioCategory, v4);
    }
LABEL_6:
    self->otherTipiAudioCategory = v4;
  }
}

- (void)_setOtherTipiPlayingApp:(id)a3
{
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[NSString isEqualToString:](self->otherTipiDevicePlayingApp, "isEqualToString:", v7);
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiPlayingApp:]", 30, "Setting OtherTipiDevicePlayingApp for Wx %@ %@ -> %@", self->deviceAddress, self->otherTipiDevicePlayingApp, v7);
    }
    objc_storeStrong((id *)&self->otherTipiDevicePlayingApp, a3);
    v6 = v7;
  }

}

- (void)_setOtherTipiDeviceInfo:(id)a3 andName:(id)a4 andVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  NSString *otherTipiDeviceBTAddress;
  unsigned __int8 v14;
  id v15;
  unsigned int tipiAndRoutedState;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (unint64_t)v9;
  otherTipiDeviceBTAddress = self->otherTipiDeviceBTAddress;
  v20 = (id)v12;
  if (!(v12 | (unint64_t)otherTipiDeviceBTAddress))
    goto LABEL_9;
  v14 = -[NSString isEqualToString:](otherTipiDeviceBTAddress, "isEqualToString:", v12);
  v15 = v20;
  if ((v14 & 1) == 0)
  {
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiDeviceInfo:andName:andVersion:]", 30, "Setting otherTipi for Wx %@ %@ -> %@ name %@ version %@", self->deviceAddress, self->otherTipiDeviceBTAddress, v20, v10, v11);
    }
    objc_storeStrong((id *)&self->otherTipiDeviceBTAddress, a3);
    objc_storeStrong((id *)&self->otherTipiDeviceBTName, a4);
    objc_storeStrong((id *)&self->otherTipiDeviceVersion, a5);
    v15 = v20;
  }
  if (!v15)
LABEL_9:
    self->otherTipiAudioCategory = 0;
  tipiAndRoutedState = self->tipiAndRoutedState;
  if (self->otherTipiDeviceBTAddress)
  {
    if (self->otherTipiDeviceIsWatch)
      v17 = 3;
    else
      v17 = 1;
    v18 = v17 | tipiAndRoutedState;
  }
  else
  {
    v18 = tipiAndRoutedState & 0xFFFFFFFC;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  objc_msgSend(v19, "_setTipiAndRoutedStateFlags:forDevice:", v18, self);

}

- (void)_setOtherTipiDeviceIsStreamingAudio:(BOOL)a3
{
  _BOOL4 otherTipiDeviceIsStreamingAudio;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  otherTipiDeviceIsStreamingAudio = self->otherTipiDeviceIsStreamingAudio;
  if (otherTipiDeviceIsStreamingAudio != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (otherTipiDeviceIsStreamingAudio)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiDeviceIsStreamingAudio:]", 30, "Setting otherTipiDeviceIsStreamingAudio %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        otherTipiDeviceIsStreamingAudio = self->otherTipiDeviceIsStreamingAudio;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->otherTipiDeviceIsStreamingAudio = v4;
  }
}

- (void)_setOtherTipiDeviceIsWatch:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 otherTipiDeviceIsWatch;
  const char *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  otherTipiDeviceIsWatch = self->otherTipiDeviceIsWatch;
  if (otherTipiDeviceIsWatch == a3)
    goto LABEL_12;
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1)
    {
LABEL_4:
      v6 = "yes";
      if (otherTipiDeviceIsWatch)
        v7 = "yes";
      else
        v7 = "no";
      if (!v3)
        v6 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiDeviceIsWatch:]", 30, "Setting otherTipiDeviceIsWatch %s -> %s", v7, v6);
      goto LABEL_11;
    }
    if (_LogCategory_Initialize(&dword_10020FA58, 30))
    {
      otherTipiDeviceIsWatch = self->otherTipiDeviceIsWatch;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->otherTipiDeviceIsWatch = v3;
LABEL_12:
  if (v3)
    v8 = 2;
  else
    v8 = 0;
  v9 = v8 | self->tipiAndRoutedState & 0xFFFFFFFD;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  objc_msgSend(v10, "_setTipiAndRoutedStateFlags:forDevice:", v9, self);

}

- (void)_setOtherTipiDeviceBuildVersion:(int64_t)a3 andMinorBuildVersion:(int64_t)a4
{
  int64_t otherTipiDeviceMajorBuildVersion;

  otherTipiDeviceMajorBuildVersion = self->otherTipiDeviceMajorBuildVersion;
  if (*(_OWORD *)&self->otherTipiDeviceMajorBuildVersion != __PAIR128__(a4, a3))
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_6;
        otherTipiDeviceMajorBuildVersion = self->otherTipiDeviceMajorBuildVersion;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiDeviceBuildVersion:andMinorBuildVersion:]", 30, "Setting otherTipi build version for Wx %@ %d.%d -> %d.%d", self->deviceAddress, otherTipiDeviceMajorBuildVersion, self->otherTipiDeviceMinorBuildVersion, a3, a4);
    }
LABEL_6:
    self->otherTipiDeviceMajorBuildVersion = a3;
    self->otherTipiDeviceMinorBuildVersion = a4;
  }
}

- (void)_setOtherTipiManuallyRouteTick:(unint64_t)a3
{
  unint64_t otherTipiManuallyRouteTicks;
  const char *v6;
  const char *v7;

  otherTipiManuallyRouteTicks = self->otherTipiManuallyRouteTicks;
  if (otherTipiManuallyRouteTicks != a3)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (otherTipiManuallyRouteTicks)
          v7 = "yes";
        else
          v7 = "no";
        if (!a3)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOtherTipiManuallyRouteTick:]", 30, "Setting otherTipiManuallyRouteTick for Wx %@ %u -> %u", self->deviceAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        otherTipiManuallyRouteTicks = self->otherTipiManuallyRouteTicks;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->otherTipiManuallyRouteTicks = a3;
  }
}

- (void)_setOwnership:(BOOL)a3
{
  _BOOL4 hasOwnership;
  _BOOL4 v4;
  const char *v6;
  const char *v7;
  id v8;

  hasOwnership = self->hasOwnership;
  if (hasOwnership != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (hasOwnership)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setOwnership:]", 30, "Updating Wx ownership %@ %s -> %s", self->deviceAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        hasOwnership = self->hasOwnership;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->hasOwnership = v4;
    if (!v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
      objc_msgSend(v8, "_setConnectedBannerTick:", 0);

    }
  }
}

- (void)_setRoutedState:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 routed;
  const char *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  routed = self->routed;
  if (routed == a3)
    goto LABEL_12;
  if (dword_10020FA58 <= 30)
  {
    if (dword_10020FA58 != -1)
    {
LABEL_4:
      v6 = "yes";
      if (routed)
        v7 = "yes";
      else
        v7 = "no";
      if (!v3)
        v6 = "no";
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setRoutedState:]", 30, "Setting routedState for Wx %@ %s -> %s", self->deviceAddress, v7, v6);
      goto LABEL_11;
    }
    if (_LogCategory_Initialize(&dword_10020FA58, 30))
    {
      routed = self->routed;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->routed = v3;
LABEL_12:
  if (v3)
    v8 = 4;
  else
    v8 = 0;
  v9 = v8 | self->tipiAndRoutedState & 0xFFFFFFFB;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon](BTSmartRoutingDaemon, "sharedBTSmartRoutingDaemon"));
  objc_msgSend(v10, "_setTipiAndRoutedStateFlags:forDevice:", v9, self);

}

- (void)_setRoutingInitialized:(BOOL)a3
{
  _BOOL4 isRoutingActionInitialized;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  isRoutingActionInitialized = self->isRoutingActionInitialized;
  if (isRoutingActionInitialized != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (isRoutingActionInitialized)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setRoutingInitialized:]", 30, "Setting routingInit for Wx %@ %s -> %s", self->deviceAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        isRoutingActionInitialized = self->isRoutingActionInitialized;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->isRoutingActionInitialized = v4;
  }
}

- (void)_setRoutingAction:(int)a3
{
  unsigned int routingAction;
  const char *v6;
  const char *v7;

  routingAction = self->routingAction;
  if (routingAction != a3)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        if (routingAction > 5)
          v6 = "?";
        else
          v6 = off_1001E3E40[routingAction];
        if (a3 > 5)
          v7 = "?";
        else
          v7 = off_1001E3E40[a3];
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setRoutingAction:]", 30, "Setting RoutingAction for Wx %@ %s -> %s", self->deviceAddress, v6, v7);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        routingAction = self->routingAction;
        goto LABEL_4;
      }
    }
LABEL_13:
    self->routingAction = a3;
  }
}

- (void)_setRoutingUI:(int)a3
{
  unsigned int routingUI;
  const char *v6;
  const char *v7;

  routingUI = self->routingUI;
  if (routingUI != a3)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        if (routingUI > 5)
          v6 = "?";
        else
          v6 = off_1001E3E40[routingUI];
        if (a3 > 5)
          v7 = "?";
        else
          v7 = off_1001E3E40[a3];
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setRoutingUI:]", 30, "Setting RoutingUI for Wx %@ %s -> %s", self->deviceAddress, v6, v7);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        routingUI = self->routingUI;
        goto LABEL_4;
      }
    }
LABEL_13:
    self->routingUI = a3;
  }
}

- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3
{
  uint64_t v4;
  NSString *deviceAddress;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (self->tipiAndRoutedState != a3)
  {
    v4 = *(_QWORD *)&a3;
    if (dword_10020FA58 <= 30
      && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
    {
      deviceAddress = self->deviceAddress;
      v6 = ((uint64_t (*)(void))CUPrintFlags32)();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = CUPrintFlags32(v4, &unk_10018470F);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingWxDevice _setTipiAndRoutedStateFlags:]", 30, "Setting tipiAndRoutedState for Wx %@ %@ -> %@", deviceAddress, v7, v9);

    }
    self->tipiAndRoutedState = v4;
  }
}

- (NSString)deviceAddress
{
  return self->deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)firstBannerShown
{
  return self->firstBannerShown;
}

- (unint64_t)hijackBackoffTicks
{
  return self->hijackBackoffTicks;
}

- (BOOL)hasOwnership
{
  return self->hasOwnership;
}

- (BOOL)isRoutingActionInitialized
{
  return self->isRoutingActionInitialized;
}

- (BOOL)manuallyRouted
{
  return self->manuallyRouted;
}

- (BOOL)manualRouteChangeInProgress
{
  return self->manualRouteChangeInProgress;
}

- (unsigned)otherTipiAudioCategory
{
  return self->otherTipiAudioCategory;
}

- (NSString)otherTipiDeviceBTAddress
{
  return self->otherTipiDeviceBTAddress;
}

- (NSString)otherTipiDeviceBTName
{
  return self->otherTipiDeviceBTName;
}

- (BOOL)otherTipiDeviceIsWatch
{
  return self->otherTipiDeviceIsWatch;
}

- (void)setOtherTipiDeviceIsWatch:(BOOL)a3
{
  self->otherTipiDeviceIsWatch = a3;
}

- (BOOL)otherTipiDeviceIsStreamingAudio
{
  return self->otherTipiDeviceIsStreamingAudio;
}

- (int64_t)otherTipiDeviceMajorBuildVersion
{
  return self->otherTipiDeviceMajorBuildVersion;
}

- (int64_t)otherTipiDeviceMinorBuildVersion
{
  return self->otherTipiDeviceMinorBuildVersion;
}

- (NSString)otherTipiDevicePlayingApp
{
  return self->otherTipiDevicePlayingApp;
}

- (void)setOtherTipiDevicePlayingApp:(id)a3
{
  objc_storeStrong((id *)&self->otherTipiDevicePlayingApp, a3);
}

- (NSNumber)otherTipiDeviceVersion
{
  return self->otherTipiDeviceVersion;
}

- (unint64_t)otherTipiManuallyRouteTicks
{
  return self->otherTipiManuallyRouteTicks;
}

- (BOOL)routed
{
  return self->routed;
}

- (int)routingAction
{
  return self->routingAction;
}

- (int)routingUI
{
  return self->routingUI;
}

- (unsigned)tipiAndRoutedState
{
  return self->tipiAndRoutedState;
}

- (id)audioRoutingResponse
{
  return self->_audioRoutingResponse;
}

- (void)setAudioRoutingResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BTAudioRoutingRequest)audioRoutingRequest
{
  return self->_audioRoutingRequest;
}

- (void)setAudioRoutingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_audioRoutingRequest, a3);
}

- (unsigned)audioRoutingClientID
{
  return self->_audioRoutingClientID;
}

- (void)setAudioRoutingClientID:(unsigned int)a3
{
  self->_audioRoutingClientID = a3;
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (void)setAudioRoutingScore:(int)a3
{
  self->_audioRoutingScore = a3;
}

- (BTAudioSession)audioSessionInProgress
{
  return self->_audioSessionInProgress;
}

- (void)setAudioSessionInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionInProgress, a3);
}

- (id)audioSessionInProgressResponse
{
  return self->_audioSessionInProgressResponse;
}

- (void)setAudioSessionInProgressResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSMutableDictionary)audioSessionMap
{
  return self->_audioSessionMap;
}

- (void)setAudioSessionMap:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionMap, a3);
}

- (NSString)conduitDeviceID
{
  return self->_conduitDeviceID;
}

- (void)setConduitDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unint64_t)conduitMessageTicks
{
  return self->_conduitMessageTicks;
}

- (void)setConduitMessageTicks:(unint64_t)a3
{
  self->_conduitMessageTicks = a3;
}

- (OS_dispatch_source)conduitMessageTimer
{
  return self->_conduitMessageTimer;
}

- (void)setConduitMessageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_conduitMessageTimer, a3);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)hfpSetupFailureNotifyRegistered
{
  return self->_hfpSetupFailureNotifyRegistered;
}

- (void)setHfpSetupFailureNotifyRegistered:(BOOL)a3
{
  self->_hfpSetupFailureNotifyRegistered = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)ignoreManualConnect
{
  return self->_ignoreManualConnect;
}

- (void)setIgnoreManualConnect:(BOOL)a3
{
  self->_ignoreManualConnect = a3;
}

- (BOOL)inEar
{
  return self->_inEar;
}

- (void)setInEar:(BOOL)a3
{
  self->_inEar = a3;
}

- (BOOL)inEarDisabled
{
  return self->_inEarDisabled;
}

- (void)setInEarDisabled:(BOOL)a3
{
  self->_inEarDisabled = a3;
}

- (BOOL)isTipiHealingV2Eligible
{
  return self->_isTipiHealingV2Eligible;
}

- (void)setIsTipiHealingV2Eligible:(BOOL)a3
{
  self->_isTipiHealingV2Eligible = a3;
}

- (BOOL)lastPlay
{
  return self->_lastPlay;
}

- (void)setLastPlay:(BOOL)a3
{
  self->_lastPlay = a3;
}

- (double)lowestBudBatteryInfo
{
  return self->_lowestBudBatteryInfo;
}

- (void)setLowestBudBatteryInfo:(double)a3
{
  self->_lowestBudBatteryInfo = a3;
}

- (int)otherTipiDeviceAudioScore
{
  return self->_otherTipiDeviceAudioScore;
}

- (void)setOtherTipiDeviceAudioScore:(int)a3
{
  self->_otherTipiDeviceAudioScore = a3;
}

- (unint64_t)otherTipiDeviceIdleTick
{
  return self->_otherTipiDeviceIdleTick;
}

- (void)setOtherTipiDeviceIdleTick:(unint64_t)a3
{
  self->_otherTipiDeviceIdleTick = a3;
}

- (BOOL)otherTipiDeviceLastPlay
{
  return self->_otherTipiDeviceLastPlay;
}

- (void)setOtherTipiDeviceLastPlay:(BOOL)a3
{
  self->_otherTipiDeviceLastPlay = a3;
}

- (BOOL)ownershipMonitorRegistered
{
  return self->_ownershipMonitorRegistered;
}

- (void)setOwnershipMonitorRegistered:(BOOL)a3
{
  self->_ownershipMonitorRegistered = a3;
}

- (BOOL)proactiveRoutingBackoff
{
  return self->_proactiveRoutingBackoff;
}

- (void)setProactiveRoutingBackoff:(BOOL)a3
{
  self->_proactiveRoutingBackoff = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (BOOL)tipiHealingBackoff
{
  return self->_tipiHealingBackoff;
}

- (void)setTipiHealingBackoff:(BOOL)a3
{
  self->_tipiHealingBackoff = a3;
}

- (BOOL)tipitableUpdated
{
  return self->_tipitableUpdated;
}

- (void)setTipitableUpdated:(BOOL)a3
{
  self->_tipitableUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_conduitMessageTimer, 0);
  objc_storeStrong((id *)&self->_conduitDeviceID, 0);
  objc_storeStrong((id *)&self->_audioSessionMap, 0);
  objc_storeStrong(&self->_audioSessionInProgressResponse, 0);
  objc_storeStrong((id *)&self->_audioSessionInProgress, 0);
  objc_storeStrong((id *)&self->_audioRoutingRequest, 0);
  objc_storeStrong(&self->_audioRoutingResponse, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceVersion, 0);
  objc_storeStrong((id *)&self->otherTipiDevicePlayingApp, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceBTName, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceBTAddress, 0);
  objc_storeStrong((id *)&self->deviceAddress, 0);
}

@end
