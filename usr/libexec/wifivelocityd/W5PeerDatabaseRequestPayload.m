@implementation W5PeerDatabaseRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDatabaseRequestPayload)initWithRequest:(id)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  W5PeerDatabaseRequestPayload *v8;
  uint64_t v9;
  NSObject *v10;
  NSNumber *v11;
  uint64_t v12;
  id v13;
  __objc2_class **p_superclass;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSFetchRequest *fetchRequest;
  uint8_t *v20;
  id v21;
  const uint8_t *v22;
  id v23;
  id v24;
  size_t v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSSet *v35;
  uint64_t v36;
  char *v37;
  NSFetchRequest *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSSet *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  NSFetchRequest *v54;
  uint64_t v55;
  _BOOL4 v56;
  char *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  W5PeerDatabaseRequestPayload *v65;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  void *v72;
  id v73;
  id v74;
  objc_super v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  char *v79;
  __int16 v80;
  id v81;

  v4 = (char *)a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_100091474();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload initWithRequest", (const char *)&unk_1000BF1F1, buf, 2u);
  }

  v75.receiver = self;
  v75.super_class = (Class)W5PeerDatabaseRequestPayload;
  v8 = -[W5PeerDatabaseRequestPayload init](&v75, "init");
  if (!v8)
    goto LABEL_41;
  v9 = sub_10008F56C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    v78 = 2112;
    v79 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: W5PeerDatabaseRequestPayload dictionary %@", buf, 22);
  }

  v11 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version"));
  v8->_version = v11;
  if (!v11)
  {
LABEL_41:
    v13 = 0;
    v37 = 0;
    goto LABEL_35;
  }
  if (!-[NSNumber isEqualToNumber:](v11, "isEqualToNumber:", &off_1000E3B28))
  {
    if (!-[NSNumber isEqualToNumber:](v8->_version, "isEqualToNumber:", &off_1000E3B40))
      goto LABEL_30;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fetchRequestNSDataUncompressed")));

    if (v39)
    {
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fetchRequestNSDataUncompressed")));
      if (v40)
      {
        v13 = (id)v40;
        v41 = sub_10008F56C();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = (char *)objc_msgSend(v13, "length");
          *(_DWORD *)buf = 136315394;
          v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
          v78 = 2048;
          v79 = v43;
          LODWORD(v69) = 22;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v42, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: Uncompressed fetchRequestData size is %zd", (const char *)buf, v69);
        }

        v45 = objc_opt_class(NSFetchRequest, v44);
        v47 = objc_opt_class(NSDate, v46);
        v49 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v45, v47, objc_opt_class(NSSet, v48), 0);
        v16 = objc_claimAutoreleasedReturnValue(v49);
        v73 = 0;
        v50 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v16, v13, &v73));
        v37 = (char *)v73;
        fetchRequest = v8->_fetchRequest;
        v8->_fetchRequest = (NSFetchRequest *)v50;
        goto LABEL_24;
      }
      goto LABEL_30;
    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fetchRequestNSData")));

    if (!v60)
      goto LABEL_30;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fetchRequestNSData")));
  if (!v12)
  {
LABEL_30:
    v61 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE to find kW5PeerRequestDatabaseFetchRequestNSDataUncompressedKey or kW5PeerRequestDatabaseFetchRequestNSDataKey", (const char *)buf);
    }
    v13 = 0;
    goto LABEL_33;
  }
  v13 = (id)v12;
  p_superclass = &OBJC_METACLASS___W5WiFiPerfLoggingManager.superclass;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "getPairOfBuffersFromPool"));

  if ((unint64_t)-[NSObject count](v16, "count") > 1)
  {
    v71 = v4;
    v72 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v16, "firstObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v16, "lastObject"));
    compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
    fetchRequest = objc_retainAutorelease(v17);
    v20 = (uint8_t *)-[NSFetchRequest mutableBytes](fetchRequest, "mutableBytes");
    v21 = -[NSFetchRequest length](fetchRequest, "length");
    v13 = objc_retainAutorelease(v13);
    v22 = (const uint8_t *)objc_msgSend(v13, "bytes");
    v23 = objc_msgSend(v13, "length");
    v24 = objc_retainAutorelease(v18);
    v25 = compression_decode_buffer(v20, (size_t)v21, v22, (size_t)v23, objc_msgSend(v24, "mutableBytes"), COMPRESSION_LZFSE);
    v26 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v28)
      {
        v29 = objc_msgSend(v13, "length");
        *(_DWORD *)buf = 136315650;
        v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        v78 = 2048;
        v79 = (char *)v25;
        v80 = 2048;
        v81 = v29;
        LODWORD(v69) = 32;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: compression_decode_buffer fetchRequestData to Size of %zd, from size %zd", (const char *)buf, v69, v70);
      }

      -[NSFetchRequest setLength:](fetchRequest, "setLength:", v25);
      v31 = objc_opt_class(NSFetchRequest, v30);
      v33 = objc_opt_class(NSDate, v32);
      v35 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, v33, objc_opt_class(NSSet, v34), 0);
      v27 = objc_claimAutoreleasedReturnValue(v35);
      v74 = 0;
      v36 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v27, fetchRequest, &v74));
      v37 = (char *)v74;
      v38 = v8->_fetchRequest;
      v8->_fetchRequest = (NSFetchRequest *)v36;

      v4 = v71;
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___W5WiFiPerfLoggingManager + 8);
    }
    else
    {
      if (v28)
      {
        v51 = objc_msgSend(v13, "length");
        *(_DWORD *)buf = 136315650;
        v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        v78 = 2048;
        v79 = 0;
        v80 = 2048;
        v81 = v51;
        LODWORD(v69) = 32;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: compression_decode_buffer fetchRequestData to Size of %zd, from size %zd", (const char *)buf, v69, v70);
      }
      v37 = 0;
      v4 = v71;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 14, "sharedW5BufferPool"));
    objc_msgSend(v52, "returnBufferToPool:", fetchRequest);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 14, "sharedW5BufferPool"));
    objc_msgSend(v53, "returnBufferToPool:", v24);

    v5 = v72;
