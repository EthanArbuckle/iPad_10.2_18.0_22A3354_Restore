@implementation _PASBloomFilterHashArray

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PASBloomFilterHashArray;
  return -[_PASBloomFilterHashArray init](&v3, sel_init);
}

- (_PASBloomFilterHashArray)initWithCapacity:(unint64_t)a3
{
  _PASBloomFilterHashArray *v4;
  int *v5;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PASBloomFilterHashArray;
  v4 = -[_PASBloomFilterHashArray init](&v8, sel_init);
  if (v4)
  {
    v4->_size = 4 * a3;
    v5 = (int *)malloc_type_malloc(4 * a3, 0x191F9D57uLL);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
    v4->_data = v5;
  }
  return v4;
}

- (int)hashes
{
  return self->_data;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_data);
  v3.receiver = self;
  v3.super_class = (Class)_PASBloomFilterHashArray;
  -[_PASBloomFilterHashArray dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  id v7;

  v4 = -[_PASBloomFilterHashArray initInternal](+[_PASBloomFilterHashArray allocWithZone:](_PASBloomFilterHashArray, "allocWithZone:", a3), "initInternal");
  if (v4)
  {
    v5 = malloc_type_malloc(self->_size, 0xD291E933uLL);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
    v4[2] = v5;
    memcpy(v5, self->_data, self->_size);
  }
  return v4;
}

@end
