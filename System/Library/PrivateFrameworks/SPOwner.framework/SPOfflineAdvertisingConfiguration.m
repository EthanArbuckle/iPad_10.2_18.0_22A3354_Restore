@implementation SPOfflineAdvertisingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOfflineAdvertisingConfiguration)initWithShortIntervalCount:(int64_t)a3 longIntervalCount:(int64_t)a4
{
  SPOfflineAdvertisingConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPOfflineAdvertisingConfiguration;
  result = -[SPOfflineAdvertisingConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_shortIntervalCount = a3;
    result->_longIntervalCount = a4;
  }
  return result;
}

- (SPOfflineAdvertisingConfiguration)initWithDictionaryRepresentation:(id)a3
{
  id v3;
  SPOfflineAdvertisingConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPOfflineAdvertisingConfiguration;
  v3 = a3;
  v4 = -[SPOfflineAdvertisingConfiguration init](&v10, sel_init);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("s"), v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("l"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (v4)
  {
    v4->_shortIntervalCount = v6;
    v4->_longIntervalCount = v8;
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("s");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SPOfflineAdvertisingConfiguration shortIntervalCount](self, "shortIntervalCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("l");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SPOfflineAdvertisingConfiguration longIntervalCount](self, "longIntervalCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t shortIntervalCount;
  id v5;

  shortIntervalCount = self->_shortIntervalCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", shortIntervalCount, CFSTR("s"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_longIntervalCount, CFSTR("l"));

}

- (SPOfflineAdvertisingConfiguration)initWithCoder:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  self->_shortIntervalCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("s"));
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("l"));

  self->_longIntervalCount = v5;
  return self;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[short: %lu, long: %lu]"), -[SPOfflineAdvertisingConfiguration shortIntervalCount](self, "shortIntervalCount"), -[SPOfflineAdvertisingConfiguration longIntervalCount](self, "longIntervalCount"));
}

- (int64_t)shortIntervalCount
{
  return self->_shortIntervalCount;
}

- (void)setShortIntervalCount:(int64_t)a3
{
  self->_shortIntervalCount = a3;
}

- (int64_t)longIntervalCount
{
  return self->_longIntervalCount;
}

- (void)setLongIntervalCount:(int64_t)a3
{
  self->_longIntervalCount = a3;
}

@end
