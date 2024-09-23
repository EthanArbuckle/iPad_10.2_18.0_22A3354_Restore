@implementation VFXMTLBuffer

- (void)contents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLBuffer *buffer;

  buffer = self->_buffer;
  if (!buffer)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v2, v3, v4, v5, v6, v7, (uint64_t)"_buffer");
    buffer = self->_buffer;
  }
  return (void *)(objc_msgSend_contents(buffer, a2, v2, v3) + self->_offset);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLBuffer;
  -[VFXMTLBuffer dealloc](&v3, sel_dealloc);
}

- (void)incrementUsedCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_usedCount(self, a2, v2, v3) + 1;
  objc_msgSend_setUsedCount_(self, v6, v5, v7);
}

- (int64_t)decrementUsedCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend_usedCount(self, a2, v2, v3);
  objc_msgSend_setUsedCount_(self, v6, v5 - 1, v7);
  return objc_msgSend_usedCount(self, v8, v9, v10);
}

- (int64_t)usedCount
{
  return self->_usedCount;
}

- (void)setUsedCount:(int64_t)a3
{
  self->_usedCount = a3;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = a3;
}

@end
