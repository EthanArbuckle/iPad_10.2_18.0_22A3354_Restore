@implementation NFRoutingConfig

- (id)initPollingType:(int)a3 wantsSEReader:(BOOL)a4 wantsExpress:(BOOL)a5 cardEmulationType:(int)a6 hostMode:(unint64_t)a7 embeddedMode:(unint64_t)a8 fieldDetect:(unint64_t)a9 pollingDuration:(unsigned int)a10 lpcdEcpFrame:(id)a11
{
  uint64_t v12;
  uint64_t v13;

  LOBYTE(v13) = 0;
  LODWORD(v12) = a10;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:ecpBroadcast:](self, "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:ecpBroadcast:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, a7, a8, a9, v12, a11, v13);
}

- (id)initPollingType:(int)a3 wantsSEReader:(BOOL)a4 wantsExpress:(BOOL)a5 cardEmulationType:(int)a6 hostMode:(unint64_t)a7 embeddedMode:(unint64_t)a8 fieldDetect:(unint64_t)a9 pollingDuration:(unsigned int)a10 lpcdEcpFrame:(id)a11 ecpBroadcast:(BOOL)a12
{
  _BOOL4 v16;
  id v20;
  NFRoutingConfig *v21;
  NFRoutingConfig *v22;
  int v23;
  BOOL v24;
  void *specific;
  uint64_t Logger;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  int v39;
  NFRoutingConfig *v40;
  const char *Name;
  objc_super v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;

  v16 = a4;
  v20 = a11;
  v43.receiver = self;
  v43.super_class = (Class)NFRoutingConfig;
  v21 = -[NFRoutingConfig init](&v43, "init");
  v22 = v21;
  if (v21)
  {
    v21->_wantsSEReader = v16;
    if (v16)
      v23 = 1;
    else
      v23 = a3;
    if (a3 == 2)
      v23 = 2;
    v21->_hostMode = a7;
    v21->_embeddedMode = a8;
    v21->_pollingType = v23;
    v21->_cardEmulationType = a6;
    if (a6)
      v24 = a5;
    else
      v24 = 0;
    v21->_wantsExpress = v24;
    v21->_fieldDetectType = a9;
    v21->_pollingDuration = a10;
    v21->_polling = 0;
    v21->_fdOn = 0;
    objc_storeStrong((id *)&v21->_lpcdEcpFrame, a11);
    v22->_tagDiscoveryConfig = 0;
    if ((v22->_pollingType - 1) <= 1)
    {
      if (a12 && objc_msgSend(v20, "length"))
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v27 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v22);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v22);
          Name = sel_getName(a2);
          v31 = 45;
          if (isMetaClass)
            v31 = 43;
          v27(6, "%c[%{public}s %{public}s]:%i ECP broadcast", v31, ClassName, Name, 75);
        }
        v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v33 = NFSharedLogGetLogger(v32);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = object_getClass(v22);
          if (class_isMetaClass(v35))
            v36 = 43;
          else
            v36 = 45;
          v37 = object_getClassName(v22);
          v38 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v45 = v36;
          v46 = 2082;
          v47 = v37;
          v48 = 2082;
          v49 = v38;
          v50 = 1024;
          v51 = 75;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ECP broadcast", buf, 0x22u);
        }

        v22->_polling = 16;
      }
      else
      {
        if (v22->_wantsSEReader)
          v39 = 15;
        else
          v39 = 31;
        v22->_polling = v39;
        v22->_tagDiscoveryConfig = (_NFDriverTagDiscoveryNtf)1791;
      }
    }
    v40 = v22;
  }

  return v22;
}

- (id)initFrom:(id)a3
{
  id v4;
  NFRoutingConfig *v5;
  NFRoutingConfig *v6;
  NFRoutingConfig *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFRoutingConfig;
  v5 = -[NFRoutingConfig init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v5->_wantsSEReader = *((_BYTE *)v4 + 8);
    v5->_wantsExpress = *((_BYTE *)v4 + 9);
    v5->_pollingType = *((_DWORD *)v4 + 3);
    v5->_cardEmulationType = *((_DWORD *)v4 + 4);
    v5->_hostMode = *((_QWORD *)v4 + 4);
    v5->_embeddedMode = *((_QWORD *)v4 + 5);
    v5->_fieldDetectType = *((_QWORD *)v4 + 6);
    v5->_pollingDuration = *((_DWORD *)v4 + 5);
    v5->_polling = *((_DWORD *)v4 + 6);
    v5->_tagDiscoveryConfig = (_NFDriverTagDiscoveryNtf)*((_DWORD *)v4 + 7);
    v5->_fdOn = *((_BYTE *)v4 + 11);
    objc_storeStrong((id *)&v5->_lpcdEcpFrame, *((id *)v4 + 7));
    v7 = v6;
  }

  return v6;
}

