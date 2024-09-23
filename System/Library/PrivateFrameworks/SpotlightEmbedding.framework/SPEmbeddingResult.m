@implementation SPEmbeddingResult

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__SPEmbeddingResult_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (id)log_log_1;
}

void __24__SPEmbeddingResult_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.spotlightembedding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

- (SPEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5 scale:(float)a6 bias:(float)a7
{
  id v13;
  SPEmbeddingResult *v14;
  SPEmbeddingResult *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SPEmbeddingResult;
  v14 = -[SPEmbeddingResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_version = a3;
    objc_storeStrong((id *)&v14->_embeddingData, a4);
    v15->_elementType = a5;
    v15->_scale = a6;
    v15->_bias = a7;
  }

  return v15;
}

- (unint64_t)elementCount
{
  unint64_t elementType;
  NSObject *v5;
  unint64_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  elementType = self->_elementType;
  if (elementType == 2)
    return -[NSData length](self->_embeddingData, "length") >> 2;
  if (elementType == 1)
    return -[NSData length](self->_embeddingData, "length") >> 1;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = self->_elementType;
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_24795D000, v5, OS_LOG_TYPE_ERROR, "Embedding has unknown element type (%d); cannot derive count",
      (uint8_t *)v7,
      8u);
  }

  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("elementType: %d, "), self->_elementType);
  objc_msgSend(v3, "appendFormat:", CFSTR("elementCount: %d, "), -[SPEmbeddingResult elementCount](self, "elementCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("embeddingData: %@>"), self->_embeddingData);
  return v3;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (NSData)embeddingData
{
  return self->_embeddingData;
}

- (unint64_t)version
{
  return self->_version;
}

- (float)scale
{
  return self->_scale;
}

- (float)bias
{
  return self->_bias;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingData, 0);
}

@end
