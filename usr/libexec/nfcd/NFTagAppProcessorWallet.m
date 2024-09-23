@implementation NFTagAppProcessorWallet

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v8;
  void *v9;
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
  _BOOL4 v23;
  id v24;
  void *specific;
  uint64_t Logger;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v30;
  const char *ClassName;
  const char *Name;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  objc_class *v50;
  id v51;
  void *v52;
  void (*v53)(uint64_t, const char *, ...);
  objc_class *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  objc_class *v61;
  int v62;
  const char *v63;
  const char *v64;
  BOOL *v65;
  id v68;
  id v69;
  void *v70;
  id obj;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE buf[44];
  _BYTE v82[128];

  v69 = a3;
  v68 = a5;
  v65 = a6;
  *a6 = 0;
  if (!qword_10032AB28)
  {
    *(_OWORD *)buf = off_1002EAA60;
    *(_QWORD *)&buf[16] = 0;
    qword_10032AB28 = _sl_dlopen(buf, 0);
  }
  if (!qword_10032AB28)
    goto LABEL_30;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "records"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (!v8)
    goto LABEL_29;
  v72 = *(_QWORD *)v74;
  while (2)
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v74 != v72)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v9);
      if (objc_msgSend(v10, "isURIRecord"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "decode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v11));
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("wallet")))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "host"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lowercaseString"));
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("activate")))
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "lowercaseString"));
              if (objc_msgSend(v18, "isEqualToString:", CFSTR("/nfc")))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "user"));
                if (!v19)
                {
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));
                  if (!v20)
                  {
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "port"));
                    if (!v21)
                    {
                      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fragment"));
                      v23 = v22 == 0;

                      if (v23)
                      {
                        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        Logger = NFLogGetLogger(specific);
                        v28 = (void (*)(uint64_t, const char *, ...))Logger;
                        if (Logger)
                        {
                          Class = object_getClass(self);
                          if (class_isMetaClass(Class))
                            v30 = 43;
                          else
                            v30 = 45;
                          ClassName = object_getClassName(self);
                          Name = sel_getName(a2);
                          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "tagID"));
                          v28(6, "%c[%{public}s %{public}s]:%i Posting Wallet Tag notification with UID : %{public}@", v30, ClassName, Name, 75, v33);

                        }
                        v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v35 = NFSharedLogGetLogger(v34);
                        v36 = objc_claimAutoreleasedReturnValue(v35);
                        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                        {
                          v37 = object_getClass(self);
                          if (class_isMetaClass(v37))
                            v38 = 43;
                          else
                            v38 = 45;
                          v39 = object_getClassName(self);
                          v40 = sel_getName(a2);
                          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "tagID"));
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v38;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v39;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v40;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 75;
                          *(_WORD *)&buf[34] = 2114;
                          *(_QWORD *)&buf[36] = v41;
                          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Posting Wallet Tag notification with UID : %{public}@", buf, 0x2Cu);

                        }
                        v43 = NFSharedSignpostLog(v42);
                        v44 = objc_claimAutoreleasedReturnValue(v43);
                        if (os_signpost_enabled(v44))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", ", buf, 2u);
                        }

                        v45 = objc_alloc((Class)NSString);
                        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "tagID"));
                        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "NF_asHexString"));
                        v48 = objc_msgSend(v45, "initWithFormat:", CFSTR("%@?uid=%@"), v11, v47);

                        v77 = 0;
                        v78 = &v77;
                        v79 = 0x2050000000;
                        v49 = (void *)qword_10032AB30;
                        v80 = qword_10032AB30;
                        if (!qword_10032AB30)
                        {
                          *(_QWORD *)buf = _NSConcreteStackBlock;
                          *(_QWORD *)&buf[8] = 3221225472;
                          *(_QWORD *)&buf[16] = sub_1001C68F8;
                          *(_QWORD *)&buf[24] = &unk_1002E5E30;
                          *(_QWORD *)&buf[32] = &v77;
                          sub_1001C68F8((uint64_t)buf);
                          v49 = (void *)v78[3];
                        }
                        v50 = objc_retainAutorelease(v49);
                        _Block_object_dispose(&v77, 8);
                        v51 = objc_alloc_init(v50);
                        if (v51)
                        {
                          sub_1001C5DFC((uint64_t)self, v51, v48, 5);
                        }
                        else
                        {
                          v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                          v53 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v52);
                          if (v53)
                          {
                            v54 = object_getClass(self);
                            if (class_isMetaClass(v54))
                              v55 = 43;
                            else
                              v55 = 45;
                            v56 = object_getClassName(self);
                            v57 = sel_getName(a2);
                            v53(3, "%c[%{public}s %{public}s]:%i Resource error; dropping notification",
                              v55,
                              v56,
                              v57,
                              84);
                          }
                          v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                          v59 = NFSharedLogGetLogger(v58);
                          v60 = objc_claimAutoreleasedReturnValue(v59);
                          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                          {
                            v61 = object_getClass(self);
                            if (class_isMetaClass(v61))
                              v62 = 43;
                            else
                              v62 = 45;
                            v63 = object_getClassName(self);
                            v64 = sel_getName(a2);
                            *(_DWORD *)buf = 67109890;
                            *(_DWORD *)&buf[4] = v62;
                            *(_WORD *)&buf[8] = 2082;
                            *(_QWORD *)&buf[10] = v63;
                            *(_WORD *)&buf[18] = 2082;
                            *(_QWORD *)&buf[20] = v64;
                            *(_WORD *)&buf[28] = 1024;
                            *(_DWORD *)&buf[30] = 84;
                            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Resource error; dropping notification",
                              buf,
                              0x22u);
                          }

                        }
                        *v65 = 1;

                        goto LABEL_29;
                      }
                      goto LABEL_23;
                    }

                    v20 = 0;
                  }

                }
              }

            }
          }

        }
LABEL_23:

      }
      v9 = (char *)v9 + 1;
    }
    while (v8 != v9);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    v8 = v24;
    if (v24)
      continue;
    break;
  }
LABEL_29:

LABEL_30:
  return 0;
}

@end
