@implementation NFTNEPHandler

- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t signpostId;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  id v30;
  id v31;
  id v32;
  const char *Name;
  _QWORD block[4];
  id v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = NFSharedSignpostLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (self)
  {
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, signpostId, "TNEP_TagDevice_Start", ", buf, 2u);
    }
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v18 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v18(6, "%c[%{public}s %{public}s]:%i ", v22, ClassName, Name, 152);
  }
  v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v24 = NFSharedLogGetLogger(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = object_getClass(self);
    if (class_isMetaClass(v26))
      v27 = 43;
    else
      v27 = 45;
    v28 = object_getClassName(self);
    v29 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v37 = v27;
    v38 = 2082;
    v39 = v28;
    v40 = 2082;
    v41 = v29;
    v42 = 1024;
    v43 = 152;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  sub_10023CF10((uint64_t)self, 0);
  v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v11);

  sub_10023CF10((uint64_t)self, v30);
  sub_10023CF20((uint64_t)self, 0);
  v31 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v10);

  sub_10023CF20((uint64_t)self, v31);
  if (self)
    self = (NFTNEPHandler *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023CF30;
  block[3] = &unk_1002E8398;
  v35 = v9;
  v32 = v9;
  dispatch_async(&self->super, block);

}

- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *specific;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  NSObject *workQueue;
  id v40;
  const char *ClassName;
  const char *v42;
  const char *Name;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD block[4];
  id v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  id v58;
  NSErrorUserInfoKey v59;
  void *v60;

  v7 = a3;
  v8 = a4;
  if (self && self->_isServiceSelected)
  {
    if (sub_10023D490((uint64_t)self, v7))
    {
      v9 = 0;
    }
    else
    {
      v24 = objc_alloc((Class)NSError);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v59 = NSLocalizedDescriptionKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Parameter"));
      v60 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
      v9 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 10, v27);

      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v30 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v33 = 45;
        if (isMetaClass)
          v33 = 43;
        v30(3, "%c[%{public}s %{public}s]:%i Error sending message=%{public}@", v33, ClassName, Name, 178, v7);
      }
      v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = NFSharedLogGetLogger(v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = object_getClass(self);
        if (class_isMetaClass(v37))
          v38 = 43;
        else
          v38 = 45;
        *(_DWORD *)buf = 67110146;
        v50 = v38;
        v51 = 2082;
        v52 = object_getClassName(self);
        v53 = 2082;
        v54 = sel_getName(a2);
        v55 = 1024;
        v56 = 178;
        v57 = 2114;
        v58 = v7;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error sending message=%{public}@", buf, 0x2Cu);
      }

    }
    workQueue = self->_workQueue;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10023D5F4;
    v44[3] = &unk_1002E82A8;
    v45 = v9;
    v46 = v8;
    v23 = v9;
    v40 = v8;
    dispatch_async(workQueue, v44);

  }
  else
  {
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFLogGetLogger(v10);
    if (v11)
    {
      v12 = (void (*)(uint64_t, const char *, ...))v11;
      v13 = object_getClass(self);
      v14 = class_isMetaClass(v13);
      v15 = object_getClassName(self);
      v42 = sel_getName(a2);
      v16 = 45;
      if (v14)
        v16 = 43;
      v12(6, "%c[%{public}s %{public}s]:%i TNEP reader not in selected state", v16, v15, v42, 168);
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67109890;
      v50 = v21;
      v51 = 2082;
      v52 = object_getClassName(self);
      v53 = 2082;
      v54 = sel_getName(a2);
      v55 = 1024;
      v56 = 168;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TNEP reader not in selected state", buf, 0x22u);
    }

    if (self)
      self = (NFTNEPHandler *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023D380;
    block[3] = &unk_1002E8398;
    v48 = v8;
    v22 = v8;
    dispatch_async(&self->super, block);
    v23 = v48;
  }

}

- (void)startTNEPReaderWithCallback:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostId;
  NSMutableArray *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (self)
  {
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, signpostId, "TNEP_Reader_Start", ", buf, 2u);
    }

    objc_storeStrong((id *)&self->_tagDeviceServices, 0);
    v9 = objc_opt_new(NSMutableArray);
    objc_storeStrong((id *)&self->_tagDeviceServices, v9);

    self = (NFTNEPHandler *)self->_workQueue;
  }
  else
  {

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023D738;
  block[3] = &unk_1002E8398;
  v12 = v4;
  v10 = v4;
  dispatch_async(&self->super, block);

}

