@implementation W5PeerDatabaseResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDatabaseResponsePayload)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  W5PeerDatabaseResponsePayload *v8;
  NSNumber *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSSet *v35;
  NSObject *v36;
  void *v37;
  char *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t *v46;
  id v47;
  const uint8_t *v48;
  id v49;
  size_t v50;
  uint64_t v51;
  NSObject *v52;
  _BOOL4 v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSSet *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSArray *fetchedResults;
  NSArray *v77;
  uint64_t v78;
  _BOOL4 v79;
  char *v80;
  uint64_t v81;
  NSObject *v82;
  W5PeerDatabaseResponsePayload *v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  W5PeerDatabaseResponsePayload *v101;
  W5PeerDatabaseResponsePayload *v102;
  void *v103;
  void *context;
  void *v105;
  id v106;
  id v107;
  objc_super v108;
  uint8_t buf[4];
  const char *v110;
  __int16 v111;
  char *v112;
  __int16 v113;
  id v114;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_100091474();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload initWithRequest", (const char *)&unk_1000BF1F1, buf, 2u);
  }

  v108.receiver = self;
  v108.super_class = (Class)W5PeerDatabaseResponsePayload;
  v8 = -[W5PeerDatabaseResponsePayload init](&v108, "init");
  if (!v8
    || (v9 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v8->_version = v9) == 0))
  {
    v38 = 0;
    goto LABEL_47;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("status")));
  v11 = v10;
  if (v10)
    v8->_status = (int64_t)objc_msgSend(v10, "integerValue");
  context = v5;
  v105 = v4;
  v103 = v11;
  if (!-[NSNumber isEqualToNumber:](v8->_version, "isEqualToNumber:", &off_1000E3AE0))
  {
    if (!-[NSNumber isEqualToNumber:](v8->_version, "isEqualToNumber:", &off_1000E3AF8))
      goto LABEL_52;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("peerDatabaseResultsUncompressed")));

    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("peerDatabaseResultsUncompressed")));
      if (v13)
      {
        v14 = (void *)v13;
        v101 = v8;
        v15 = sub_10008F56C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (char *)objc_msgSend(v14, "length");
          *(_DWORD *)buf = 136315394;
          v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
          v111 = 2048;
          v112 = v17;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: Uncompressed databaseData size is %zd", (const char *)buf, 22);
        }

        v19 = objc_opt_class(NSArray, v18);
        v21 = objc_opt_class(NSDictionary, v20);
        v23 = objc_opt_class(NSNumber, v22);
        v25 = v14;
        v26 = objc_opt_class(NSString, v24);
        v28 = objc_opt_class(NSDate, v27);
        v30 = objc_opt_class(NSUUID, v29);
        v32 = objc_opt_class(NSMutableSet, v31);
        v98 = v26;
        v34 = v25;
        v35 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v21, v23, v98, v28, v30, v32, objc_opt_class(NSNull, v33), 0);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        v106 = 0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v36, v25, &v106));
        v38 = (char *)v106;
        v8 = v101;
        goto LABEL_26;
      }
      goto LABEL_52;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("peerDatabaseResults")));

    if (!v39)
      goto LABEL_52;
  }
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("peerDatabaseResults")));
  if (!v40)
  {
LABEL_52:
    v95 = sub_10008F56C();
    v36 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v36, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: Failed to find kW5PeerResponsePeerDatabaseResultsUncompressedKey or kW5PeerResponsePeerDatabaseResultsKey", buf);
    }
LABEL_45:
    v38 = 0;
LABEL_46:

