@implementation NRDUpdateBrainLoader

+ (id)brainAtPath:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NRDUpdateBrainClientImpl *v10;
  NRDUpdateBrainClientImpl *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSError *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  __int128 buf;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;

  if (!load_trust_cache_at_path((const char *)objc_msgSend(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR(".TrustCache")), "fileSystemRepresentation"), 0))
  {
    if (a5)
    {
      v22 = NSDebugDescriptionErrorKey;
      v23 = CFSTR("trust cache load failed");
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 100, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
LABEL_16:
      v10 = 0;
      *a5 = v15;
      return v10;
    }
    return 0;
  }
  v8 = objc_msgSend(a3, "stringByAppendingPathComponent:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.xpc"), CFSTR("com.apple.NRD.UpdateBrainService")));
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v8))
  {
    if (a5)
    {
      v24 = NSDebugDescriptionErrorKey;
      v25 = CFSTR("xpc bundle does not exist");
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      goto LABEL_16;
    }
    return 0;
  }
  v9 = nrdSharedLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loading NeRD update brain bundle at %@", (uint8_t *)&buf, 0xCu);
  }
  xpc_add_bundle(objc_msgSend(v8, "fileSystemRepresentation"), 2);
  isLoaded = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v10 = -[NRDUpdateBrainClientImpl initWithDelegate:]([NRDUpdateBrainClientImpl alloc], "initWithDelegate:", a4);
  v11 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __51__NRDUpdateBrainLoader_brainAtPath_delegate_error___block_invoke;
  v17[3] = &unk_1000149A8;
  v17[4] = &v18;
  v17[5] = &buf;
  -[NRDUpdateBrainClientImpl ping:](v10, "ping:", v17);
  if (!*((_BYTE *)v19 + 24))
    v10 = 0;
  v12 = *((_QWORD *)&buf + 1);
  v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v13)
  {
    if (a5)
    {
      *a5 = v13;
      v13 = *(void **)(v12 + 40);
    }
    v14 = v13;
  }
  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

_QWORD *__51__NRDUpdateBrainLoader_brainAtPath_delegate_error___block_invoke(_QWORD *result, void *a2)
{
  _QWORD *v2;

  v2 = result;
  if (a2)
  {
    result = objc_msgSend(a2, "copy");
    *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 40) = result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  }
  return result;
}

+ (BOOL)isBrainLoaded
{
  return isLoaded;
}

@end
