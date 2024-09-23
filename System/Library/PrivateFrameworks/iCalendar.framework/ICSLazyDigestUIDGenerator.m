@implementation ICSLazyDigestUIDGenerator

- (ICSLazyDigestUIDGenerator)initWithData:(id)a3
{
  id v5;
  ICSLazyDigestUIDGenerator *v6;
  ICSLazyDigestUIDGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSLazyDigestUIDGenerator;
  v6 = -[ICSLazyDigestUIDGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (id)_digest
{
  NSString *digest;
  NSData *data;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSString *v10;

  digest = self->_digest;
  if (!digest)
  {
    data = self->_data;
    if (data)
    {
      -[NSData ical_digest](data, "ical_digest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * objc_msgSend(v5, "length"));
      digest = objc_retainAutorelease(v5);
      v7 = -[NSString bytes](digest, "bytes");
      if (-[NSString length](digest, "length"))
      {
        v8 = 0;
        do
          objc_msgSend(v6, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v7 + v8++));
        while (v8 != -[NSString length](digest, "length"));
      }
      v9 = (NSString *)objc_msgSend(v6, "copy");
      v10 = self->_digest;
      self->_digest = v9;

    }
    else
    {
      self->_digest = (NSString *)&stru_1E953C148;
    }

  }
  return self->_digest;
}

- (id)generateUID
{
  void *v3;
  void *v4;
  uint64_t lastIndex;
  void *v6;

  -[ICSLazyDigestUIDGenerator _digest](self, "_digest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  lastIndex = self->_lastIndex;
  self->_lastIndex = lastIndex + 1;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%d"), v3, lastIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
