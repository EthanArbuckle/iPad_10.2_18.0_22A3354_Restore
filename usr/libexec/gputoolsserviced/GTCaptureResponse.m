@implementation GTCaptureResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureResponse)init
{
  GTCaptureResponse *v2;
  GTCaptureResponse *v3;
  GTCaptureResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTCaptureResponse;
  v2 = -[GTCaptureResponse init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_version.var0.version = 1;
    v4 = v2;
  }

  return v3;
}

- (GTCaptureResponse)initWithCoder:(id)a3
{
  id v4;
  GTCaptureResponse *v5;
  id v6;
  uint64_t v7;
  NSData *data;
  id v9;
  uint64_t v10;
  NSError *error;
  GTCaptureResponse *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GTCaptureResponse;
  v5 = -[GTCaptureResponse init](&v14, "init");
  if (v5)
  {
    v5->_version.value = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
    v5->_requestID = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("data"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError), CFSTR("error"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    error = v5->_error;
    v5->_error = (NSError *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GTDataVersion version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", version.value, CFSTR("version"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (GTDataVersion)version
{
  return (GTDataVersion)self->_version.value;
}

- (void)setVersion:(GTDataVersion)a3
{
  self->_version = a3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
