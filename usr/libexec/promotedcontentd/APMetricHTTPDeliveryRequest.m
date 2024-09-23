@implementation APMetricHTTPDeliveryRequest

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setBilling:(id)a3
{
  objc_storeStrong((id *)&self->_billing, a3);
}

- (void)setBatchInfos:(id)a3
{
  objc_storeStrong((id *)&self->_batchInfos, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (APDestination)destination
{
  return self->_destination;
}

- (NSData)data
{
  return self->_data;
}

- (id)buildSignatureUsingSigningAuthority:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signatureForData:error:", v7, a4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 32));
  -[APMetricHTTPDeliveryRequest setSignature:](self, "setSignature:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest signature](self, "signature"));
  return v10;
}

- (NSString)billing
{
  return self->_billing;
}

- (NSArray)batchInfos
{
  return self->_batchInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, 0);
  objc_storeStrong((id *)&self->_batchInfos, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_billing, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest data](self, "data"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest billing](self, "billing"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("billing"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest headers](self, "headers"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("headers"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest destination](self, "destination"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("destination"));

  v10 = (id)objc_claimAutoreleasedReturnValue(-[APMetricHTTPDeliveryRequest signature](self, "signature"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("signature"));

}

- (APMetricHTTPDeliveryRequest)initWithCoder:(id)a3
{
  id v4;
  APMetricHTTPDeliveryRequest *v5;
  id v6;
  uint64_t v7;
  NSData *data;
  id v9;
  uint64_t v10;
  NSString *billing;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *headers;
  APDestination *v18;
  id v19;
  void *v20;
  APDestination *v21;
  APDestination *destination;
  id v23;
  uint64_t v24;
  NSString *signature;

  v4 = a3;
  v5 = -[APMetricHTTPDeliveryRequest init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("data"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("billing"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    billing = v5->_billing;
    v5->_billing = (NSString *)v10;

    v12 = objc_opt_class(NSDictionary);
    v13 = objc_opt_class(NSString);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, objc_opt_class(NSNumber), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("headers")));
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v16;

    v18 = [APDestination alloc];
    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("destination"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = -[APDestination initWithString:](v18, "initWithString:", v20);
    destination = v5->_destination;
    v5->_destination = v21;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("signature"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    signature = v5->_signature;
    v5->_signature = (NSString *)v24;

  }
  return v5;
}

- (APFakeNetworkResponse)fakeNetworkResponse
{
  return self->_fakeNetworkResponse;
}

- (void)setFakeNetworkResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, a3);
}

@end
