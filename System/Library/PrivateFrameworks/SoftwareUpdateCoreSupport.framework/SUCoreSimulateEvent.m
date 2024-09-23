@implementation SUCoreSimulateEvent

- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atFunction:(id)a6 startAt:(int)a7 endAt:(int)a8 duration:(int)a9 untilStop:(id)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19
{
  uint64_t v20;

  LODWORD(v20) = a9;
  return (SUCoreSimulateEvent *)-[SUCoreSimulateEvent _initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](self, "_initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", a3, a4, a5, a6, 0, 0, 0, __PAIR64__(a8, a7), v20, a10, a11, a12, a13, a14, a15,
                                  a16,
                                  a17,
                                  a18,
                                  a19);
}

- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forMachine:(id)a5 atEvent:(id)a6 inState:(id)a7 alteration:(id)a8 startAt:(int)a9 endAt:(int)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19
{
  uint64_t v20;

  LODWORD(v20) = 0;
  return (SUCoreSimulateEvent *)-[SUCoreSimulateEvent _initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](self, "_initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", a3, a4, CFSTR("fsm"), a5, a6, a7, a8, __PAIR64__(a10, a9), v20, 0, a11, a12, a13, a14, a15,
                                  a16,
                                  a17,
                                  a18,
                                  a19);
}

- (id)_initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atIdentity:(id)a6 atEvent:(id)a7 inState:(id)a8 alteration:(id)a9 startAt:(int)a10 endAt:(int)a11 duration:(int)a12 untilStop:(id)a13 assetBuildVersions:(id)a14 assetProductVersions:(id)a15 assetAttributesPlist:(id)a16 assetState:(id)a17 updateInfoPlist:(id)a18 errorDomain:(id)a19 errorCode:(int64_t)a20 errorUserInfo:(id)a21 errorRecoverable:(int64_t)a22
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  SUCoreSimulateEvent *v31;
  SUCoreSimulateEvent *v32;
  id obj;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v45 = a5;
  obj = a6;
  v43 = a6;
  v38 = a7;
  v42 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a13;
  v46 = a14;
  v44 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v41 = a19;
  v40 = a21;
  v47.receiver = self;
  v47.super_class = (Class)SUCoreSimulateEvent;
  v31 = -[SUCoreSimulateEvent init](&v47, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_simAction = a3;
    v31->_simTrigger = a4;
    objc_storeStrong((id *)&v31->_moduleName, a5);
    objc_storeStrong((id *)&v32->_identityName, obj);
    objc_storeStrong((id *)&v32->_fsmEvent, v38);
    objc_storeStrong((id *)&v32->_fsmState, a8);
    objc_storeStrong((id *)&v32->_alteration, a9);
    v32->_count = 0;
    v32->_startAt = a10;
    v32->_endAt = a11;
    v32->_duration = a12;
    objc_storeStrong((id *)&v32->_untilStop, a13);
    objc_storeStrong((id *)&v32->_assetBuildVersions, a14);
    objc_storeStrong((id *)&v32->_assetProductVersions, a15);
    objc_storeStrong((id *)&v32->_assetAttributesPlist, a16);
    objc_storeStrong((id *)&v32->_assetState, a17);
    objc_storeStrong((id *)&v32->_updateInfoPlist, a18);
    objc_storeStrong((id *)&v32->_errorDomain, a19);
    v32->_errorCode = a20;
    objc_storeStrong((id *)&v32->_errorUserInfo, a21);
    v32->_errorRecoverable = a22;
  }

  return v32;
}

