@implementation SFCombinedDevice

- (id)description
{
  id v3;
  void *v4;
  SFDevice *bleDevice;
  void *v6;
  RPCompanionLinkDevice *clinkDevice;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice name](self, "name"));
  objc_msgSend(v3, "appendFormat:", CFSTR("SFCombinedDevice \"%@\": "), v4);

  bleDevice = self->_bleDevice;
  if (bleDevice)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](bleDevice, "identifier"));
    objc_msgSend(v3, "appendFormat:", CFSTR(", BLE %@"), v6);

  }
  clinkDevice = self->_clinkDevice;
  if (clinkDevice)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice effectiveIdentifier](clinkDevice, "effectiveIdentifier"));
    objc_msgSend(v3, "appendFormat:", CFSTR(", CL %@"), v8);

  }
  v9 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_clinkDevice, "mediaRouteIdentifier"));
  v10 = (void *)v9;
  if (v9)
    objc_msgSend(v3, "appendFormat:", CFSTR(", CL.MR %@"), v9);

  if (self->_notificationInfo)
    objc_msgSend(v3, "appendString:", CFSTR(", notif"));
  v11 = CFSTR("HPMedia");
  switch(self->_notificationType)
  {
    case 0u:
      goto LABEL_17;
    case 1u:
      v11 = CFSTR("Unknown");
      goto LABEL_16;
    case 2u:
      goto LABEL_16;
    case 3u:
      v11 = CFSTR("HPCall");
      goto LABEL_16;
    case 4u:
      v11 = CFSTR("TVAutoFill");
      goto LABEL_16;
    case 5u:
      v11 = CFSTR("TVKeyboard");
      goto LABEL_16;
    case 6u:
      v11 = CFSTR("WatchKeyboard");
      goto LABEL_16;
    default:
      v11 = CFSTR("?");
LABEL_16:
      objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), v11);
LABEL_17:
      if (self->_route)
        objc_msgSend(v3, "appendString:", CFSTR(", route"));
      if (-[SFCombinedDevice isReady](self, "isReady"))
        objc_msgSend(v3, "appendString:", CFSTR(", ready"));
      v12 = sub_1000A4358(self->_state);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v13;
      if (v13)
        objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), v13);

      return v3;
  }
}

- (BOOL)canTransition:(int)a3
{
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = -[SFCombinedDevice _canTransition:](self, "_canTransition:");
  if (!v5
    && dword_1007B1060 <= 10
    && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 10)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice name](self, "name"));
    v7 = sub_1000A4358(self->_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = sub_1000A4358(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF(&dword_1007B1060, "-[SFCombinedDevice canTransition:]", 10, "%@ transition not allowed: %@ -> %@\n", v6, v8, v10);

  }
  return v5;
}

- (BOOL)_canTransition:(int)a3
{
  BOOL v4;
  _BOOL4 v5;
  BOOL v6;
  unsigned int v7;
  int state;
  unsigned int v9;
  unsigned int v10;

  switch(a3)
  {
    case 10:
      v4 = ((self->_state - 11) & 0xFFFFFFFB) == 0;
      goto LABEL_24;
    case 11:
      v4 = self->_state == 10;
      goto LABEL_24;
    case 12:
      v4 = self->_state == 11;
      goto LABEL_24;
    case 13:
      v5 = -[SFCombinedDevice isReady](self, "isReady");
      if (!v5)
        return v5;
      v6 = (self->_state - 11) >= 2;
LABEL_15:
      LOBYTE(v5) = !v6;
      return v5;
    case 14:
      v5 = -[SFCombinedDevice isReady](self, "isReady");
      if (!v5)
        return v5;
      v4 = self->_state == 13;
      goto LABEL_24;
    case 15:
      state = self->_state;
      v4 = state == 14 || state == 20;
      goto LABEL_24;
    case 16:
      v6 = (self->_state - 13) >= 3;
      goto LABEL_15;
    case 17:
      v4 = self->_state == 16;
      goto LABEL_24;
    case 18:
      v9 = self->_state;
      v6 = v9 >= 0x12;
      v10 = (0x34000u >> v9) & 1;
      if (v6)
        LOBYTE(v5) = 0;
      else
        LOBYTE(v5) = v10;
      return v5;
    case 19:
      v7 = self->_state;
      goto LABEL_23;
    case 20:
      v7 = self->_state & 0xFFFFFFFE;
LABEL_23:
      v4 = v7 == 18;
LABEL_24:
      LOBYTE(v5) = v4;
      break;
    default:
      LOBYTE(v5) = 0;
      break;
  }
  return v5;
}

