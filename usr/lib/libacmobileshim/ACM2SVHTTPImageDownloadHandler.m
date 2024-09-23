@implementation ACM2SVHTTPImageDownloadHandler

+ (id)handlerWithURLString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithURLString:", a3);
}

- (ACM2SVHTTPImageDownloadHandler)initWithURLString:(id)a3
{
  ACM2SVHTTPImageDownloadHandler *v4;
  ACM2SVHTTPImageDownloadHandler *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)ACM2SVHTTPImageDownloadHandler;
  v4 = -[ACM2SVHTTPImageDownloadHandler init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ACFHTTPTransportProtocol setRequestURLTemplate:](-[ACCHTTPHandler transport](v4, "transport"), "setRequestURLTemplate:", CFSTR("%@"));
    v8[0] = a3;
    -[ACFHTTPTransportProtocol setServerHosts:](-[ACCHTTPHandler transport](v5, "transport"), "setServerHosts:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1));
    -[ACFHTTPTransportProtocol setHttpMethod:](-[ACCHTTPHandler transport](v5, "transport"), "setHttpMethod:", CFSTR("GET"));
  }
  return v5;
}

- (void)downloadImageWithCompletionBlock:(id)a3
{
  id v4;
  ACFHTTPTransportProtocol *v5;
  _QWORD v6[6];

  v4 = (id)objc_msgSend(a3, "copy");
  v5 = -[ACCHTTPHandler transport](self, "transport");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__ACM2SVHTTPImageDownloadHandler_downloadImageWithCompletionBlock___block_invoke;
  v6[3] = &unk_24FCE5210;
  v6[4] = self;
  v6[5] = v4;
  -[ACFHTTPTransportProtocol performRequestWithCompletionBlock:](v5, "performRequestWithCompletionBlock:", v6);
}

uint64_t __67__ACM2SVHTTPImageDownloadHandler_downloadImageWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (**v5)(id, _QWORD);

  v4 = *(_QWORD *)(a1 + 40);
  if (!a2 || a3)
    a2 = 0;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  v5 = (void (**)(id, _QWORD))(id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "finalizeBlock"), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setFinalizeBlock:", 0);
  if (v5)
    v5[2](v5, *(_QWORD *)(a1 + 32));
  return 1;
}

@end
