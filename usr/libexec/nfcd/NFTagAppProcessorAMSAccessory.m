@implementation NFTagAppProcessorAMSAccessory

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *specific;
  uint64_t Logger;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  const char *ClassName;
  const char *Name;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];

  *a6 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "records"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (!v7)
    goto LABEL_24;
  v8 = v7;
  v9 = *(_QWORD *)v49;
  v47 = v6;
  while (2)
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v49 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v10);
      if (objc_msgSend(v11, "isURIRecord"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "decode"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v12));
        v14 = v13;
        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scheme"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lowercaseString"));
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("https")))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "host"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));
            if (objc_msgSend(v18, "isEqualToString:", CFSTR("ams.apple.com")))
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "user"));
              if (!v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "password"));
                if (!v20)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "port"));
                  if (!v21)
                  {
                    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fragment"));

                    v6 = v47;
                    if (!v22)
                    {
                      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      Logger = NFLogGetLogger(specific);
                      if (Logger)
                      {
                        v27 = (void (*)(uint64_t, const char *, ...))Logger;
                        Class = object_getClass(self);
                        isMetaClass = class_isMetaClass(Class);
                        ClassName = object_getClassName(self);
                        Name = sel_getName(a2);
                        v30 = 45;
                        if (isMetaClass)
                          v30 = 43;
                        v6 = v47;
                        v27(6, "%c[%{public}s %{public}s]:%i Found AMS Accessory: %{public}@", v30, ClassName, Name, 39, v14);
                      }
                      v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      v32 = NFSharedLogGetLogger(v31);
                      v33 = objc_claimAutoreleasedReturnValue(v32);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                      {
                        v34 = object_getClass(self);
                        if (class_isMetaClass(v34))
                          v35 = 43;
                        else
                          v35 = 45;
                        v36 = object_getClassName(self);
                        v37 = sel_getName(a2);
                        *(_DWORD *)buf = 67110146;
                        v53 = v35;
                        v54 = 2082;
                        v55 = v36;
                        v56 = 2082;
                        v57 = v37;
                        v58 = 1024;
                        v59 = 39;
                        v60 = 2114;
                        v61 = v14;
                        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found AMS Accessory: %{public}@", buf, 0x2Cu);
                      }

                      v39 = NFSharedSignpostLog(v38);
                      v40 = objc_claimAutoreleasedReturnValue(v39);
                      if (os_signpost_enabled(v40))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", ", buf, 2u);
                      }

                      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
                      objc_msgSend(v41, "postNotificationName:object:userInfo:options:", CFSTR("com.apple.nfcd.ams.accessory"), v12, 0, 3);

                      *a6 = 1;
                      goto LABEL_24;
                    }
                    goto LABEL_18;
                  }

                  v20 = 0;
                }

              }
            }

            v6 = v47;
          }

        }
LABEL_18:

      }
      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    v8 = v23;
    if (v23)
      continue;
    break;
  }
LABEL_24:

  return 0;
}

@end
