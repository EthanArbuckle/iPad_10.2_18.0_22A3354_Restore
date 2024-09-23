@implementation NFStepUpController

- (NFStepUpController)initWithQueue:(id)a3 driverWrapper:(id)a4
{
  id v8;
  id v9;
  NFStepUpController *v10;
  NFStepUpController *v11;
  STSHelperLibrary *v12;
  STSHelperLibrary *stsHelper;
  NFStepUpController *v14;
  void *specific;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  const char *Name;
  objc_super v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)NFStepUpController;
  v10 = -[NFStepUpController init](&v31, "init");
  v11 = v10;
  if (v10
    && (objc_storeStrong((id *)&v10->_workQueue, a3),
        objc_storeStrong((id *)&v11->_driverWrapper, a4),
        v11->_transactionType = 0,
        v12 = objc_opt_new(STSHelperLibrary),
        stsHelper = v11->_stsHelper,
        v11->_stsHelper = v12,
        stsHelper,
        !v11->_stsHelper))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v17 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v11);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v11);
      Name = sel_getName(a2);
      v21 = 45;
      if (isMetaClass)
        v21 = 43;
      v17(3, "%c[%{public}s %{public}s]:%i Could not allocate STS helper object", v21, ClassName, Name, 44);
    }
    v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = object_getClass(v11);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(v11);
      v28 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v26;
      v34 = 2082;
      v35 = v27;
      v36 = 2082;
      v37 = v28;
      v38 = 1024;
      v39 = 44;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not allocate STS helper object", buf, 0x22u);
    }

    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (void)invalidate
{
  STSHelperLibrary *stsHelper;
  NFApplet *applet;

  -[STSHelperLibrary invalidate](self->_stsHelper, "invalidate");
  stsHelper = self->_stsHelper;
  self->_stsHelper = 0;

  applet = self->_applet;
  self->_applet = 0;

}

- (id)connectToNotificationListener:(id)a3
{
  return -[STSHelperLibrary connectToNotificationListener:](self->_stsHelper, "connectToNotificationListener:", a3);
}