- (BOOL)wantsIsoDepToHost
{
  return self->_hostMode == 2 && self->_embeddedMode != 2;
}

- (BOOL)wantsCardEmulation
{
  return (self->_hostMode == 2 || self->_embeddedMode == 2)
      && -[NFRoutingConfig cardEmulationType](self, "cardEmulationType") != 0;
}

- (BOOL)wantsReader
{
  return (self->_pollingType - 1) < 2;
}

- (BOOL)wantsLPCD
{
  return self->_pollingType == 2;
}

- (void)_setMultiTag:(BOOL)a3
{
  self->_wantsMultiTag = a3;
}

- (BOOL)isEquivalentRouting:(id)a3
{
  NFRoutingConfig *v4;
  NFRoutingConfig *v5;
  NSData *lpcdEcpFrame;
  NSData *v7;
  BOOL v8;

  v4 = (NFRoutingConfig *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_12;
  if (self->_cardEmulationType != v4->_cardEmulationType
    || self->_wantsExpress != v4->_wantsExpress
    || self->_wantsSEReader != v4->_wantsSEReader
    || self->_pollingType != v4->_pollingType
    || self->_hostMode != v4->_hostMode
    || self->_embeddedMode != v4->_embeddedMode
    || self->_pollingDuration != v4->_pollingDuration
    || self->_polling != v4->_polling)
  {
    goto LABEL_14;
  }
  lpcdEcpFrame = self->_lpcdEcpFrame;
  v7 = v5->_lpcdEcpFrame;
  if (!lpcdEcpFrame)
  {
    if (!v7)
      goto LABEL_12;
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  if (!-[NSData isEqualToData:](lpcdEcpFrame, "isEqualToData:", v7))
    goto LABEL_14;
LABEL_12:
  v8 = 1;
LABEL_15:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NFRoutingConfig *v4;
  BOOL v5;

  v4 = (NFRoutingConfig *)a3;
  v5 = self == v4
    || -[NFRoutingConfig isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self))
    && -[NFRoutingConfig isEquivalentRouting:](self, "isEquivalentRouting:", v4)
    && self->_fieldDetectType == v4->_fieldDetectType;

  return v5;
}

- (id)cloneWithReaderDisabled
{
  _DWORD *v2;

  v2 = -[NFRoutingConfig copy](self, "copy");
  v2[3] = 0;
  *((_BYTE *)v2 + 8) = 0;
  return v2;
}

- (id)cloneWithHCE:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD *v4;

  v3 = a3;
  v4 = -[NFRoutingConfig copy](self, "copy");
  if (v3)
  {
    v4[4] |= 3u;
    *((_QWORD *)v4 + 4) = 2;
  }
  else
  {
    *((_QWORD *)v4 + 4) = 0;
    if (*((_QWORD *)v4 + 5) != 2)
      v4[4] = 0;
  }
  return v4;
}

- (id)cloneWithFieldDetect:(unint64_t)a3
{
  _QWORD *v4;

  v4 = -[NFRoutingConfig copy](self, "copy");
  v4[6] = a3;
  return v4;
}