- (SUCoreSimulateEvent)initWithCoder:(id)a3
{
  id v4;
  SUCoreSimulateEvent *v5;
  uint64_t v6;
  NSString *moduleName;
  uint64_t v8;
  NSString *identityName;
  uint64_t v10;
  NSString *fsmEvent;
  uint64_t v12;
  NSString *fsmState;
  uint64_t v14;
  NSString *alteration;
  uint64_t v16;
  NSString *untilStop;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *assetBuildVersions;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *assetProductVersions;
  uint64_t v28;
  NSString *assetAttributesPlist;
  uint64_t v30;
  NSString *assetState;
  uint64_t v32;
  NSString *updateInfoPlist;
  uint64_t v34;
  NSString *errorDomain;
  uint64_t v36;
  NSDictionary *errorUserInfo;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreSimulateEvent;
  v5 = -[SUCoreSimulateEvent init](&v39, sel_init);
  if (v5)
  {
    v5->_simAction = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("simAction"));
    v5->_simTrigger = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("simTrigger"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("moduleName"));
    v6 = objc_claimAutoreleasedReturnValue();
    moduleName = v5->_moduleName;
    v5->_moduleName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityName"));
    v8 = objc_claimAutoreleasedReturnValue();
    identityName = v5->_identityName;
    v5->_identityName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fsmEvent"));
    v10 = objc_claimAutoreleasedReturnValue();
    fsmEvent = v5->_fsmEvent;
    v5->_fsmEvent = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fsmState"));
    v12 = objc_claimAutoreleasedReturnValue();
    fsmState = v5->_fsmState;
    v5->_fsmState = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alteration"));
    v14 = objc_claimAutoreleasedReturnValue();
    alteration = v5->_alteration;
    v5->_alteration = (NSString *)v14;

    v5->_count = objc_msgSend(v4, "decodeIntForKey:", CFSTR("count"));
    v5->_startAt = objc_msgSend(v4, "decodeIntForKey:", CFSTR("startAt"));
    v5->_endAt = objc_msgSend(v4, "decodeIntForKey:", CFSTR("endAt"));
    v5->_duration = objc_msgSend(v4, "decodeIntForKey:", CFSTR("duration"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untilStop"));
    v16 = objc_claimAutoreleasedReturnValue();
    untilStop = v5->_untilStop;
    v5->_untilStop = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("assetBuildVersions"));
    v21 = objc_claimAutoreleasedReturnValue();
    assetBuildVersions = v5->_assetBuildVersions;
    v5->_assetBuildVersions = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("assetProductVersions"));
    v26 = objc_claimAutoreleasedReturnValue();
    assetProductVersions = v5->_assetProductVersions;
    v5->_assetProductVersions = (NSArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetAttributesPlist"));
    v28 = objc_claimAutoreleasedReturnValue();
    assetAttributesPlist = v5->_assetAttributesPlist;
    v5->_assetAttributesPlist = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetState"));
    v30 = objc_claimAutoreleasedReturnValue();
    assetState = v5->_assetState;
    v5->_assetState = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateInfoPlist"));
    v32 = objc_claimAutoreleasedReturnValue();
    updateInfoPlist = v5->_updateInfoPlist;
    v5->_updateInfoPlist = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorDomain"));
    v34 = objc_claimAutoreleasedReturnValue();
    errorDomain = v5->_errorDomain;
    v5->_errorDomain = (NSString *)v34;

    v5->_errorCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("errorCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorUserInfo"));
    v36 = objc_claimAutoreleasedReturnValue();
    errorUserInfo = v5->_errorUserInfo;
    v5->_errorUserInfo = (NSDictionary *)v36;

    v5->_errorRecoverable = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("errorRecoverable"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t simAction;
  id v5;

  simAction = self->_simAction;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", simAction, CFSTR("simAction"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_simTrigger, CFSTR("simTrigger"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moduleName, CFSTR("moduleName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityName, CFSTR("identityName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fsmEvent, CFSTR("fsmEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fsmState, CFSTR("fsmState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alteration, CFSTR("alteration"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_startAt, CFSTR("startAt"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_endAt, CFSTR("endAt"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untilStop, CFSTR("untilStop"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetBuildVersions, CFSTR("assetBuildVersions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetProductVersions, CFSTR("assetProductVersions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetAttributesPlist, CFSTR("assetAttributesPlist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetState, CFSTR("assetState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updateInfoPlist, CFSTR("updateInfoPlist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorDomain, CFSTR("errorDomain"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_errorCode, CFSTR("errorCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorUserInfo, CFSTR("errorUserInfo"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_errorRecoverable), CFSTR("errorRecoverable"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)buildErrorWithDescription:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("SUCoreError");
  }
  v7 = v6;

  if (-[SUCoreSimulateEvent errorCode](self, "errorCode"))
    v8 = -[SUCoreSimulateEvent errorCode](self, "errorCode");
  else
    v8 = 9900;
  -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E08];
  if (v9)
  {
    -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v12, "setSafeObject:forKey:", v4, *MEMORY[0x1E0CB2D50]);
  v13 = -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable");
  if (v13)
  {
    if (v13 == 2)
    {
      v14 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if (v13 != 1)
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown value for errorRecoverable:%d"), -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
        objc_msgSend(v15, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] EVENT"), v16, 8116, 0);

        goto LABEL_17;
      }
      v14 = MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(v12, "setSafeObject:forKey:", v14, CFSTR("Recoverable"));
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, v8, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)description
{
  if (-[SUCoreSimulateEvent simTrigger](self, "simTrigger") == 3)
    -[SUCoreSimulateEvent _descriptionFSM](self, "_descriptionFSM");
  else
    -[SUCoreSimulateEvent _descriptionStandard](self, "_descriptionStandard");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summary
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  -[SUCoreSimulateEvent moduleName](self, "moduleName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("fsm"));

  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreSimulateEvent _actionName](self, "_actionName");
  v28 = objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent _triggerName](self, "_triggerName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUCoreSimulateEvent identityName](self, "identityName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent fsmEvent](self, "fsmEvent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent fsmState](self, "fsmState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent alteration](self, "alteration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SUCoreSimulateEvent count](self, "count");
    v23 = -[SUCoreSimulateEvent startAt](self, "startAt");
    v5 = -[SUCoreSimulateEvent endAt](self, "endAt");
    -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent assetState](self, "assetState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFSTR("SUCoreError");
    }
    +[SUCore errorNameForCode:](SUCore, "errorNameForCode:", -[SUCoreSimulateEvent errorCode](self, "errorCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSimulateEvent nameForSimulateEventBoolean:](SUCoreSimulateEvent, "nameForSimulateEventBoolean:", -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v5;
    v16 = (void *)v28;
    v17 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("action:%@ trigger:%@ fsm:%@ event:%@ state:%@ alteration:%@ count:%d startAt:%d endAt:%d assetBuildVersions:%@ assetProductVersions:%@ assetAttributesPlist:%@ assetState:%@ updateInfoPlist:%@ errorDomain:%@ errorCode:%@ errorRecoverable:%@"), v28, v34, v33, v32, v31, v30, v25, v23, v22, v29, v6, v7, v8, v9, v11, v14,
                    v15);

    if (v10)
LABEL_11:

    goto LABEL_12;
  }
  -[SUCoreSimulateEvent moduleName](self, "moduleName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent identityName](self, "identityName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SUCoreSimulateEvent count](self, "count");
  v24 = -[SUCoreSimulateEvent startAt](self, "startAt");
  v12 = -[SUCoreSimulateEvent endAt](self, "endAt");
  v13 = -[SUCoreSimulateEvent duration](self, "duration");
  -[SUCoreSimulateEvent untilStop](self, "untilStop");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetState](self, "assetState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("SUCoreError");
  }
  +[SUCore errorNameForCode:](SUCore, "errorNameForCode:", -[SUCoreSimulateEvent errorCode](self, "errorCode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreSimulateEvent nameForSimulateEventBoolean:](SUCoreSimulateEvent, "nameForSimulateEventBoolean:", -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v12;
  v16 = (void *)v28;
  v17 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("action:%@ trigger:%@ module:%@ function:%@ count:%d startAt:%d endAt:%d duration:%d untilStop:%@ assetBuildVersions:%@ assetProductVersions:%@ assetAttributesPlist:%@ assetState:%@ updateInfoPlist:%@ errorDomain:%@ errorCode:%@ errorRecoverable:%@"), v28, v34, v33, v32, v26, v24, v21, v13, v31, v30, v29, v6, v7, v8, v10, v18,
                  v19);

  if (v9)
    goto LABEL_11;
LABEL_12:

  return v17;
}

- (id)_descriptionFSM
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreSimulateEvent _actionName](self, "_actionName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent _triggerName](self, "_triggerName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent identityName](self, "identityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent fsmEvent](self, "fsmEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent fsmState](self, "fsmState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent alteration](self, "alteration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SUCoreSimulateEvent count](self, "count");
  v15 = -[SUCoreSimulateEvent startAt](self, "startAt");
  v14 = -[SUCoreSimulateEvent endAt](self, "endAt");
  -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetState](self, "assetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("SUCoreError");
  }
  +[SUCore errorNameForCode:](SUCore, "errorNameForCode:", -[SUCoreSimulateEvent errorCode](self, "errorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreSimulateEvent nameForSimulateEventBoolean:](SUCoreSimulateEvent, "nameForSimulateEventBoolean:", -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("\n[>>>\n               action: %@\n              trigger: %@\n                  fsm: %@\n                event: %@\n                state: %@\n           alteration: %@\n                count: %d\n              startAt: %d\n                endAt: %d\n   assetBuildVersions: %@\n assetProductVersions: %@\n assetAttributesPlist: %@\n           assetState: %@\n      updateInfoPlist: %@\n          errorDomain: %@\n            errorCode: %@\n        errorUserInfo: %@\n     errorRecoverable: %@\n<<<]"), v24, v23, v22, v21, v20, v19, v16, v15, v14, v18, v3, v4, v5, v6, v8, v9,
                  v10,
                  v11);

  if (v7)
  return v12;
}

- (id)_descriptionStandard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreSimulateEvent _actionName](self, "_actionName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent _triggerName](self, "_triggerName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent moduleName](self, "moduleName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent identityName](self, "identityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SUCoreSimulateEvent count](self, "count");
  v16 = -[SUCoreSimulateEvent startAt](self, "startAt");
  v15 = -[SUCoreSimulateEvent endAt](self, "endAt");
  v14 = -[SUCoreSimulateEvent duration](self, "duration");
  -[SUCoreSimulateEvent untilStop](self, "untilStop");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetBuildVersions](self, "assetBuildVersions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetProductVersions](self, "assetProductVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetAttributesPlist](self, "assetAttributesPlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent assetState](self, "assetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent updateInfoPlist](self, "updateInfoPlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUCoreSimulateEvent errorDomain](self, "errorDomain");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("SUCoreError");
  }
  +[SUCore errorNameForCode:](SUCore, "errorNameForCode:", -[SUCoreSimulateEvent errorCode](self, "errorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreSimulateEvent errorUserInfo](self, "errorUserInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreSimulateEvent nameForSimulateEventBoolean:](SUCoreSimulateEvent, "nameForSimulateEventBoolean:", -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("\n[>>>\n               action: %@\n              trigger: %@\n               module: %@\n             function: %@\n                count: %d\n              startAt: %d\n                endAt: %d\n             duration: %d\n            untilStop: %@\n   assetBuildVersions: %@\n assetProductVersions: %@\n assetAttributesPlist: %@\n           assetState: %@\n      updateInfoPlist: %@\n          errorDomain: %@\n            errorCode: %@\n        errorUserInfo: %@\n     errorRecoverable: %@\n<<<]"), v24, v23, v22, v21, v17, v16, v15, v14, v20, v19, v3, v4, v5, v6, v8, v9,
                  v10,
                  v11);

  if (v7)
  return v12;
}

- (id)_actionName
{
  __CFString *v3;

  if (-[SUCoreSimulateEvent simAction](self, "simAction") < 0
    || -[SUCoreSimulateEvent simAction](self, "simAction") > 11)
  {
    v3 = CFSTR("UNKNOWN");
  }
  else
  {
    v3 = kSUCoreSimulateEventActionName[-[SUCoreSimulateEvent simAction](self, "simAction")];
  }
  return v3;
}

- (id)_triggerName
{
  __CFString *v3;

  if (-[SUCoreSimulateEvent simTrigger](self, "simTrigger") < 0
    || -[SUCoreSimulateEvent simTrigger](self, "simTrigger") > 3)
  {
    v3 = CFSTR("UNKNOWN");
  }
  else
  {
    v3 = kSUCoreSimulateEventTriggerName[-[SUCoreSimulateEvent simTrigger](self, "simTrigger")];
  }
  return v3;
}

+ (id)nameForSimulateEventBoolean:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return off_1E611C510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SUCoreSimulateEventBoolean(%d)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)simAction
{
  return self->_simAction;
}

