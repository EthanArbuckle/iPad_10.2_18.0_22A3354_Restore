@implementation _NSLineBreakerNodePool

- (void)reset
{
  -[_NSBumpAllocator reset](self->_allocator, "reset");
  self->_freeList = 0;
}

- (_WLNode)allocNode
{
  _NSBumpAllocator *v3;
  _NSBumpAllocator *allocator;
  _WLNode *result;

  if (!self->_allocator)
  {
    v3 = objc_alloc_init(_NSBumpAllocator);
    allocator = self->_allocator;
    self->_allocator = v3;

  }
  result = self->_freeList;
  if (result)
    self->_freeList = result->var0;
  else
    result = -[_NSBumpAllocator allocate:](self->_allocator, "allocate:", 112);
  result->var3 = 0.0;
  result->var0 = 0;
  result->var1 = 1;
  result->var4 = 0;
  return result;
}

- (_WLNode)retainNode:(_WLNode *)a3
{
  _WLNode *result;

  result = a3;
  if (a3)
    ++a3->var1;
  return result;
}

- (void)releaseNode:(_WLNode *)a3
{
  _WLNode *var0;

  if (a3)
  {
    while (a3->var1 == 1)
    {
      var0 = a3->var0;
      a3->var4 = 1;
      a3->var0 = self->_freeList;
      a3->var1 = 0;
      self->_freeList = a3;
      a3 = var0;
      if (!var0)
        return;
    }
    --a3->var1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
}

@end
