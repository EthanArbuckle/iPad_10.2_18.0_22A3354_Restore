@implementation AudioAccessoryDevice

- (BOOL)updateWithAADeviceRecord:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "allowNoiseManagementOff");
  if (_os_feature_enabled_impl("AudioAccessoryFeatures", "AllowListeningModeOff")
    && (_DWORD)v5 != -[AudioAccessoryDevice listeningModeOffAllowed](self, "listeningModeOffAllowed"))
  {
    -[AudioAccessoryDevice setListeningModeOffAllowed:](self, "setListeningModeOffAllowed:", v5);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v4, "headGestureMode");
  if ((_DWORD)v7 != -[AudioAccessoryDevice headGestureToggle](self, "headGestureToggle"))
  {
    -[AudioAccessoryDevice setHeadGestureToggle:](self, "setHeadGestureToggle:", v7);
    v6 = 1;
  }
  v8 = objc_msgSend(v4, "acceptReplyPlayPauseConfig");
  if ((_DWORD)v8 != -[AudioAccessoryDevice acceptReplyPlayPauseConfig](self, "acceptReplyPlayPauseConfig"))
  {
    -[AudioAccessoryDevice setAcceptReplyPlayPauseConfig:](self, "setAcceptReplyPlayPauseConfig:", v8);
    v6 = 1;
  }
  v9 = objc_msgSend(v4, "declineDismissSkipConfig");
  if ((_DWORD)v9 == -[AudioAccessoryDevice declineDismissSkipConfig](self, "declineDismissSkipConfig"))
  {
    if (!v6)
    {
      v10 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    -[AudioAccessoryDevice setDeclineDismissSkipConfig:](self, "setDeclineDismissSkipConfig:", v9);
  }
  if (dword_10020F840 <= 30)
  {
    if (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30))
      LogPrintF(&dword_10020F840, "-[AudioAccessoryDevice(AARecord) updateWithAADeviceRecord:]", 30, "AADeviceRecord changed: %@", v4);
    if (dword_10020F840 <= 30
      && (dword_10020F840 != -1 || _LogCategory_Initialize(&dword_10020F840, 30)))
    {
      LogPrintF(&dword_10020F840, "-[AudioAccessoryDevice(AARecord) updateWithAADeviceRecord:]", 30, "updated device with AADeviceRecord, device: %@", self);
    }
  }
  v10 = 1;
LABEL_22:

  return v10;
}

@end
