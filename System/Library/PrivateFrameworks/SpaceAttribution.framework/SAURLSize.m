@implementation SAURLSize

- (SAURLSize)initWithSize:(unint64_t)a3 mayBePartOfCloneChain:(BOOL)a4
{
  SAURLSize *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SAURLSize;
  result = -[SAURLSize init](&v7, sel_init);
  if (result)
  {
    result->_size = a3;
    result->_mayBePartOfCloneChain = a4;
  }
  return result;
}

+ (id)newWithSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:mayBePartOfCloneChain:", a3, 0);
}

+ (id)newWithSize:(unint64_t)a3 mayBePartOfCloneChain:(BOOL)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:mayBePartOfCloneChain:", a3, a4);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t size;
  id v5;

  size = self->_size;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", size, CFSTR("urlSize"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mayBePartOfCloneChain, CFSTR("cloneChain"));

}

- (SAURLSize)initWithCoder:(id)a3
{
  id v4;
  SAURLSize *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SAURLSize;
  v5 = -[SAURLSize init](&v7, sel_init);
  if (v5)
  {
    v5->_size = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("urlSize"));
    v5->_mayBePartOfCloneChain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cloneChain"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (BOOL)mayBePartOfCloneChain
{
  return self->_mayBePartOfCloneChain;
}

- (void)setMayBePartOfCloneChain:(BOOL)a3
{
  self->_mayBePartOfCloneChain = a3;
}

@end
