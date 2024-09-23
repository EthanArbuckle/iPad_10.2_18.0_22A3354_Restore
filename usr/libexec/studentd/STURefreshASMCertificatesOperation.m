@implementation STURefreshASMCertificatesOperation

- (STURefreshASMCertificatesOperation)initWithCourseIdentifier:(id)a3 instructorIdentifier:(id)a4 targetIPAddress:(id)a5 rosterProvider:(id)a6 certificateConduit:(id)a7 IDSCacheClearer:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  STURefreshASMCertificatesOperation *v20;
  STURefreshASMCertificatesOperation *v21;
  NSString *v22;
  NSString *instructorIdentifier;
  NSString *v24;
  NSString *targetIPAddress;
  id v27;
  objc_super v28;

  v27 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)STURefreshASMCertificatesOperation;
  v20 = -[STURefreshASMCertificatesOperation init](&v28, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_courseIdentifier, a3);
    v22 = (NSString *)objc_msgSend(v15, "copy");
    instructorIdentifier = v21->_instructorIdentifier;
    v21->_instructorIdentifier = v22;

    v24 = (NSString *)objc_msgSend(v16, "copy");
    targetIPAddress = v21->_targetIPAddress;
    v21->_targetIPAddress = v24;

    objc_storeStrong((id *)&v21->_rosterProvider, a6);
    objc_storeStrong((id *)&v21->_certificateConduit, a7);
    objc_storeStrong((id *)&v21->_IDSCacheClearer, a8);
  }

  return v21;
}

- (BOOL)isForCourseIdentifier:(id)a3 targetIPAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation targetIPAddress](self, "targetIPAddress"));
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isForCourseIdentifier:(id)a3 instructorIdentifier:(id)a4 targetIPAddress:(id)a5
{
  id v8;
  void *v9;
  unsigned __int8 v10;

  v8 = a4;
  if (-[STURefreshASMCertificatesOperation isForCourseIdentifier:targetIPAddress:](self, "isForCourseIdentifier:targetIPAddress:", a3, a5))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation instructorIdentifier](self, "instructorIdentifier"));
    v10 = objc_msgSend(v9, "isEqualToString:", v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STURefreshASMCertificatesOperation;
  -[STURefreshASMCertificatesOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BB48;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)main
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BBD0;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;

  if ((-[STURefreshASMCertificatesOperation isExecuting](self, "isExecuting") & 1) == 0)
  {
    v27 = CATErrorWithCodeAndUserInfo(404, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue(v27);
    -[STURefreshASMCertificatesOperation endOperationWithError:](self, "endOperationWithError:");

    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation rosterProvider](self, "rosterProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "roster"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "courseWithIdentifier:inRoster:", v5, v4));

  if (!v6)
  {
    v45 = CFSTR("kCRKItemNameErrorKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    v9 = (void *)v28;
    v29 = CFSTR("self.courseIdentifier.stringValue");
    if (v28)
      v29 = (const __CFString *)v28;
    v46 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
    v31 = CRKErrorWithCodeAndUserInfo(12, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[STURefreshASMCertificatesOperation endOperationWithError:](self, "endOperationWithError:", v32);

LABEL_14:
    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation instructorIdentifier](self, "instructorIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities trustedUserWithIdentifier:inCourse:](STUASMRosterQueryUtilities, "trustedUserWithIdentifier:inCourse:", v7, v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appleID"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appleID"));

      v12 = sub_10000C018();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation targetIPAddress](self, "targetIPAddress"));
        *(_DWORD *)buf = 138544130;
        v38 = v15;
        v39 = 2114;
        v40 = v16;
        v41 = 2112;
        v42 = v11;
        v43 = 2112;
        v44 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting underlying fetch certificates operation for course identifier %{public}@, target IP address %{public}@, student Apple Account = %@, instructor Apple Account = %@", buf, 0x2Au);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identity"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "certificate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataRepresentation"));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation certificateConduit](self, "certificateConduit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation targetIPAddress](self, "targetIPAddress"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
      v35 = (id)v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "operationToFetchCertificateForDestinationAppleID:sourceAppleID:destinationDeviceIdentifier:controlGroupIdentifier:sourceRole:destinationRole:requesterCertificate:timeout:", v9, v11, v21, v22, 0, 1, 60.0, v19));
      -[STURefreshASMCertificatesOperation setFetchOperation:](self, "setFetchOperation:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation fetchOperation](self, "fetchOperation"));
      objc_msgSend(v24, "addTarget:selector:forOperationEvents:userInfo:", self, "fetchCertificatesOperationDidFinish:instructorAppleID:", 6, v9);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation fetchOperation](self, "fetchOperation"));
      objc_msgSend(v25, "addOperation:", v26);

      goto LABEL_15;
    }
    v34 = CRKErrorWithCodeAndUserInfo(35, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[STURefreshASMCertificatesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v30);
    goto LABEL_14;
  }
  v33 = CRKErrorWithCodeAndUserInfo(203, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[STURefreshASMCertificatesOperation endOperationWithError:](self, "endOperationWithError:", v9);
LABEL_15:

}

