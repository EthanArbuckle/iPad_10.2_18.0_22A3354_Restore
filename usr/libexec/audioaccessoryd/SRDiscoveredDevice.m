@implementation SRDiscoveredDevice

- (void)_setBtAddress:(id)a3
{
  NSString **p_btAddress;
  NSString *btAddress;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = a3;
  btAddress = self->_btAddress;
  p_btAddress = &self->_btAddress;
  v7 = -[NSString isEqualToString:](btAddress, "isEqualToString:", v9);
  v8 = v9;
  if ((v7 & 1) == 0)
  {
    if (dword_10020FE98 <= 30
      && (dword_10020FE98 != -1 || _LogCategory_Initialize(&dword_10020FE98, 30)))
    {
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setBtAddress:]", 30, "Setting btaddress %@ -> %@", *p_btAddress, v9);
    }
    objc_storeStrong((id *)p_btAddress, a3);
    v8 = v9;
  }

}

- (void)_setConnectionState:(unsigned __int8)a3
{
  unsigned int connectionState;
  unsigned int v4;
  const char *v6;
  const char *v7;

  connectionState = self->_connectionState;
  if (connectionState != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        if (connectionState > 3)
          v6 = "?";
        else
          v6 = (&off_1001E5340)[(char)connectionState];
        if (v4 > 3)
          v7 = "?";
        else
          v7 = (&off_1001E5340)[(char)v4];
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setConnectionState:]", 30, "Setting connectionState %s -> %s", v6, v7);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        connectionState = self->_connectionState;
        goto LABEL_4;
      }
    }
LABEL_13:
    self->_connectionState = v4;
  }
}

- (void)_setIsNearby:(BOOL)a3
{
  _BOOL4 isNearby;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  isNearby = self->_isNearby;
  if (isNearby != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (isNearby)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setIsNearby:]", 30, "Setting isNearby %@ %s -> %s", self->_btAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        isNearby = self->_isNearby;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_isNearby = v4;
  }
}

- (void)_setInUseBannerBackoffTick:(unint64_t)a3
{
  unint64_t inUseBannerBackoffTick;

  inUseBannerBackoffTick = self->_inUseBannerBackoffTick;
  if (inUseBannerBackoffTick != a3)
  {
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FE98, 30))
          goto LABEL_6;
        inUseBannerBackoffTick = self->_inUseBannerBackoffTick;
      }
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setInUseBannerBackoffTick:]", 30, "Setting inUseBannerBackoffTick %@ %u -> %u", self->_btAddress, inUseBannerBackoffTick, a3);
    }
LABEL_6:
    self->_inUseBannerBackoffTick = a3;
  }
}

- (void)_setInUseBannerBackoffReason:(id)a3
{
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[NSString isEqualToString:](self->_inUseBannerBackoffReason, "isEqualToString:", v7);
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (dword_10020FE98 <= 30
      && (dword_10020FE98 != -1 || _LogCategory_Initialize(&dword_10020FE98, 30)))
    {
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setInUseBannerBackoffReason:]", 30, "Setting inUseBannerBackoff %@ %@ -> %@", self->_btAddress, self->_inUseBannerBackoffReason, v7);
    }
    objc_storeStrong((id *)&self->_inUseBannerBackoffReason, a3);
    v6 = v7;
  }

}

- (void)_setInUseBannerShown:(BOOL)a3
{
  _BOOL4 inUseBannerShown;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  inUseBannerShown = self->_inUseBannerShown;
  if (inUseBannerShown != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (inUseBannerShown)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setInUseBannerShown:]", 30, "Setting inUseBannerShown %@ %s -> %s", self->_btAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        inUseBannerShown = self->_inUseBannerShown;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_inUseBannerShown = v4;
  }
}

- (void)_setMutedSpeakerForRemotePhoneCall:(BOOL)a3
{
  _BOOL4 mutedSpeakerForRemotePhoneCall;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  mutedSpeakerForRemotePhoneCall = self->_mutedSpeakerForRemotePhoneCall;
  if (mutedSpeakerForRemotePhoneCall != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (mutedSpeakerForRemotePhoneCall)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setMutedSpeakerForRemotePhoneCall:]", 30, "Setting muted speaker for remote phone call %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        mutedSpeakerForRemotePhoneCall = self->_mutedSpeakerForRemotePhoneCall;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_mutedSpeakerForRemotePhoneCall = v4;
  }
}

- (void)_setNearbyiCloudSignIn:(BOOL)a3
{
  _BOOL4 nearbyiCloudSignIn;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  nearbyiCloudSignIn = self->_nearbyiCloudSignIn;
  if (nearbyiCloudSignIn != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (nearbyiCloudSignIn)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyiCloudSignIn:]", 30, "Setting nearbyiCloudSignIn %@ %s -> %s", self->_btAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        nearbyiCloudSignIn = self->_nearbyiCloudSignIn;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_nearbyiCloudSignIn = v4;
  }
}

