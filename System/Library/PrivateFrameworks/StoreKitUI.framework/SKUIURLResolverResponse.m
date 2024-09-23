@implementation SKUIURLResolverResponse

- (SKUIURLResolverResponse)initWithData:(id)a3 URLResponse:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKUIURLResolverResponse *v17;
  SKUIURLResolverResponse *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        -[SKUIURLResolverResponse initWithData:URLResponse:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIURLResolverResponse;
  v17 = -[SKUIURLResolverResponse init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    objc_storeStrong((id *)&v18->_response, a4);
  }

  return v18;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithData:(uint64_t)a3 URLResponse:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