LABEL_47:
    v89 = sub_10008F56C();
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      v111 = 2112;
      v112 = v38;
      LODWORD(v96) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v90, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: init error (error='%@'", buf, v96);
    }

    v91 = sub_100091474();
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_signpost_enabled(v92))
    {
      *(_DWORD *)buf = 138412290;
      v110 = v38;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload initWithRequest", "Error=%@", buf, 0xCu);
    }

    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: BOOL Expression FALSE"), "-[W5PeerDatabaseResponsePayload initWithRequest:]"));
    v94 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v93, 0));

    objc_exception_throw(v94);
  }
  v41 = (void *)v40;
  if (!compression_decode_scratch_buffer_size(COMPRESSION_LZFSE))
  {
    v86 = sub_10008F56C();
    v36 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v36, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: scratchLengthBytes get sizeof failed", buf);
    }
    goto LABEL_45;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
  v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "getPairOfBuffersFromPool"));

  if ((unint64_t)-[NSObject count](v36, "count") <= 1)
  {
    v87 = sub_10008F56C();
    v88 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v88, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: getPairOfBuffersFromPool returned less than 2 buffers", (const char *)buf);
    }

    goto LABEL_45;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v36, "firstObject"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v36, "lastObject"));
  v45 = objc_retainAutorelease(v43);
  v46 = (uint8_t *)objc_msgSend(v45, "mutableBytes");
  v47 = objc_msgSend(v45, "length");
  v34 = objc_retainAutorelease(v41);
  v48 = (const uint8_t *)objc_msgSend(v34, "bytes");
  v49 = objc_msgSend(v34, "length");
  v100 = objc_retainAutorelease(v44);
  v50 = compression_decode_buffer(v46, (size_t)v47, v48, (size_t)v49, objc_msgSend(v100, "mutableBytes"), COMPRESSION_LZFSE);
  v51 = sub_10008F56C();
  v52 = objc_claimAutoreleasedReturnValue(v51);
  v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
  if (v50)
  {
    v102 = v8;
    if (v53)
    {
      v54 = objc_msgSend(v34, "length");
      *(_DWORD *)buf = 136315650;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      v111 = 2048;
      v112 = (char *)v50;
      v113 = 2048;
      v114 = v54;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v52, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: compression_decode_buffer databaseData to Size of %zd, from size %zd", (const char *)buf, 32, v97);
    }

    objc_msgSend(v45, "setLength:", v50);
    v56 = objc_opt_class(NSArray, v55);
    v58 = objc_opt_class(NSDictionary, v57);
    v60 = objc_opt_class(NSNumber, v59);
    v62 = v34;
    v63 = objc_opt_class(NSString, v61);
    v65 = objc_opt_class(NSDate, v64);
    v67 = objc_opt_class(NSUUID, v66);
    v69 = objc_opt_class(NSMutableSet, v68);
    v99 = v63;
    v34 = v62;
    v71 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v56, v58, v60, v99, v65, v67, v69, objc_opt_class(NSNull, v70), 0);
    v52 = objc_claimAutoreleasedReturnValue(v71);
    v107 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v52, v45, &v107));
    v38 = (char *)v107;
    v8 = v102;
  }
  else
  {
    if (v53)
    {
      v72 = objc_msgSend(v34, "length");
      *(_DWORD *)buf = 136315650;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      v111 = 2048;
      v112 = 0;
      v113 = 2048;
      v114 = v72;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v52, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: compression_decode_buffer databaseData to Size of %zd, from size %zd", (const char *)buf, 32, v97);
    }
    v37 = 0;
    v38 = 0;
  }

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
  objc_msgSend(v73, "returnBufferToPool:", v45);

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
  objc_msgSend(v74, "returnBufferToPool:", v100);

LABEL_26:
  if (!v37)
  {
    v85 = sub_10008F56C();
    v36 = objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      v111 = 2112;
      v112 = v38;
      LODWORD(v96) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v36, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE to NSKeyedUnarchiver databaseData error='%@'", buf, v96);
    }
    goto LABEL_46;
  }
  v75 = objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload convertCSVArrayToKeyValueDictArray:](v8, "convertCSVArrayToKeyValueDictArray:", v37));
  fetchedResults = v8->_fetchedResults;
  v8->_fetchedResults = (NSArray *)v75;

  v77 = v8->_fetchedResults;
  v78 = sub_10008F56C();
  v36 = objc_claimAutoreleasedReturnValue(v78);
  v79 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (!v77)
  {
    if (v79)
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      v111 = 2112;
      v112 = v38;
      LODWORD(v96) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v36, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: _fetchedResults is nil error='%@'", buf, v96);
    }
    goto LABEL_46;
  }
  if (v79)
  {
    v80 = (char *)objc_msgSend(v34, "length");
    *(_DWORD *)buf = 136315394;
    v110 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
    v111 = 2048;
    v112 = v80;
    LODWORD(v96) = 22;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v36, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: W5PeerDatabaseResponsePayload sizeof databaseData %ld bytes", (const char *)buf, v96);
  }

  v81 = sub_100091474();
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_signpost_enabled(v82))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload initWithRequest", "Success", buf, 2u);
  }

  v83 = v8;
  objc_autoreleasePoolPop(context);

  return v83;
}

