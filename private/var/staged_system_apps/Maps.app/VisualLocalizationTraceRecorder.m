@implementation VisualLocalizationTraceRecorder

+ (NSURL)traceDirectory
{
  if (qword_1014D2928 != -1)
    dispatch_once(&qword_1014D2928, &stru_1011BB338);
  return (NSURL *)(id)qword_1014D2930;
}

- (VisualLocalizationTraceRecorder)init
{
  VisualLocalizationTraceRecorder *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  VisualLocalizationTraceRecorder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VisualLocalizationTraceRecorder;
  v2 = -[VisualLocalizationTraceRecorder init](&v8, "init");
  if (v2)
  {
    v3 = geo_dispatch_queue_create_with_qos("com.apple.Maps.VisualLocalizationTrace", 17);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_began.lock._os_unfair_lock_opaque = 0;
    v2->_began.didRun = 0;
    v2->_finished.lock._os_unfair_lock_opaque = 0;
    v2->_finished.didRun = 0;
    v6 = v2;
  }

  return v2;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100560D58;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)finish
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100560DB8;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  GEOOnce(&self->_finished, v2);
}

- (void)_beginTraceIfNecessary
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100560E70;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  GEOOnce(&self->_began, v2);
}

- (void)recordAttempt:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100561380;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_recordAttemptOnIsolationQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _UNKNOWN **v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  VLLocalizationCrowdsourcingDetails *v37;
  VLLocalizationCrowdsourcingDetails *lastCrowdsourcingDetails;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  NSObject *v46;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[VisualLocalizationTraceRecorder _beginTraceIfNecessary](self, "_beginTraceIfNecessary");
  if (self->_baseDirectory)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pngData"));
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_imagesDirectory, "URLByAppendingPathComponent:", v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "URLByAppendingPathExtension:", CFSTR("png")));

      v44 = 0;
      LOBYTE(v8) = objc_msgSend(v7, "writeToURL:options:error:", v9, 0, &v44);
      v10 = v44;
      if ((v8 & 1) == 0)
      {
        v11 = sub_1005612C4();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to write image: %{public}@", buf, 0xCu);
        }

      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inputParameters"));
    v14 = objc_msgSend(v13, "mutableCopy");

    v15 = MKPlaceCollectionsLogicController_ptr;
    if (v14)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("uuid"));
      v43 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v14, 0, &v43));
      v17 = v43;
      if (v16)
      {
        v18 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_parametersDirectory, "URLByAppendingPathComponent:", v6));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v18, "URLByAppendingPathExtension:", CFSTR("json")));

        v42 = 0;
        LOBYTE(v18) = objc_msgSend(v16, "writeToURL:options:error:", v19, 0, &v42);
        v20 = v42;
        if ((v18 & 1) == 0)
        {
          v21 = v7;
          v22 = sub_1005612C4();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to write input parameters: %{public}@", buf, 0xCu);
          }

          v7 = v21;
        }

        v15 = MKPlaceCollectionsLogicController_ptr;
      }
      else
      {
        v24 = sub_1005612C4();
        v20 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to JSON-encode input parameters: %{public}@", buf, 0xCu);
        }
      }

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
    v26 = objc_msgSend(v25, "mutableCopy");

    if (v26)
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v6, CFSTR("uuid"));
      v27 = v15[345];
      v41 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dataWithJSONObject:options:error:", v26, 0, &v41));
      v29 = v41;
      if (v28)
      {
        v39 = v7;
        v30 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_resultsDirectory, "URLByAppendingPathComponent:", v6));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30, "URLByAppendingPathExtension:", CFSTR("json")));

        v40 = 0;
        LOBYTE(v30) = objc_msgSend(v28, "writeToURL:options:error:", v31, 0, &v40);
        v32 = v40;
        if ((v30 & 1) == 0)
        {
          v33 = sub_1005612C4();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v32;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to write results: %{public}@", buf, 0xCu);
          }

        }
        v7 = v39;
      }
      else
      {
        v35 = sub_1005612C4();
        v32 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v29;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to JSON-encode results: %{public}@", buf, 0xCu);
        }
      }

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crowdsourcingDetails"));

    if (v36)
    {
      v37 = (VLLocalizationCrowdsourcingDetails *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crowdsourcingDetails"));
      lastCrowdsourcingDetails = self->_lastCrowdsourcingDetails;
      self->_lastCrowdsourcingDetails = v37;

    }
  }

}

