@implementation CLHUploadRequest

- (CLHUploadRequest)initWithPayload:(id)a3 requestTypeCode:(unsigned int)a4 endpoint:(id)a5 headers:(id)a6
{
  CLHUploadRequest *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLHUploadRequest;
  v10 = -[CLHUploadRequest init](&v12, "init");
  if (v10)
  {
    v10->_payload = (NSData *)a3;
    v10->_requestTypeCode = a4;
    v10->_endpoint = (NSURL *)a5;
    v10->_headers = (NSDictionary *)a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHUploadRequest;
  -[CLHUploadRequest dealloc](&v3, "dealloc");
}

- (CLHUploadRequest)initWithRequest:(id)a3 endpoint:(id)a4 headers:(id)a5
{
  id v9;
  CLHUploadRequest *v10;

  v9 = objc_alloc_init((Class)PBDataWriter);
  objc_msgSend(a3, "writeTo:", v9);
  v10 = -[CLHUploadRequest initWithPayload:requestTypeCode:endpoint:headers:](self, "initWithPayload:requestTypeCode:endpoint:headers:", objc_msgSend(v9, "immutableData"), objc_msgSend(a3, "requestTypeCode"), a4, a5);

  return v10;
}

- (CLHUploadRequest)initWithArchive:(id)a3
{
  CLHUploadRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLHUploadRequest;
  v4 = -[CLHUploadRequest init](&v6, "init");
  if (v4)
    v4->_requestArchive = (CLHRequestArchive *)a3;
  return v4;
}

- (CLHUploadRequest)initWithPayload:(id)a3
{
  return -[CLHUploadRequest initWithPayload:requestTypeCode:endpoint:headers:](self, "initWithPayload:requestTypeCode:endpoint:headers:", a3, 0, 0, 0);
}

- (NSURLRequest)URLRequest
{
  id v3;
  NSDictionary *headers;
  CLHRequestArchive *requestArchive;
  NSData *payload;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  _QWORD v12[5];
  uint8_t buf[1640];

  v3 = objc_alloc_init((Class)NSMutableURLRequest);
  objc_msgSend(v3, "setURL:", self->_endpoint);
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "setTimeoutInterval:", 60.0);
  headers = self->_headers;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_101279A38;
  v12[3] = &unk_1021ABD10;
  v12[4] = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](headers, "enumerateKeysAndObjectsUsingBlock:", v12);
  requestArchive = self->_requestArchive;
  if (requestArchive)
  {
    payload = -[CLHRequestArchive mappedDataByDestructivelyCombiningPrimaryAndSecondaryData](requestArchive, "mappedDataByDestructivelyCombiningPrimaryAndSecondaryData");
  }
  else
  {
    payload = self->_payload;
    if (!payload)
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021ABD30);
      v7 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Request archive and Payload both were nil for upload request", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021ABD30);
        v11 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 16, "Request archive and Payload both were nil for upload request", &v11, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 0, "-[CLHUploadRequest URLRequest]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }
      payload = 0;
    }
  }
  objc_msgSend(v3, "setHTTPBody:", payload);
  return (NSURLRequest *)v3;
}

- (id)jsonObject
{
  CLHRequestArchive *requestArchive;
  const __CFString *v4;
  CLHRequestArchive *v5;

  requestArchive = self->_requestArchive;
  v4 = CFSTR("archive");
  v5 = requestArchive;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestCode: %d, itemCount: %lu"), -[CLHRequestArchive requestCode](self->_requestArchive, "requestCode"), -[CLHRequestArchive count](self->_requestArchive, "count"));
}

- (unsigned)requestTypeCode
{
  return self->_requestTypeCode;
}

- (void)setRequestTypeCode:(unsigned int)a3
{
  self->_requestTypeCode = a3;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLHEndpointSelector)endpointSelector
{
  return self->_endpointSelector;
}

- (CLHRequestArchive)requestArchive
{
  return self->_requestArchive;
}

@end
