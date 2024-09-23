@implementation SKPartitionDescriptor

- (SKPartitionDescriptor)initWithVolume:(id)a3 size:(unint64_t)a4
{
  id v7;
  SKPartitionDescriptor *v8;
  SKPartitionDescriptor *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKPartitionDescriptor;
  v8 = -[SKPartitionDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_innerDescriptor, a3);
    v9->_size = a4;
  }

  return v9;
}

+ (id)descriptorWithVolume:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVolume:size:", v3, 0);

  return v4;
}

+ (id)descriptorWithVolume:(id)a3 size:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVolume:size:", v5, a4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SKFilesystem)filesystem
{
  void *v2;
  void *v3;

  -[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filesystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKFilesystem *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKPartitionDescriptor size](self, "size"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("size"));

}

- (SKPartitionDescriptor)initWithCoder:(id)a3
{
  id v4;
  SKPartitionDescriptor *v5;
  void *v6;
  uint64_t v7;
  SKVolumeDescriptor *innerDescriptor;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKPartitionDescriptor;
  v5 = -[SKPartitionDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("descriptor"));
    v7 = objc_claimAutoreleasedReturnValue();
    innerDescriptor = v5->_innerDescriptor;
    v5->_innerDescriptor = (SKVolumeDescriptor *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_size = objc_msgSend(v9, "unsignedLongLongValue");

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKPartitionDescriptor size](self, "size");
  -[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { size: \"%lu\", innerDescriptor: \"%@\"}>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)size
{
  return self->_size;
}

- (SKVolumeDescriptor)innerDescriptor
{
  return self->_innerDescriptor;
}

- (void)setInnerDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_innerDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerDescriptor, 0);
}

@end