- (void)tnepReaderSelectService:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NFTNEPHandler *v8;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t signpostId;
  id v34;
  id v35;
  const char *ClassName;
  const char *Name;
  unsigned __int8 v38;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  SEL v45;
  _QWORD block[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  _BYTE v53[14];
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  id v59;

  v6 = a3;
  v40 = a4;
  v38 = objc_msgSend(v6, "length");
  v7 = v6;
  if (self)
  {
    v8 = self;
    objc_sync_enter(v8);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v9 = v8->_tagDeviceServices;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, buf, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uri"));
          v15 = objc_msgSend(v14, "isEqualToString:", v7);

          if (v15)
          {
            v10 = v13;
            goto LABEL_12;
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, buf, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v8);
  }
  else
  {
    v10 = 0;
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v18 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v21 = 45;
    if (isMetaClass)
      v21 = 43;
    v18(6, "%c[%{public}s %{public}s]:%i %{public}@", v21, ClassName, Name, 202, v7);
  }
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFSharedLogGetLogger(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    v27 = object_getClassName(self);
    v28 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v53 = v26;
    *(_WORD *)&v53[4] = 2082;
    *(_QWORD *)&v53[6] = v27;
    v54 = 2082;
    v55 = v28;
    v56 = 1024;
    v57 = 202;
    v58 = 2114;
    v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (v38 && v10)
  {
    v30 = NFSharedSignpostLog(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = v31;
    if (self)
    {
      signpostId = self->_signpostId;
      if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v53 = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "TNEP_Reader_Select", "service=%@", buf, 0xCu);
      }
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10023DCA0;
    v41[3] = &unk_1002EC398;
    v41[4] = self;
    v44 = v40;
    v45 = a2;
    v42 = v7;
    v43 = v10;
    v34 = v40;
    sub_10023E244((uint64_t)self, v43, 1u, v41);

  }
  else
  {
    if (self)
      self = (NFTNEPHandler *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023DB90;
    block[3] = &unk_1002E8398;
    v47 = v40;
    v35 = v40;
    dispatch_async(&self->super, block);

  }
}

- (void)tnepReaderDeselectWithCallback:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t signpostId;
  id v23;
  const char *Name;
  _QWORD v25[5];
  id v26;
  SEL v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 249);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v29 = v17;
    v30 = 2082;
    v31 = object_getClassName(self);
    v32 = 2082;
    v33 = sel_getName(a2);
    v34 = 1024;
    v35 = 249;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v19 = NFSharedSignpostLog(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (self)
  {
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "TNEP_Reader_Deselect", ", buf, 2u);
    }
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10023EB08;
  v25[3] = &unk_1002E6330;
  v26 = v5;
  v27 = a2;
  v25[4] = self;
  v23 = v5;
  sub_10023E244((uint64_t)self, 0, 0, v25);

}

- (void)tnepReaderSend:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t signpostId;
  NFTNEPService *readerSelectedService;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = NFSharedSignpostLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (self)
  {
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "TNEP_Reader_Send", ", buf, 2u);
    }

    readerSelectedService = self->_readerSelectedService;
  }
  else
  {

    readerSelectedService = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10023EEE0;
  v16[3] = &unk_1002EC3C0;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v19 = a2;
  v14 = v8;
  v15 = v7;
  sub_10023F128(self, v15, readerSelectedService, v16);

}

- (void)tnepReaderRestartPollingWithCallback:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  sub_10023F510((uint64_t)self, 0);
  v4[2](v4, 0);

}

- (void)tnepServiceInvalidate
{
  sub_10023F510((uint64_t)self, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readPurpose, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_tagMemory, 0);
  objc_storeStrong((id *)&self->_tagDeviceServices, 0);
  objc_storeStrong((id *)&self->_initialRecords, 0);
  objc_storeStrong((id *)&self->_remoteDev, 0);
  objc_destroyWeak((id *)&self->_remoteProxy);
  objc_storeStrong((id *)&self->_readerSelectedService, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
