@implementation SSVPlaybackKDLeaseRequest

- (id)_actionParameterValue
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[SSVPlaybackLeaseRequest _actionType](self, "_actionType");
  v3 = CFSTR("init");
  if (v2 == 1)
    v3 = CFSTR("lease");
  if (v2 == 2)
    return CFSTR("init+lease");
  else
    return (id)v3;
}

- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  NSObject *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  unint64_t v45;
  objc_super v46;
  int v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)SSVPlaybackKDLeaseRequest;
  v5 = -[SSVPlaybackLeaseRequest _copyBodyDictionaryWithFairPlaySession:](&v46, sel__copyBodyDictionaryWithFairPlaySession_);
  -[SSVPlaybackLeaseRequest _certificateData](self, "_certificateData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SSVPlaybackLeaseRequest _KDMovieIdentifier](self, "_KDMovieIdentifier");
  v45 = v7;
  if (!v7 && v6)
  {
    LODWORD(v44[0]) = 1;
    v8 = objc_retainAutorelease(v6);
    v9 = Qhl17oSYJtCJIxM(objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), (uint64_t)v44, 1, (uint64_t)&v45);
    if (!v9)
    {
      -[SSVPlaybackLeaseRequest _setKDMovieIdentifier:](self, "_setKDMovieIdentifier:", v45);
      goto LABEL_18;
    }
    v10 = v9;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      v15 = v13;
    else
      v15 = v13 & 2;
    if (v15)
    {
      LODWORD(v49) = 134217984;
      *(_QWORD *)((char *)&v49 + 4) = v10;
      LODWORD(v40) = 12;
      v39 = &v49;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_16:

LABEL_18:
        v7 = v45;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v49, v40);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_16;
  }
LABEL_19:
  v50 = 0u;
  v51 = 0u;
  *(_QWORD *)&v49 = 1;
  *((_QWORD *)&v49 + 1) = v7;
  v23 = objc_retainAutorelease(v6);
  *(_QWORD *)&v50 = objc_msgSend(v23, "bytes");
  DWORD2(v50) = objc_msgSend(v23, "length");
  *(_QWORD *)&v51 = 0;
  DWORD2(v51) = 0;
  v52 = 0;
  v53 = -[SSVPlaybackLeaseRequest KDChannelIdentifier](self, "KDChannelIdentifier");
  v43 = 0;
  v44[0] = 1;
  v44[1] = &v49;
  v44[2] = 1;
  v41 = 0;
  v42 = 0;
  MpP1bcydEGt61uk5lIIoLR((uint64_t)v44, (uint64_t)&v41);
  if (v24)
  {
    v25 = v24;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = objc_msgSend(v26, "shouldLog", v39);
    if (objc_msgSend(v26, "shouldLogToDisk"))
      v28 = v27 | 2;
    else
      v28 = v27;
    objc_msgSend(v26, "OSLogObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      v30 = v28;
    else
      v30 = v28 & 2;
    if (v30)
    {
      v47 = 134217984;
      v48 = v25;
      LODWORD(v40) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v31, 4, &v47, v40);
      v29 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog(v26, CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v29);
    }
    v31 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (!(_DWORD)v43)
  {
    v31 = 0;
    if (!a3)
      goto LABEL_39;
    goto LABEL_38;
  }
  v31 = *(void **)(v42 + 16);
  if (*(_QWORD *)v42)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)v42, *(unsigned int *)(v42 + 8), 0);
    objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("spc"));
    goto LABEL_35;
  }
LABEL_37:
  if (a3)
LABEL_38:
    *a3 = v31;
LABEL_39:

  return v5;
}

- (id)_URLBagKey
{
  return CFSTR("ottLease");
}

@end
