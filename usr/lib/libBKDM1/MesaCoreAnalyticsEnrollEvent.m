@implementation MesaCoreAnalyticsEnrollEvent

- (MesaCoreAnalyticsEnrollEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsEnrollEvent *v3;
  MesaCoreAnalyticsEnrollEvent *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MesaCoreAnalyticsEnrollEvent;
  v3 = -[MesaCoreAnalyticsEvent initWithName:](&v10, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + v5), "arrayByAddingObjectsFromArray:", &unk_251CB3C10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(Class *)((char *)&v4->super.super.super.isa + v5);
    *(Class *)((char *)&v4->super.super.super.isa + v5) = (Class)v6;

  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "self = [super initWithName:eventName]";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v19 = 1024;
      v20 = 1881;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (MesaCoreAnalyticsEnrollEvent)init
{
  return -[MesaCoreAnalyticsEnrollEvent initWithName:](self, "initWithName:", CFSTR("com.apple.biometrickit.mesa.enrollAttempt"));
}

- (void)reset
{
  NSNumber *touchesCount;
  NSNumber *badImagesCount;
  NSNumber *rejectedImagesCount;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MesaCoreAnalyticsEnrollEvent;
  -[MesaCoreAnalyticsEvent reset](&v6, sel_reset);
  -[BiometricKitCoreAnalyticsEvent setEventCanceled:](self, "setEventCanceled:", MEMORY[0x24BDBD1C0]);
  touchesCount = self->_touchesCount;
  self->_touchesCount = (NSNumber *)&unk_251CB3428;

  badImagesCount = self->_badImagesCount;
  self->_badImagesCount = (NSNumber *)&unk_251CB3428;

  rejectedImagesCount = self->_rejectedImagesCount;
  self->_rejectedImagesCount = (NSNumber *)&unk_251CB3428;

  self->_badImagePerFingerDown = 0;
  self->_waitForFinish = 0;
  -[MesaCoreAnalyticsEvent setDeviceGroupType:](self, "setDeviceGroupType:", &unk_251CB3440);
  uuid_clear(self->super._lastBioDevice.uuid);
}

- (BOOL)postEvent
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  MesaCoreAnalyticsEnrollEvent *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsEnrollEvent postEvent: %@\n", buf, 0xCu);
  }
  if (!self->_overallResult || !self->_overallTime)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)MesaCoreAnalyticsEnrollEvent;
  -[MesaCoreAnalyticsEvent postEvent](&v5, sel_postEvent);
  return 1;
}

- (void)setFingerDetected:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *touchesCount;
  NSNumber *v7;
  NSNumber *badImagesCount;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "BOOLValue"))
  {
    if (!self->super._fingerOn)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_touchesCount, "unsignedIntValue") + 1);
      v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      touchesCount = self->_touchesCount;
      self->_touchesCount = v5;

      self->_badImagePerFingerDown = 0;
      goto LABEL_7;
    }
  }
  else if (!self->super._fingerOn)
  {
    goto LABEL_7;
  }
  if (self->_badImagePerFingerDown)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_badImagesCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    badImagesCount = self->_badImagesCount;
    self->_badImagesCount = v7;

  }
LABEL_7:
  v9.receiver = self;
  v9.super_class = (Class)MesaCoreAnalyticsEnrollEvent;
  -[MesaCoreAnalyticsEvent setFingerDetected:](&v9, sel_setFingerDetected_, v4);

}