LABEL_24:

    v54 = v8->_fetchRequest;
    v55 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v55);
    v56 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v54)
    {
      if (v56)
      {
        v57 = (char *)objc_msgSend(v13, "length");
        *(_DWORD *)buf = 136315394;
        v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        v78 = 2048;
        v79 = v57;
        LODWORD(v69) = 22;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: W5PeerDatabaseRequestPayload sizeof fetchRequest %ld bytes", (const char *)buf, v69);
      }

      v58 = sub_100091474();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload initWithRequest", "Success", buf, 2u);
      }
      goto LABEL_40;
    }
    if (v56)
    {
      *(_DWORD *)buf = 136315394;
      v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
      v78 = 2112;
      v79 = v37;
      LODWORD(v69) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE to NSKeyedUnarchiver fetchRequestData error='%@'", buf, v69);
    }
    goto LABEL_34;
  }
  v67 = sub_10008F56C();
  v68 = objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v68, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: getPairOfBuffersFromPool returned less than 2 buffers", (const char *)buf);
  }

LABEL_33:
  v37 = 0;
LABEL_34:

LABEL_35:
  v62 = sub_10008F56C();
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v77 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    v78 = 2112;
    v79 = v37;
    LODWORD(v69) = 22;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v63, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: init error (error='%@'", buf, v69);
  }

  v64 = sub_100091474();
  v59 = objc_claimAutoreleasedReturnValue(v64);
  if (os_signpost_enabled(v59))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v37;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload initWithRequest", "Error=%@", buf, 0xCu);
  }
  v8 = 0;
LABEL_40:

  v65 = v8;
  objc_autoreleasePoolPop(v5);

  return v65;
}

