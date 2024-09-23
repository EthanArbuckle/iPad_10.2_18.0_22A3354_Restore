@implementation DIIOCacheDelete

- (DIIOCacheDelete)initWithDebugServiceName:(id)a3
{
  id v5;
  DIIOCacheDelete *v6;
  DIIOCacheDelete *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIIOCacheDelete;
  v6 = -[DIBaseServiceDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_debugServiceName, a3);
    -[DIIOCacheDelete setupSigtermHandler](v7, "setupSigtermHandler");
  }

  return v7;
}

- (id)sandboxProfile
{
  return CFSTR("com.apple.diskimagesiod");
}

- (void)setupSigtermHandler
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigtermHandler;

  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_sigtermHandler, &stru_10016D520);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (void)restartExitTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOCacheDelete exitTimer](self, "exitTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIIOCacheDelete exitTimer](self, "exitTimer"));
    objc_msgSend(v4, "invalidate");

    -[DIIOCacheDelete setExitTimer:](self, "setExitTimer:", 0);
  }
  -[DIIOCacheDelete performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "setupExitTimer:", 0, 0);
}

- (void)setupExitTimer:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006148;
  v6[3] = &unk_10016D548;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 20.0));
  -[DIIOCacheDelete setExitTimer:](self, "setExitTimer:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (unint64_t)eraseOldCacheFiles
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSURLResourceKey v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  double v21;
  double v22;
  int v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  char *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  int v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  char *v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  _BOOL4 v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  const char *v72;
  const char *v73;
  int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  int v80;
  void *v81;
  id obj;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint8_t buf[4];
  int v96;
  __int16 v97;
  const char *v98;
  __int16 v99;
  _BYTE v100[20];
  __int16 v101;
  unint64_t v102;
  _BYTE v103[128];
  _QWORD v104[3];
  char v105[1024];

  if (confstr(65538, v105, 0x400uLL))
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v105, 1, 0));
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("^%@.*\\.%@$"), CFSTR("diskimage_"), CFSTR("cache")));
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v104[0] = NSURLContentAccessDateKey;
    v104[1] = NSURLFileSizeKey;
    v104[2] = NSURLNameKey;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 3));
    v76 = (void *)v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, v4, 5, &stru_10016D588));

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    if (!v6)
    {
      v79 = 0;
      v78 = 0;
      HIDWORD(v77) = 0;
      v80 = 0;
      goto LABEL_68;
    }
    v7 = v6;
    v79 = 0;
    v78 = 0;
    HIDWORD(v77) = 0;
    v80 = 0;
    v8 = *(_QWORD *)v91;
    v9 = NSURLNameKey;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v91 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)v10);
        v89 = 0;
        v12 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v89, v9, 0);
        v13 = v89;
        v14 = v13;
        if (v12
          && objc_msgSend(v81, "numberOfMatchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length")))
        {
          v87 = 0;
          v88 = 0;
          v15 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v88, NSURLContentAccessDateKey, &v87);
          v16 = v88;
          v17 = v87;
          v83 = v16;
          if (v15)
          {
            v85 = 0;
            v86 = 0;
            v18 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v86, NSURLFileSizeKey, &v85);
            v19 = v86;
            v20 = v85;

            if ((v18 & 1) != 0)
            {
              ++v80;
              v79 += (unint64_t)objc_msgSend(v19, "unsignedLongLongValue");
              objc_msgSend(v16, "timeIntervalSinceNow");
              v22 = v21;
              v23 = *__error();
              v24 = sub_1000BF0BC();
              if (v22 >= -259200.0)
              {
                if (v24)
                {
                  v94 = 0;
                  v40 = sub_1000BF044();
                  v41 = objc_claimAutoreleasedReturnValue(v40);
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    v42 = 3;
                  else
                    v42 = 2;
                  *(_DWORD *)buf = 68158466;
                  v96 = 37;
                  v97 = 2080;
                  v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  v99 = 2114;
                  *(_QWORD *)v100 = v11;
                  *(_WORD *)&v100[8] = 2048;
                  *(double *)&v100[10] = v22 / -86400.0;
                  LODWORD(v73) = 38;
                  v43 = (char *)_os_log_send_and_compose_impl(v42, &v94, 0, 0, &_mh_execute_header, v41, 0, "%.*s: Skipping %{public}@ (last access time was %.2f days ago)", buf, v73);

                  if (v43)
                  {
                    fprintf(__stderrp, "%s\n", v43);
                    free(v43);
                  }
                  v9 = NSURLNameKey;
                }
                else
                {
                  v48 = sub_1000BF044();
                  v49 = objc_claimAutoreleasedReturnValue(v48);
                  v9 = NSURLNameKey;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 68158466;
                    v96 = 37;
                    v97 = 2080;
                    v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                    v99 = 2114;
                    *(_QWORD *)v100 = v11;
                    *(_WORD *)&v100[8] = 2048;
                    *(double *)&v100[10] = v22 / -86400.0;
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%.*s: Skipping %{public}@ (last access time was %.2f days ago)", buf, 0x26u);
                  }

                }
                *__error() = v23;
                v17 = v20;
                goto LABEL_33;
              }
              if (v24)
              {
                v94 = 0;
                v25 = sub_1000BF044();
                v26 = objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  v27 = 3;
                else
                  v27 = 2;
                *(_DWORD *)buf = 68158466;
                v96 = 37;
                v97 = 2080;
                v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                v99 = 2114;
                *(_QWORD *)v100 = v11;
                *(_WORD *)&v100[8] = 2048;
                *(double *)&v100[10] = v22 / -86400.0;
                LODWORD(v73) = 38;
                v28 = (char *)_os_log_send_and_compose_impl(v27, &v94, 0, 0, &_mh_execute_header, v26, 0, "%.*s: Last access time expired for %{public}@ (%.2f days), removing", buf, v73);

                if (v28)
                {
                  fprintf(__stderrp, "%s\n", v28);
                  free(v28);
                }
              }
              else
              {
                v44 = sub_1000BF044();
                v45 = objc_claimAutoreleasedReturnValue(v44);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 68158466;
                  v96 = 37;
                  v97 = 2080;
                  v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                  v99 = 2114;
                  *(_QWORD *)v100 = v11;
                  *(_WORD *)&v100[8] = 2048;
                  *(double *)&v100[10] = v22 / -86400.0;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%.*s: Last access time expired for %{public}@ (%.2f days), removing", buf, 0x26u);
                }

              }
              *__error() = v23;
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
              v84 = v20;
              v47 = objc_msgSend(v46, "removeItemAtURL:error:", v11, &v84);
              v17 = v84;

              if (v47)
              {
                ++HIDWORD(v77);
                v78 += (unint64_t)objc_msgSend(v19, "unsignedLongLongValue");
                v9 = NSURLNameKey;
                goto LABEL_33;
              }
              v29 = *__error();
              if (sub_1000BF0BC())
              {
                v94 = 0;
                v50 = sub_1000BF044();
                v31 = objc_claimAutoreleasedReturnValue(v50);
                v51 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
                *(_DWORD *)buf = 68158466;
                if (v51)
                  v52 = 3;
                else
                  v52 = 2;
                v96 = 37;
                v97 = 2080;
                v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                v99 = 2114;
                *(_QWORD *)v100 = v11;
                *(_WORD *)&v100[8] = 2114;
                *(_QWORD *)&v100[10] = v17;
                LODWORD(v73) = 38;
                v34 = _os_log_send_and_compose_impl(v52, &v94, 0, 0, &_mh_execute_header, v31, 16, "%.*s: Failed to remove %{public}@: %{public}@", buf, v73);
                goto LABEL_25;
              }
              v53 = sub_1000BF044();
              v37 = objc_claimAutoreleasedReturnValue(v53);
              v9 = NSURLNameKey;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 68158466;
                v96 = 37;
                v97 = 2080;
                v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
                v99 = 2114;
                *(_QWORD *)v100 = v11;
                *(_WORD *)&v100[8] = 2114;
                *(_QWORD *)&v100[10] = v17;
                v38 = v37;
                v39 = "%.*s: Failed to remove %{public}@: %{public}@";
