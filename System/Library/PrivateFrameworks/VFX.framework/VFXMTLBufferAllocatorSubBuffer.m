@implementation VFXMTLBufferAllocatorSubBuffer

- (VFXMTLBufferAllocatorSubBuffer)initWithPage:(id)a3 allocator:(id)a4
{
  VFXMTLBufferAllocatorSubBuffer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXMTLBufferAllocatorSubBuffer;
  result = -[VFXMTLBufferAllocatorSubBuffer init](&v6, sel_init, a3, a4);
  if (result)
    result->_parentPage = (VFXFixedSizePage *)a3;
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  VFXFixedSizePage *parentPage;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  parentPage = self->_parentPage;
  v6 = objc_msgSend_offset(self, a2, v2, v3);
  objc_msgSend_deallocateElementAtOffset_(parentPage, v7, v6, v8);
  v9.receiver = self;
  v9.super_class = (Class)VFXMTLBufferAllocatorSubBuffer;
  -[VFXMTLBuffer dealloc](&v9, sel_dealloc);
}

@end