- (void)calculateFieldDetectEnabled:(BOOL)a3
{
  unint64_t fieldDetectType;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  _BOOL4 v21;
  const char *v22;
  void *specific;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  _BOOL4 fdOn;
  void *v38;
  uint64_t v39;
  void (*v40)(uint64_t, const char *, ...);
  objc_class *v41;
  _BOOL4 v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  _BOOL4 v52;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  _BOOL4 v62;

  fieldDetectType = self->_fieldDetectType;
  if (!fieldDetectType)
  {
    self->_fdOn = 0;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v30 = 45;
      if (isMetaClass)
        v30 = 43;
      v25(6, "%c[%{public}s %{public}s]:%i Field detect force disable: %d", v30, ClassName, Name, 268, self->_fdOn);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v16 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    v33 = object_getClass(self);
    if (class_isMetaClass(v33))
      v34 = 43;
    else
      v34 = 45;
    v35 = object_getClassName(self);
    v36 = sel_getName(a2);
    fdOn = self->_fdOn;
    *(_DWORD *)buf = 67110146;
    v54 = v34;
    v55 = 2082;
    v56 = v35;
    v57 = 2082;
    v58 = v36;
    v59 = 1024;
    v60 = 268;
    v61 = 1024;
    v62 = fdOn;
    v22 = "%c[%{public}s %{public}s]:%i Field detect force disable: %d";
    goto LABEL_31;
  }
  if (fieldDetectType == 2)
  {
    self->_fdOn = 1;
    v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v39 = NFLogGetLogger(v38);
    if (v39)
    {
      v40 = (void (*)(uint64_t, const char *, ...))v39;
      v41 = object_getClass(self);
      v42 = class_isMetaClass(v41);
      v43 = object_getClassName(self);
      v44 = sel_getName(a2);
      v45 = 45;
      if (v42)
        v45 = 43;
      v40(6, "%c[%{public}s %{public}s]:%i Field detect force enable: %d", v45, v43, v44, 263, self->_fdOn);
    }
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = NFSharedLogGetLogger(v46);
    v16 = objc_claimAutoreleasedReturnValue(v47);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    v48 = object_getClass(self);
    if (class_isMetaClass(v48))
      v49 = 43;
    else
      v49 = 45;
    v50 = object_getClassName(self);
    v51 = sel_getName(a2);
    v52 = self->_fdOn;
    *(_DWORD *)buf = 67110146;
    v54 = v49;
    v55 = 2082;
    v56 = v50;
    v57 = 2082;
    v58 = v51;
    v59 = 1024;
    v60 = 263;
    v61 = 1024;
    v62 = v52;
    v22 = "%c[%{public}s %{public}s]:%i Field detect force enable: %d";
    goto LABEL_31;
  }
  if (fieldDetectType != 1)
    return;
  self->_fdOn = a3;
  v6 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = NFLogGetLogger(v6);
  if (v7)
  {
    v8 = (void (*)(uint64_t, const char *, ...))v7;
    v9 = object_getClass(self);
    v10 = class_isMetaClass(v9);
    v11 = object_getClassName(self);
    v12 = sel_getName(a2);
    v13 = 45;
    if (v10)
      v13 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i Field Detect allowed: %d", v13, v11, v12, 258, self->_fdOn);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    v21 = self->_fdOn;
    *(_DWORD *)buf = 67110146;
    v54 = v18;
    v55 = 2082;
    v56 = v19;
    v57 = 2082;
    v58 = v20;
    v59 = 1024;
    v60 = 258;
    v61 = 1024;
    v62 = v21;
    v22 = "%c[%{public}s %{public}s]:%i Field Detect allowed: %d";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v22, buf, 0x28u);
  }
LABEL_32:

}

- (BOOL)contactlessOnAny
{
  return self->_hostMode == 2 || self->_embeddedMode == 2;
}

- (BOOL)activeRouting
{
  return self->_embeddedMode || self->_hostMode != 0;
}

- (id)description
{
  unint64_t fieldDetectType;
  char *v4;
  _BOOL4 wantsExpress;
  uint64_t pollingType;
  unint64_t hostMode;
  unint64_t embeddedMode;
  uint64_t pollingDuration;
  unsigned int v10;
  NSData *lpcdEcpFrame;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;

  fieldDetectType = self->_fieldDetectType;
  v4 = off_1002E5F18[-[NFRoutingConfig cardEmulationType](self, "cardEmulationType")];
  wantsExpress = self->_wantsExpress;
  pollingType = self->_pollingType;
  hostMode = self->_hostMode;
  embeddedMode = self->_embeddedMode;
  pollingDuration = self->_pollingDuration;
  v10 = -[NFRoutingConfig wantsIsoDepToHost](self, "wantsIsoDepToHost");
  lpcdEcpFrame = self->_lpcdEcpFrame;
  if (!lpcdEcpFrame)
    lpcdEcpFrame = (NSData *)&stru_1002ED8A8;
  v12 = "yes";
  if (self->_wantsSEReader)
    v13 = "yes";
  else
    v13 = "no";
  if (v10)
    v14 = "yes";
  else
    v14 = "no";
  if ((_DWORD)pollingType == 2)
    v15 = "yes";
  else
    v15 = "no";
  if (!wantsExpress)
    v12 = "no";
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fieldDetect=%lu cardType=%s express=%s lpcd=%s pollingType=%lu duration=%d host=%lu embedded=%lu isoDepToHostEnable=%s wantsESEReader=%s lpcdEcpFrame=%@"), fieldDetectType, v4, v12, v15, pollingType, pollingDuration, hostMode, embeddedMode, v14, v13, lpcdEcpFrame);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NFRoutingConfig initFrom:](+[NFRoutingConfig allocWithZone:](NFRoutingConfig, "allocWithZone:", a3), "initFrom:", self);
}

