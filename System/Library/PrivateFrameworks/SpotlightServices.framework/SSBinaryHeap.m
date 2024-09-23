@implementation SSBinaryHeap

- (SSBinaryHeap)initWithComparator:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  SSBinaryHeap *v7;
  uint64_t v8;
  id comparator;
  objc_super v11;
  CFBinaryHeapCompareContext compareContext;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSBinaryHeap;
  v7 = -[SSBinaryHeap init](&v11, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x1BCCB38DC](v6);
    comparator = v7->_comparator;
    v7->_comparator = (id)v8;

    v7->_maxCount = a4;
    compareContext.version = 0;
    memset(&compareContext.retain, 0, 24);
    compareContext.info = v7;
    v7->_binaryHeap = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &commonHeapCreate_heapCallbacks, &compareContext);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_binaryHeap);
  v3.receiver = self;
  v3.super_class = (Class)SSBinaryHeap;
  -[SSBinaryHeap dealloc](&v3, sel_dealloc);
}

- (void)addObject:(id)a3
{
  CFBinaryHeapAddValue(self->_binaryHeap, a3);
  if (-[SSBinaryHeap count](self, "count") > self->_maxCount)
    -[SSBinaryHeap removeMinimumValue](self, "removeMinimumValue");
}

- (BOOL)containsObject:(id)a3
{
  return CFBinaryHeapContainsValue(self->_binaryHeap, a3) != 0;
}

- (unint64_t)count
{
  return CFBinaryHeapGetCount(self->_binaryHeap);
}

- (unint64_t)countForObject:(id)a3
{
  return CFBinaryHeapGetCountOfValue(self->_binaryHeap, a3);
}

- (id)minimumValue
{
  return (id)CFBinaryHeapGetMinimum(self->_binaryHeap);
}

- (void)removeMinimumValue
{
  CFBinaryHeapRemoveMinimumValue(self->_binaryHeap);
}

- (void)removeAllObjects
{
  CFBinaryHeapRemoveAllValues(self->_binaryHeap);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  CFBinaryHeapApplyFunction(self->_binaryHeap, (CFBinaryHeapApplierFunction)SSBinaryHeapApplierFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
}

@end
