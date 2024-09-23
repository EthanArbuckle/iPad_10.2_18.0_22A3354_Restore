@implementation PLSortedChangedObjects

- (PLSortedChangedObjects)initWithChangedObjects:(id)a3
{
  id v5;
  PLSortedChangedObjects *v6;
  size_t v7;
  id *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLSortedChangedObjects;
  v6 = -[PLSortedChangedObjects init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "count");
    v6->_count = v7;
    objc_storeStrong((id *)&v6->_changedObjects, a3);
    v8 = (id *)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    v6->_sortedObjectPointers = v8;
    objc_msgSend(v5, "getObjects:range:", v8, 0, v7);
    qsort(v6->_sortedObjectPointers, v7, 8uLL, (int (__cdecl *)(const void *, const void *))_pointerComparator);
  }

  return v6;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedObjects, 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sortedObjectPointers);
  v3.receiver = self;
  v3.super_class = (Class)PLSortedChangedObjects;
  -[PLSortedChangedObjects dealloc](&v3, sel_dealloc);
}

- (NSArray)changedObjects
{
  return self->_changedObjects;
}

- (id)sortedObjectPointers
{
  return self->_sortedObjectPointers;
}

@end