+ (id)secureElementAsReaderMode
{
  uint64_t v3;

  LODWORD(v3) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 1, 1, 0, 0, 0, 1, 0, v3, 0);
}

+ (id)hostCardEmulation
{
  uint64_t v3;

  LODWORD(v3) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 0, 3, 2, 0, 2, v3, 0);
}

+ (id)hostCardEmulationWithFieldDetect:(BOOL)a3
{
  _BOOL4 v3;
  NFRoutingConfig *v4;
  uint64_t v5;
  uint64_t v7;

  v3 = a3;
  v4 = [NFRoutingConfig alloc];
  v5 = 2;
  if (!v3)
    v5 = 0;
  LODWORD(v7) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:](v4, "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 0, 3, 2, 0, v5, v7, 0);
}

+ (id)hostCardEmulationVASBroadcastWithFrame:(id)a3 lpcdEnable:(BOOL)a4 fieldDetect:(BOOL)a5 pollDuration:(unsigned int)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  NFRoutingConfig *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [NFRoutingConfig alloc];
  if (v8)
    v11 = 2;
  else
    v11 = 1;
  v12 = 2;
  if (!v7)
    v12 = 0;
  LOBYTE(v16) = 1;
  LODWORD(v15) = a6;
  v13 = -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:ecpBroadcast:](v10, "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:ecpBroadcast:", v11, 0, 0, 3, 2, 0, v12, v15, v9, v16);

  return v13;
}

+ (id)embeddedWiredMode
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:](NFRoutingConfig, "embeddedWiredModeWithFD:", 3);
}

+ (id)embeddedWiredModeWithFD:(unint64_t)a3
{
  uint64_t v4;

  LODWORD(v4) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 0, 0, 0, 1, a3, v4, 0);
}

+ (id)embeddedWiredModeWithHCE
{
  uint64_t v3;

  LODWORD(v3) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 0, 3, 2, 1, 2, v3, 0);
}

+ (id)embeddedCardEmulationWithHCE:(BOOL)a3 emulationType:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  uint64_t v12;

  v4 = *(_QWORD *)&a4;
  if (a4)
  {
    v6 = 2;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NFRoutingConfig.m"), 404, CFSTR("Expects card type to *not* be NFCardTypeNone"));

    v6 = 0;
  }
  if ((v4 & 3) != 0 && a3)
    v7 = 2;
  else
    v7 = 0;
  LODWORD(v12) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 0, v4, v7, v6, 2, v12, 0);
}

+ (id)routingOff
{
  return +[NFRoutingConfig routingOffWithFD:ecp:](NFRoutingConfig, "routingOffWithFD:ecp:", 3, 0);
}

+ (id)routingOffWithFD:(unint64_t)a3
{
  return +[NFRoutingConfig routingOffWithFD:ecp:](NFRoutingConfig, "routingOffWithFD:ecp:", a3, 0);
}

+ (id)routingOffWithFD:(unint64_t)a3 ecp:(id)a4
{
  id v5;
  id v6;
  uint64_t v8;

  v5 = a4;
  LODWORD(v8) = 0;
  v6 = -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 0, 0, 0, 0, a3, v8, v5);

  return v6;
}

+ (id)none
{
  return +[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0);
}

+ (id)wantsLPCD:(BOOL)a3 expressForEmbedded:(BOOL)a4 hostCardEmulation:(BOOL)a5 fieldDetect:(unint64_t)a6 lpcdEcpFrame:(id)a7
{
  _BOOL8 v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v17;

  v7 = a4;
  if (a5)
    v8 = 3;
  else
    v8 = 0;
  if (a5)
    v9 = 2;
  else
    v9 = 0;
  if (a4)
    v10 = 2;
  else
    v10 = 0;
  if (a4)
    v11 = 7;
  else
    v11 = v8;
  if (a4 || a5)
    v12 = 2;
  else
    v12 = a6;
  if (a3)
    v13 = 2;
  else
    v13 = 0;
  v14 = a7;
  LODWORD(v17) = 0;
  v15 = -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", v13, 0, v7, v11, v9, v10, v12, v17, v14);

  return v15;
}

+ (id)expressOnly
{
  return +[NFRoutingConfig expressWithECP:](NFRoutingConfig, "expressWithECP:", 0);
}

+ (id)expressWithECP:(id)a3
{
  id v3;
  id v4;
  uint64_t v6;

  v3 = a3;
  LODWORD(v6) = 0;
  v4 = -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 1, 7, 0, 2, 2, v6, v3);

  return v4;
}

