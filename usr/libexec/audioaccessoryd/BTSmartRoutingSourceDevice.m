@implementation BTSmartRoutingSourceDevice

- (void)_setBuiltInMicAudioDeviceID:(unsigned int)a3
{
  unsigned int builtInMicAudioDeviceID;

  builtInMicAudioDeviceID = self->builtInMicAudioDeviceID;
  if (builtInMicAudioDeviceID != a3)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_6;
        builtInMicAudioDeviceID = self->builtInMicAudioDeviceID;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setBuiltInMicAudioDeviceID:]", 30, "Setting builtInMic audio device ID %u -> %u", builtInMicAudioDeviceID, a3);
    }
LABEL_6:
    self->builtInMicAudioDeviceID = a3;
  }
}

- (void)_setBuiltInSpeakerAudioDeviceID:(unsigned int)a3
{
  unsigned int builtInSpeakerAudioDeviceID;

  builtInSpeakerAudioDeviceID = self->builtInSpeakerAudioDeviceID;
  if (builtInSpeakerAudioDeviceID != a3)
  {
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10020FA58, 30))
          goto LABEL_6;
        builtInSpeakerAudioDeviceID = self->builtInSpeakerAudioDeviceID;
      }
      LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setBuiltInSpeakerAudioDeviceID:]", 30, "Setting builtInSpeaker audio device ID %u -> %u", builtInSpeakerAudioDeviceID, a3);
    }
LABEL_6:
    self->builtInSpeakerAudioDeviceID = a3;
  }
}

- (void)_updateHijackBlockingClientWithBundleID:(id)a3 mode:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *hijackBlockingClientSet;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  const __CFString *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  hijackBlockingClientSet = self->hijackBlockingClientSet;
  v12 = v6;
  if (v4)
  {
    if (!hijackBlockingClientSet)
    {
      v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v9 = self->hijackBlockingClientSet;
      self->hijackBlockingClientSet = v8;

      v6 = v12;
      hijackBlockingClientSet = self->hijackBlockingClientSet;
    }
    -[NSMutableSet addObject:](hijackBlockingClientSet, "addObject:", v6);
  }
  else
  {
    -[NSMutableSet removeObject:](hijackBlockingClientSet, "removeObject:", v6);
    if (!-[NSMutableSet count](self->hijackBlockingClientSet, "count"))
    {
      v10 = self->hijackBlockingClientSet;
      self->hijackBlockingClientSet = 0;

    }
  }
  if (dword_10020FA58 <= 30 && (dword_10020FA58 != -1 || _LogCategory_Initialize(&dword_10020FA58, 30)))
  {
    v11 = CFSTR("Removed");
    if (v4)
      v11 = CFSTR("Added");
    LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _updateHijackBlockingClientWithBundleID:mode:]", 30, "%@ Hijackblocking client %@ clients %@", v11, v12, self->hijackBlockingClientSet);
  }

}

- (void)_setHijackedByPhoneCall:(BOOL)a3
{
  _BOOL4 hijackedByPhoneCall;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  hijackedByPhoneCall = self->hijackedByPhoneCall;
  if (hijackedByPhoneCall != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (hijackedByPhoneCall)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setHijackedByPhoneCall:]", 30, "Setting hijacked by phone %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        hijackedByPhoneCall = self->hijackedByPhoneCall;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->hijackedByPhoneCall = v4;
  }
}

- (void)_setIncomingCallRingtoneState:(BOOL)a3
{
  _BOOL4 incomingCallRingtone;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  incomingCallRingtone = self->incomingCallRingtone;
  if (incomingCallRingtone != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (incomingCallRingtone)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setIncomingCallRingtoneState:]", 30, "Setting incoming call ringtone state %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        incomingCallRingtone = self->incomingCallRingtone;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->incomingCallRingtone = v4;
  }
}

- (void)_setSpeakerRouteChangeInProgress:(BOOL)a3
{
  _BOOL4 routeChangeToSpeakerInProgress;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  routeChangeToSpeakerInProgress = self->routeChangeToSpeakerInProgress;
  if (routeChangeToSpeakerInProgress != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (routeChangeToSpeakerInProgress)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setSpeakerRouteChangeInProgress:]", 30, "Setting speaker route change %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        routeChangeToSpeakerInProgress = self->routeChangeToSpeakerInProgress;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->routeChangeToSpeakerInProgress = v4;
  }
}