- (int64_t)simTrigger
{
  return self->_simTrigger;
}

- (NSString)moduleName
{
  return self->_moduleName;
}

- (NSString)identityName
{
  return self->_identityName;
}

- (NSString)fsmEvent
{
  return self->_fsmEvent;
}

- (NSString)fsmState
{
  return self->_fsmState;
}

- (NSString)alteration
{
  return self->_alteration;
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (int)startAt
{
  return self->_startAt;
}

- (int)endAt
{
  return self->_endAt;
}

- (int)duration
{
  return self->_duration;
}

- (NSString)untilStop
{
  return self->_untilStop;
}

- (NSArray)assetBuildVersions
{
  return self->_assetBuildVersions;
}

- (NSArray)assetProductVersions
{
  return self->_assetProductVersions;
}

- (NSString)assetAttributesPlist
{
  return self->_assetAttributesPlist;
}

- (NSString)assetState
{
  return self->_assetState;
}

- (NSString)updateInfoPlist
{
  return self->_updateInfoPlist;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSDictionary)errorUserInfo
{
  return self->_errorUserInfo;
}

- (int64_t)errorRecoverable
{
  return self->_errorRecoverable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorUserInfo, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_updateInfoPlist, 0);
  objc_storeStrong((id *)&self->_assetState, 0);
  objc_storeStrong((id *)&self->_assetAttributesPlist, 0);
  objc_storeStrong((id *)&self->_assetProductVersions, 0);
  objc_storeStrong((id *)&self->_assetBuildVersions, 0);
  objc_storeStrong((id *)&self->_untilStop, 0);
  objc_storeStrong((id *)&self->_alteration, 0);
  objc_storeStrong((id *)&self->_fsmState, 0);
  objc_storeStrong((id *)&self->_fsmEvent, 0);
  objc_storeStrong((id *)&self->_identityName, 0);
  objc_storeStrong((id *)&self->_moduleName, 0);
}

@end
