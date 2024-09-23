@implementation _APKeyedArchiver

- (id)encodedData
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_APKeyedArchiver;
  v3 = -[_APKeyedArchiver encodedData](&v7, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_memorySize));
  objc_setAssociatedObject(v4, "_memorySize", v5, (void *)1);

  return v4;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (v6)
    self->_memorySize += malloc_size(v6);
  v8.receiver = self;
  v8.super_class = (Class)_APKeyedArchiver;
  -[_APKeyedArchiver encodeObject:forKey:](&v8, "encodeObject:forKey:", v6, v7);

}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  objc_super v5;

  self->_memorySize += a4;
  v5.receiver = self;
  v5.super_class = (Class)_APKeyedArchiver;
  -[_APKeyedArchiver encodeBytes:length:forKey:](&v5, "encodeBytes:length:forKey:", a3);
}

@end