LABEL_30:
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v39, buf, 0x26u);
              }
              goto LABEL_31;
            }
            v17 = v20;
            v9 = NSURLNameKey;
          }
          else
          {
            v19 = 0;
          }
          v29 = *__error();
          if (sub_1000BF0BC())
          {
            v94 = 0;
            v30 = sub_1000BF044();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 68158466;
            if (v32)
              v33 = 3;
            else
              v33 = 2;
            v96 = 37;
            v97 = 2080;
            v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
            v99 = 2114;
            *(_QWORD *)v100 = v11;
            *(_WORD *)&v100[8] = 2114;
            *(_QWORD *)&v100[10] = v17;
            LODWORD(v73) = 38;
            v34 = _os_log_send_and_compose_impl(v33, &v94, 0, 0, &_mh_execute_header, v31, 16, "%.*s: Failed retrieving property for %{public}@: %{public}@", buf, v73);
LABEL_25:
            v35 = (char *)v34;

            if (v35)
            {
              fprintf(__stderrp, "%s\n", v35);
              free(v35);
            }
            v9 = NSURLNameKey;
          }
          else
          {
            v36 = sub_1000BF044();
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68158466;
              v96 = 37;
              v97 = 2080;
              v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
              v99 = 2114;
              *(_QWORD *)v100 = v11;
              *(_WORD *)&v100[8] = 2114;
              *(_QWORD *)&v100[10] = v17;
              v38 = v37;
              v39 = "%.*s: Failed retrieving property for %{public}@: %{public}@";
              goto LABEL_30;
            }
