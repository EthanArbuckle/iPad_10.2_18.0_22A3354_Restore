@implementation PXGSpriteMetadataStore

- (const)resizableCapInsets
{
  return self->_resizableCapInsets;
}

- (unsigned)numberOfResizableCapInsets
{
  return self->_numberOfResizableCapInsets;
}

- (unsigned)addResizableCapInsets:(id)a3
{
  float var3;
  float var2;
  float var1;
  float var0;
  uint64_t numberOfResizableCapInsets;
  unsigned int resizableCapInsetsCapacity;
  $C28CD4A45FD07A4F97CC9D5F91F25271 *v10;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  LODWORD(numberOfResizableCapInsets) = -[PXGSpriteMetadataStore _indexOfResizableCapInsets:](self, "_indexOfResizableCapInsets:");
  if ((_DWORD)numberOfResizableCapInsets == 0xFFFF)
  {
    numberOfResizableCapInsets = self->_numberOfResizableCapInsets;
    self->_numberOfResizableCapInsets = numberOfResizableCapInsets + 1;
    resizableCapInsetsCapacity = self->_resizableCapInsetsCapacity;
    if (resizableCapInsetsCapacity < (unsigned __int16)(numberOfResizableCapInsets + 1))
    {
      if (self->_resizableCapInsetsCapacity)
      {
        do
          LOWORD(resizableCapInsetsCapacity) = 2 * resizableCapInsetsCapacity;
        while ((resizableCapInsetsCapacity & 0xFFFE) < (unsigned __int16)(numberOfResizableCapInsets + 1));
      }
      else
      {
        LOWORD(resizableCapInsetsCapacity) = numberOfResizableCapInsets + 1;
      }
      self->_resizableCapInsetsCapacity = resizableCapInsetsCapacity;
      _PXGArrayResize();
    }
    v10 = &self->_resizableCapInsets[numberOfResizableCapInsets];
    v10->var0 = var0;
    v10->var1 = var1;
    v10->var2 = var2;
    v10->var3 = var3;
  }
  return numberOfResizableCapInsets;
}

- (unsigned)_indexOfResizableCapInsets:(id)a3
{
  uint64_t v3;
  float *p_var2;
  BOOL v5;
  BOOL v6;

  if (self->_numberOfResizableCapInsets)
  {
    v3 = 0;
    p_var2 = &self->_resizableCapInsets->var2;
    while (1)
    {
      v5 = a3.var0 == *(p_var2 - 2) && a3.var1 == *(p_var2 - 1);
      v6 = v5 && a3.var2 == *p_var2;
      if (v6 && a3.var3 == p_var2[1])
        break;
      ++v3;
      p_var2 += 4;
      if (self->_numberOfResizableCapInsets == v3)
        goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
    LOWORD(v3) = -1;
  }
  return v3;
}

- (PXGSpriteMetadataStore)init
{
  PXGSpriteMetadataStore *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  PXGSpriteMetadataStore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGSpriteMetadataStore;
  v2 = -[PXGSpriteMetadataStore init](&v9, sel_init);
  v7 = v2;
  if (v2)
  {
    LODWORD(v3) = *(_DWORD *)off_1E50B8290;
    LODWORD(v4) = *((_DWORD *)off_1E50B8290 + 1);
    LODWORD(v5) = *((_DWORD *)off_1E50B8290 + 2);
    LODWORD(v6) = *((_DWORD *)off_1E50B8290 + 3);
    -[PXGSpriteMetadataStore addResizableCapInsets:](v2, "addResizableCapInsets:", v3, v4, v5, v6);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_resizableCapInsets);
  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteMetadataStore;
  -[PXGSpriteMetadataStore dealloc](&v3, sel_dealloc);
}

@end
