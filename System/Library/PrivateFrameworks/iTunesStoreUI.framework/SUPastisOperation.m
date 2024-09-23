@implementation SUPastisOperation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPastisOperation;
  -[SUPastisOperation dealloc](&v3, sel_dealloc);
}

- (void)run
{
  id v3;
  void *v4;
  id v5;
  NSData *v6;
  id v7;

  v3 = -[SUPastisOperation _getURIWithError:](self, "_getURIWithError:", 0);
  if (v3
    && (v4 = v3, (v5 = -[SUPastisOperation _getAppCertWithError:](self, "_getAppCertWithError:", 0)) != 0)
    && (v6 = -[AVAssetResourceLoadingRequest streamingContentKeyRequestDataForApp:contentIdentifier:options:error:](self->_loadingRequest, "streamingContentKeyRequestDataForApp:contentIdentifier:options:error:", v5, objc_msgSend(v4, "dataUsingEncoding:", 4), 0, 0)) != 0&& (v7 = -[SUPastisOperation _getCKCForSPC:URI:error:](self, "_getCKCForSPC:URI:error:", v6, v4, 0)) != 0)
  {
    -[AVAssetResourceLoadingDataRequest respondWithData:](-[AVAssetResourceLoadingRequest dataRequest](self->_loadingRequest, "dataRequest"), "respondWithData:", v7);
    -[AVAssetResourceLoadingRequest finishLoading](self->_loadingRequest, "finishLoading");
  }
  else
  {
    -[AVAssetResourceLoadingRequest finishLoadingWithError:](self->_loadingRequest, "finishLoadingWithError:", 0);
  }
}

- (id)_getAppCertWithError:(id *)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;

  if (self->_certificateUrl)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", self->_certificateUrl);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB1F30]);
    objc_msgSend(v4, "setURLBagKey:", CFSTR("skd-setup-cert"));
  }
  objc_msgSend(v4, "setCachePolicy:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v5, "setRequestProperties:", v4);
  objc_msgSend(v5, "setDataProvider:", objc_msgSend(MEMORY[0x24BEC8B78], "provider"));

  v6 = -[SUPastisOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, 0);
  v7 = 0;
  if (v6)
    v7 = (void *)objc_msgSend((id)objc_msgSend(v5, "dataProvider"), "output");

  return v7;
}

- (id)_getURIWithError:(id *)a3
{
  return -[NSURL absoluteString](-[NSURLRequest URL](-[AVAssetResourceLoadingRequest request](self->_loadingRequest, "request", a3), "URL"), "absoluteString");
}

- (id)_getCKCForSPC:(id)a3 URI:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD v23[3];
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v27 = CFSTR("fairplay-streaming-request");
  v25[0] = CFSTR("version");
  v25[1] = CFSTR("streaming-keys");
  v26[0] = &unk_24DEDC290;
  v22[0] = CFSTR("id");
  v22[1] = CFSTR("spc");
  v23[0] = &unk_24DEDC290;
  v23[1] = a3;
  v22[2] = CFSTR("uri");
  v23[2] = a4;
  v24 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v26[1] = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v28[0] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v6 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, 0);
  if (self->_keyUrl)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", self->_keyUrl);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BEB1F30]);
    objc_msgSend(v8, "setURLBagKey:", CFSTR("skd-get-keys"));
  }
  objc_msgSend(v8, "setCachePolicy:", 1);
  objc_msgSend(v8, "setHTTPBody:", v7);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  v9 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v9, "setRequestProperties:", v8);
  objc_msgSend(v9, "setDataProvider:", objc_msgSend(MEMORY[0x24BEC8B78], "provider"));

  v10 = -[SUPastisOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v9, 0);
  v11 = 0;
  if (v10)
  {
    v12 = objc_msgSend((id)objc_msgSend(v9, "dataProvider"), "output");
    if (!v12)
      goto LABEL_20;
    v13 = (void *)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 0, 0);
    objc_opt_class();
    v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v14 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("fairplay-streaming-response"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v15 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("streaming-keys")),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) == 0)
      || !objc_msgSend(v15, "count"))
    {
LABEL_20:
      v11 = 0;
      goto LABEL_21;
    }
    v16 = 0;
    v11 = 0;
    do
    {
      v17 = (void *)objc_msgSend(v15, "objectAtIndex:", v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("id"));
        v19 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("status"));
        v20 = objc_msgSend(v17, "objectForKey:", CFSTR("ckc"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v18, "integerValue") == 1
          && !objc_msgSend(v19, "integerValue"))
        {
          v11 = (void *)v20;
        }
      }
      ++v16;
    }
    while (v16 < objc_msgSend(v15, "count"));
  }
LABEL_21:

  return v11;
}

- (NSURL)certificateURL
{
  return self->_certificateUrl;
}

- (void)setCertificateURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (NSURL)keyURL
{
  return self->_keyUrl;
}

- (void)setKeyURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (AVAssetResourceLoadingRequest)loadingRequest
{
  return self->_loadingRequest;
}

- (void)setLoadingRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

@end
