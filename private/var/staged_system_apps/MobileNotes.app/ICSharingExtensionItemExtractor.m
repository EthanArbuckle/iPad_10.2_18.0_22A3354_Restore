@implementation ICSharingExtensionItemExtractor

- (void)extractMediaFileURLWithProvider:(id)a3 contentType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ICSharingExtensionItemExtractor *v14;
  id v15;

  v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E7F14;
  v12[3] = &unk_1005549A8;
  v14 = self;
  v15 = a5;
  v13 = v8;
  v9 = v15;
  v10 = v8;
  v11 = objc_msgSend(a3, "loadFileRepresentationForContentType:openInPlace:completionHandler:", v10, 0, v12);

}

- (void)extractURLWithProvider:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeFileURL, "identifier"));
  v12 = NSItemProviderOptionsIssueSandboxExtensionKey;
  v13 = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E836C;
  v10[3] = &unk_1005549D0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "loadItemForTypeIdentifier:options:completionHandler:", v7, v8, v10);

}

- (void)extractDataWithProvider:(id)a3 forUTI:(id)a4 useTempFile:(BOOL)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeData, "identifier"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E85D4;
  v17[3] = &unk_100554A20;
  v21 = a5;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v15, "loadItemForTypeIdentifier:options:completionHandler:", v13, 0, v17);

}

- (id)getAttachmentInfoWithImage:(id)a3 useTempFile:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
  v8 = v7;
  if (v4)
    -[ICSharingExtensionItemExtractor createTempFileFromImage:populateAttachmentInfo:](self, "createTempFileFromImage:populateAttachmentInfo:", v6, v7);
  else
    objc_msgSend(v7, "setImage:", v6);

  return v8;
}

- (void)createTempFileFromImage:(id)a3 populateAttachmentInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountUtilities](ICAccount, "accountUtilities"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharingExtensionItemExtractor accountId](self, "accountId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "temporaryDirectoryURLForAccountIdentifier:", v9));

  if (!v10)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((tempDirectoryURL) != nil)", "-[ICSharingExtensionItemExtractor createTempFileFromImage:populateAttachmentInfo:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "tempDirectoryURL");
  v11 = objc_alloc_init((Class)NSUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.jpeg"), v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v13, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_JPEGData"));
  if (!v15)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((data) != nil)", "-[ICSharingExtensionItemExtractor createTempFileFromImage:populateAttachmentInfo:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "data");
  v20 = 0;
  v16 = objc_msgSend(v15, "writeToURL:options:error:", v14, 1, &v20);
  v17 = v20;
  if (v16)
  {
    objc_msgSend(v7, "setMediaURL:", v14);
    objc_msgSend(v7, "setUsesTemporaryFile:", 1);
  }
  else
  {
    v18 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10040B72C((uint64_t)v17, v18, v19);

    objc_msgSend(v7, "setImage:", v6);
  }

}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