- (id)convertCSVArrayToKeyValueDictArray:(id)a3
{
  id v3;
  char *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char *v17;
  char *v19;
  id obj;
  id v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = a3;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v23 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v23)
  {
    v4 = 0;
    v22 = *(_QWORD *)v32;
    do
    {
      v5 = 0;
      v19 = v4;
      v6 = (uint64_t)v4;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v5);
        if (v6)
        {
          v24 = v6;
          v25 = v5;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v26 = v26;
          v9 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v9)
          {
            v10 = v9;
            v11 = 0;
            v12 = *(_QWORD *)v28;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v28 != v12)
                  objc_enumerationMutation(v26);
                v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)v13 + v11, v19));
                v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

                if (v15 != v16)
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

                v13 = (char *)v13 + 1;
              }
              while (v10 != v13);
              v10 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              v11 += (uint64_t)v13;
            }
            while (v10);
          }

          objc_msgSend(v21, "addObject:", v8);
          v5 = v25;
          v6 = v24 + 1;
        }
        else
        {
          v8 = v26;
          v6 = 1;
          v26 = v7;
        }

        ++v5;
      }
      while (v5 != v23);
      v17 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v4 = &v19[(_QWORD)v23];
      v23 = v17;
    }
    while (v17);
  }

  return v21;
}

- (id)convertKeyValueDictArrayToCSVArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *k;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *m;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  id obj;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "allKeys"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
        objc_msgSend(v4, "unionSet:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v8);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v15);
  }
  v31 = v13;

  objc_msgSend(v35, "addObject:", v5);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v36)
  {
    v33 = *(_QWORD *)v42;
    v34 = v5;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v31));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v21 = v5;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v38;
          do
          {
            for (m = 0; m != v23; m = (char *)m + 1)
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)m);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v26));

              if (v27)
                v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v26));
              else
                v28 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              v29 = (void *)v28;
              objc_msgSend(v20, "addObject:", v28);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
          }
          while (v23);
        }

        objc_msgSend(v35, "addObject:", v20);
        v5 = v34;
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v36);
  }

  return v35;
}

- (id)encode
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  NSArray *fetchedResults;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t *v35;
  id v36;
  id v37;
  const uint8_t *v38;
  id v39;
  id v40;
  size_t v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  NSExceptionName v66;
  NSString *v67;
  void *v68;
  id v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  id v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  size_t v81;
  __int16 v82;
  int64_t v83;
  __int16 v84;
  id v85;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = sub_100091474();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload encode", (const char *)&unk_1000BF1F1, buf, 2u);
  }

  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload version](self, "version"));
    v10 = -[W5PeerDatabaseResponsePayload status](self, "status");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
    *(_DWORD *)buf = 136315906;
    v79 = "-[W5PeerDatabaseResponsePayload encode]";
    v80 = 2112;
    v81 = (size_t)v9;
    v82 = 2048;
    v83 = v10;
    v84 = 2112;
    v85 = v11;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: version='%@', status=%ld, peerDatabase='%@'", buf, 42);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload version](self, "version"));

  if (!v12)
  {
    v59 = sub_10008F56C();
    v31 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad version", buf);
    }
    goto LABEL_53;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload version](self, "version"));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("version"));

  if (!-[W5PeerDatabaseResponsePayload status](self, "status"))
  {
    v60 = sub_10008F56C();
    v31 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad status", buf);
    }
    goto LABEL_53;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerDatabaseResponsePayload status](self, "status")));
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("status"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
  if (!v15)
  {
    v16 = sub_10008F56C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad fetchedResults", (const char *)buf);
    }

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));

  if (!v18)
  {
    v61 = sub_10008F56C();
    v31 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad fetchedResults", buf);
    }
    goto LABEL_53;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload convertKeyValueDictArrayToCSVArray:](self, "convertKeyValueDictArrayToCSVArray:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseResponsePayload fetchedResults](self, "fetchedResults"));
  if (!v21)
  {
LABEL_20:
    if (!v20)
    {
      v62 = sub_10008F56C();
      v31 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "-[W5PeerDatabaseResponsePayload encode]";
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad csvDictArray", buf);
      }
      goto LABEL_53;
    }
    goto LABEL_21;
  }
  v22 = v21;
  if (!v20)
  {

LABEL_17:
    v24 = sub_10008F56C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      fetchedResults = self->_fetchedResults;
      *(_DWORD *)buf = 136315650;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      v80 = 2112;
      v81 = (size_t)v20;
      v82 = 2112;
      v83 = (int64_t)fetchedResults;
      LODWORD(v73) = 32;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v25, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: bad csvDictArray: %@ from fetchedResults: %@", buf, v73);
    }

    goto LABEL_20;
  }
  v23 = objc_msgSend(v20, "count");

  if (!v23)
    goto LABEL_17;
