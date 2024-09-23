@implementation SAFileDownloaderDelegate

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;

  v18 = a4;
  v9 = a6;
  v10 = (void (**)(id, _QWORD))a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "originalRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("https")) & 1) == 0)
  {

    goto LABEL_5;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("http"));

  if ((v16 & 1) == 0)
  {
LABEL_5:
    v17 = v9;
    goto LABEL_6;
  }
  v17 = 0;
LABEL_6:
  ((void (**)(id, id))v10)[2](v10, v17);

}

@end