- (void)_setTUIncomingCallState:(BOOL)a3
{
  _BOOL4 TUIncomingCallAnswered;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  TUIncomingCallAnswered = self->TUIncomingCallAnswered;
  if (TUIncomingCallAnswered != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (TUIncomingCallAnswered)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setTUIncomingCallState:]", 30, "Setting TUIncomingCallAnswered %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        TUIncomingCallAnswered = self->TUIncomingCallAnswered;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->TUIncomingCallAnswered = v4;
  }
}

- (void)_setShouldStayOnVirtual:(BOOL)a3
{
  _BOOL4 shouldStayOnVirtual;
  _BOOL4 v4;
  const char *v6;
  const char *v7;

  shouldStayOnVirtual = self->shouldStayOnVirtual;
  if (shouldStayOnVirtual != a3)
  {
    v4 = a3;
    if (dword_10020FA58 <= 30)
    {
      if (dword_10020FA58 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (shouldStayOnVirtual)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        LogPrintF(&dword_10020FA58, "-[BTSmartRoutingSourceDevice _setShouldStayOnVirtual:]", 30, "Setting shouldStayOnVirtual %s -> %s", v7, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_10020FA58, 30))
      {
        shouldStayOnVirtual = self->shouldStayOnVirtual;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->shouldStayOnVirtual = v4;
  }
}

- (unsigned)builtInMicAudioDeviceID
{
  return self->builtInMicAudioDeviceID;
}

- (void)setBuiltInMicAudioDeviceID:(unsigned int)a3
{
  self->builtInMicAudioDeviceID = a3;
}

- (unsigned)builtInSpeakerAudioDeviceID
{
  return self->builtInSpeakerAudioDeviceID;
}

- (void)setBuiltInSpeakerAudioDeviceID:(unsigned int)a3
{
  self->builtInSpeakerAudioDeviceID = a3;
}

- (NSMutableSet)hijackBlockingClientSet
{
  return self->hijackBlockingClientSet;
}

- (void)setHijackBlockingClientSet:(id)a3
{
  objc_storeStrong((id *)&self->hijackBlockingClientSet, a3);
}

- (BOOL)hijackedByPhoneCall
{
  return self->hijackedByPhoneCall;
}

- (BOOL)incomingCallRingtone
{
  return self->incomingCallRingtone;
}

- (BOOL)routeChangeToSpeakerInProgress
{
  return self->routeChangeToSpeakerInProgress;
}

- (void)setRouteChangeToSpeakerInProgress:(BOOL)a3
{
  self->routeChangeToSpeakerInProgress = a3;
}

- (BOOL)TUIncomingCallAnswered
{
  return self->TUIncomingCallAnswered;
}

- (BOOL)shouldStayOnVirtual
{
  return self->shouldStayOnVirtual;
}

- (NSString)activePlayingApp
{
  return self->_activePlayingApp;
}

- (void)setActivePlayingApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (void)setAudioDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (void)setAudioRoute:(int)a3
{
  self->_audioRoute = a3;
}

- (unsigned)audioRouteDevice
{
  return self->_audioRouteDevice;
}

- (void)setAudioRouteDevice:(unsigned int)a3
{
  self->_audioRouteDevice = a3;
}

- (BOOL)audioRouteDeviceRegistered
{
  return self->_audioRouteDeviceRegistered;
}

- (void)setAudioRouteDeviceRegistered:(BOOL)a3
{
  self->_audioRouteDeviceRegistered = a3;
}

- (NSMutableDictionary)audioSessionkMap
{
  return self->_audioSessionkMap;
}

- (void)setAudioSessionkMap:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionkMap, a3);
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (BOOL)builtInMicRegistered
{
  return self->_builtInMicRegistered;
}

- (void)setBuiltInMicRegistered:(BOOL)a3
{
  self->_builtInMicRegistered = a3;
}

- (BOOL)builtInSpeakerRegistered
{
  return self->_builtInSpeakerRegistered;
}

- (void)setBuiltInSpeakerRegistered:(BOOL)a3
{
  self->_builtInSpeakerRegistered = a3;
}

- (int)callIncomingConnected
{
  return self->_callIncomingConnected;
}

- (void)setCallIncomingConnected:(int)a3
{
  self->_callIncomingConnected = a3;
}

- (int)callIncomingUnconnected
{
  return self->_callIncomingUnconnected;
}

- (void)setCallIncomingUnconnected:(int)a3
{
  self->_callIncomingUnconnected = a3;
}

- (unint64_t)callStartTicks
{
  return self->_callStartTicks;
}

- (void)setCallStartTicks:(unint64_t)a3
{
  self->_callStartTicks = a3;
}

- (NSSet)conferencingCallSets
{
  return self->_conferencingCallSets;
}

- (void)setConferencingCallSets:(id)a3
{
  objc_storeStrong((id *)&self->_conferencingCallSets, a3);
}

- (NSString)evalPreemptiveBannerResult
{
  return self->_evalPreemptiveBannerResult;
}

- (void)setEvalPreemptiveBannerResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSMutableDictionary)evalWxMap
{
  return self->_evalWxMap;
}

