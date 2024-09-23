@implementation SDAirDropClassroomTransferManager

- (SDAirDropClassroomTransferManager)init
{
  SDAirDropClassroomTransferManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *transferIDToProgress;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropClassroomTransferManager;
  v2 = -[SDXPCDaemon init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    transferIDToProgress = v2->_transferIDToProgress;
    v2->_transferIDToProgress = v3;

  }
  return v2;
}

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAirDropClassroomTransferManager;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAirDropClassroomTransferManager;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  -[SDXPCDaemon enumerateRemoteObjectProxiesUsingBlock:](self, "enumerateRemoteObjectProxiesUsingBlock:", a3);
}

- (id)makeDestinationDirectoryWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSFileAttributeKey v35;
  NSFileProtectionType v36;

  v5 = a3;
  v6 = sub_10019BD30();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.AirDrop"), 1));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v5, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Files"), 1));

    v35 = NSFileProtectionKey;
    v36 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, v12, a4);

    if ((v14 & 1) == 0)
    {
      v16 = airdrop_log(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10020CCE8((uint64_t)a4, v17, v18, v19, v20, v21, v22, v23);

    }
    v24 = v11;

    v25 = v24;
  }
  else
  {
    if (a4)
    {
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6709, 0)));
      *a4 = v26;

    }
    v27 = airdrop_log(v7);
    v24 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10020CC80((uint64_t)a4, v24, v28, v29, v30, v31, v32, v33);
    v25 = 0;
  }

  return v25;
}

- (void)replaceIconValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  const __CFData *v7;
  uint64_t v8;
  uint64_t isKindOfClass;
  CGImageRef v10;
  CGImageRef v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v6 = a4;
  v7 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  if (v7)
  {
    v8 = objc_opt_class(NSData);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);
    if ((isKindOfClass & 1) != 0)
    {
      v10 = sub_1000CE4CC(v7);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v6);
        CFRelease(v11);
        goto LABEL_10;
      }
      v21 = airdrop_log(0);
      v13 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10020CD50(v13, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      v12 = airdrop_log(isKindOfClass);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10020CD84(v13, v14, v15, v16, v17, v18, v19, v20);
    }

  }
LABEL_10:

}

- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  dispatch_time_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void (**v47)(id, uint64_t, void *, id);
  id v48;
  _QWORD block[5];
  id v50;
  id v51;
  id location;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  NSErrorUserInfoKey v57;
  const __CFString *v58;
  _BYTE buf[12];
  __int16 v60;
  int v61;

  v10 = a3;
  v48 = a5;
  v47 = (void (**)(id, uint64_t, void *, id))a6;
  v11 = objc_claimAutoreleasedReturnValue(-[SDXPCDaemon dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v11);

  v13 = airdrop_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    v60 = 1024;
    v61 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Update transfer %@ with state %d", buf, 0x12u);
  }

  v15 = objc_msgSend(v48, "mutableCopy");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationSenderIsMeKey);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSFOperationVerifiableIdentityKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:](self, "replaceIconValue:forKey:", v15, kSFOperationSmallFileIconKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:](self, "replaceIconValue:forKey:", v15, kSFOperationFileIconKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:](self, "replaceIconValue:forKey:", v15, kSFOperationSenderIconKey);
  -[SDAirDropClassroomTransferManager replaceIconValue:forKey:](self, "replaceIconValue:forKey:", v15, kSFOperationReceiverIconKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferIDToProgress, "objectForKeyedSubscript:", v10));
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  switch(a4)
  {
    case 1:
      v56 = 0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager makeDestinationDirectoryWithIdentifier:error:](self, "makeDestinationDirectoryWithIdentifier:error:", v10, &v56));
      v18 = v56;
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, kSFOperationReceiverClassroomDestination);
      v19 = objc_alloc((Class)NSProgress);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLByDeletingLastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sf_initWithFileURL:", v20));

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transferIDToProgress, "setObject:forKeyedSubscript:", v21, v10);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10020C548;
      v53[3] = &unk_10071BF78;
      objc_copyWeak(&v55, (id *)buf);
      v53[4] = self;
      v22 = v10;
      v54 = v22;
      objc_msgSend(v21, "setCancellationHandler:", v53);
      objc_msgSend(v21, "_publish");
      objc_msgSend(v21, "setSf_transferState:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
      objc_msgSend(v21, "setTotalUnitCount:", objc_msgSend(v23, "longLongValue"));

      objc_msgSend(v21, "setCompletedUnitCount:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      objc_msgSend(v24, "askEventForRecordID:withResults:", v22, v15);

      objc_destroyWeak(&v55);
      if (!v18)
        goto LABEL_15;
      goto LABEL_5;
    case 2:
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
      objc_msgSend(v16, "setTotalUnitCount:", objc_msgSend(v35, "longLongValue"));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kSFOperationBytesCopiedKey));
      objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v36, "longLongValue"));

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kSFOperationTimeRemainingKey));
      objc_msgSend(v16, "setUserInfoObject:forKey:", v37, NSProgressEstimatedTimeRemainingKey);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      objc_msgSend(v38, "progressEventForRecordID:withResults:", v10, v15);

      goto LABEL_13;
    case 3:
      objc_msgSend(v16, "setSf_transferState:", 4);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      objc_msgSend(v39, "cancelEventForRecordID:withResults:", v10, v15);
      goto LABEL_12;
    case 4:
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", kSFOperationErrorKey));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedDescription"));
      objc_msgSend(v16, "sf_failedWithError:", v41);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      objc_msgSend(v39, "errorEventForRecordID:withResults:", v10, v15);
      goto LABEL_12;
    case 5:
      objc_msgSend(v16, "setSf_transferState:", 6);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
      objc_msgSend(v39, "finishedEventForRecordID:withResults:", v10, v15);