+ (id)embeddedExpressCardEmulation:(int)a3
{
  uint64_t v3;
  void *v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  if (!a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NFRoutingConfig.m"), 516, CFSTR("Expects card type to *not* be NFCardTypeNone"));

  }
  LODWORD(v8) = 0;
  return -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 0, 0, 1, v3, 0, 2, 2, v8, 0);
}

- (void)setPollingMask:(int)a3 tagConfig:(_NFDriverTagDiscoveryNtf)a4
{
  void *v8;
  void *v9;

  if (!*(_DWORD *)&a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFRoutingConfig.m"), 534, CFSTR("Tag Discovery cannot be empty"));

    if (a3)
      goto LABEL_3;
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFRoutingConfig.m"), 535, CFSTR("Polling mask invalid"));

    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  self->_polling = a3;
  self->_tagDiscoveryConfig = a4;
}

+ (id)readerMode
{
  return +[NFRoutingConfig readerWithLPCD:fieldDetect:pollDuration:ecp:](NFRoutingConfig, "readerWithLPCD:fieldDetect:pollDuration:ecp:", 0, 3, 0, 0);
}

+ (id)readerModeWithFD:(unint64_t)a3
{
  return +[NFRoutingConfig readerWithLPCD:fieldDetect:pollDuration:ecp:](NFRoutingConfig, "readerWithLPCD:fieldDetect:pollDuration:ecp:", 0, a3, 0, 0);
}

+ (id)readerWithLPCD
{
  return +[NFRoutingConfig readerWithLPCD:fieldDetect:pollDuration:ecp:](NFRoutingConfig, "readerWithLPCD:fieldDetect:pollDuration:ecp:", 1, 1, 0, 0);
}

+ (id)readerWithLPCD:(BOOL)a3 fieldDetect:(unint64_t)a4 pollDuration:(unsigned int)a5 ecp:(id)a6
{
  _BOOL4 v8;
  id v9;
  NFRoutingConfig *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v8 = a3;
  v9 = a6;
  v10 = [NFRoutingConfig alloc];
  if (v8)
    v11 = 2;
  else
    v11 = 1;
  LODWORD(v14) = a5;
  v12 = -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:](v10, "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", v11, 0, 0, 0, 0, 0, a4, v14, v9);

  return v12;
}

+ (id)accessoryMultiTag
{
  id v2;
  uint64_t v4;

  LODWORD(v4) = 0;
  v2 = -[NFRoutingConfig initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:]([NFRoutingConfig alloc], "initPollingType:wantsSEReader:wantsExpress:cardEmulationType:hostMode:embeddedMode:fieldDetect:pollingDuration:lpcdEcpFrame:", 3, 0, 0, 0, 0, 0, 2, v4, 0);
  objc_msgSend(v2, "_setMultiTag:", 1);
  return v2;
}

+ (id)accessoryReaderWithLPCD
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig readerWithLPCD](NFRoutingConfig, "readerWithLPCD"));
  objc_msgSend(v2, "setPollingMask:tagConfig:", 239, 16127);
  return v2;
}

+ (id)accessoryReaderWithPolling:(int)a3 lpcd:(BOOL)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig readerWithLPCD:fieldDetect:pollDuration:ecp:](NFRoutingConfig, "readerWithLPCD:fieldDetect:pollDuration:ecp:", a4, 1, 0, 0));
  objc_msgSend(v5, "setPollingMask:tagConfig:", v4, 16127);
  return v5;
}

- (int)pollingType
{
  return self->_pollingType;
}

- (unint64_t)hostMode
{
  return self->_hostMode;
}

- (unint64_t)embeddedMode
{
  return self->_embeddedMode;
}

- (BOOL)wantsSEReader
{
  return self->_wantsSEReader;
}

- (BOOL)wantsExpress
{
  return self->_wantsExpress;
}

- (int)cardEmulationType
{
  return self->_cardEmulationType;
}

- (unint64_t)fieldDetectType
{
  return self->_fieldDetectType;
}

- (unsigned)pollingDuration
{
  return self->_pollingDuration;
}

- (int)polling
{
  return self->_polling;
}

- (_NFDriverTagDiscoveryNtf)tagDiscoveryConfig
{
  return self->_tagDiscoveryConfig;
}

- (BOOL)wantsMultiTag
{
  return self->_wantsMultiTag;
}

- (BOOL)fdOn
{
  return self->_fdOn;
}

- (NSData)lpcdEcpFrame
{
  return self->_lpcdEcpFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lpcdEcpFrame, 0);
}

@end