- (BOOL)isReady
{
  unsigned int notificationType;
  RPCompanionLinkDevice *v4;
  TURoute *v5;
  SFDevice *v6;
  SFNotificationInfo *v7;
  BOOL v8;
  void *v9;
  SFNotificationInfo *notificationInfo;

  notificationType = self->_notificationType;
  if (notificationType == 2)
  {
    if (self->_forced && self->_notificationInfo)
      return 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_clinkDevice, "mediaRouteIdentifier"));

    if (v9)
    {
      if (self->_bleDevice)
      {
        notificationInfo = self->_notificationInfo;
        if (notificationInfo)
          return -[SFNotificationInfo notificationType](notificationInfo, "notificationType") == 2;
      }
    }
    return 0;
  }
  if (notificationType != 3)
    return 0;
  if (self->_forced && self->_notificationInfo)
    return 1;
  v4 = self->_clinkDevice;
  if (v4)
  {
    v5 = self->_route;
    if (v5)
    {
      v6 = self->_bleDevice;
      v8 = v6
        && RPCompanionLinkDeviceIsEqualToSFDevice(v4, v6)
        && sub_1000A46D8(v6, v5, v4)
        && (v7 = self->_notificationInfo) != 0
        && -[SFNotificationInfo notificationType](v7, "notificationType") == 3;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)effectiveID
{
  NSString *v2;
  NSString *v3;

  if (self->_forced)
  {
    v2 = self->_forcedID;
  }
  else
  {
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice mediaRouteIdentifier](self->_clinkDevice, "mediaRouteIdentifier"));
    v2 = v3;
    if (!v3 || !-[NSString length](v3, "length"))
    {

      v2 = 0;
    }
  }
  return v2;
}

- (NSString)name
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice name](self->_bleDevice, "name"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice name](self->_clinkDevice, "name"));
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(-[TURoute name](self->_route, "name"));
    v5 = v8;

  }
  return (NSString *)v5;
}

- (void)resetTicks
{
  void *v3;
  void *v4;
  id v5;

  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice name](self, "name"));
    LogPrintF(&dword_1007B1060, "-[SFCombinedDevice resetTicks]", 30, "%@ state reset\n", v3);

  }
  -[SFCombinedDevice setNotificationDurationSecs:](self, "setNotificationDurationSecs:", -1.0);
  -[SFCombinedDevice setNotificationTicks:](self, "setNotificationTicks:", -1);
  -[SFCombinedDevice setPendingContentDurationSecs:](self, "setPendingContentDurationSecs:", -1.0);
  -[SFCombinedDevice setPendingContentTicks:](self, "setPendingContentTicks:", -1);
  -[SFCombinedDevice setTransferDoneDurationSecs:](self, "setTransferDoneDurationSecs:", -1.0);
  -[SFCombinedDevice setTransferDoneTicks:](self, "setTransferDoneTicks:", -1);
  -[SFCombinedDevice setTransferPendingDurationSecs:](self, "setTransferPendingDurationSecs:", -1.0);
  -[SFCombinedDevice setTransferPendingStartTicks:](self, "setTransferPendingStartTicks:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationBubble](self, "notificationBubble"));
  objc_msgSend(v4, "reset");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice transferBubble](self, "transferBubble"));
  objc_msgSend(v5, "reset");

}

- (BOOL)stateIsClose
{
  return (self->_state - 16) < 5;
}

- (BOOL)stateIsMedium
{
  return -[SFCombinedDevice stateIsClose](self, "stateIsClose") || (self->_state - 11) < 5;
}

- (BOOL)stateIsNearby
{
  return -[SFCombinedDevice stateIsClose](self, "stateIsClose")
      || -[SFCombinedDevice stateIsMedium](self, "stateIsMedium")
      || self->_state == 10;
}