- (void)_setNearbyInEar:(int)a3
{
  uint64_t nearbyInEar;
  const char *v6;
  const char *v7;

  if (dword_10020FE98 <= 30 && (dword_10020FE98 != -1 || _LogCategory_Initialize(&dword_10020FE98, 30)))
  {
    nearbyInEar = self->_nearbyInEar;
    if (nearbyInEar > 7)
      v6 = "?";
    else
      v6 = (&off_1001E5360)[nearbyInEar];
    if (a3 > 7)
      v7 = "?";
    else
      v7 = (&off_1001E5360)[a3];
    LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyInEar:]", 30, "Setting nearbyInEar %@ %s -> %s", self->_btAddress, v6, v7);
  }
  self->_nearbyInEar = a3;
}

- (void)_setNearbyLastRouteHost:(id)a3
{
  NSData *nearbyLastRouteHost;

  if (!a3 && !-[NSData isEqualToData:](self->_nearbyLastRouteHost, "isEqualToData:"))
  {
    if (dword_10020FE98 <= 30
      && (dword_10020FE98 != -1 || _LogCategory_Initialize(&dword_10020FE98, 30)))
    {
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyLastRouteHost:]", 30, "Setting nearbyLastRouteHost %@ %@ -> %@", self->_btAddress, self->_nearbyLastRouteHost, 0);
    }
    nearbyLastRouteHost = self->_nearbyLastRouteHost;
    self->_nearbyLastRouteHost = 0;

  }
}

- (void)_setNearbyName:(id)a3
{
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[NSString isEqualToString:](self->_nearbyName, "isEqualToString:", v7);
  v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (dword_10020FE98 <= 30
      && (dword_10020FE98 != -1 || _LogCategory_Initialize(&dword_10020FE98, 30)))
    {
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyName:]", 30, "Setting nearbyName %@ %@ -> %@", self->_btAddress, self->_nearbyName, v7);
    }
    objc_storeStrong((id *)&self->_nearbyName, a3);
    v6 = v7;
  }

}

- (void)_setNearbyOutOfCaseTime:(unsigned __int8)a3
{
  unsigned int nearbyOutOfCaseTime;
  uint64_t v4;

  nearbyOutOfCaseTime = self->_nearbyOutOfCaseTime;
  if (nearbyOutOfCaseTime != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FE98, 30))
          goto LABEL_6;
        nearbyOutOfCaseTime = self->_nearbyOutOfCaseTime;
      }
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyOutOfCaseTime:]", 30, "Setting outOfCaseTime %@ %d -> %d", self->_btAddress, nearbyOutOfCaseTime, v4);
    }
LABEL_6:
    self->_nearbyOutOfCaseTime = v4;
  }
}

- (void)_setNearbyPaired:(BOOL)a3
{
  _BOOL4 nearbyPaired;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  nearbyPaired = self->_nearbyPaired;
  if (nearbyPaired != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (nearbyPaired)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyPaired:]", 30, "Setting nearbyPaired %@ %s -> %s", self->_btAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        nearbyPaired = self->_nearbyPaired;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_nearbyPaired = v4;
  }
}

- (void)_setNearbyProductID:(unsigned int)a3
{
  uint64_t nearbyProductID;
  uint64_t v4;

  nearbyProductID = self->_nearbyProductID;
  if ((_DWORD)nearbyProductID != a3)
  {
    v4 = *(_QWORD *)&a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FE98, 30))
          goto LABEL_6;
        nearbyProductID = self->_nearbyProductID;
      }
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyProductID:]", 30, "Setting nearbyProductID %@ %u -> %u", self->_btAddress, nearbyProductID, v4);
    }
LABEL_6:
    self->_nearbyProductID = v4;
  }
}

- (void)_setNearbyPrevInEar:(int)a3
{
  uint64_t nearbyPrevInEar;
  const char *v6;
  const char *v7;

  if (dword_10020FE98 <= 30 && (dword_10020FE98 != -1 || _LogCategory_Initialize(&dword_10020FE98, 30)))
  {
    nearbyPrevInEar = self->_nearbyPrevInEar;
    if (nearbyPrevInEar > 7)
      v6 = "?";
    else
      v6 = (&off_1001E5360)[nearbyPrevInEar];
    if (a3 > 7)
      v7 = "?";
    else
      v7 = (&off_1001E5360)[a3];
    LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyPrevInEar:]", 30, "Setting nearbyPrevInEar %@ %s -> %s", self->_btAddress, v6, v7);
  }
  self->_nearbyPrevInEar = a3;
}

