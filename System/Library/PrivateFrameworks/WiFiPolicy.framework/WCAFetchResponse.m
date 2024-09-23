@implementation WCAFetchResponse

+ (id)fetchResponseWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setError:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;

  error = self->_error;
  if (error)
    objc_msgSend(a3, "encodeObject:forKey:", error, CFSTR("_error"));
}

- (WCAFetchResponse)initWithCoder:(id)a3
{
  id v3;
  WCAFetchResponse *v4;
  uint64_t v5;
  NSError *error;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WCAFetchResponse;
  v3 = a3;
  v4 = -[WCAFetchResponse init](&v8, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  error = v4->_error;
  v4->_error = (NSError *)v5;

  return v4;
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
}

@end
