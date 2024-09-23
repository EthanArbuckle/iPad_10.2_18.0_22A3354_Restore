@implementation NFTagAppProcessorDockKit

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *specific;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NFXPCEventPublisher *eventPublisher;
  void *v41;
  void *v42;
  BOOL *v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  const __CFString *v52;
  void *v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];

  v7 = a3;
  v45 = a6;
  *a6 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v47 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "records"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isURIRecord"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "decode"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v14));
          v16 = v15;
          if (v15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scheme"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("x-dk"));

            if (v19)
            {
              specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              Logger = NFLogGetLogger(specific);
              if (Logger)
              {
                v22 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(self);
                isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(self);
                Name = sel_getName(a2);
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
                v28 = 45;
                if (isMetaClass)
                  v28 = 43;
                v22(6, "%c[%{public}s %{public}s]:%i Found DockKit notification with URL: %@, Orig msg: %@", v28, ClassName, Name, 51, v27, v47);

              }
              v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v30 = NFSharedLogGetLogger(v29);
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = object_getClass(self);
                if (class_isMetaClass(v32))
                  v33 = 43;
                else
                  v33 = 45;
                v34 = object_getClassName(self);
                v35 = sel_getName(a2);
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
                *(_DWORD *)buf = 67110402;
                v55 = v33;
                v56 = 2082;
                v57 = v34;
                v58 = 2082;
                v59 = v35;
                v60 = 1024;
                v61 = 51;
                v62 = 2112;
                v63 = v36;
                v64 = 2112;
                v65 = v47;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found DockKit notification with URL: %@, Orig msg: %@", buf, 0x36u);

              }
              v38 = NFSharedSignpostLog(v37);
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_signpost_enabled(v39))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", ", buf, 2u);
              }

              eventPublisher = self->_eventPublisher;
              v52 = CFSTR("url");
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
              v53 = v41;
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
              -[NFXPCEventPublisher sendXpcNotificationEventWithDictionary:](eventPublisher, "sendXpcNotificationEventWithDictionary:", v42);

              *v45 = 1;
              goto LABEL_25;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_25:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublisher, 0);
}

@end
