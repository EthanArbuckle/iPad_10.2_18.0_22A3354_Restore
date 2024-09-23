@implementation VFXFixedSizePage

- (VFXFixedSizePage)initWithBuffer:(id)a3 elementSize:(unint64_t)a4
{
  VFXFixedSizePage *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXFixedSizePage;
  v6 = -[VFXFixedSizePage init](&v15, sel_init);
  v10 = objc_msgSend_length(a3, v7, v8, v9) / a4;
  v6->_buffer = (MTLBuffer *)a3;
  v11 = objc_alloc(MEMORY[0x1E0CB3788]);
  v13 = objc_msgSend_initWithIndexesInRange_(v11, v12, 0, v10);
  v6->_elementSize = a4;
  v6->_freeIndices = (NSMutableIndexSet *)v13;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXFixedSizePage;
  -[VFXFixedSizePage dealloc](&v3, sel_dealloc);
}

- (BOOL)isFull
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_freeIndices, a2, v2, v3) == 0;
}

- (BOOL)hasFreeElementsLeft
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_freeIndices, a2, v2, v3) != 0;
}

- (unint64_t)_allocateElement
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t Index;

  if (!objc_msgSend_count(self->_freeIndices, a2, v2, v3))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Internal consistency error – no free index"), v6, v7, v8, v9, v10, v11, (uint64_t)"_freeIndices.count > 0");
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend_count(self->_freeIndices, v5, v6, v7))
  {
    Index = objc_msgSend_firstIndex(self->_freeIndices, v12, v13, v14);
    if (Index == 0x7FFFFFFFFFFFFFFFLL)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Internal consistency error – no free index"), v17, v18, v19, v20, v21, v22, (uint64_t)"firstFreeIndex != NSNotFound");
    objc_msgSend_removeIndex_(self->_freeIndices, v16, Index, v18);
    return self->_elementSize * Index;
  }
  return v15;
}

- (void)deallocateElementAtOffset:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t elementSize;
  unint64_t v10;

  elementSize = self->_elementSize;
  v10 = a3 / elementSize;
  if (a3 % elementSize)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. offset should be exactly equal to size"), a3, v3, v4, v5, v6, v7, (uint64_t)"(offset % _elementSize) == 0");
  objc_msgSend_addIndex_(self->_freeIndices, a2, v10, v3);
}

- (id)newSubBufferForAllocator:(id)a3
{
  VFXMTLBufferAllocatorSubBuffer *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Element;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = [VFXMTLBufferAllocatorSubBuffer alloc];
  v7 = (void *)objc_msgSend_initWithPage_allocator_(v5, v6, (uint64_t)self, (uint64_t)a3);
  objc_msgSend_setBuffer_(v7, v8, (uint64_t)self->_buffer, v9);
  Element = objc_msgSend__allocateElement(self, v10, v11, v12);
  objc_msgSend_setOffset_(v7, v14, Element, v15);
  if (objc_msgSend_offset(v7, v16, v17, v18) == 0x7FFFFFFFFFFFFFFFLL)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. should have some index free"), v19, v20, v21, v22, v23, v24, (uint64_t)"mtlBuffer.offset != NSNotFound");
  return v7;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

@end
