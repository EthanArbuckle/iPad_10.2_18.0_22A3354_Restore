@implementation TPSContextualEventBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualEventBookmark)initWithDataVersion:(unsigned int)a3
{
  TPSContextualEventBookmark *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualEventBookmark;
  result = -[TPSContextualEventBookmark init](&v5, sel_init);
  if (result)
    result->_dataVersion = a3;
  return result;
}

- (TPSContextualEventBookmark)initWithCoder:(id)a3
{
  id v4;
  TPSContextualEventBookmark *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSContextualEventBookmark;
  v5 = -[TPSContextualEventBookmark init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataVersion = objc_msgSend(v6, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  uint64_t dataVersion;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  dataVersion = self->_dataVersion;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInt:", dataVersion);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("dataVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setDataVersion:", self->_dataVersion);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualEventBookmark;
  -[TPSContextualEventBookmark description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %d"),
    CFSTR("dataVersion"),
    -[TPSContextualEventBookmark dataVersion](self, "dataVersion"));
  return v5;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(unsigned int)a3
{
  self->_dataVersion = a3;
}

@end
