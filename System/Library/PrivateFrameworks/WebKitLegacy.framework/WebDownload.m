@implementation WebDownload

- (void)_setRealDelegate:(id)a3
{
  WebDownloadInternal *v5;

  if (!self->_webInternal)
  {
    v5 = objc_alloc_init(WebDownloadInternal);
    self->_webInternal = v5;
    -[WebDownloadInternal setRealDelegate:](v5, "setRealDelegate:", a3);
  }
}

- (WebDownload)init
{
  WebDownload *result;
  WebDownload *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebDownload;
  result = -[NSURLDownload init](&v4, sel_init);
  v3 = result;
  if (result)
  {
    if (!result->_webInternal)
    {
      result->_webInternal = objc_alloc_init(WebDownloadInternal);
      return v3;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebDownload;
  -[NSURLDownload dealloc](&v3, sel_dealloc);
}

- (WebDownload)initWithRequest:(id)a3 delegate:(id)a4
{
  WebDownloadInternal *webInternal;
  objc_super v8;

  -[WebDownload _setRealDelegate:](self, "_setRealDelegate:", a4);
  webInternal = self->_webInternal;
  v8.receiver = self;
  v8.super_class = (Class)WebDownload;
  return -[NSURLDownload initWithRequest:delegate:](&v8, sel_initWithRequest_delegate_, a3, webInternal);
}

- (id)_initWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7
{
  WebDownloadInternal *webInternal;
  objc_super v14;

  -[WebDownload _setRealDelegate:](self, "_setRealDelegate:", a6);
  webInternal = self->_webInternal;
  v14.receiver = self;
  v14.super_class = (Class)WebDownload;
  return -[NSURLDownload _initWithLoadingConnection:request:response:delegate:proxy:](&v14, sel__initWithLoadingConnection_request_response_delegate_proxy_, a3, a4, a5, webInternal, a7);
}

- (id)_initWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5
{
  WebDownloadInternal *webInternal;
  objc_super v10;

  -[WebDownload _setRealDelegate:](self, "_setRealDelegate:", a4);
  webInternal = self->_webInternal;
  v10.receiver = self;
  v10.super_class = (Class)WebDownload;
  return -[NSURLDownload _initWithRequest:delegate:directory:](&v10, sel__initWithRequest_delegate_directory_, a3, webInternal, a5);
}

@end
