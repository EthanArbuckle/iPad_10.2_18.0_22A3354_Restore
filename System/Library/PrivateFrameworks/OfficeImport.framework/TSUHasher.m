@implementation TSUHasher

- (TSUHasher)init
{
  TSUHasher *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUHasher;
  result = -[TSUHasher init](&v3, sel_init);
  if (result)
    result->_currentHash = 0xCBF29CE484222325;
  return result;
}

- (void)p_appendUnsignedInteger:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  -[TSUHasher setCurrentHash:](self, "setCurrentHash:", TSUHashWithSeed((char *)&v3, 8, -[TSUHasher currentHash](self, "currentHash")));
}

- (void)addInt:(int)a3
{
  -[TSUHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", a3);
}

- (void)addUnsignedInt:(unsigned int)a3
{
  -[TSUHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", a3);
}

- (void)addBool:(BOOL)a3
{
  -[TSUHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", a3);
}

- (void)addObject:(id)a3
{
  -[TSUHasher p_appendUnsignedInteger:](self, "p_appendUnsignedInteger:", objc_msgSend(a3, "hash"));
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
