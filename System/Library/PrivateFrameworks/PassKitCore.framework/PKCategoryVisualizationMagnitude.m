@implementation PKCategoryVisualizationMagnitude

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCategoryVisualizationMagnitude)initWithCoder:(id)a3
{
  id v4;
  PKCategoryVisualizationMagnitude *v5;
  uint64_t v6;
  NSString *passUniqueIdentifier;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCategoryVisualizationMagnitude;
  v5 = -[PKCategoryVisualizationMagnitude init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    v5->_bucket = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bucket"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("magnitude"));
    v5->_magnitude = v8;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKCategoryVisualizationMagnitude *v4;
  PKCategoryVisualizationMagnitude *v5;
  NSString *passUniqueIdentifier;
  NSString *v7;
  BOOL v8;

  v4 = (PKCategoryVisualizationMagnitude *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      passUniqueIdentifier = self->_passUniqueIdentifier;
      v7 = v5->_passUniqueIdentifier;
      if (passUniqueIdentifier && v7)
      {
        if ((-[NSString isEqual:](passUniqueIdentifier, "isEqual:") & 1) == 0)
          goto LABEL_12;
      }
      else if (passUniqueIdentifier != v7)
      {
        goto LABEL_12;
      }
      if (self->_bucket == v5->_bucket)
      {
        v8 = self->_magnitude == v5->_magnitude;
LABEL_13:

        goto LABEL_14;
      }
LABEL_12:
      v8 = 0;
      goto LABEL_13;
    }
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_passUniqueIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_bucket - v4 + 32 * v4;
  v6 = (unint64_t)self->_magnitude - v5 + 32 * v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passUniqueIdentifier;
  id v5;

  passUniqueIdentifier = self->_passUniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bucket, CFSTR("bucket"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("magnitude"), self->_magnitude);

}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (void)setBucket:(int64_t)a3
{
  self->_bucket = a3;
}

- (double)magnitude
{
  return self->_magnitude;
}

- (void)setMagnitude:(double)a3
{
  self->_magnitude = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
