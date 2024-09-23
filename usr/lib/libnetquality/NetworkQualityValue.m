@implementation NetworkQualityValue

- (void)updateConfidence:(int64_t)a3
{
  if (-[NetworkQualityValue confidence](self, "confidence") < a3)
    -[NetworkQualityValue setConfidence:](self, "setConfidence:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NetworkQualityValue *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(NetworkQualityValue);
  -[NetworkQualityValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NetworkQualityValue setValue:](v4, "setValue:", v6);

  -[NetworkQualityValue rating](self, "rating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[NetworkQualityValue setRating:](v4, "setRating:", v8);

  -[NetworkQualityValue setConfidence:](v4, "setConfidence:", -[NetworkQualityValue confidence](self, "confidence"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NetworkQualityValue)initWithCoder:(id)a3
{
  id v4;
  NetworkQualityValue *v5;
  uint64_t v6;
  NSNumber *value;
  uint64_t v8;
  NSNumber *rating;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NetworkQualityValue;
  v5 = -[NetworkQualityValue init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rating"));
    v8 = objc_claimAutoreleasedReturnValue();
    rating = v5->_rating;
    v5->_rating = (NSNumber *)v8;

    v5->_confidence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confidence"));
  }

  return v5;
}

- (NetworkQualityValue)init
{
  NetworkQualityValue *v2;
  NSNumber *v3;
  NSNumber *value;
  NSNumber *v5;
  NSNumber *rating;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NetworkQualityValue;
  v2 = -[NetworkQualityValue init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSNumber *)objc_alloc_init(MEMORY[0x24BDD16E0]);
    value = v2->_value;
    v2->_value = v3;

    v5 = (NSNumber *)objc_alloc_init(MEMORY[0x24BDD16E0]);
    rating = v2->_rating;
    v2->_rating = v5;

  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rating, CFSTR("rating"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_confidence, CFSTR("confidence"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: value=%@, rating=%@, confidence=%ld>"), v5, self->_value, self->_rating, self->_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)rating
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRating:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
