@implementation NSError

- (NSString)crl_zipArchiveErrorDescription
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1001175DC;
  v9 = sub_1001175EC;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001189D4;
  v4[3] = &unk_1012395A0;
  v4[4] = &v5;
  -[NSError crl_enumerateErrorUsingBlock:](self, "crl_enumerateErrorUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)crl_zipArchiveErrorEntryName
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1001175DC;
  v9 = sub_1001175EC;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100118B40;
  v4[3] = &unk_1012395A0;
  v4[4] = &v5;
  -[NSError crl_enumerateErrorUsingBlock:](self, "crl_enumerateErrorUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 recoverySuggestion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v14 = v13;
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, NSLocalizedDescriptionKey);
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, NSLocalizedRecoverySuggestionErrorKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, a4, v14));

  return v15;
}

+ (id)crl_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  if ((unint64_t)a3 >= 3)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245970);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0E698(v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245990);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSError(CRLAdditions) crl_errorWithCode:userInfo:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSError_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 39, 0, "Bad error code");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.freeform"), a3, v6));

  return v12;
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6
{
  return objc_msgSend(a1, "crl_errorWithDomain:code:alertTitle:alertMessage:userInfo:", a3, a4, a5, a6, 0);
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 alertTitle:(id)a5 alertMessage:(id)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v15, "count") + 4);
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "addEntriesFromDictionary:", v15);
  if (v13)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, NSLocalizedDescriptionKey);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("CRLLocalizedErrorAlertTitle"));
  }
  if (v14)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, NSLocalizedRecoverySuggestionErrorKey);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("CRLLocalizedErrorAlertMessage"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, NSLocalizedFailureReasonErrorKey);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:userInfo:", v12, a4, v17));

  return v18;
}

+ (id)crl_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlyingError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, NSLocalizedDescriptionKey);

  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, NSUnderlyingErrorKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, a4, v13));

  return v14;
}

+ (id)crl_errorWithError:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5 additionalUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v15 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v10, "count") + (_QWORD)objc_msgSend(v14, "count") + 1);
    v16 = v15;
    if (v14)
      objc_msgSend(v15, "addEntriesFromDictionary:", v14);
    if (v10)
      objc_msgSend(v16, "addEntriesFromDictionary:", v10);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v18 = objc_msgSend(v13, "code");

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_errorWithDomain:code:alertTitle:alertMessage:userInfo:", v17, v18, v12, v11, v16));
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)crl_errorPreservingAlertTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSError *v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CRLLocalizedErrorAlertTitle")));
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "isEqualToString:", v4))
    {
      v8 = objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, NSLocalizedDescriptionKey);
      *(_QWORD *)&v10 = objc_opt_class(self, v9).n128_u64[0];
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain", v10));
      v7 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, -[NSError code](self, "code"), v8));

      goto LABEL_7;
    }

  }
  v7 = self;
LABEL_7:

  return v7;
}

- (id)crl_errorPreservingCancel
{
  NSError *v2;
  uint64_t v3;
  void *v4;
  NSErrorDomain v5;
  unsigned __int8 v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSErrorUserInfoKey v13;
  NSError *v14;

  v2 = self;
  if (-[NSError crl_isCancelError](v2, "crl_isCancelError"))
  {
    if ((id)-[NSError code](v2, "code") == (id)3072)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
      v5 = NSCocoaErrorDomain;
      v6 = objc_msgSend(v4, "isEqualToString:", NSCocoaErrorDomain);

      if ((v6 & 1) != 0)
        return v2;
    }
    else
    {
      v5 = NSCocoaErrorDomain;
    }
    *(_QWORD *)&v7 = objc_opt_class(v2, v3).n128_u64[0];
    v9 = v8;
    v13 = NSUnderlyingErrorKey;
    v14 = v2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1, v7));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "errorWithDomain:code:userInfo:", v5, 3072, v10));

    v2 = (NSError *)v11;
  }
  return v2;
}

- (id)crl_localizedAlertTitle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CRLLocalizedErrorAlertTitle")));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
  v6 = v5;

  return v6;
}

- (id)crl_localizedAlertMessage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CRLLocalizedErrorAlertMessage")));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", NSLocalizedRecoverySuggestionErrorKey));
  v6 = v5;

  return v6;
}

- (BOOL)crl_isOutOfSpaceError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_1012459D0);
}

- (BOOL)crl_isCancelError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_1012459F0);
}

- (BOOL)crl_isFileExistsError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101245A10);
}

- (BOOL)crl_isNoSuchFileError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101245A30);
}

- (BOOL)crl_isNoPermissionError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101245A50);
}

- (BOOL)crl_isFeatureUnsupportedError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101245A70);
}

- (void)crl_enumerateErrorUsingBlock:(id)a3
{
  void (**v4)(id, void *, id, void *, _BYTE *);
  NSError *v5;
  NSError *v6;
  void *v7;
  void *v8;
  NSError *v9;
  NSError *v10;
  NSError *v11;
  char v12;

  v4 = (void (**)(id, void *, id, void *, _BYTE *))a3;
  if (v4)
  {
    v5 = self;
    v12 = 0;
    if (v5)
    {
      v6 = v5;
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v6, "userInfo"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v6, "domain"));
        v4[2](v4, v8, (id)-[NSError code](v6, "code"), v7, &v12);

        v9 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));
        v10 = v9;
        if (v9 != v6)
        {
          v11 = v9;

          v6 = v11;
        }

      }
      while (v6 && !v12);

    }
  }

}

- (BOOL)crl_isErrorPassingTest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10021B1C0;
    v8[3] = &unk_101245A98;
    v9 = v4;
    v10 = &v11;
    -[NSError crl_enumerateErrorUsingBlock:](self, "crl_enumerateErrorUsingBlock:", v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

+ (id)crl_userInfoWithErrorType:(int64_t)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v5, "count") + 1);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("CRLIOErrorType"));

  return v7;
}

+ (id)crl_fileReadUnknownErrorWithUserInfo:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_userInfoWithErrorType:userInfo:", 1, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 256, v3));

  return v4;
}

+ (id)crl_fileReadCorruptedFileErrorWithUserInfo:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_userInfoWithErrorType:userInfo:", 1, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 259, v3));

  return v4;
}

+ (id)crl_fileReadPOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_userInfoWithErrorType:userInfo:", 1, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, v5));

  return v6;
}

+ (id)crl_fileWriteUnknownErrorWithUserInfo:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_userInfoWithErrorType:userInfo:", 2, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 512, v3));

  return v4;
}

+ (id)crl_fileWritePOSIXErrorWithNumber:(int)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = objc_alloc((Class)NSError);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_userInfoWithErrorType:userInfo:", 2, v6));

  v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", NSPOSIXErrorDomain, a3, v8);
  return v9;
}

- (BOOL)crl_isReadError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101250050);
}

- (BOOL)crl_isCorruptedError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101250070);
}

- (BOOL)crl_isWriteError
{
  return -[NSError crl_isErrorPassingTest:](self, "crl_isErrorPassingTest:", &stru_101250090);
}

- (BOOL)crl_errorShouldAlwaysBeReportedDuringImport
{
  NSError *v2;
  char v3;

  v2 = self;
  v3 = sub_100BC2AA0();

  return v3 & 1;
}

@end