- (id)startISO18013WithConnectionHandoverConfiguration
{
  return -[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:](self->_stsHelper, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", 32, 2, self);
}

- (void)handleStepUpEvent:(id)a3 transactionType:(unsigned int)a4 forApplet:(id)a5
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  __CFString *v35;
  void *specific;
  uint64_t Logger;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *Class;
  const char *Name;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  id v53;
  const char *v54;
  const char *v55;
  const __CFString *v56;
  const __CFString *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  const __CFString *v65;
  const __CFString *v66;
  const char *v67;
  const char *v68;
  const __CFString *v69;
  _BOOL4 isMetaClass;
  const char *ClassName;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint8_t buf[4];
  int v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  const __CFString *v88;
  _QWORD v89[3];
  _QWORD v90[3];

  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StepUpReaderData")));
  if (v12 && (v13 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    v75 = v11;
    objc_storeStrong((id *)&self->_theStepUpEvent, a3);
    self->_transactionType = a4;
    objc_storeStrong((id *)&self->_applet, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));

    if (v14 && (v15 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v14, v15) & 1) != 0))
      v16 = objc_msgSend(v14, "copy");
    else
      v16 = 0;
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StepUpReaderData")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("SharedSecret")));

    if (v28 && (v29 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v28, v29) & 1) != 0))
      v76 = objc_msgSend(v28, "copy");
    else
      v76 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("endPointIdentifier")));

    if (v12 && (v30 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v12, v30) & 1) != 0))
      v31 = objc_msgSend(v12, "copy");
    else
      v31 = 0;
    v32 = objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v31));
    v33 = (void *)v32;
    if (v76 && v32 && v16)
    {
      v72 = v31;
      v89[0] = CFSTR("appletIdentifier");
      v89[1] = STSUAStepupEventKeyEndpointData;
      v90[0] = v16;
      v90[1] = v32;
      v89[2] = STSUAStepupEventKeySharedSecretData;
      v90[2] = v76;
      v34 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 3));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(-[STSHelperLibrary signalUnifiedAccessStepUpWithEventDictionary:](self->_stsHelper, "signalUnifiedAccessStepUpWithEventDictionary:", v34));
      if (v35)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v38 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v41 = 45;
          if (isMetaClass)
            v41 = 43;
          v38(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v41, ClassName, Name, 117, v35);
        }
        v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v43 = NFSharedLogGetLogger(v42);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = object_getClass(self);
          if (class_isMetaClass(v45))
            v46 = 43;
          else
            v46 = 45;
          *(_DWORD *)buf = 67110146;
          v78 = v46;
          v79 = 2082;
          v80 = object_getClassName(self);
          v81 = 2082;
          v82 = sel_getName(a2);
          v83 = 1024;
          v84 = 117;
          v85 = 2114;
          v86 = v35;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
        }

      }
      v31 = v72;
      v47 = v74;
    }
    else
    {
      v73 = (void *)v32;
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFLogGetLogger(v48);
      if (v49)
      {
        v50 = (void (*)(uint64_t, const char *, ...))v49;
        v51 = object_getClass(self);
        v52 = class_isMetaClass(v51);
        v53 = v31;
        v54 = object_getClassName(self);
        v55 = sel_getName(a2);
        v56 = CFSTR("Missing Step-Up data ");
        if (v76)
          v56 = &stru_1002ED8A8;
        v57 = CFSTR("Missing Endpoint identifier");
        if (v73)
          v57 = &stru_1002ED8A8;
        v69 = v56;
        v58 = 45;
        if (v52)
          v58 = 43;
        v67 = v54;
        v31 = v53;
        v50(3, "%c[%{public}s %{public}s]:%i Invalid data from Event. %{public}@ %{public}@", v58, v67, v55, 120, v69, v57);
      }
      v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v60 = NFSharedLogGetLogger(v59);
      v34 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v61 = object_getClass(self);
        if (class_isMetaClass(v61))
          v62 = 43;
        else
          v62 = 45;
        v63 = object_getClassName(self);
        v64 = sel_getName(a2);
        *(_DWORD *)buf = 67110402;
        v65 = &stru_1002ED8A8;
        if (v76)
          v66 = &stru_1002ED8A8;
        else
          v66 = CFSTR("Missing Step-Up data ");
        v33 = v73;
        v78 = v62;
        if (!v73)
          v65 = CFSTR("Missing Endpoint identifier");
        v79 = 2082;
        v80 = v63;
        v81 = 2082;
        v82 = v64;
        v83 = 1024;
        v84 = 120;
        v85 = 2114;
        v86 = v66;
        v87 = 2114;
        v88 = v65;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid data from Event. %{public}@ %{public}@", buf, 0x36u);
        v47 = v74;
      }
      else
      {
        v33 = v73;
        v47 = v74;
      }
    }

    v11 = v75;
  }
  else
  {
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFLogGetLogger(v17);
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      v21 = class_isMetaClass(v20);
      v22 = object_getClassName(self);
      v68 = sel_getName(a2);
      v23 = 45;
      if (v21)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i StepUp event from ATL is of invalid type", v23, v22, v68, 79);
    }
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger(v24);
    v16 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(self);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      *(_DWORD *)buf = 67109890;
      v78 = v27;
      v79 = 2082;
      v80 = object_getClassName(self);
      v81 = 2082;
      v82 = sel_getName(a2);
      v83 = 1024;
      v84 = 79;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i StepUp event from ATL is of invalid type", buf, 0x22u);
    }
  }

}

