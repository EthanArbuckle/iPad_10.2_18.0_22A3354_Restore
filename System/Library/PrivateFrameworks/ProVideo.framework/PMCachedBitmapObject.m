@implementation PMCachedBitmapObject

- (PMCachedBitmapObject)initWithBitmap:(const void *)a3
{
  PMCachedBitmapObject *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PMCachedBitmapObject;
  v4 = -[PMCachedBitmapObject init](&v10, sel_init);
  if (v4)
  {
    v5 = (_QWORD *)operator new();
    v6 = *((_QWORD *)a3 + 1);
    *v5 = *(_QWORD *)a3;
    v5[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v4->_bitmap = v5;
  }
  return v4;
}

- (void)dealloc
{
  void *bitmap;
  uint64_t v4;
  objc_super v5;

  bitmap = self->_bitmap;
  if (bitmap)
  {
    v4 = std::shared_ptr<HGCPUComputeDevice const>::~shared_ptr[abi:ne180100]((uint64_t)bitmap);
    MEMORY[0x1B5E29170](v4, 0x20C40A4A59CD2);
  }
  v5.receiver = self;
  v5.super_class = (Class)PMCachedBitmapObject;
  -[PMCachedBitmapObject dealloc](&v5, sel_dealloc);
}

- (shared_ptr<PCBitmap>)bitmap
{
  _QWORD *v2;
  uint64_t *bitmap;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  shared_ptr<PCBitmap> result;

  bitmap = (uint64_t *)self->_bitmap;
  v5 = *bitmap;
  v4 = bitmap[1];
  *v2 = v5;
  v2[1] = v4;
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (PCBitmap *)self;
  return result;
}

@end
