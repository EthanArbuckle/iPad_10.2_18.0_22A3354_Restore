@implementation CRLHasher

- (CRLHasher)init
{
  CRLHasher *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLHasher;
  result = -[CRLHasher init](&v3, "init");
  if (result)
    result->_currentHash = 0xCBF29CE484222325;
  return result;
}

- (void)p_appendUnsignedInteger:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  -[CRLHasher setCurrentHash:](self, "setCurrentHash:", sub_1000BC018((char *)&v3, 8, -[CRLHasher currentHash](self, "currentHash")));
}

- (void)addInt:(int)a3
{
  -[CRLHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:");
}

- (void)addUnsignedInt:(unsigned int)a3
{
  -[CRLHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:");
}

- (void)addBool:(BOOL)a3
{
  -[CRLHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:");
}

- (void)addInteger:(int64_t)a3
{
  -[CRLHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", a3);
}

- (void)addUnsignedInteger:(unint64_t)a3
{
  -[CRLHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", a3);
}

- (void)addObject:(id)a3
{
  -[CRLHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", objc_msgSend(a3, "hash"));
}

- (unint64_t)currentHash
{
  return self->_currentHash;
}

- (void)setCurrentHash:(unint64_t)a3
{
  self->_currentHash = a3;
}

@end