- (void)setNextState:(int)a3
{
  void *v5;
  id v6;
  void *v7;

  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice name](self, "name"));
    v6 = sub_1000A4358(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    LogPrintF(&dword_1007B1060, "-[SFCombinedDevice setNextState:]", 30, "%@ next state: %@\n", v5, v7);

  }
  self->_nextState = a3;
}

- (void)setState:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice name](self, "name"));
    v6 = sub_1000A4358(self->_state);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_1000A4358(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    LogPrintF(&dword_1007B1060, "-[SFCombinedDevice setState:]", 30, "%@ state change: %@ -> %@", v5, v7, v9);

  }
  self->_state = a3;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURL, a3);
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (BOOL)clientProvidedError
{
  return self->_clientProvidedError;
}

- (void)setClientProvidedError:(BOOL)a3
{
  self->_clientProvidedError = a3;
}

- (RPCompanionLinkDevice)clinkDevice
{
  return self->_clinkDevice;
}

- (void)setClinkDevice:(id)a3
{
  objc_storeStrong((id *)&self->_clinkDevice, a3);
}

- (int64_t)dismissReason
{
  return self->_dismissReason;
}

- (void)setDismissReason:(int64_t)a3
{
  self->_dismissReason = a3;
}

- (BOOL)forced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_forced = a3;
}

- (NSString)forcedID
{
  return self->_forcedID;
}

- (void)setForcedID:(id)a3
{
  objc_storeStrong((id *)&self->_forcedID, a3);
}

- (int)nextState
{
  return self->_nextState;
}

- (SFBubbleEstimator)notificationBubble
{
  return self->_notificationBubble;
}

- (void)setNotificationBubble:(id)a3
{
  objc_storeStrong((id *)&self->_notificationBubble, a3);
}

- (SFNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_notificationInfo, a3);
}

- (unsigned)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unsigned int)a3
{
  self->_notificationType = a3;
}

- (BOOL)medBubbleDelayed
{
  return self->_medBubbleDelayed;
}

- (void)setMedBubbleDelayed:(BOOL)a3
{
  self->_medBubbleDelayed = a3;
}

- (TURoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (int)state
{
  return self->_state;
}

- (SFBubbleEstimator)transferBubble
{
  return self->_transferBubble;
}

- (void)setTransferBubble:(id)a3
{
  objc_storeStrong((id *)&self->_transferBubble, a3);
}

- (unint64_t)notificationTicks
{
  return self->_notificationTicks;
}

- (void)setNotificationTicks:(unint64_t)a3
{
  self->_notificationTicks = a3;
}

- (double)notificationDurationSecs
{
  return self->_notificationDurationSecs;
}

- (void)setNotificationDurationSecs:(double)a3
{
  self->_notificationDurationSecs = a3;
}

- (unint64_t)pendingContentTicks
{
  return self->_pendingContentTicks;
}

- (void)setPendingContentTicks:(unint64_t)a3
{
  self->_pendingContentTicks = a3;
}

- (double)pendingContentDurationSecs
{
  return self->_pendingContentDurationSecs;
}

- (void)setPendingContentDurationSecs:(double)a3
{
  self->_pendingContentDurationSecs = a3;
}

- (unint64_t)transferDoneTicks
{
  return self->_transferDoneTicks;
}

- (void)setTransferDoneTicks:(unint64_t)a3
{
  self->_transferDoneTicks = a3;
}

- (double)transferDoneDurationSecs
{
  return self->_transferDoneDurationSecs;
}

- (void)setTransferDoneDurationSecs:(double)a3
{
  self->_transferDoneDurationSecs = a3;
}

- (unint64_t)transferPendingStartTicks
{
  return self->_transferPendingStartTicks;
}

- (void)setTransferPendingStartTicks:(unint64_t)a3
{
  self->_transferPendingStartTicks = a3;
}

- (double)transferPendingDurationSecs
{
  return self->_transferPendingDurationSecs;
}

- (void)setTransferPendingDurationSecs:(double)a3
{
  self->_transferPendingDurationSecs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferBubble, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_notificationBubble, 0);
  objc_storeStrong((id *)&self->_forcedID, 0);
  objc_storeStrong((id *)&self->_clinkDevice, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
}

@end
