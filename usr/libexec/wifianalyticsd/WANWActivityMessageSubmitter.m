@implementation WANWActivityMessageSubmitter

- (WANWActivityMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  WANWActivityMessageSubmitter *v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;

  v10.receiver = self;
  v10.super_class = (Class)WANWActivityMessageSubmitter;
  v4 = -[WANWActivityMessageSubmitter init](&v10, "init");
  v4->_groupTypeForThisSubmitter = a3;
  if (!qword_1000ED0C8)
  {
    qword_1000ED0C8 = symptom_framework_init(108, "com.apple.wifi.analytics");
    if (!qword_1000ED0C8)
    {
      v6 = WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[WANWActivityMessageSubmitter initWithMessageGroupType:]";
        v13 = 1024;
        v14 = 73;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating reporter", buf, 0x12u);
      }

      v8 = WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v12 = "-[WANWActivityMessageSubmitter initWithMessageGroupType:]";
        v13 = 1024;
        v14 = 78;
        v15 = 2048;
        v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error configuring groupType: %ld", buf, 0x1Cu);
      }

      return 0;
    }
  }
  return v4;
}

- (id)submitMessage:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  int v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  int v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v42;
  NSObject *v43;
  const __CFString **v44;
  NSErrorUserInfoKey *v45;
  int v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  id v56;
  NSErrorUserInfoKey v57;
  const __CFString *v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  NSErrorUserInfoKey v69;
  const __CFString *v70;
  NSErrorUserInfoKey v71;
  const __CFString *v72;
  NSErrorUserInfoKey v73;
  const __CFString *v74;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
    *(_DWORD *)buf = 136446722;
    v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
    v61 = 1024;
    v62 = 87;
    v63 = 2112;
    v64 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);

  }
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter submitMessage", ", buf, 2u);
  }

  v10 = objc_autoreleasePoolPush();
  v11 = symptom_new(qword_1000ED0C8, 421896);
  if (!v11)
  {
    v42 = WALogCategoryDefaultHandle();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      v61 = 1024;
      v62 = 92;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating symptom", buf, 0x12u);
    }

    v73 = NSLocalizedFailureReasonErrorKey;
    v74 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v44 = &v74;
    v45 = &v73;
    goto LABEL_32;
  }
  v12 = v11;
  v13 = symptom_set_qualifier(v11, 5, 0);
  if (v13)
  {
    v46 = v13;
    v47 = WALogCategoryDefaultHandle();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      v61 = 1024;
      v62 = 94;
      v63 = 1024;
      LODWORD(v64) = v46;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error setting symptom qualifier kNWActivityQualifierWiFiFragment %d", buf, 0x18u);
    }

    v71 = NSLocalizedFailureReasonErrorKey;
    v72 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v44 = &v72;
    v45 = &v71;
    goto LABEL_32;
  }
  v14 = objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](self, "instantiateAWDProtobufAndPopulateValues:", v4));
  if (!v14)
  {
    v49 = WALogCategoryDefaultHandle();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      v61 = 1024;
      v62 = 98;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to symptom_send", buf, 0x12u);
    }

    v69 = NSLocalizedFailureReasonErrorKey;
    v70 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v44 = &v70;
    v45 = &v69;
LABEL_32:
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v45, 1));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9007, v51));

    objc_autoreleasePoolPop(v10);
    goto LABEL_20;
  }
  v15 = (void *)v14;
  v56 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v56));
  v17 = v56;
  v18 = WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class(v15);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_msgSend(v16, "length");
    *(_DWORD *)buf = 136447234;
    v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
    v61 = 1024;
    v62 = 101;
    v63 = 2112;
    v64 = v22;
    v65 = 2048;
    v66 = v23;
    v67 = 2112;
    v68 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Size of %@: %zd %@", buf, 0x30u);

  }
  v24 = objc_msgSend(v16, "length");
  v25 = objc_retainAutorelease(v16);
  v26 = symptom_set_additional_qualifier(v12, 5, v24, objc_msgSend(v25, "bytes"));
  v27 = WALogCategoryDefaultHandle();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
    v61 = 1024;
    v62 = 117;
    v63 = 1024;
    LODWORD(v64) = v26;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:symptom_set_additional_qualifier: %d", buf, 0x18u);
  }

  v29 = WALogCategoryDefaultHandle();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter symptom_send", ", buf, 2u);
  }

  v31 = symptom_send(v12);
  v32 = WALogCategoryDefaultHandle();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter symptom_send", ", buf, 2u);
  }

  if (v31)
  {
    v52 = WALogCategoryDefaultHandle();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      v61 = 1024;
      v62 = 123;
      v63 = 1024;
      LODWORD(v64) = v31;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error symptom_send() %d", buf, 0x18u);
    }

    v57 = NSLocalizedFailureReasonErrorKey;
    v58 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
    v55 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9007, v54));

    objc_autoreleasePoolPop(v10);
    v17 = (id)v55;
  }
  else
  {

    objc_autoreleasePoolPop(v10);
    v34 = WALogCategoryDefaultHandle();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
      *(_DWORD *)buf = 136446722;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      v61 = 1024;
      v62 = 127;
      v63 = 2112;
      v64 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Submit complete: %@", buf, 0x1Cu);

    }
  }
LABEL_20:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDSubmitter submissionDelegate](self, "submissionDelegate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  objc_msgSend(v37, "messsageWasSubmittedWithUUID:", v38);

  v39 = WALogCategoryDefaultHandle();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WANWActivityMessageSubmitter submitMessage", ", buf, 2u);
  }

  return v17;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end