- (void)handleStatusMessage:(unsigned int)a3 withData:(id)a4
{
  uint64_t v4;
  id v6;
  NSNumber *enrollResult;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *v10;
  void *v11;
  void *v12;
  $E45E227ABC07F85A6643C6962DE303D4 *p_lastBioDevice;
  NSNumber *overallResult;
  NSObject *v15;
  objc_super v16;
  _BYTE buf[22];
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((int)v4 <= 84)
  {
    switch((int)v4)
    {
      case 'B':
        enrollResult = self->_enrollResult;
        v8 = (NSNumber *)&unk_251CB3458;
        break;
      case 'C':
        enrollResult = self->_enrollResult;
        v8 = (NSNumber *)&unk_251CB3488;
        break;
      case 'D':
        enrollResult = self->_enrollResult;
        v8 = (NSNumber *)&unk_251CB3470;
        break;
      case 'F':
        goto LABEL_11;
      default:
        goto LABEL_18;
    }
    self->_enrollResult = v8;

    overallResult = self->_overallResult;
    self->_overallResult = (NSNumber *)MEMORY[0x24BDBD1C0];

  }
  else
  {
    if ((int)v4 <= 94)
    {
      if ((v4 - 85) >= 4)
        goto LABEL_18;
      goto LABEL_11;
    }
    if ((_DWORD)v4 == 95)
    {
LABEL_12:
      +[MesaCAImageInfo imageInfoFromImageProcessingResult:](MesaCAImageInfo, "imageInfoFromImageProcessingResult:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        p_lastBioDevice = &self->super._lastBioDevice;
        objc_msgSend(v11, "source");
        *(_OWORD *)&p_lastBioDevice->type = *(_OWORD *)buf;
        *(_DWORD *)&p_lastBioDevice->uuid[12] = *(_DWORD *)&buf[16];
      }
      else
      {
        if (__osLog)
          v15 = __osLog;
        else
          v15 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "imageInfo";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = 0;
          v18 = 2080;
          v19 = "";
          v20 = 2080;
          v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
          v22 = 1024;
          v23 = 1994;
          _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }

      goto LABEL_19;
    }
    if ((_DWORD)v4 == 98)
    {
LABEL_11:
      self->_badImagePerFingerDown = 1;
      goto LABEL_12;
    }
    if ((_DWORD)v4 != 355)
    {
LABEL_18:
      v16.receiver = self;
      v16.super_class = (Class)MesaCoreAnalyticsEnrollEvent;
      -[MesaCoreAnalyticsEvent handleStatusMessage:withData:](&v16, sel_handleStatusMessage_withData_, v4, v6);
      goto LABEL_19;
    }
    v9 = self->_enrollResult;
    self->_enrollResult = (NSNumber *)&unk_251CB3410;

    v10 = self->_overallResult;
    self->_overallResult = (NSNumber *)MEMORY[0x24BDBD1C8];

    self->_waitForFinish = 1;
  }
LABEL_19:

}

- (BOOL)isWaitingForFinish
{
  return self->_waitForFinish;
}

- (void)enrollProgress:(id)a3
{
  id v4;
  void *v5;
  NSNumber *v6;
  NSNumber *rejectedImagesCount;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  _OWORD v19[191];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  memset(v19, 0, 512);
  if (v4)
  {
    objc_msgSend(v4, "getBytes:length:", v19, 3060);
    if (SWORD3(v19[0]) < 300)
    {
      if (SWORD3(v19[0]) == -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_rejectedImagesCount, "unsignedIntValue") + 1);
        v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        rejectedImagesCount = self->_rejectedImagesCount;
        self->_rejectedImagesCount = v6;

      }
      goto LABEL_5;
    }
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "topology.nodeAdded < 300";
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v17 = 1024;
      v18 = 2017;
      goto LABEL_16;
    }
  }
  else
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "alignmentData";
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v17 = 1024;
      v18 = 2015;
LABEL_16:
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
LABEL_5:

}

- (NSNumber)enrollResult
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setEnrollResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSNumber)overallResult
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setOverallResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSNumber)overallTime
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setOverallTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSNumber)touchesCount
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTouchesCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)badImagesCount
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setBadImagesCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)rejectedImagesCount
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setRejectedImagesCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSNumber)enrolledUsersCount
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setEnrolledUsersCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSNumber)enrolledIdentityUserCount
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setEnrolledIdentityUserCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSNumber)enrolledIdentityTotalCount
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setEnrolledIdentityTotalCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSNumber)scanGroupCount
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setScanGroupCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSNumber)scanCount
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setScanCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSNumber)userID
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setUserID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_scanCount, 0);
  objc_storeStrong((id *)&self->_scanGroupCount, 0);
  objc_storeStrong((id *)&self->_enrolledIdentityTotalCount, 0);
  objc_storeStrong((id *)&self->_enrolledIdentityUserCount, 0);
  objc_storeStrong((id *)&self->_enrolledUsersCount, 0);
  objc_storeStrong((id *)&self->_rejectedImagesCount, 0);
  objc_storeStrong((id *)&self->_badImagesCount, 0);
  objc_storeStrong((id *)&self->_touchesCount, 0);
  objc_storeStrong((id *)&self->_overallTime, 0);
  objc_storeStrong((id *)&self->_overallResult, 0);
  objc_storeStrong((id *)&self->_enrollResult, 0);
}

@end