- (id)encode
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t *v16;
  id v17;
  id v18;
  const uint8_t *v19;
  id v20;
  id v21;
  size_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  size_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = sub_100091474();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload encode", (const char *)&unk_1000BF1F1, buf, 2u);
  }

  if (!self->_version)
  {
    v43 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[W5PeerDatabaseRequestPayload encode]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: bad version", (const char *)buf);
    }
    v9 = 0;
    v10 = 0;
    goto LABEL_26;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequestPayload version](self, "version"));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("version"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequestPayload fetchRequest](self, "fetchRequest"));
  v52 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v52));
  v10 = v52;

  if (!v9)
  {
    v44 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[W5PeerDatabaseRequestPayload encode]";
      v55 = 2112;
      v56 = (size_t)v10;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE to NSKeyedArchiver fetchRequest with error='%@'", buf, 22);
    }
    v9 = 0;
    goto LABEL_26;
  }
  if (-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000E3B28))
    goto LABEL_8;
  if (-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000E3B40))
  {
    if ((unint64_t)objc_msgSend(v9, "length") >= 0x2801)
    {
LABEL_8:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getPairOfBuffersFromPool"));

      if ((unint64_t)-[NSObject count](v12, "count") <= 1)
      {
        v45 = sub_10008F56C();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "-[W5PeerDatabaseRequestPayload encode]";
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v46, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: getPairOfBuffersFromPool returned less than 2 buffers", (const char *)buf);
        }

        goto LABEL_26;
      }
      v50 = v10;
      v51 = v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v12, "firstObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v12, "lastObject"));
      compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
      v15 = objc_retainAutorelease(v13);
      v16 = (uint8_t *)objc_msgSend(v15, "mutableBytes");
      v17 = objc_msgSend(v15, "length");
      v18 = objc_retainAutorelease(v9);
      v19 = (const uint8_t *)objc_msgSend(v18, "bytes");
      v20 = objc_msgSend(v18, "length");
      v21 = objc_retainAutorelease(v14);
      v22 = compression_encode_buffer(v16, (size_t)v17, v19, (size_t)v20, objc_msgSend(v21, "mutableBytes"), COMPRESSION_LZFSE);
      v23 = sub_10008F56C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v25)
        {
          v26 = objc_msgSend(v18, "length");
          *(_DWORD *)buf = 136315650;
          v54 = "-[W5PeerDatabaseRequestPayload encode]";
          v55 = 2048;
          v56 = v22;
          v57 = 2048;
          v58 = v26;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: compression_encode_buffer fetchRequestData to Size of %zd, original fetchRequestData.length %zd", (const char *)buf, 32, v49);
        }

        v24 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v15), "mutableBytes"), v22));
        objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("fetchRequestNSData"));
      }
      else if (v25)
      {
        v27 = objc_msgSend(v18, "length");
        v28 = objc_msgSend(v15, "length");
        v29 = objc_msgSend(v21, "length");
        *(_DWORD *)buf = 136315906;
        v54 = "-[W5PeerDatabaseRequestPayload encode]";
        v55 = 2048;
        v56 = (size_t)v27;
        v57 = 2048;
        v58 = v28;
        v59 = 2048;
        v60 = v29;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: FAILURE: compression_encode_buffer to compress fetchRequestData %zd into size %zd with scratch size %zd", (const char *)buf, 42, v49, (size_t)v50);
      }
      v10 = v50;
      v3 = v51;

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
      objc_msgSend(v30, "returnBufferToPool:", v15);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
      objc_msgSend(v31, "returnBufferToPool:", v21);

      goto LABEL_16;
    }
    v40 = sub_10008F56C();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(v9, "length");
      *(_DWORD *)buf = 136315394;
      v54 = "-[W5PeerDatabaseRequestPayload encode]";
      v55 = 2048;
      v56 = (size_t)v42;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v41, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: Uncompressed fetchRequestData to size %zd", (const char *)buf, 22);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("fetchRequestNSDataUncompressed"));
  }
LABEL_16:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fetchRequestNSData")));
  if (v32)
  {

LABEL_19:
    v34 = sub_100091474();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_signpost_enabled(v35))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v36 = "Success";
    goto LABEL_21;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fetchRequestNSDataUncompressed")));

  if (v33)
    goto LABEL_19;
  v38 = sub_10008F56C();
  v12 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[W5PeerDatabaseRequestPayload encode]";
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] W5PeerDatabaseRequestPayload %s: Failed to form kW5PeerRequestDatabaseFetchRequestNSDataKey or kW5PeerRequestDatabaseFetchRequestNSDataUncompressedKey", (const char *)buf);
  }
LABEL_26:

  v39 = sub_100091474();
  v35 = objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    v36 = "Error";
LABEL_21:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload encode", v36, buf, 2u);
  }
LABEL_22:

  if (!objc_msgSend(v4, "count"))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerDatabaseRequestPayload encode]"));
    v48 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v47, 0));

    objc_exception_throw(v48);
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("W5PeerDatabaseRequestPayload NSFetchRequest %@"), self->_fetchRequest);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end
