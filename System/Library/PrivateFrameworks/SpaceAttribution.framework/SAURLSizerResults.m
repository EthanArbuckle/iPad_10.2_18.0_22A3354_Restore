@implementation SAURLSizerResults

- (SAURLSizerResults)init
{
  SAURLSizerResults *v2;
  SAURLSizerResults *v3;
  uint64_t v4;
  NSDictionary *urlInfo;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SAURLSizerResults;
  v2 = -[SAURLSizerResults init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeNow = 0;
    v4 = objc_opt_new();
    urlInfo = v3->_urlInfo;
    v3->_urlInfo = (NSDictionary *)v4;

  }
  return v3;
}

- (void)addURL:(id)a3 withSizeInfo:(id)a4
{
  -[NSDictionary setObject:forKey:](self->_urlInfo, "setObject:forKey:", a4, a3);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t timeNow;
  id v5;

  timeNow = self->_timeNow;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", timeNow, CFSTR("time"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlInfo, CFSTR("urlInfo"));

}

- (SAURLSizerResults)initWithCoder:(id)a3
{
  id v4;
  SAURLSizerResults *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *urlInfo;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SAURLSizerResults;
  v5 = -[SAURLSizerResults init](&v13, sel_init);
  if (v5)
  {
    v5->_timeNow = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("time"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("urlInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    urlInfo = v5->_urlInfo;
    v5->_urlInfo = (NSDictionary *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)timeNow
{
  return self->_timeNow;
}

- (void)setTimeNow:(int64_t)a3
{
  self->_timeNow = a3;
}

- (NSDictionary)urlInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlInfo, 0);
}

@end
