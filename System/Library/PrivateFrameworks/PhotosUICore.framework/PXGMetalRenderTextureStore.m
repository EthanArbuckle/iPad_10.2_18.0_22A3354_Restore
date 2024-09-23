@implementation PXGMetalRenderTextureStore

uint64_t __43__PXGMetalRenderTextureStore__sortIfNeeded__block_invoke()
{
  return PXFloatCompare();
}

- (void)addTexture:(id *)a3
{
  int64_t capacity;
  int64_t count;
  int64_t v7;
  _OWORD *v8;
  __int128 v9;
  _NSRange var2;
  __int128 v11;

  count = self->_count;
  capacity = self->_capacity;
  if (count >= capacity)
  {
    if (capacity)
      v7 = 2 * capacity;
    else
      v7 = 16;
    self->_capacity = v7;
    _PXGArrayResize();
  }
  v8 = (_OWORD *)((char *)self->_textures + 64 * count);
  v9 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v11 = *(_OWORD *)&a3[1].var0;
  v8[2] = *(_OWORD *)&a3->var3;
  v8[3] = v11;
  *v8 = v9;
  v8[1] = var2;
  self->_count = count + 1;
  self->_sorted = 0;
}

- (void)removeAllTextures
{
  self->_count = 0;
  self->_sorted = 0;
}

- (void)drawWithOrder:(unint64_t)a3 enumerationBlock:(id)a4
{
  $64EAD1AD0E979F44103B7C42BCA22050 *textures;
  int64_t count;
  void (**v8)(_QWORD, _QWORD);
  unint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  -[PXGMetalRenderTextureStore _sortIfNeeded](self, "_sortIfNeeded");
  textures = self->_textures;
  count = self->_count;
  if (a3 == 1)
  {
    v8 = (void (**)(_QWORD, _QWORD))v11;
    if (count >= 1)
    {
      do
      {
        ((void (**)(id, $64EAD1AD0E979F44103B7C42BCA22050 *))v8)[2](v11, textures);
        v8 = (void (**)(_QWORD, _QWORD))v11;
        textures = ($64EAD1AD0E979F44103B7C42BCA22050 *)((char *)textures + 64);
        --count;
      }
      while (count);
    }
  }
  else
  {
    v8 = (void (**)(_QWORD, _QWORD))v11;
    if (count >= 1)
    {
      v9 = count + 1;
      v10 = (uint64_t)&textures[-1] + 64 * count - 16;
      do
      {
        ((void (**)(id, uint64_t))v8)[2](v11, v10);
        v8 = (void (**)(_QWORD, _QWORD))v11;
        --v9;
        v10 -= 64;
      }
      while (v9 > 1);
    }
  }

}

- (void)_sortIfNeeded
{
  if (!self->_sorted)
  {
    self->_sorted = 1;
    qsort_b(self->_textures, self->_count, 0x40uLL, &__block_literal_global_292258);
  }
}

- (PXGMetalRenderTextureStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderTextureStore;
  return -[PXGMetalRenderTextureStore init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_textures);
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderTextureStore;
  -[PXGMetalRenderTextureStore dealloc](&v3, sel_dealloc);
}

- (void)prepareForRender
{
  int64_t count;
  _BYTE *v3;

  count = self->_count;
  if (count >= 1)
  {
    v3 = (char *)&self->_textures[1].var1 + 6;
    do
    {
      *v3 = 0;
      v3 += 64;
      --count;
    }
    while (count);
  }
}

@end