LABEL_12:

      location = 0;
      objc_initWeak(&location, v16);
      v42 = sub_10019AAC0(2.0);
      v44 = SFMainQueue(v42, v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10020C594;
      block[3] = &unk_10071BF78;
      objc_copyWeak(&v51, &location);
      block[4] = self;
      v50 = v10;
      dispatch_after(v42, v45, block);

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
LABEL_13:
      v17 = 0;
      v18 = 0;
      v34 = 1;
      break;
    default:
      v57 = NSLocalizedDescriptionKey;
      v58 = CFSTR("invalid state value");
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v46));

      v17 = 0;
      v21 = v16;
      if (v18)
      {
LABEL_5:
        v26 = airdrop_log(v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_10020CDB8((uint64_t)v18, v27, v28, v29, v30, v31, v32, v33);

        v34 = 0;
      }
      else
      {
LABEL_15:
        v34 = 1;
      }
      v16 = v21;
      break;
  }
  v47[2](v47, v34, v17, v18);

  objc_destroyWeak((id *)buf);
}

- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  id v17;

  v7 = a4;
  v8 = airdrop_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
    *(_DWORD *)buf = 67109378;
    v15 = objc_msgSend(v10, "count");
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notifying %d clients that transfer %@ was accepted", buf, 0x12u);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10020C6FC;
  v12[3] = &unk_10071BFA0;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[SDAirDropClassroomTransferManager _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v12);

}

- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  unsigned int v16;
  __int16 v17;
  id v18;

  v7 = a4;
  v8 = airdrop_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
    *(_DWORD *)buf = 67109378;
    v16 = objc_msgSend(v10, "count");
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notifying %d clients that transfer %@ was declined", buf, 0x12u);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10020C888;
  v12[3] = &unk_10071BFC8;
  v12[4] = self;
  v13 = v7;
  v14 = a5;
  v11 = v7;
  -[SDAirDropClassroomTransferManager _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v12);

}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.classroom-transfer");
}

- (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SDAirDropClassroomTransferManagerProtocol));
  v6[0] = objc_opt_class(NSDictionary);
  v6[1] = objc_opt_class(NSArray);
  v6[2] = objc_opt_class(NSString);
  v6[3] = objc_opt_class(NSURL);
  v6[4] = objc_opt_class(NSNumber);
  v6[5] = objc_opt_class(NSData);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, "updateTransferWithIdentifier:withState:information:completionHandler:", 2, 0);

  return v2;
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFAirDropClassroomTransferManagerProtocol);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connection established %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
  objc_msgSend(v8, "setClassroomDelegate:", self);

}

- (void)connectionInvalidated:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "connection invalidated %@", (uint8_t *)&v11, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCDaemon activeConnections](self, "activeConnections"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClassroomTransferManager alertManager](self, "alertManager"));
    objc_msgSend(v10, "setClassroomDelegate:", 0);

  }
}

- (SDAirDropAlertManagerProtocol)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
  objc_storeStrong((id *)&self->_alertManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_transferIDToProgress, 0);
}

@end
