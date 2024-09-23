@implementation REPriorityQueue

- (id)minimumObject
{
  void *v3;

  v3 = -[REPriorityQueue count](self, "count");
  if (v3)
  {
    CFBinaryHeapGetMinimum(self->_binaryHeap);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)count
{
  return CFBinaryHeapGetCount(self->_binaryHeap);
}

- (REPriorityQueue)initWithComparator:(id)a3
{
  id v4;
  REPriorityQueue *v5;
  uint64_t v6;
  id comparator;
  id v8;
  CFBinaryHeapCompareContext compareContext;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REPriorityQueue;
  v5 = -[REPriorityQueue init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    comparator = v5->_comparator;
    v5->_comparator = (id)v6;

    v8 = v5->_comparator;
    compareContext.version = 0;
    compareContext.info = v8;
    compareContext.retain = (const void *(__cdecl *)(const void *))REPriorityQueueRetain;
    compareContext.release = REPriorityQueueRelease;
    compareContext.copyDescription = (CFStringRef (__cdecl *)(const void *))REPriorityQueueCopyDescription;
    v5->_binaryHeap = CFBinaryHeapCreate(0, 0, &kREPriorityQueueCallbacks, &compareContext);
  }

  return v5;
}

- (REPriorityQueue)init
{
  return -[REPriorityQueue initWithComparator:](self, "initWithComparator:", &__block_literal_global_78);
}

uint64_t __23__REPriorityQueue_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isEqual:(id)a3
{
  REPriorityQueue *v4;
  REPriorityQueue *v5;
  unint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  REPriorityQueue *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = (REPriorityQueue *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[REPriorityQueue count](self, "count");
      if (v6 == -[REPriorityQueue count](v5, "count"))
      {
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 1;
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __27__REPriorityQueue_isEqual___block_invoke;
        v9[3] = &unk_24CF906E0;
        v11 = &v12;
        v10 = v5;
        -[REPriorityQueue enumerateObjects:](self, "enumerateObjects:", v9);
        v7 = *((_BYTE *)v13 + 24) != 0;

        _Block_object_dispose(&v12, 8);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

uint64_t __27__REPriorityQueue_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REPriorityQueue *v4;
  REPriorityQueue *v5;
  _QWORD v7[4];
  REPriorityQueue *v8;

  v4 = -[REPriorityQueue initWithComparator:](+[REPriorityQueue allocWithZone:](REPriorityQueue, "allocWithZone:", a3), "initWithComparator:", self->_comparator);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__REPriorityQueue_copyWithZone___block_invoke;
  v7[3] = &unk_24CF8B250;
  v5 = v4;
  v8 = v5;
  -[REPriorityQueue enumerateObjects:](self, "enumerateObjects:", v7);

  return v5;
}

uint64_t __32__REPriorityQueue_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertObject:", a2);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_binaryHeap);
  v3.receiver = self;
  v3.super_class = (Class)REPriorityQueue;
  -[REPriorityQueue dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_binaryHeap);
}

- (NSArray)allObjects
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REPriorityQueue count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__REPriorityQueue_allObjects__block_invoke;
  v7[3] = &unk_24CF8B250;
  v8 = v3;
  v4 = v3;
  -[REPriorityQueue enumerateObjects:](self, "enumerateObjects:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

uint64_t __29__REPriorityQueue_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)insertObject:(id)a3
{
  CFBinaryHeapAddValue(self->_binaryHeap, a3);
}

- (void)removeAllObjects
{
  CFBinaryHeapRemoveAllValues(self->_binaryHeap);
}

- (void)removeMinimumObject
{
  CFBinaryHeapRemoveMinimumValue(self->_binaryHeap);
}

- (BOOL)containsObject:(id)a3
{
  return CFBinaryHeapContainsValue(self->_binaryHeap, a3) != 0;
}

- (void)enumerateObjects:(id)a3
{
  CFBinaryHeapApplyFunction(self->_binaryHeap, (CFBinaryHeapApplierFunction)REPriorityQueueApply, a3);
}

- (id)comparator
{
  return self->_comparator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
}

@end
