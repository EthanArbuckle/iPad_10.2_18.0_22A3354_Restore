@implementation NFTagAppProcessorHomeKitAccessory

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _UNKNOWN **v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *specific;
  uint64_t Logger;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  BOOL *v49;
  void *v50;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v8 = a5;
  v49 = a6;
  *a6 = 0;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "records"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v58;
    v13 = &AMFDRSealingMapCopyLocalData_ptr;
    v46 = *(_QWORD *)v58;
    v47 = v8;
    v50 = v9;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "isURIRecord"))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "decode"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[270], "componentsWithString:"));
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v17 = objc_msgSend(&off_100305E60, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v54;
            while (2)
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v54 != v19)
                  objc_enumerationMutation(&off_100305E60);
                if (v16)
                {
                  v21 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheme"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lowercaseString"));
                  LODWORD(v21) = objc_msgSend(v23, "isEqualToString:", v21);

                  if ((_DWORD)v21)
                  {
                    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    Logger = NFLogGetLogger(specific);
                    v8 = v47;
                    if (Logger)
                    {
                      v26 = (void (*)(uint64_t, const char *, ...))Logger;
                      Class = object_getClass(self);
                      isMetaClass = class_isMetaClass(Class);
                      ClassName = object_getClassName(self);
                      Name = sel_getName(a2);
                      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tagID"));
                      v32 = 45;
                      if (isMetaClass)
                        v32 = 43;
                      v26(6, "%c[%{public}s %{public}s]:%i Posting HomeKit Tag notification with UID : %@ for urlText = %@", v32, ClassName, Name, 55, v31, v52);

                    }
                    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v34 = NFSharedLogGetLogger(v33);
                    v35 = objc_claimAutoreleasedReturnValue(v34);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      v36 = object_getClass(self);
                      if (class_isMetaClass(v36))
                        v37 = 43;
                      else
                        v37 = 45;
                      v38 = object_getClassName(self);
                      v39 = sel_getName(a2);
                      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tagID"));
                      *(_DWORD *)buf = 67110402;
                      v62 = v37;
                      v63 = 2082;
                      v64 = v38;
                      v65 = 2082;
                      v66 = v39;
                      v67 = 1024;
                      v68 = 55;
                      v69 = 2112;
                      v70 = v40;
                      v71 = 2112;
                      v72 = v52;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Posting HomeKit Tag notification with UID : %@ for urlText = %@", buf, 0x36u);

                    }
                    v42 = NFSharedSignpostLog(v41);
                    v43 = objc_claimAutoreleasedReturnValue(v42);
                    if (os_signpost_enabled(v43))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", ", buf, 2u);
                    }

                    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
                    objc_msgSend(v44, "postNotificationName:object:userInfo:options:", CFSTR("com.apple.nfcd.homekit.proxcard"), v52, 0, 3);

                    -[NFXPCEventPublisher sendXpcNotificationEventWithString:](self->_eventPublisher, "sendXpcNotificationEventWithString:", v52);
                    *v49 = 1;

                    v9 = v50;
                    goto LABEL_32;
                  }
                }
              }
              v18 = objc_msgSend(&off_100305E60, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
              if (v18)
                continue;
              break;
            }
          }

          v9 = v50;
          v12 = v46;
          v13 = &AMFDRSealingMapCopyLocalData_ptr;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
      v8 = v47;
    }
    while (v11);
  }
LABEL_32:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublisher, 0);
}

@end
