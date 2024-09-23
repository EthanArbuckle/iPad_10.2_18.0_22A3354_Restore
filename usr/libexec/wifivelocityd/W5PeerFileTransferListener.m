@implementation W5PeerFileTransferListener

- (W5PeerFileTransferListener)initWithTransferManager:(id)a3
{
  id v4;
  W5PeerFileTransferListener *v5;
  W5PeerFileTransferListener *v6;
  W5FileTransferManager *v7;
  NSObject *p_super;
  uint64_t v10;
  const char *v11;
  objc_super v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)W5PeerFileTransferListener;
  v5 = -[W5PeerFileTransferListener init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (W5FileTransferManager *)v4;
    p_super = &v6->_transferManager->super;
    v6->_transferManager = v7;
  }
  else
  {

    v10 = sub_10008F56C();
    p_super = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[W5PeerFileTransferListener initWithTransferManager:]";
      v15 = 2080;
      v16 = "W5PeerFileTransferListener.m";
      v17 = 1024;
      v18 = 37;
      LODWORD(v11) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v13, v11, LODWORD(v12.receiver));
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  W5PeerFileTransferResponsePayload *v10;
  void *v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  BOOL v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  _BYTE v43[14];
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 136316418;
      v39 = "-[W5PeerFileTransferListener handleClientRequest:]";
      v40 = 2080;
      v41 = "W5PeerFileTransferListener.m";
      v42 = 1024;
      *(_DWORD *)v43 = 47;
      *(_WORD *)&v43[4] = 2114;
      *(_QWORD *)&v43[6] = v4;
      v44 = 2114;
      v45 = v6;
      v46 = 2114;
      v47 = v7;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@' version='%{public}@'", &v38, 58);
    }

    v10 = objc_alloc_init(W5PeerFileTransferResponsePayload);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerFileTransferListener currentVersion](self, "currentVersion")));
    -[W5PeerFileTransferResponsePayload setVersion:](v10, "setVersion:", v11);

    v12 = objc_msgSend(v7, "integerValue");
    if (v12 == (id)-[W5PeerFileTransferListener currentVersion](self, "currentVersion"))
    {
      v13 = objc_msgSend(v6, "type");
      if (v13 == (id)2)
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remotePath"));
        v27 = sub_10008F56C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 138543362;
          v39 = v14;
          LODWORD(v35) = 12;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] Request received to list files in directory: %{public}@", &v38, v35);
        }

        v20 = v14 != 0;
        if (v14)
        {
          -[W5PeerFileTransferResponsePayload setStatus:](v10, "setStatus:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferListener _listFiles:](self, "_listFiles:", v14));
          -[W5PeerFileTransferResponsePayload setFiles:](v10, "setFiles:", v29);

          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
          (*(void (**)(uint64_t, W5PeerFileTransferResponsePayload *, _QWORD))(v30 + 16))(v30, v10, 0);
        }
        else
        {
          v33 = sub_10008F56C();
          v30 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v38) = 0;
            LODWORD(v35) = 2;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v30, 0, "[wifivelocity] nil Directory Path", &v38, v35);
          }
        }

      }
      else
      {
        if (v13 != (id)1)
        {
          v20 = 0;
LABEL_28:

          goto LABEL_29;
        }
        -[W5PeerFileTransferResponsePayload setStatus:](v10, "setStatus:", 1);
        v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "targetID"));
        v15 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remotePath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKey"));
        v17 = sub_10008F56C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKey"));
          v38 = 138543874;
          v39 = v15;
          v40 = 2114;
          v41 = v19;
          v42 = 2114;
          *(_QWORD *)v43 = v14;
          LODWORD(v35) = 32;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] Request received to send file: %{public}@, peer public key: %{public}@, targetID: %{public}@", &v38, v35);

        }
        v20 = v15 != 0;
        if (v15)
        {
          -[W5FileTransferManager initializeSenderWithTargetID:peerPublicKey:](self->_transferManager, "initializeSenderWithTargetID:peerPublicKey:", v14, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5FileTransferManager publicKeySelf](self->_transferManager, "publicKeySelf"));
          -[W5PeerFileTransferResponsePayload setPublicKey:](v10, "setPublicKey:", v21);

          v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
          ((void (**)(_QWORD, W5PeerFileTransferResponsePayload *, _QWORD))v22)[2](v22, v10, 0);

          -[W5FileTransferManager startW5FileSenderForFile:](self->_transferManager, "startW5FileSenderForFile:", v15);
        }
        else
        {
          v31 = sub_10008F56C();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v38) = 0;
            LODWORD(v35) = 2;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v32, 0, "[wifivelocity] nil File Path", &v38, v35);
          }

        }
      }
    }
    else
    {
      v23 = sub_10008F56C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 138543362;
        v39 = (const char *)v7;
        LODWORD(v35) = 12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] Request received with invalid version: %{public}@", &v38, v35);
      }

      -[W5PeerFileTransferResponsePayload setStatus:](v10, "setStatus:", 2);
      v36 = NSLocalizedFailureReasonErrorKey;
      v37 = CFSTR("W5PeerFileListenerUnsupportedVersion");
      v20 = 1;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 11, v25));
      -[W5PeerFileTransferResponsePayload setError:](v10, "setError:", v26);

      v14 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
      (*((void (**)(char *, W5PeerFileTransferResponsePayload *, _QWORD))v14 + 2))(v14, v10, 0);
    }

    goto LABEL_28;
  }
  v20 = 0;
LABEL_29:

  return v20;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerFileTransferRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.fileTransfer");
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)_listFiles:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, &__NSArray0__struct, 4, &v20));
  v7 = v20;

  if (v7)
  {
    v15 = sub_10008F56C();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315906;
      v23 = "-[W5PeerFileTransferListener _listFiles:]";
      v24 = 2080;
      v25 = "W5PeerFileTransferListener.m";
      v26 = 1024;
      v27 = 139;
      v28 = 2114;
      v29 = v3;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) Unable to list contents of: %{public}@", &v22, 38);
    }
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v13, "hasDirectoryPath") & 1) == 0)
            objc_msgSend(v4, "addObject:", v13);
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }
  }

  return v4;
}

- (W5FileTransferManager)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
  objc_storeStrong((id *)&self->_transferManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferManager, 0);
}

@end