LABEL_31:

          }
          *__error() = v29;
LABEL_33:

        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
      v7 = v54;
      if (!v54)
      {
LABEL_68:

        v60 = *__error();
        if (sub_1000BF0BC())
        {
          v94 = 0;
          v61 = sub_1000BF044();
          v62 = objc_claimAutoreleasedReturnValue(v61);
          v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68158978;
          v96 = 37;
          if (v63)
            v64 = 3;
          else
            v64 = 2;
          v97 = 2080;
          v65 = v78;
          v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
          v99 = 1024;
          *(_DWORD *)v100 = HIDWORD(v77);
          *(_WORD *)&v100[4] = 2048;
          *(_QWORD *)&v100[6] = v78 >> 20;
          *(_WORD *)&v100[14] = 1024;
          *(_DWORD *)&v100[16] = v80;
          v101 = 2048;
          v102 = v79 >> 20;
          LODWORD(v73) = 50;
          v66 = (char *)_os_log_send_and_compose_impl(v64, &v94, 0, 0, &_mh_execute_header, v62, 0, "%.*s: Summary: removed %u files (%llu MB) out of %u files (%llu MB) of cache", (int)buf, v73, v74, v75, (_DWORD)v76, v77);

          if (v66)
          {
            fprintf(__stderrp, "%s\n", v66);
            free(v66);
          }
        }
        else
        {
          v67 = sub_1000BF044();
          v68 = objc_claimAutoreleasedReturnValue(v67);
          v65 = v78;
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68158978;
            v96 = 37;
            v97 = 2080;
            v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
            v99 = 1024;
            *(_DWORD *)v100 = HIDWORD(v77);
            *(_WORD *)&v100[4] = 2048;
            *(_QWORD *)&v100[6] = v78 >> 20;
            *(_WORD *)&v100[14] = 1024;
            *(_DWORD *)&v100[16] = v80;
            v101 = 2048;
            v102 = v79 >> 20;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%.*s: Summary: removed %u files (%llu MB) out of %u files (%llu MB) of cache", buf, 0x32u);
          }

        }
        *__error() = v60;

        return v65;
      }
    }
  }
  v55 = *__error();
  if (sub_1000BF0BC())
  {
    v94 = 0;
    v56 = sub_1000BF044();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      v58 = 3;
    else
      v58 = 2;
    *(_DWORD *)buf = 68157954;
    v96 = 37;
    v97 = 2080;
    v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
    LODWORD(v72) = 18;
    v59 = (char *)_os_log_send_and_compose_impl(v58, &v94, 0, 0, &_mh_execute_header, v57, 16, "%.*s: Could not determine cache dir", (int)buf, v72);

    if (v59)
    {
      fprintf(__stderrp, "%s\n", v59);
      free(v59);
    }
  }
  else
  {
    v69 = sub_1000BF044();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      v96 = 37;
      v97 = 2080;
      v98 = "-[DIIOCacheDelete eraseOldCacheFiles]";
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%.*s: Could not determine cache dir", buf, 0x12u);
    }

  }
  v65 = 0;
  *__error() = v55;
  return v65;
}

- (id)onPeriodicWithInfo:(id)a3 urgency:(int)a4
{
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v7 = *__error();
  if (sub_1000BF0BC())
  {
    v18 = 0;
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 68158467;
    v22 = 46;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = 3;
    else
      v10 = 2;
    v23 = 2080;
    v24 = "-[DIIOCacheDelete onPeriodicWithInfo:urgency:]";
    v25 = 1024;
    v26 = a4;
    v27 = 2113;
    v28 = v6;
    v17 = 34;
    v11 = (char *)_os_log_send_and_compose_impl(v10, &v18, 0, 0, &_mh_execute_header, v9, 0, "%.*s: Reached periodic cache delete with urgency %d, volume: %{private}@", buf, v17);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }
  else
  {
    v12 = sub_1000BF044();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158467;
      v22 = 46;
      v23 = 2080;
      v24 = "-[DIIOCacheDelete onPeriodicWithInfo:urgency:]";
      v25 = 1024;
      v26 = a4;
      v27 = 2113;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Reached periodic cache delete with urgency %d, volume: %{private}@", buf, 0x22u);
    }

  }
  *__error() = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[DIIOCacheDelete eraseOldCacheFiles](self, "eraseOldCacheFiles")));
  -[DIIOCacheDelete restartExitTimer](self, "restartExitTimer");
  v19[0] = CFSTR("CACHE_DELETE_VOLUME");
  v19[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v20[0] = v6;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

  return v15;
}

