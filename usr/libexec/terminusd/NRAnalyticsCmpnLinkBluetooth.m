@implementation NRAnalyticsCmpnLinkBluetooth

- (void)submit
{
  double v2;
  double v3;
  double v4;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t ikePairingSessionSetupStart;
  unint64_t ikePairingSessionSetupEnd;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *eventDictionary;
  const __CFString *v22;

  sub_10011FD10((uint64_t)self, v2, v3, v4);
  v8 = 0.0;
  if (self)
  {
    ikePairingSessionSetupStart = self->_ikePairingSessionSetupStart;
    ikePairingSessionSetupEnd = self->_ikePairingSessionSetupEnd;
    if (ikePairingSessionSetupStart && ikePairingSessionSetupEnd > ikePairingSessionSetupStart)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v6) = dword_1001E48B0;
      LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
      v8 = (double)v6 * 0.000001 * (double)(ikePairingSessionSetupEnd - ikePairingSessionSetupStart) / (double)v7;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v8) * 0.001));
  if (!self)
  {
    v22 = CFSTR("ikePairingSessionSetupTimeInSec");
    eventDictionary = 0;
    goto LABEL_29;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v12, CFSTR("ikePairingSessionSetupTimeInSec"));

  if (self->_ikePairingSessionSetupAttempts)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v13, CFSTR("ikePairingSessionSetupAttempts"));

  }
  if (self->_urgentLoopChecksumError)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v14, CFSTR("urgentLoopChecksumError"));

  }
  if (self->_loopChecksumError)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v15, CFSTR("loopChecksumError"));

  }
  if (self->_bufferChecksumError)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v16, CFSTR("bufferChecksumError"));

  }
  if (self->_preludeChecksumError)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v17, CFSTR("preludeChecksumError"));

  }
  if (self->_urgentPreludeChecksumError)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v18, CFSTR("urgentPreludeChecksumError"));

  }
  if (self->_preludeTimeoutError)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v19, CFSTR("preludeTimeoutError"));

  }
  if (self->_urgentPreludeTimeoutError)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v20, CFSTR("urgentPreludeTimeoutError"));

  }
  if (self->_urgentPipeDisconnections)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
    eventDictionary = self->super.super._eventDictionary;
    v22 = CFSTR("urgentPipeDisconnections");
LABEL_29:
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", v12, v22);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.cmpnLinkBluetooth"));
}

@end