- (void)_finishOnIsolationQueue
{
  uint64_t v2;
  uint64_t v3;
  VLLocalizationCrowdsourcingDetails *lastCrowdsourcingDetails;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  int v50;
  BOOL v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  uint64_t v60;
  NSObject *obj;
  id v63;
  unsigned __int8 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((GEOVisualLocalizationCrowdsourcingIsSupported(v2, v3) & 1) == 0)
  {
    v15 = sub_1005612C4();
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v16 = "Not capturing VL Crowdsourcing details because the feature is disabled";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    goto LABEL_22;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsAllowed() & 1) == 0)
  {
    v17 = sub_1005612C4();
    v6 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v16 = "Not capturing VL Crowdsourcing details because the feature is not supported for the current device posture";
    goto LABEL_21;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsEnabled() & 1) == 0)
  {
    v18 = sub_1005612C4();
    v6 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v16 = "Not capturing VL Crowdsourcing details because the user has not given permission";
    goto LABEL_21;
  }
  lastCrowdsourcingDetails = self->_lastCrowdsourcingDetails;
  v5 = sub_1005612C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!lastCrowdsourcingDetails)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v16 = "Not capturing VL Crowdsourcing details because we did not receive any";
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Capturing VL Crowdsourcing details", buf, 2u);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[GEOVLFCrowdsourcingDetails _vl_createWithVLCrowdsourcingDetails:](GEOVLFCrowdsourcingDetails, "_vl_createWithVLCrowdsourcingDetails:", self->_lastCrowdsourcingDetails));
  if (v8)
  {
    v6 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:isDirectory:](self->_baseDirectory, "URLByAppendingPathComponent:isDirectory:", CFSTR("crowdsourcing_details.bin"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject data](v6, "data"));
    v70 = 0;
    v11 = objc_msgSend(v10, "writeToURL:options:error:", v9, 0, &v70);
    v12 = v70;

    if ((v11 & 1) == 0)
    {
      v13 = sub_1005612C4();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to write crowdsourcing details: %{public}@", buf, 0xCu);
      }

    }
    goto LABEL_22;
  }
LABEL_23:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VisualLocalizationTraceRecorder traceDirectory](VisualLocalizationTraceRecorder, "traceDirectory"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
  v22 = objc_msgSend(v19, "fileExistsAtPath:", v21);

  if ((v22 & 1) != 0)
  {
LABEL_26:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[VisualLocalizationTraceRecorder traceDirectory](VisualLocalizationTraceRecorder, "traceDirectory"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_baseDirectory, "lastPathComponent"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VisualLocalization.%@"), v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URLByAppendingPathComponent:", v29));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URLByAppendingPathExtension:", CFSTR("tar.gz")));

    v32 = sub_1005612C4();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v73 = v31;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Writing trace archive to %{public}@", buf, 0xCu);
    }

    v34 = archive_write_new();
    archive_write_set_format_v7tar();
    archive_write_add_filter_gzip(v34);
    v59 = v31;
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "path")));
    v60 = v34;
    archive_write_open_filename(v34, objc_msgSend(v35, "UTF8String"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_baseDirectory, "path"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "subpathsAtPath:", v37));

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v39 = v38;
    v40 = -[NSObject countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v66;
      obj = v39;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v42)
            objc_enumerationMutation(obj);
          v44 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          v45 = objc_autoreleasePoolPush();
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_baseDirectory, "URLByAppendingPathComponent:", v44));
          v64 = 0;
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "path"));
          v49 = objc_msgSend(v47, "fileExistsAtPath:isDirectory:", v48, &v64);
          v50 = v64;

          if (v49)
            v51 = v50 == 0;
          else
            v51 = 0;
          if (v51)
          {
            v63 = 0;
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v46, 0, &v63));
            v53 = v63;
            if (v52)
            {
              v54 = archive_entry_new();
              archive_entry_set_pathname(v54, objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
              archive_entry_set_size(v54, objc_msgSend(v52, "length"));
              archive_entry_set_filetype(v54, 0x8000);
              archive_entry_set_perm(v54, 420);
              archive_write_header(v60, v54);
              archive_entry_free(v54);
              v55 = objc_retainAutorelease(v52);
              archive_write_data(v60, objc_msgSend(v55, "bytes"), objc_msgSend(v55, "length"));
            }
            else
            {
              v56 = sub_1005612C4();
              v57 = objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v73 = v53;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to read data during archiving: %{public}@", buf, 0xCu);
              }

            }
          }

          objc_autoreleasePoolPop(v45);
        }
        v39 = obj;
        v41 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v41);
    }

    archive_write_close(v60);
    archive_write_free(v60);
    v26 = v59;
    goto LABEL_47;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[VisualLocalizationTraceRecorder traceDirectory](VisualLocalizationTraceRecorder, "traceDirectory"));
  v69 = 0;
  v25 = objc_msgSend(v23, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v24, 1, 0, &v69);
  v26 = v69;

  if ((v25 & 1) != 0)
  {

    goto LABEL_26;
  }
  v58 = sub_1005612C4();
  v39 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v73 = v26;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to create trace directory: %{public}@", buf, 0xCu);
  }
LABEL_47:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCrowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_resultsDirectory, 0);
  objc_storeStrong((id *)&self->_parametersDirectory, 0);
  objc_storeStrong((id *)&self->_imagesDirectory, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