LABEL_21:
  v77 = 0;
  v27 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v77));
  v28 = (unint64_t)v77;
  if (!(v27 | v28))
  {
    v63 = sub_10008F56C();
    v31 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      v80 = 2112;
      v81 = 0;
      LODWORD(v73) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: to encode W5PeerDatabaseResponsePayload databaseData with error='%@'", buf, v73);
    }
    goto LABEL_53;
  }
  v29 = (void *)v28;
  if (-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000E3AE0))
    goto LABEL_23;
  if (!-[NSNumber isEqualToNumber:](self->_version, "isEqualToNumber:", &off_1000E3AF8))
    goto LABEL_36;
  if ((unint64_t)objc_msgSend((id)v27, "length") >= 0x2801)
  {
LABEL_23:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getPairOfBuffersFromPool"));

    if ((unint64_t)-[NSObject count](v31, "count") <= 1)
    {
      v70 = sub_10008F56C();
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "-[W5PeerDatabaseResponsePayload encode]";
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v71, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: getPairOfBuffersFromPool returned less than 2 buffers", (const char *)buf);
      }

      goto LABEL_53;
    }
    v74 = v29;
    v76 = v3;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v31, "firstObject"));
    v75 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v31, "lastObject"));
    compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
    v34 = objc_retainAutorelease(v32);
    v35 = (uint8_t *)objc_msgSend(v34, "mutableBytes");
    v36 = objc_msgSend(v34, "length");
    v37 = objc_retainAutorelease((id)v27);
    v38 = (const uint8_t *)objc_msgSend(v37, "bytes");
    v39 = objc_msgSend(v37, "length");
    v40 = objc_retainAutorelease(v33);
    v41 = compression_encode_buffer(v35, (size_t)v36, v38, (size_t)v39, objc_msgSend(v40, "mutableBytes"), COMPRESSION_LZFSE);
    v42 = sub_10008F56C();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v41)
    {
      if (v44)
      {
        v45 = objc_msgSend(v37, "length");
        *(_DWORD *)buf = 136315650;
        v79 = "-[W5PeerDatabaseResponsePayload encode]";
        v80 = 2048;
        v81 = v41;
        v82 = 2048;
        v83 = (int64_t)v45;
        LODWORD(v73) = 32;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v43, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: compression_encode_buffer databaseData to Size of %zd, original databaseData.length %zd", (const char *)buf, v73, (size_t)v74);
      }

      v43 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v34), "mutableBytes"), v41));
      objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("peerDatabaseResults"));
    }
    else if (v44)
    {
      v49 = objc_msgSend(v37, "length");
      v50 = objc_msgSend(v34, "length");
      v51 = objc_msgSend(v40, "length");
      *(_DWORD *)buf = 136315906;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      v80 = 2048;
      v81 = (size_t)v49;
      v82 = 2048;
      v83 = (int64_t)v50;
      v84 = 2048;
      v85 = v51;
      LODWORD(v73) = 42;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v43, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: FAILURE: compression_encode_buffer to compress databaseData %zd into size %zd with scratch size %zd", (const char *)buf, v73, (size_t)v74, (size_t)v75);
    }
    v29 = v74;

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
    objc_msgSend(v52, "returnBufferToPool:", v34);

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[W5BufferPool sharedW5BufferPool](W5BufferPool, "sharedW5BufferPool"));
    objc_msgSend(v53, "returnBufferToPool:", v40);

    v3 = v76;
  }
  else
  {
    v46 = sub_10008F56C();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = objc_msgSend((id)v27, "length");
      *(_DWORD *)buf = 136315394;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      v80 = 2048;
      v81 = (size_t)v48;
      LODWORD(v73) = 22;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v47, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: Uncompressed databaseData to size %zd", (const char *)buf, v73);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("peerDatabaseResultsUncompressed"));
  }
LABEL_36:
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerDatabaseResults")));
  if (v54)
  {

    goto LABEL_39;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerDatabaseResultsUncompressed")));

  if (!v55)
  {
    v72 = sub_10008F56C();
    v31 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[W5PeerDatabaseResponsePayload encode]";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] W5PeerDatabaseResponsePayload %s: Failed to form kW5PeerResponsePeerDatabaseResultsKey or kW5PeerResponsePeerDatabaseResultsUncompressedKey", buf);
    }
LABEL_53:

    v64 = sub_100091474();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_signpost_enabled(v65))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload encode", "Error", buf, 2u);
    }

    v66 = NSInternalInconsistencyException;
    v67 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: BOOL Expression FALSE"), "-[W5PeerDatabaseResponsePayload encode]");
LABEL_56:
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v69 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v66, v68, 0));

    objc_exception_throw(v69);
  }
LABEL_39:
  v56 = sub_100091474();
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload encode", "Success", buf, 2u);
  }

  if (!objc_msgSend(v4, "count"))
  {
    v66 = NSInternalInconsistencyException;
    v67 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerDatabaseResponsePayload encode]");
    goto LABEL_56;
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)fetchedResults
{
  return self->_fetchedResults;
}

- (void)setFetchedResults:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedResults, 0);
}

@end
