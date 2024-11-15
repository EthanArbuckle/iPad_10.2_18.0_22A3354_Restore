@implementation _NSBumpAllocator

- (Slab)_allocateSlabWithSize:(unint64_t)a3
{
  Slab *result;

  result = (Slab *)malloc_type_malloc(a3, 0xF1D3E7E9uLL);
  result->var0 = a3;
  result->var1 = 0;
  return result;
}

- (void)allocate:(unint64_t)a3
{
  void *result;
  Slab *var1;
  Slab *v7;
  unint64_t var0;

  if (a3 - 4081 <= 0xFFFFFFFFFFFFEFFELL)
    -[_NSBumpAllocator allocate:].cold.1();
  if (!self->_firstSlab)
  {
    v7 = -[_NSBumpAllocator _allocateSlabWithSize:](self, "_allocateSlabWithSize:", 4096);
    var1 = v7;
    self->_firstSlab = v7;
    self->_curSlab = v7;
LABEL_8:
    var0 = v7->var0;
    result = v7->var2;
    self->_endPtr = (char *)var1 + var0;
    goto LABEL_9;
  }
  result = self->_ptr;
  if ((char *)((unint64_t)result + a3) > self->_endPtr)
  {
    var1 = self->_curSlab->var1;
    if (!var1)
    {
      self->_curSlab->var1 = -[_NSBumpAllocator _allocateSlabWithSize:](self, "_allocateSlabWithSize:", 4096);
      var1 = self->_curSlab->var1;
    }
    self->_curSlab = var1;
    v7 = var1;
    goto LABEL_8;
  }
LABEL_9:
  self->_ptr = (char *)result + a3;
  return result;
}

- (void)reset
{
  Slab *firstSlab;
  unint64_t var0;

  firstSlab = self->_firstSlab;
  var0 = firstSlab->var0;
  self->_curSlab = firstSlab;
  self->_ptr = firstSlab->var2;
  self->_endPtr = (char *)firstSlab + var0;
}

- (void)dealloc
{
  Slab *firstSlab;
  Slab *var1;
  objc_super v5;

  firstSlab = self->_firstSlab;
  if (firstSlab)
  {
    do
    {
      var1 = firstSlab->var1;
      free(firstSlab);
      firstSlab = var1;
    }
    while (var1);
  }
  v5.receiver = self;
  v5.super_class = (Class)_NSBumpAllocator;
  -[_NSBumpAllocator dealloc](&v5, sel_dealloc);
}

- (void)allocate:.cold.1()
{
  __assert_rtn("-[_NSBumpAllocator allocate:]", "NSBumpAllocator.m", 38, "offsetof(Slab, data) + size <= SLAB_SIZE");
}

@end
