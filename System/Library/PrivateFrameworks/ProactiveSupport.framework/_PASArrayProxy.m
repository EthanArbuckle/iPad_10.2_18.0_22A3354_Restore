@implementation _PASArrayProxy

- (_PASArrayProxy)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  _PASArrayProxy *v5;

  v5 = (_PASArrayProxy *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4);

  return v5;
}

- (_PASArrayProxy)initWithCoder:(id)a3
{
  _PASArrayProxy *result;

  result = (_PASArrayProxy *)a3;
  __break(1u);
  return result;
}

- (id)_pas_unproxy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PASArrayProxy;
  return -[_PASArrayProxy copyWithZone:](&v3, sel_copyWithZone_, 0);
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1A1AFDC98](self, a2);
  (*((void (**)(void))self->_objectAtIndexBlock + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  return v5;
}

- (unint64_t)count
{
  void *v3;
  unint64_t v4;

  v3 = (void *)MEMORY[0x1A1AFDC98](self, a2);
  v4 = (*((uint64_t (**)(void))self->_countBlock + 2))();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_countBlock, 0);
  objc_storeStrong(&self->_objectAtIndexBlock, 0);
}

@end