- (void)fetchCertificatesOperationDidFinish:(id)a3 instructorAppleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[STURefreshASMCertificatesOperation isExecuting](self, "isExecuting"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000C14C;
      v10[3] = &unk_1000C9B00;
      v10[4] = self;
      v11 = v8;
      -[STURefreshASMCertificatesOperation maybeClearIDSCacheForInstructorAppleID:courseIdentifier:dependingOnError:completion:](self, "maybeClearIDSCacheForInstructorAppleID:courseIdentifier:dependingOnError:completion:", v7, v9, v11, v10);

    }
    else
    {
      -[STURefreshASMCertificatesOperation handleSuccessfulFetchCertificatesOperation:instructorAppleID:](self, "handleSuccessfulFetchCertificatesOperation:instructorAppleID:", v6, v7);
    }

  }
}

- (void)handleSuccessfulFetchCertificatesOperation:(id)a3 instructorAppleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resultObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation rosterProvider](self, "rosterProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation courseIdentifier](self, "courseIdentifier"));
  v12 = 0;
  v10 = +[STUASMRosterCertificateIngestor ingestCertificateDatas:intoRosterProvider:instructorAppleID:courseIdentifier:error:](STUASMRosterCertificateIngestor, "ingestCertificateDatas:intoRosterProvider:instructorAppleID:courseIdentifier:error:", v7, v8, v6, v9, &v12);

  v11 = v12;
  if ((v10 & 1) != 0)
    -[STURefreshASMCertificatesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  else
    -[STURefreshASMCertificatesOperation endOperationWithError:](self, "endOperationWithError:", v11);

}

- (void)maybeClearIDSCacheForInstructorAppleID:(id)a3 courseIdentifier:(id)a4 dependingOnError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation IDSCacheClearer](self, "IDSCacheClearer"));
  v15 = objc_msgSend(v14, "errorIndicatesCacheNeedsToBeCleared:", v13);

  if ((v15 & 1) != 0)
  {
    -[STURefreshASMCertificatesOperation clearCacheForInstructorAppleID:courseIdentifier:completion:](self, "clearCacheForInstructorAppleID:courseIdentifier:completion:", v10, v11, v12);
  }
  else
  {
    v16 = sub_10000C018();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Not initiating cache clear for instructor Apple Account %{public}@,                        course identifier %{public}@ because the error does not indicate                        that a cache clear is needed", (uint8_t *)&v19, 0x16u);

    }
    v12[2](v12);
  }

}

- (void)clearCacheForInstructorAppleID:(id)a3 courseIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_10000C018();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    v24 = 2114;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Initiating IDS cache clear for instructor Apple Account %{public}@, course identifier %{public}@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STURefreshASMCertificatesOperation IDSCacheClearer](self, "IDSCacheClearer"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C514;
  v18[3] = &unk_1000C9838;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "clearCacheForInstructorAppleID:courseIdentifier:completion:", v17, v16, v18);

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (NSString)instructorIdentifier
{
  return self->_instructorIdentifier;
}

- (NSString)targetIPAddress
{
  return self->_targetIPAddress;
}

- (CRKASMRosterProviding)rosterProvider
{
  return self->_rosterProvider;
}

- (CRKCertificateConduit)certificateConduit
{
  return self->_certificateConduit;
}

- (STUIDSCacheClearer)IDSCacheClearer
{
  return self->_IDSCacheClearer;
}

- (CATOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_IDSCacheClearer, 0);
  objc_storeStrong((id *)&self->_certificateConduit, 0);
  objc_storeStrong((id *)&self->_rosterProvider, 0);
  objc_storeStrong((id *)&self->_targetIPAddress, 0);
  objc_storeStrong((id *)&self->_instructorIdentifier, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
