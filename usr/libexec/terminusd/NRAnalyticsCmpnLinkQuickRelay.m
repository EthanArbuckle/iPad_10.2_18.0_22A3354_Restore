@implementation NRAnalyticsCmpnLinkQuickRelay

- (void)submit
{
  double v2;
  double v3;
  double v4;
  double v6;
  double v7;
  unint64_t idsSessionSendInvitationStart;
  unint64_t idsSessionSendInvitationEnd;
  double v10;
  BOOL v11;
  double v12;
  unint64_t idsSessionReceiveInvitationStart;
  unint64_t idsSessionReceiveInvitationEnd;
  BOOL v15;
  unint64_t idsSessionStart;
  unint64_t idsSessionEnd;
  double v18;
  BOOL v19;
  double v20;
  unint64_t ikeClassDKeepAliveStart;
  unint64_t ikeClassDKeepAliveEnd;
  BOOL v23;
  unint64_t ikeClassCKeepAliveStart;
  double v25;
  unint64_t ikeClassCKeepAliveEnd;
  unint64_t v27;
  void *v28;
  NSMutableDictionary *eventDictionary;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  NSMutableDictionary *v37;
  void *v38;
  NSMutableDictionary *v39;
  const __CFString *v40;

  sub_10011FD10((uint64_t)self, v2, v3, v4);
  if (self)
  {
    idsSessionSendInvitationStart = self->_idsSessionSendInvitationStart;
    idsSessionSendInvitationEnd = self->_idsSessionSendInvitationEnd;
    v10 = 0.0;
    if (idsSessionSendInvitationStart)
      v11 = idsSessionSendInvitationEnd > idsSessionSendInvitationStart;
    else
      v11 = 0;
    v12 = 0.0;
    if (v11)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v6) = dword_1001E48B0;
      LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
      v7 = (double)*(unint64_t *)&v7;
      v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      v12 = (double)(idsSessionSendInvitationEnd - idsSessionSendInvitationStart) * v6 / v7;
    }
    idsSessionReceiveInvitationStart = self->_idsSessionReceiveInvitationStart;
    idsSessionReceiveInvitationEnd = self->_idsSessionReceiveInvitationEnd;
    if (idsSessionReceiveInvitationStart)
      v15 = idsSessionReceiveInvitationEnd > idsSessionReceiveInvitationStart;
    else
      v15 = 0;
    if (v15)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v6) = dword_1001E48B0;
      LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
      v7 = (double)*(unint64_t *)&v7;
      v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      v10 = (double)(idsSessionReceiveInvitationEnd - idsSessionReceiveInvitationStart) * v6 / v7;
    }
    idsSessionStart = self->_idsSessionStart;
    idsSessionEnd = self->_idsSessionEnd;
    v18 = 0.0;
    if (idsSessionStart)
      v19 = idsSessionEnd > idsSessionStart;
    else
      v19 = 0;
    v20 = 0.0;
    if (v19)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v6) = dword_1001E48B0;
      LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
      v7 = (double)*(unint64_t *)&v7;
      v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      v20 = (double)(idsSessionEnd - idsSessionStart) * v6 / v7;
    }
    ikeClassDKeepAliveStart = self->_ikeClassDKeepAliveStart;
    ikeClassDKeepAliveEnd = self->_ikeClassDKeepAliveEnd;
    if (ikeClassDKeepAliveStart)
      v23 = ikeClassDKeepAliveEnd > ikeClassDKeepAliveStart;
    else
      v23 = 0;
    if (v23)
    {
      if (qword_1001E48A8 != -1)
        dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
      LODWORD(v6) = dword_1001E48B0;
      LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
      v7 = (double)*(unint64_t *)&v7;
      v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      v18 = (double)(ikeClassDKeepAliveEnd - ikeClassDKeepAliveStart) * v6 / v7;
    }
    ikeClassCKeepAliveStart = self->_ikeClassCKeepAliveStart;
    v25 = 0.0;
    if (ikeClassCKeepAliveStart)
    {
      ikeClassCKeepAliveEnd = self->_ikeClassCKeepAliveEnd;
      v27 = ikeClassCKeepAliveEnd - ikeClassCKeepAliveStart;
      if (ikeClassCKeepAliveEnd > ikeClassCKeepAliveStart)
      {
        if (qword_1001E48A8 != -1)
          dispatch_once(&qword_1001E48A8, &stru_1001B7C30);
        LODWORD(v6) = dword_1001E48B0;
        LODWORD(v7) = *(_DWORD *)algn_1001E48B4;
        v25 = (double)v27 * (0.000000001 * (double)*(unint64_t *)&v6) / (double)*(unint64_t *)&v7;
      }
    }
    if (self->_idsSessionInvitationFailed)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v12 * 1000.0) * 0.001));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v28, CFSTR("idsSessionInvitationTimeToFailureInSec"));

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", &off_1001C4B88, CFSTR("idsSessionSendInvitationDurationInSec"));
      goto LABEL_45;
    }
    eventDictionary = self->super.super._eventDictionary;
  }
  else
  {
    eventDictionary = 0;
    v25 = 0.0;
    v18 = 0.0;
    v20 = 0.0;
    v10 = 0.0;
    v12 = 0.0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](eventDictionary, "setObject:forKeyedSubscript:", &off_1001C4B88, CFSTR("idsSessionInvitationTimeToFailureInSec"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v12 * 1000.0) * 0.001));
  if (self)
    v31 = self->super.super._eventDictionary;
  else
    v31 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v30, CFSTR("idsSessionSendInvitationDurationInSec"));