- (BOOL)registerPeriodicCallback
{
  int v2;
  BOOL v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  id location;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;

  objc_initWeak(&location, self);
  v27[1] = &_CacheDeleteRegisterInfoCallbacks;
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100007904;
    v25[3] = &unk_10016D5B0;
    objc_copyWeak(&v26, &location);
    v2 = CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.diskimagesiod.cachedelete"), 0, 0, 0, v25);
    v3 = v2 == 0;
    if (v2)
    {
      v4 = *__error();
      if (!sub_1000BF0BC())
      {
        v17 = sub_1000BF044();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68157954;
          v30 = 43;
          v31 = 2080;
          v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%.*s: CacheDelete registration failed", buf, 0x12u);
        }

        goto LABEL_32;
      }
      v27[0] = 0;
      v5 = sub_1000BF044();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        v7 = 3;
      else
        v7 = 2;
      *(_DWORD *)buf = 68157954;
      v30 = 43;
      v31 = 2080;
      v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
      LODWORD(v24) = 18;
      v8 = (char *)_os_log_send_and_compose_impl(v7, v27, 0, 0, &_mh_execute_header, v6, 16, "%.*s: CacheDelete registration failed", (int)buf, v24);

      if (v8)
        goto LABEL_20;
    }
    else
    {
      v4 = *__error();
      if (!sub_1000BF0BC())
      {
        v21 = sub_1000BF044();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v30 = 43;
          v31 = 2080;
          v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%.*s: Cache delete periodic registered", buf, 0x12u);
        }

        goto LABEL_32;
      }
      v27[0] = 0;
      v14 = sub_1000BF044();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v16 = 3;
      else
        v16 = 2;
      *(_DWORD *)buf = 68157954;
      v30 = 43;
      v31 = 2080;
      v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
      LODWORD(v24) = 18;
      v8 = (char *)_os_log_send_and_compose_impl(v16, v27, 0, 0, &_mh_execute_header, v15, 0, "%.*s: Cache delete periodic registered", (int)buf, v24);

      if (v8)
      {
LABEL_20:
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }
LABEL_32:
    *__error() = v4;
    objc_destroyWeak(&v26);
    goto LABEL_33;
  }
  v9 = *__error();
  if (sub_1000BF0BC())
  {
    v27[0] = 0;
    v10 = sub_1000BF044();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v12 = 3;
    else
      v12 = 2;
    *(_DWORD *)buf = 68157954;
    v30 = 43;
    v31 = 2080;
    v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
    LODWORD(v24) = 18;
    v13 = (char *)_os_log_send_and_compose_impl(v12, v27, 0, 0, &_mh_execute_header, v11, 16, "%.*s: CacheDelete is not supported, daemon was launched unexpectedly without an instance ID", (int)buf, v24);

    if (v13)
    {
      fprintf(__stderrp, "%s\n", v13);
      free(v13);
    }
  }
  else
  {
    v19 = sub_1000BF044();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      v30 = 43;
      v31 = 2080;
      v32 = "-[DIIOCacheDelete registerPeriodicCallback]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%.*s: CacheDelete is not supported, daemon was launched unexpectedly without an instance ID", buf, 0x12u);
    }

  }
  v3 = 0;
  *__error() = v9;
LABEL_33:
  objc_destroyWeak(&location);
  return v3;
}

- (id)serviceName
{
  return -[DIIOCacheDelete debugServiceName](self, "debugServiceName");
}

- (BOOL)setupNewConnection:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;

  v3 = a3;
  v4 = *__error();
  if (sub_1000BF0BC())
  {
    v12 = 0;
    v5 = sub_1000BF044();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      v7 = 3;
    else
      v7 = 2;
    *(_DWORD *)buf = 68157954;
    v14 = 38;
    v15 = 2080;
    v16 = "-[DIIOCacheDelete setupNewConnection:]";
    LODWORD(v11) = 18;
    v8 = (char *)_os_log_send_and_compose_impl(v7, &v12, 0, 0, &_mh_execute_header, v6, 16, "%.*s: Connection to cache delete instance is not allowed, quitting", (int)buf, v11);

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    v9 = sub_1000BF044();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      v14 = 38;
      v15 = 2080;
      v16 = "-[DIIOCacheDelete setupNewConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%.*s: Connection to cache delete instance is not allowed, quitting", buf, 0x12u);
    }

  }
  *__error() = v4;
  exit(0);
}

- (NSString)debugServiceName
{
  return self->_debugServiceName;
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
  objc_storeStrong((id *)&self->_sigtermHandler, a3);
}

- (NSTimer)exitTimer
{
  return self->_exitTimer;
}

- (void)setExitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_exitTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_sigtermHandler, 0);
  objc_storeStrong((id *)&self->_debugServiceName, 0);
}

@end
