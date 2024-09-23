@implementation ISURLCacheConfiguration

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISURLCacheConfiguration;
  -[ISURLCacheConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_diskCapacity;
  v5[2] = self->_memoryCapacity;
  v5[3] = -[NSString copyWithZone:](self->_persistentIdentifier, "copyWithZone:", a3);
  return v5;
}

- (unint64_t)diskCapacity
{
  return self->_diskCapacity;
}

- (void)setDiskCapacity:(unint64_t)a3
{
  self->_diskCapacity = a3;
}

- (unint64_t)memoryCapacity
{
  return self->_memoryCapacity;
}

- (void)setMemoryCapacity:(unint64_t)a3
{
  self->_memoryCapacity = a3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