- (void)hceReadWithHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSDictionary *theStepUpEvent;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  STSHelperLibrary *stsHelper;
  OS_dispatch_queue *workQueue;
  NSDictionary *v17;
  NFContactlessPaymentEndEvent *v18;
  NFContactlessPaymentEndEvent *v19;
  void *v20;
  NSDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSDictionary *v25;
  NFContactlessPaymentEndEvent *v26;
  NFContactlessPaymentEndEvent *v27;
  void *v28;
  NSDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v33[5];
  NSDictionary *v34;
  NFStepUpController *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint8_t v39[16];
  uint8_t buf[8];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  NSMutableDictionary *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v6 = a3;
  v7 = a4;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_100174570;
  v52 = sub_100174580;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_100174570;
  v46 = sub_100174580;
  v47 = objc_opt_new(NSMutableDictionary);
  v41 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readApduAndReturnError:", &v41));
  v9 = v41;
  theStepUpEvent = self->_theStepUpEvent;
  if (theStepUpEvent)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](theStepUpEvent, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_theStepUpEvent, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
      objc_msgSend((id)v43[5], "setObject:forKeyedSubscript:", v12, CFSTR("appletIdentifier"));

    }
  }
  if (v8 && !v9)
  {
    strcpy((char *)buf, "o");
    v13 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", buf, 2);
    v14 = v13;
    stsHelper = self->_stsHelper;
    if (stsHelper)
    {
      workQueue = self->_workQueue;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100174588;
      v33[3] = &unk_1002E9CF8;
      v33[4] = v13;
      v37 = &v42;
      v38 = &v48;
      v34 = (NSDictionary *)v6;
      v35 = self;
      v36 = v7;
      -[STSHelperLibrary processUnifiedAccessStepupAPDU:callbackQueue:responseHandler:](stsHelper, "processUnifiedAccessStepupAPDU:callbackQueue:responseHandler:", v8, workQueue, v33);

      v17 = v34;
    }
    else
    {
      objc_msgSend(v6, "sendAPDU:", v13);
      objc_msgSend((id)v43[5], "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("didError"));
      v26 = [NFContactlessPaymentEndEvent alloc];
      v27 = -[NFContactlessPaymentEndEvent initWithDictionary:](v26, "initWithDictionary:", v43[5]);
      v28 = (void *)v49[5];
      v49[5] = (uint64_t)v27;

      (*((void (**)(id, uint64_t, NSDictionary *))v7 + 2))(v7, v49[5], self->_theStepUpEvent);
      v29 = self->_theStepUpEvent;
      if (!v29)
      {
LABEL_19:

        goto LABEL_20;
      }
      sub_1000A6FB8((uint64_t)NFUnifiedAccessTransactionCALogger, v29, self->_transactionType, 28416);
      v31 = NFSharedSignpostLog(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)v39 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AtlEvent", "AtlStepUpEventComplete", v39, 2u);
      }

      v17 = self->_theStepUpEvent;
      self->_theStepUpEvent = 0;
    }

    goto LABEL_19;
  }
  if (objc_msgSend(v9, "code") == (id)62)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    sub_1001FBF60(self->_driverWrapper);
    objc_msgSend((id)v43[5], "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("didError"));
    v18 = [NFContactlessPaymentEndEvent alloc];
    v19 = -[NFContactlessPaymentEndEvent initWithDictionary:](v18, "initWithDictionary:", v43[5]);
    v20 = (void *)v49[5];
    v49[5] = (uint64_t)v19;

    (*((void (**)(id, uint64_t, NSDictionary *))v7 + 2))(v7, v49[5], self->_theStepUpEvent);
    v21 = self->_theStepUpEvent;
    if (v21)
    {
      sub_1000A6FB8((uint64_t)NFUnifiedAccessTransactionCALogger, v21, self->_transactionType, (uint64_t)objc_msgSend(v9, "code"));
      v23 = NFSharedSignpostLog(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AtlEvent", "AtlStepUpEventComplete", buf, 2u);
      }

      v25 = self->_theStepUpEvent;
      self->_theStepUpEvent = 0;

    }
  }
LABEL_20:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_theStepUpEvent, 0);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
}

@end
