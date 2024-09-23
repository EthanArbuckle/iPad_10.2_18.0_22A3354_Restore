@implementation STUASMEventHandler

- (STUASMEventHandler)initWithASMCourseLibrary:(id)a3
{
  id v5;
  STUASMEventHandler *v6;
  STUASMEventHandler *v7;
  NSSet *v8;
  NSSet *inRangeRefreshIdentifiers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUASMEventHandler;
  v6 = -[STUASMEventHandler init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    v8 = objc_opt_new(NSSet);
    inRangeRefreshIdentifiers = v7->_inRangeRefreshIdentifiers;
    v7->_inRangeRefreshIdentifiers = v8;

  }
  return v7;
}

- (void)setInRangeClassSessions:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crk_mapUsingBlock:", &stru_1000CA350));
  -[STUASMEventHandler setInRangeRefreshIdentifiers:](self, "setInRangeRefreshIdentifiers:", v4);

}

- (void)setInRangeRefreshIdentifiers:(id)a3
{
  unint64_t v4;
  NSSet *inRangeRefreshIdentifiers;
  unsigned __int8 v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;
  void *v10;

  v4 = (unint64_t)a3;
  inRangeRefreshIdentifiers = self->_inRangeRefreshIdentifiers;
  if (v4 | (unint64_t)inRangeRefreshIdentifiers)
  {
    v10 = (void *)v4;
    v6 = -[NSSet isEqual:](inRangeRefreshIdentifiers, "isEqual:", v4);
    v4 = (unint64_t)v10;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet crk_setBySubtractingSet:](self->_inRangeRefreshIdentifiers, "crk_setBySubtractingSet:", v10));
      v8 = (NSSet *)objc_msgSend(v10, "copy");
      v9 = self->_inRangeRefreshIdentifiers;
      self->_inRangeRefreshIdentifiers = v8;

      -[STUASMEventHandler cancelRefreshesForIdentifiers:](self, "cancelRefreshesForIdentifiers:", v7);
      v4 = (unint64_t)v10;
    }
  }

}

- (void)didEncounterUntrustedClassSession:(id)a3 instructorIdentifier:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, _QWORD);
  uint8_t buf[4];
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = sub_1000228C0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Encountered untrusted class session: %{public}@", buf, 0xCu);

  }
  if (!-[STUASMEventHandler shouldRefreshCertificatesForClassSession:](self, "shouldRefreshCertificatesForClassSession:", v8))
  {
    v17 = sub_1000228C0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Not refreshing certificates for class session: %{public}@", buf, 0xCu);

    }
    goto LABEL_10;
  }
  if (!v9)
  {
    v20 = sub_1000228C0();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10007B34C(v8, v18);
LABEL_10:

    v10[2](v10, 0);
    goto LABEL_11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString crk_stringWithIPAddress:](NSString, "crk_stringWithIPAddress:", objc_msgSend(v8, "leaderIP")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEventHandler library](self, "library"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100022900;
  v21[3] = &unk_1000CA378;
  v22 = v8;
  v23 = v10;
  objc_msgSend(v16, "refreshCertificatesForCourseWithIdentifier:instructorIdentifier:targetIPAddress:completion:", v14, v9, v15, v21);

LABEL_11:
}

- (void)cancelRefreshesForIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEventHandler library](self, "library"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "courseIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "targetIPAddress"));
        objc_msgSend(v10, "cancelRefreshCertificatesForCourseWithIdentifier:targetIPAddress:", v11, v12);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)shouldRefreshCertificatesForClassSession:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[STUASMEventHandler isInRangeClassSession:](self, "isInRangeClassSession:", v4))
    v5 = -[STUASMEventHandler isASMClassSession:](self, "isASMClassSession:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isASMClassSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEventHandler library](self, "library"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));

  LOBYTE(v4) = objc_msgSend(v5, "containsCourseWithIdentifier:", v6);
  return (char)v4;
}

- (BOOL)isInRangeClassSession:(id)a3
{
  id v4;
  STUASMCertificateRefreshIdentifier *v5;
  void *v6;

  v4 = a3;
  v5 = -[STUASMCertificateRefreshIdentifier initWithSessionIdentifier:]([STUASMCertificateRefreshIdentifier alloc], "initWithSessionIdentifier:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMEventHandler inRangeRefreshIdentifiers](self, "inRangeRefreshIdentifiers"));
  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v5);

  return (char)v4;
}

- (STUASMCourseLibrary)library
{
  return self->_library;
}

- (NSSet)inRangeRefreshIdentifiers
{
  return self->_inRangeRefreshIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inRangeRefreshIdentifiers, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
