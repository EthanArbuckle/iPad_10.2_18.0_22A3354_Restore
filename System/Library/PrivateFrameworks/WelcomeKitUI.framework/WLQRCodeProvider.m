@implementation WLQRCodeProvider

- (void)request
{
  id WeakRetained;
  WLQRCode *v4;
  void *v5;
  void *v6;
  WLQRCode *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *urls;
  NSMutableArray *v11;
  NSMutableArray *codes;
  NSMutableArray *v13;
  WLQRCode *v14;
  void *v15;
  void *v16;
  WLQRCode *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (self->_useGooglePlayStore)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = [WLQRCode alloc];
    WLLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WLQRCode initWithName:title:URL:code:](v4, "initWithName:title:URL:code:", v5, v6, CFSTR("https://support.apple.com/HT201196"), CFSTR("apple_support"));
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "providerDidProvide:", v8);

  }
  else
  {
    v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("https://a.app.qq.com/o/simple.jsp?pkgname=com.apple.movetoios"), CFSTR("https://url.cloud.huawei.com/gKwTbAcORy"), CFSTR("https://h5coml.vivo.com.cn/h5coml/appdetail_h5/browser_v2/index.html?appId=415331"), 0);
    urls = self->_urls;
    self->_urls = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    codes = self->_codes;
    self->_codes = v11;

    v13 = self->_codes;
    v14 = [WLQRCode alloc];
    WLLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WLQRCode initWithName:title:URL:code:](v14, "initWithName:title:URL:code:", v15, v16, CFSTR("https://play.google.com/store/apps/details?id=com.apple.movetoios"), CFSTR("google_play"));
    -[NSMutableArray addObject:](v13, "addObject:", v17);

    -[WLQRCodeProvider drainQueue](self, "drainQueue");
  }
}

- (void)drainQueue
{
  WLRequest *v3;
  WLRequest *request;
  id v5;

  if (-[NSMutableArray count](self->_urls, "count"))
  {
    -[NSMutableArray firstObject](self->_urls, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(WLRequest);
    request = self->_request;
    self->_request = v3;

    -[WLRequest setDelegate:](self->_request, "setDelegate:", self);
    -[WLRequest request:redirect:](self->_request, "request:redirect:", v5, 0);

  }
  else
  {
    -[WLQRCodeProvider complete](self, "complete");
  }
}

- (void)requestDidFinish:(BOOL)a3
{
  _BOOL4 v3;
  WLQRCode *v5;
  WLQRCode *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  WLQRCode *v11;
  id v12;

  v3 = a3;
  -[NSMutableArray firstObject](self->_urls, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_urls, "removeObjectAtIndex:", 0);
  if (v3)
  {
    v5 = (WLQRCode *)v12;
    if (-[WLQRCode isEqualToString:](v5, "isEqualToString:", CFSTR("https://a.app.qq.com/o/simple.jsp?pkgname=com.apple.movetoios")))
    {
      v6 = [WLQRCode alloc];
      WLLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WLLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("https://a.app.qq.com/o/simple.jsp?pkgname=com.apple.movetoios");
      v10 = CFSTR("tencent_store");
    }
    else if (-[WLQRCode isEqualToString:](v5, "isEqualToString:", CFSTR("https://url.cloud.huawei.com/gKwTbAcORy")))
    {
      v6 = [WLQRCode alloc];
      WLLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WLLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("https://url.cloud.huawei.com/gKwTbAcORy");
      v10 = CFSTR("huawei_store");
    }
    else if (-[WLQRCode isEqualToString:](v5, "isEqualToString:", CFSTR("https://h5coml.vivo.com.cn/h5coml/appdetail_h5/browser_v2/index.html?appId=415331")))
    {
      v6 = [WLQRCode alloc];
      WLLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WLLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("https://h5coml.vivo.com.cn/h5coml/appdetail_h5/browser_v2/index.html?appId=415331");
      v10 = CFSTR("vivo_store");
    }
    else
    {
      if (!-[WLQRCode isEqualToString:](v5, "isEqualToString:", CFSTR("https://mobile.baidu.com/item?pid=1538161")))
      {
        v11 = v5;
        goto LABEL_12;
      }
      v6 = [WLQRCode alloc];
      WLLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WLLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("https://mobile.baidu.com/item?pid=1538161");
      v10 = CFSTR("baidu_store");
    }
    v11 = -[WLQRCode initWithName:title:URL:code:](v6, "initWithName:title:URL:code:", v7, v8, v9, v10);

    if (v11)
    {
      -[NSMutableArray addObject:](self->_codes, "addObject:", v11);
LABEL_12:

    }
  }
  -[WLQRCodeProvider drainQueue](self, "drainQueue");

}

- (void)complete
{
  id WeakRetained;
  WLRequest *request;
  NSMutableArray *urls;
  NSMutableArray *codes;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "providerDidProvide:", self->_codes);

  request = self->_request;
  self->_request = 0;

  urls = self->_urls;
  self->_urls = 0;

  codes = self->_codes;
  self->_codes = 0;

}

- (WLQRCodeProviderDelegate)delegate
{
  return (WLQRCodeProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useGooglePlayStore
{
  return self->_useGooglePlayStore;
}

- (void)setUseGooglePlayStore:(BOOL)a3
{
  self->_useGooglePlayStore = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_codes, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