- (void)_setNearbyConnectedSourceCount:(unsigned __int8)a3
{
  unsigned int nearbyConnectedSourceCount;
  uint64_t v4;

  nearbyConnectedSourceCount = self->_nearbyConnectedSourceCount;
  if (nearbyConnectedSourceCount != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FE98, 30))
          goto LABEL_6;
        nearbyConnectedSourceCount = self->_nearbyConnectedSourceCount;
      }
      LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyConnectedSourceCount:]", 30, "Setting nearbyConnectedSourceCount %@ %d -> %d", self->_btAddress, nearbyConnectedSourceCount, v4);
    }
LABEL_6:
    self->_nearbyConnectedSourceCount = v4;
  }
}

- (void)_setNearbyStreamState:(int64_t)a3
{
  unint64_t nearbyStreamState;
  const char *v6;
  const char *v7;

  nearbyStreamState = self->_nearbyStreamState;
  if (nearbyStreamState != a3)
  {
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        if (nearbyStreamState > 3)
          v6 = "?";
        else
          v6 = (&off_1001E53A0)[nearbyStreamState];
        if ((unint64_t)a3 > 3)
          v7 = "?";
        else
          v7 = (&off_1001E53A0)[a3];
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setNearbyStreamState:]", 30, "Setting nearbyStreamState %@ %s -> %s", self->_btAddress, v6, v7);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        nearbyStreamState = self->_nearbyStreamState;
        goto LABEL_4;
      }
    }
LABEL_13:
    self->_nearbyStreamState = a3;
  }
}

- (void)_setNearbyWxDevice:(id)a3
{
  SFDevice *v5;
  SFDevice **p_nearbyWxDevice;
  SFDevice *nearbyWxDevice;
  SFDevice *v8;

  v5 = (SFDevice *)a3;
  nearbyWxDevice = self->_nearbyWxDevice;
  p_nearbyWxDevice = &self->_nearbyWxDevice;
  if (nearbyWxDevice != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_nearbyWxDevice, a3);
    v5 = v8;
  }

}

- (void)_setRouteToWxAfterUnhide:(BOOL)a3
{
  _BOOL4 routeToWxAfterUnhide;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  routeToWxAfterUnhide = self->_routeToWxAfterUnhide;
  if (routeToWxAfterUnhide != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (routeToWxAfterUnhide)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setRouteToWxAfterUnhide:]", 30, "Setting routeToWxAfterUnhide %@ %s -> %s", self->_btAddress, v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        routeToWxAfterUnhide = self->_routeToWxAfterUnhide;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_routeToWxAfterUnhide = v4;
  }
}

- (void)_setUserConnectedState:(BOOL)a3
{
  _BOOL4 userConnectedState;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  userConnectedState = self->_userConnectedState;
  if (userConnectedState != a3)
  {
    v4 = a3;
    if (dword_10020FE98 <= 30)
    {
      if (dword_10020FE98 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (userConnectedState)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FE98, "-[SRDiscoveredDevice _setUserConnectedState:]", 30, "Setting userConnectedState %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FE98, 30))
      {
        userConnectedState = self->_userConnectedState;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_userConnectedState = v4;
  }
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (unint64_t)inUseBannerBackoffTick
{
  return self->_inUseBannerBackoffTick;
}

- (NSString)inUseBannerBackoffReason
{
  return self->_inUseBannerBackoffReason;
}

- (BOOL)inUseBannerShown
{
  return self->_inUseBannerShown;
}

- (BOOL)mutedSpeakerForRemotePhoneCall
{
  return self->_mutedSpeakerForRemotePhoneCall;
}

- (BOOL)nearbyiCloudSignIn
{
  return self->_nearbyiCloudSignIn;
}

- (int)nearbyInEar
{
  return self->_nearbyInEar;
}

- (NSData)nearbyLastRouteHost
{
  return self->_nearbyLastRouteHost;
}

- (NSString)nearbyName
{
  return self->_nearbyName;
}

- (unsigned)nearbyOutOfCaseTime
{
  return self->_nearbyOutOfCaseTime;
}

- (int)nearbyPrevInEar
{
  return self->_nearbyPrevInEar;
}

- (BOOL)nearbyPaired
{
  return self->_nearbyPaired;
}

- (unsigned)nearbyProductID
{
  return self->_nearbyProductID;
}

- (unsigned)nearbyConnectedSourceCount
{
  return self->_nearbyConnectedSourceCount;
}

- (int64_t)nearbyStreamState
{
  return self->_nearbyStreamState;
}

- (SFDevice)nearbyWxDevice
{
  return self->_nearbyWxDevice;
}

- (BOOL)routeToWxAfterUnhide
{
  return self->_routeToWxAfterUnhide;
}

- (BOOL)userConnectedState
{
  return self->_userConnectedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyWxDevice, 0);
  objc_storeStrong((id *)&self->_nearbyName, 0);
  objc_storeStrong((id *)&self->_nearbyLastRouteHost, 0);
  objc_storeStrong((id *)&self->_inUseBannerBackoffReason, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
}

@end
