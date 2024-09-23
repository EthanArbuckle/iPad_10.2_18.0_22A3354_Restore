@implementation WebBundleSchemaHandler

- (WebBundleSchemaHandler)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  WebBundleSchemaHandler *v8;
  WebBundleSchemaHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleSchemaHandler;
  v8 = -[WebBundleSchemaHandler init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
  }

  return v9;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleConfiguration webBundleDirectory](self->_configuration, "webBundleDirectory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathExtension"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredMIMEType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
  v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v27 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v17, 0, &v27));
    v19 = v27;

    if (!v19)
      goto LABEL_8;
  }
  else
  {
    v26 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v10, 0, &v26));
    v19 = v26;
    if (!v19)
      goto LABEL_8;
  }
  v20 = sub_10043292C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "File Retrieval Error %@", buf, 0xCu);
  }

LABEL_8:
  v22 = objc_alloc((Class)NSURLResponse);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URL"));
  v25 = objc_msgSend(v22, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v24, v13, objc_msgSend(v18, "length"), 0);

  objc_msgSend(v5, "didReceiveResponse:", v25);
  objc_msgSend(v5, "didReceiveData:", v18);
  objc_msgSend(v5, "didFinish");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
