@implementation TUIStyledBox

- (TUIStyledBox)init
{
  TUIStyledBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIStyledBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    result->super.super._storage._data = TUIStyledBoxStorageDataset | 1;
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIStyledBoxLayout, a2);
}

- (void)setInsets:(UIEdgeInsets)a3
{
  float top;
  Storage *p_storage;
  float left;
  float bottom;
  float right;
  uint64_t v8;
  float *DataForKey;

  top = a3.top;
  p_storage = &self->super.super._storage;
  left = a3.left;
  bottom = a3.bottom;
  right = a3.right;
  if (TUIInsets32Equal(top, left, bottom, right, 0.0, 0.0, 0.0, 0.0))
  {
    v8 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Fu);
    if (!v8)
      return;
    DataForKey = (float *)v8;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Fu);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x1Fu, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = top;
  DataForKey[1] = left;
  DataForKey[2] = bottom;
  DataForKey[3] = right;
}

- (UIEdgeInsets)insets
{
  uint64_t v2;
  float *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Fu);
  v3 = (float *)&TUIInsets32Zero;
  if (v2)
    v3 = (float *)v2;
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x11u, (objc_object *)a3);
}

- (UIColor)backgroundColor
{
  return (UIColor *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x11u);
}

- (void)setCornerRadius:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super.super._storage;
  v4 = a3;
  if (v4 == 0.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x14u);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x14u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x14u, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)cornerRadius
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x14u);
  if (v2)
    return *v2;
  else
    return 0.0;
}

- (void)setShadowColor:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x1Cu, (objc_object *)a3);
}

- (UIColor)shadowColor
{
  return (UIColor *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Cu);
}

- (void)setShadowOffset:(CGSize)a3
{
  Storage *p_storage;
  float width;
  float height;
  uint64_t v6;
  float *DataForKey;

  p_storage = &self->super.super._storage;
  width = a3.width;
  height = a3.height;
  if (TUISize32Equal(width, height, 0.0, 0.0))
  {
    v6 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Bu);
    if (!v6)
      return;
    DataForKey = (float *)v6;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Bu);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x1Bu, 8uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = width;
  DataForKey[1] = height;
}

- (CGSize)shadowOffset
{
  uint64_t v2;
  float *v3;
  double v4;
  double v5;
  CGSize result;

  v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Bu);
  v3 = (float *)&TUISize32Zero;
  if (v2)
    v3 = (float *)v2;
  v4 = *v3;
  v5 = v3[1];
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setShadowOpacity:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super.super._storage;
  v4 = a3;
  if (v4 == 1.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 7u);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 7u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 7u, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)shadowOpacity
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 7u);
  if (v2)
    return *v2;
  else
    return 1.0;
}

- (void)setBorderColor:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x16u, (objc_object *)a3);
}

- (UIColor)borderColor
{
  return (UIColor *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x16u);
}

- (void)setBlendMode:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 1u, (objc_object *)a3);
}

- (NSString)blendMode
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 1u);
}

- (void)setContinuousCorners:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->super.super._flags + 6);
  v4 = *((_WORD *)&self->super.super._flags + 2);
  v5 = 0x10000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->super.super._flags = *(_DWORD *)&self->super.super._flags & 0xEFFFFFFF | v5;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = v4;
}

- (BOOL)continuousCorners
{
  return ((unint64_t)*(_DWORD *)&self->super.super._flags >> 28) & 1;
}

- (void)setClipsToBounds:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)clipsToBounds
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 4) & 1;
}

- (void)setAllowsGroupBlending:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)allowsGroupBlending
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 5) & 1;
}

- (void)setShadowRadius:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super.super._storage;
  v4 = a3;
  if (v4 == 0.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Au);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Au);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x1Au, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)shadowRadius
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Au);
  if (v2)
    return *v2;
  else
    return 0.0;
}

- (void)setBorderWidth:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super.super._storage;
  v4 = a3;
  if (v4 == 0.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x15u);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x15u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x15u, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)borderWidth
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x15u);
  if (v2)
    return *v2;
  else
    return 0.0;
}

@end
