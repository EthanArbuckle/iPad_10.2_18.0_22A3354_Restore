@implementation NFTagAppLauncher

- (NFTagAppLauncher)init
{
  NFTagAppLauncher *v2;
  NSMutableArray *v3;
  NSMutableArray *tagApps;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFTagAppLauncher;
  v2 = -[NFTagAppLauncher init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v2, 0);
    tagApps = v2->_tagApps;
    v2->_tagApps = v3;

  }
  return v2;
}

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *specific;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *sel;
  NFTagAppLauncher *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];

  v10 = a3;
  *a6 = 0;
  *a4 = 0;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "records"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (v12)
  {
    v13 = v12;
    v41 = self;
    v14 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "isURIRecord"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "decode"));
          v18 = objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v17));
          if (v18)
          {
            v20 = (void *)v18;
            sel = a2;
            v21 = objc_retainAutorelease(v10);
            *a4 = v21;
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v24 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(v41);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(v41);
              Name = sel_getName(sel);
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
              v30 = 45;
              if (isMetaClass)
                v30 = 43;
              v24(6, "%c[%{public}s %{public}s]:%i Found App URL: %@, Orig msg: %@", v30, ClassName, Name, 75, v29, v21);

            }
            v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v32 = NFSharedLogGetLogger(v31);
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = object_getClass(v41);
              if (class_isMetaClass(v34))
                v35 = 43;
              else
                v35 = 45;
              v36 = object_getClassName(v41);
              v37 = sel_getName(sel);
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
              *(_DWORD *)buf = 67110402;
              v47 = v35;
              v48 = 2082;
              v49 = v36;
              v50 = 2082;
              v51 = v37;
              v52 = 1024;
              v53 = 75;
              v54 = 2112;
              v55 = v38;
              v56 = 2112;
              v57 = v21;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found App URL: %@, Orig msg: %@", buf, 0x36u);

            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));

            goto LABEL_22;
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      if (v13)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeParser, 0);
  objc_storeStrong((id *)&self->_tagApps, 0);
}

@end