LABEL_45:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v10 * 1000.0) * 0.001));
  if (self)
    v33 = self->super.super._eventDictionary;
  else
    v33 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v32, CFSTR("idsSessionReceiveInvitationDurationInSec"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v20 * 1000.0) * 0.001));
  if (self)
    v35 = self->super.super._eventDictionary;
  else
    v35 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v34, CFSTR("idsSessionDurationInSec"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v18 * 1000.0) * 0.001));
  if (self)
    v37 = self->super.super._eventDictionary;
  else
    v37 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v36, CFSTR("ikeClassDKeepAliveDurationInSec"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v25 * 1000.0) * 0.001));
  if (!self)
  {
    v40 = CFSTR("ikeClassCKeepAliveDurationInSec");
    v39 = 0;
    goto LABEL_54;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super.super._eventDictionary, "setObject:forKeyedSubscript:", v38, CFSTR("ikeClassCKeepAliveDurationInSec"));

  if (self->_idsSessionEndedReason)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
    v39 = self->super.super._eventDictionary;
    v40 = CFSTR("idsSessionEndedReason");
LABEL_54:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v38, v40);

  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.cmpnLinkQuickRelay"));
}

- (void)reset
{
  if (self)
  {
    self->_idsSessionInvitationCollisionCount = 0;
    self->_idsSessionSendInvitationStart = 0;
    self->_idsSessionSendInvitationEnd = 0;
    self->_idsSessionReceiveInvitationStart = 0;
    self->_idsSessionReceiveInvitationEnd = 0;
    self->_idsSessionStart = 0;
    self->_idsSessionEnd = 0;
    self->super._ikeClassCAttempts = 0;
    self->super._ikeClassDAttempts = 0;
    self->super._ikeClassDSetupStart = 0;
    self->super._ikeClassDSetupEnd = 0;
    self->super._ikeClassCSetupStart = 0;
    self->super._ikeClassCSetupEnd = 0;
    self->_ikeClassDKeepAliveStart = 0;
    self->_ikeClassCKeepAliveStart = 0;
    self->_ikeClassDKeepAliveEnd = 0;
    self->_ikeClassCKeepAliveEnd = 0;
  }
}

@end