- (void)setEvalWxMap:(id)a3
{
  objc_storeStrong((id *)&self->_evalWxMap, a3);
}

- (NSString)evalResult
{
  return self->_evalResult;
}

- (void)setEvalResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)evalTicks
{
  return self->_evalTicks;
}

- (void)setEvalTicks:(unint64_t)a3
{
  self->_evalTicks = a3;
}

- (unint64_t)hfpSetupFailTicks
{
  return self->_hfpSetupFailTicks;
}

- (void)setHfpSetupFailTicks:(unint64_t)a3
{
  self->_hfpSetupFailTicks = a3;
}

- (BOOL)magnetConnected
{
  return self->_magnetConnected;
}

- (void)setMagnetConnected:(BOOL)a3
{
  self->_magnetConnected = a3;
}

- (unint64_t)manualRouteSpeakerTicks
{
  return self->_manualRouteSpeakerTicks;
}

- (void)setManualRouteSpeakerTicks:(unint64_t)a3
{
  self->_manualRouteSpeakerTicks = a3;
}

- (NSMutableDictionary)isFirstConnectionAfterSREnable
{
  return self->_isFirstConnectionAfterSREnable;
}

- (void)setIsFirstConnectionAfterSREnable:(id)a3
{
  objc_storeStrong((id *)&self->_isFirstConnectionAfterSREnable, a3);
}

- (unint64_t)predictiveRouteTicks
{
  return self->_predictiveRouteTicks;
}

- (void)setPredictiveRouteTicks:(unint64_t)a3
{
  self->_predictiveRouteTicks = a3;
}

- (NSString)routeToSpeakerReason
{
  return self->_routeToSpeakerReason;
}

- (void)setRouteToSpeakerReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)routingRequestWx
{
  return self->_routingRequestWx;
}

- (void)setRoutingRequestWx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSMutableDictionary)TUCallMap
{
  return self->_TUCallMap;
}

- (void)setTUCallMap:(id)a3
{
  objc_storeStrong((id *)&self->_TUCallMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_TUCallMap, 0);
  objc_storeStrong((id *)&self->_routingRequestWx, 0);
  objc_storeStrong((id *)&self->_routeToSpeakerReason, 0);
  objc_storeStrong((id *)&self->_isFirstConnectionAfterSREnable, 0);
  objc_storeStrong((id *)&self->_evalResult, 0);
  objc_storeStrong((id *)&self->_evalWxMap, 0);
  objc_storeStrong((id *)&self->_evalPreemptiveBannerResult, 0);
  objc_storeStrong((id *)&self->_conferencingCallSets, 0);
  objc_storeStrong((id *)&self->_audioSessionkMap, 0);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_activePlayingApp, 0);
  objc_storeStrong((id *)&self->hijackBlockingClientSet, 0);
}

@end
