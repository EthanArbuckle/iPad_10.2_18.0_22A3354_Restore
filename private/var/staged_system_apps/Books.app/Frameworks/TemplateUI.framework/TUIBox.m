@implementation TUIBox

- (Class)dynamicArrayLayoutContainerClass
{
  return (Class)objc_opt_class(TUILayoutContainer, a2);
}

- (Class)dynamicArrayLayoutIterationClass
{
  return (Class)objc_opt_class(TUILayoutContainer, a2);
}

+ (void)initialize
{
  unsigned int *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if ((id)objc_opt_class(TUIBox) == a1)
  {
    if (qword_2CBC20[0] != -1)
      dispatch_once(qword_2CBC20, &stru_243760);
    v2 = (unsigned int *)objc_msgSend((id)qword_2CBC18, "bytes");
    v3 = v2[1];
    if ((_DWORD)v3)
    {
      v4 = (const char *)v2;
      v5 = 0;
      v6 = (char *)(v2 + 2);
      while (strcmp("box", &v4[*(unsigned int *)&v6[v5]]))
      {
        v5 += 4;
        if (4 * v3 == v5)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v7 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + v5]];
LABEL_11:
      v9 = 0;
      TUIBoxStorageDataset = v7;
      while (strcmp("imagebox", &v4[*(unsigned int *)&v6[4 * v9]]))
      {
        if (v3 == ++v9)
        {
          v10 = 0;
          goto LABEL_16;
        }
      }
      v10 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v9]];
LABEL_16:
      v11 = 0;
      TUIImageBoxStorageDataset = v10;
      while (strcmp("vbox", &v4[*(unsigned int *)&v6[4 * v11]]))
      {
        if (v3 == ++v11)
        {
          v12 = 0;
          goto LABEL_21;
        }
      }
      v12 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v11]];
LABEL_21:
      v13 = 0;
      TUIVBoxStorageDataset = v12;
      while (strcmp("progressbox", &v4[*(unsigned int *)&v6[4 * v13]]))
      {
        if (v3 == ++v13)
        {
          v14 = 0;
          goto LABEL_26;
        }
      }
      v14 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v13]];
LABEL_26:
      v15 = 0;
      TUIProgressBoxStorageDataset = v14;
      while (strcmp("statefulelementbox", &v4[*(unsigned int *)&v6[4 * v15]]))
      {
        if (v3 == ++v15)
        {
          v16 = 0;
          goto LABEL_31;
        }
      }
      v16 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v15]];
LABEL_31:
      v17 = 0;
      TUIStatefulElementBoxStorageDataset = v16;
      while (strcmp("ratingsbox", &v4[*(unsigned int *)&v6[4 * v17]]))
      {
        if (v3 == ++v17)
        {
          v18 = 0;
          goto LABEL_36;
        }
      }
      v18 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v17]];
LABEL_36:
      v19 = 0;
      TUIRatingsBoxStorageDataset = v18;
      while (strcmp("styledbox", &v4[*(unsigned int *)&v6[4 * v19]]))
      {
        if (v3 == ++v19)
        {
          v20 = 0;
          goto LABEL_41;
        }
      }
      v20 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v19]];
LABEL_41:
      v21 = 0;
      TUIStyledBoxStorageDataset = v20;
      while (strcmp("wpbox", &v4[*(unsigned int *)&v6[4 * v21]]))
      {
        if (v3 == ++v21)
        {
          v8 = 0;
          goto LABEL_46;
        }
      }
      v8 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v21]];
    }
    else
    {
      v8 = 0;
      TUIBoxStorageDataset = 0;
      TUIImageBoxStorageDataset = 0;
      TUIVBoxStorageDataset = 0;
      TUIProgressBoxStorageDataset = 0;
      TUIStatefulElementBoxStorageDataset = 0;
      TUIRatingsBoxStorageDataset = 0;
      TUIStyledBoxStorageDataset = 0;
    }
LABEL_46:
    TUIWPBoxStorageDataset = v8;
  }
}

- (TUIBox)init
{
  TUIBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    result->_storage._data = TUIBoxStorageDataset | 1;
  return result;
}

- (unint64_t)modelKind
{
  return 1;
}

- (void)appendLayoutModelsToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)width
{
  uint64_t v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v4;

  v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3)
    v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  return *v4;
}

- (void)setWidth:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  Storage *p_storage;
  uint64_t v7;
  _QWORD *DataForKey;

  v4 = v3;
  p_storage = &self->_storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
    if (!v7)
      return;
    DataForKey = (_QWORD *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0);
  }
  else
  {
    DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a3;
  DataForKey[1] = v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)relativeWidth
{
  uint64_t v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v4;

  v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x22u);
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3)
    v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  return *v4;
}

- (void)setRelativeWidth:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  Storage *p_storage;
  uint64_t v7;
  _QWORD *DataForKey;

  v4 = v3;
  p_storage = &self->_storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x22u);
    if (!v7)
      return;
    DataForKey = (_QWORD *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x22u);
  }
  else
  {
    DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x22u, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a3;
  DataForKey[1] = v4;
}

- (BOOL)hasRelativeWidth
{
  return TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x22u) != 0;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)height
{
  uint64_t v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v4;

  v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 8u);
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3)
    v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  return *v4;
}

- (void)setHeight:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  Storage *p_storage;
  uint64_t v7;
  _QWORD *DataForKey;

  v4 = v3;
  p_storage = &self->_storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 8u);
    if (!v7)
      return;
    DataForKey = (_QWORD *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 8u);
  }
  else
  {
    DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 8u, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a3;
  DataForKey[1] = v4;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  float32x2_t *v5;
  float64x2_t v6;

  result = (CGAffineTransform *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x28u);
  v5 = (float32x2_t *)&TUIAffineTransform32Identity;
  if (result)
    v5 = (float32x2_t *)result;
  v6 = vcvtq_f64_f32(v5[1]);
  *(float64x2_t *)&retstr->a = vcvtq_f64_f32(*v5);
  *(float64x2_t *)&retstr->c = v6;
  *(float64x2_t *)&retstr->tx = vcvtq_f64_f32(v5[2]);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  Storage *p_storage;
  float a;
  float b;
  float c;
  float d;
  float tx;
  float ty;
  uint64_t v10;
  float *DataForKey;
  float v12[6];

  p_storage = &self->_storage;
  a = a3->a;
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v12[0] = a;
  v12[1] = b;
  v12[2] = c;
  v12[3] = d;
  v12[4] = tx;
  v12[5] = ty;
  if (TUIAffineTransform32IsIdentity(v12))
  {
    v10 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x28u);
    if (!v10)
      return;
    DataForKey = (float *)v10;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x28u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x28u, 0x18uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a;
  DataForKey[1] = b;
  DataForKey[2] = c;
  DataForKey[3] = d;
  DataForKey[4] = tx;
  DataForKey[5] = ty;
}

- (CGAffineTransform)renderTransform
{
  CGAffineTransform *result;
  float32x2_t *v5;
  float64x2_t v6;

  result = (CGAffineTransform *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x2Au);
  v5 = (float32x2_t *)&TUIAffineTransform32Identity;
  if (result)
    v5 = (float32x2_t *)result;
  v6 = vcvtq_f64_f32(v5[1]);
  *(float64x2_t *)&retstr->a = vcvtq_f64_f32(*v5);
  *(float64x2_t *)&retstr->c = v6;
  *(float64x2_t *)&retstr->tx = vcvtq_f64_f32(v5[2]);
  return result;
}

- (void)setRenderTransform:(CGAffineTransform *)a3
{
  Storage *p_storage;
  float a;
  float b;
  float c;
  float d;
  float tx;
  float ty;
  uint64_t v10;
  float *DataForKey;
  float v12[6];

  p_storage = &self->_storage;
  a = a3->a;
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v12[0] = a;
  v12[1] = b;
  v12[2] = c;
  v12[3] = d;
  v12[4] = tx;
  v12[5] = ty;
  if (TUIAffineTransform32IsIdentity(v12))
  {
    v10 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x2Au);
    if (!v10)
      return;
    DataForKey = (float *)v10;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x2Au);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x2Au, 0x18uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a;
  DataForKey[1] = b;
  DataForKey[2] = c;
  DataForKey[3] = d;
  DataForKey[4] = tx;
  DataForKey[5] = ty;
}

- (int64_t)zIndex
{
  int *v2;

  v2 = (int *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x17u);
  if (v2 && *v2 != 0x7FFFFFFF)
    return *v2;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setZIndex:(int64_t)a3
{
  Storage *p_storage;
  int v4;
  uint64_t v5;
  _DWORD *DataForKey;

  p_storage = &self->_storage;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0x7FFFFFFF;
  else
    v4 = a3;
  if (v4 == 0x7FFFFFFF)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x17u);
    if (!v5)
      return;
    DataForKey = (_DWORD *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x17u);
  }
  else
  {
    DataForKey = (_DWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x17u, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (UIEdgeInsets)renderOutsets
{
  uint64_t v2;
  float *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x1Du);
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

- (void)setRenderOutsets:(UIEdgeInsets)a3
{
  Storage *p_storage;
  float top;
  float left;
  float bottom;
  float right;
  uint64_t v8;
  float *DataForKey;

  p_storage = &self->_storage;
  top = a3.top;
  left = a3.left;
  bottom = a3.bottom;
  right = a3.right;
  if (TUIInsets32Equal(top, left, bottom, right, 0.0, 0.0, 0.0, 0.0))
  {
    v8 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Du);
    if (!v8)
      return;
    DataForKey = (float *)v8;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Du);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x1Du, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = top;
  DataForKey[1] = left;
  DataForKey[2] = bottom;
  DataForKey[3] = right;
}

- (TUIImpressionData)impressionData
{
  return (TUIImpressionData *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x13u);
}

- (void)setImpressionData:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x13u, (objc_object *)a3);
}

- (NSArray)axCustomActions
{
  return (NSArray *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x31u);
}

- (void)setAxCustomActions:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x31u, (objc_object *)a3);
}

- (NSString)refId
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xAu);
}

- (void)setRefId:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0xAu, (objc_object *)a3);
}

- (NSString)refInstance
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x12u);
}

- (void)setRefInstance:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x12u, (objc_object *)a3);
}

- (TUIGridCoord)gridCoord
{
  return (TUIGridCoord *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x30u);
}

- (void)setGridCoord:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x30u, (objc_object *)a3);
}

- (NSString)axLabel
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xEu);
}

- (void)setAxLabel:(id)a3
{
  objc_object *v4;

  v4 = (objc_object *)objc_msgSend(a3, "copy");
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0xEu, v4);

}

- (NSString)axValue
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x1Eu);
}

- (void)setAxValue:(id)a3
{
  objc_object *v4;

  v4 = (objc_object *)objc_msgSend(a3, "copy");
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x1Eu, v4);

}

- (NSString)axHint
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x20u);
}

- (void)setAxHint:(id)a3
{
  objc_object *v4;

  v4 = (objc_object *)objc_msgSend(a3, "copy");
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x20u, v4);

}

- (TUIAnimationGroupCollection)animationGroups
{
  return (TUIAnimationGroupCollection *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x27u);
}

- (void)setAnimationGroups:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x27u, (objc_object *)a3);
}

- (TUIGuides)guides
{
  return (TUIGuides *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 9u);
}

- (void)setGuides:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 9u, (objc_object *)a3);
}

- (unint64_t)role
{
  return *(_DWORD *)&self->_flags & 7;
}

- (void)setRole:(unint64_t)a3
{
  Flags *p_flags;
  int flags;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  *(_DWORD *)p_flags = flags & 0xFFFFFFF8 | a3 & 7;
  LOWORD(flags) = *((_WORD *)p_flags + 2);
  p_flags = (Flags *)((char *)p_flags + 4);
  *((_BYTE *)p_flags + 2) = *((_BYTE *)p_flags + 2);
  *(_WORD *)p_flags = flags;
}

- (BOOL)inheritWidth
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 19) & 1;
}

- (void)setInheritWidth:(BOOL)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;
  int v6;
  int v7;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  v6 = flags;
  v7 = 0x80000;
  if (!a3)
    v7 = 0;
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = v6 & 0xFFF7FFFF | v7;
}

- (BOOL)inheritHeight
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 20) & 1;
}

- (void)setInheritHeight:(BOOL)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;
  int v6;
  int v7;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  v6 = flags;
  v7 = 0x100000;
  if (!a3)
    v7 = 0;
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = v6 & 0xFFEFFFFF | v7;
}

- (unint64_t)layoutDirection
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 3) & 3;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFFFFFE7 | (8 * (a3 & 3));
}

- (unint64_t)renderModelKind
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 5) & 0xF;
}

- (void)setRenderModelKind:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFFFFE1F | (32 * (a3 & 0xF));
}

- (unint64_t)valign
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 9) & 7;
}

- (void)setValign:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFFFF1FF | ((a3 & 7) << 9);
}

- (unint64_t)halign
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 12) & 3;
}

- (void)setHalign:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFFFCFFF | ((a3 & 3) << 12);
}

- (unint64_t)vcompressed
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 14) & 1;
}

- (void)setVcompressed:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFFFBFFF | ((a3 & 1) << 14);
}

- (unint64_t)hcompressed
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 15) & 1;
}

- (void)setHcompressed:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFFF7FFF | ((a3 & 1) << 15);
}

- (unint64_t)liveTransformKind
{
  return *((_WORD *)&self->_flags + 1) & 7;
}

- (void)setLiveTransformKind:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFFF8FFFF | ((a3 & 7) << 16);
}

- (unint64_t)anchorPosition
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 21) & 7;
}

- (void)setAnchorPosition:(unint64_t)a3
{
  Flags *p_flags;
  int flags;
  __int16 v5;

  flags = (int)self->_flags;
  p_flags = &self->_flags;
  v5 = *((_WORD *)p_flags + 2);
  *((_BYTE *)p_flags + 6) = *((_BYTE *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_flags = flags & 0xFF1FFFFF | ((a3 & 7) << 21);
}

- (BOOL)axHasNonDefaultAttributess
{
  char v2;
  Storage *p_storage;
  _QWORD *ObjectForKey;
  _QWORD *v5;
  _QWORD *v6;

  if ((((unint64_t)(*((unsigned __int16 *)&self->_flags + 2) | (*((unsigned __int8 *)&self->_flags + 6) << 16)) << 32) & 0x3FE0000000000) != 0)
    return 1;
  p_storage = &self->_storage;
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xEu);
  if (ObjectForKey)
  {
    v2 = 1;
  }
  else
  {
    v5 = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Eu);
    if (v5)
    {
      v2 = 1;
    }
    else
    {
      v6 = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x20u);
      v2 = v6 != 0;

    }
  }

  return v2;
}

- (void)setAxDisabled:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 512;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFFFDFFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axDisabled
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 9) & 1;
}

- (void)setAXElement:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 1024;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFFFBFFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)isAXElement
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 10) & 1;
}

- (void)setAxTouchContainer:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 2048;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFFF7FFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axTouchContainer
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 11) & 1;
}

- (void)setAxButton:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 4096;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFFEFFFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axButton
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 12) & 1;
}

- (void)setAxImage:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 0x2000;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFFDFFFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axImage
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 13) & 1;
}

- (void)setAxHeading:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 0x4000;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFFBFFFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axHeading
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 14) & 1;
}

- (void)setAxAdjustable:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  int v5;
  unint64_t v6;
  __int16 v7;
  unint64_t v8;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int8 *)p_flags + 6);
  v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  v7 = 0x8000;
  if (!a3)
    v7 = 0;
  v8 = v6 & 0xFFFF7FFFFFFFFFFFLL;
  *((_BYTE *)p_flags + 6) = v5;
  *(_DWORD *)p_flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axAdjustable
{
  return *((unsigned __int16 *)&self->_flags + 2) >> 15;
}

- (void)setAxToggle:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  uint64_t v5;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = *((unsigned __int16 *)p_flags + 2) | (*((unsigned __int8 *)p_flags + 6) << 16);
  *((_WORD *)p_flags + 2) = *((_WORD *)p_flags + 2);
  *(_DWORD *)p_flags = flags;
  *((_BYTE *)p_flags + 6) = (((flags | (unint64_t)(v5 << 32)) & 0xFFFEFFFFFFFFFFFFLL) >> 48) | a3;
}

- (BOOL)axToggle
{
  return *((_BYTE *)&self->_flags + 6) & 1;
}

- (void)setAxStaticText:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  unint64_t v5;
  char v6;
  unint64_t v7;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (*((unsigned __int8 *)p_flags + 6) << 16)) << 32);
  v6 = 2;
  if (!a3)
    v6 = 0;
  v7 = v5 & 0xFFFDFFFFFFFFFFFFLL;
  *((_WORD *)p_flags + 2) = *((_WORD *)p_flags + 2);
  *(_DWORD *)p_flags = v7;
  *((_BYTE *)p_flags + 6) = BYTE6(v7) | v6;
}

- (BOOL)axStaticText
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 1) & 1;
}

- (void)setGrouped:(BOOL)a3
{
  Flags *p_flags;
  unsigned int flags;
  unint64_t v5;
  char v6;
  unint64_t v7;

  flags = self->_flags;
  p_flags = &self->_flags;
  v5 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (*((unsigned __int8 *)p_flags + 6) << 16)) << 32);
  v6 = 8;
  if (!a3)
    v6 = 0;
  v7 = v5 & 0xFFF7FFFFFFFFFFFFLL;
  *((_WORD *)p_flags + 2) = *((_WORD *)p_flags + 2);
  *(_DWORD *)p_flags = v7;
  *((_BYTE *)p_flags + 6) = BYTE6(v7) | v6;
}

- (BOOL)grouped
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 3) & 1;
}

- (Class)layoutClass
{
  return 0;
}

- (void)_compressStorage
{
  TUI::Util::PartialStruct::Storage::compress((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (TUIDynamicArrayWindowing)dynamicArrayWindowingBox
{
  return 0;
}

+ (int64_t)textAlignmentFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB10 == -1)
  {
    if (v3)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  dispatch_once(&qword_2CBB10, &stru_243518);
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB08, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (!v5)
  {
LABEL_7:
    v7 = &dword_4;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v5, "integerValue");
LABEL_8:

  return (int64_t)v7;
}

+ (unint64_t)halignFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB20 != -1)
  {
    dispatch_once(&qword_2CBB20, &stru_243538);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB18, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)valignFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB30 != -1)
  {
    dispatch_once(&qword_2CBB30, &stru_243558);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB28, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)anchorPositionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB40 != -1)
  {
    dispatch_once(&qword_2CBB40, &stru_243578);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB38, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)compressedFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB50 != -1)
  {
    dispatch_once(&qword_2CBB50, &stru_243598);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB48, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)renderModelFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB60 != -1)
  {
    dispatch_once(&qword_2CBB60, &stru_2435B8);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB58, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)triggerStateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB70 != -1)
  {
    dispatch_once(&qword_2CBB70, &stru_2435D8);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB68, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (id)blendModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB80 != -1)
  {
    dispatch_once(&qword_2CBB80, &stru_2435F8);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB78, "objectForKeyedSubscript:", v4));
LABEL_6:

  return v5;
}

+ (unint64_t)interfaceLayoutDirectionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBB90 != -1)
  {
    dispatch_once(&qword_2CBB90, &stru_243618);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB88, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)layoutModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBBA0 != -1)
  {
    dispatch_once(&qword_2CBBA0, &stru_243638);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBB98, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)defaultRole
{
  return 0;
}

+ (unint64_t)roleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBBB0 != -1)
  {
    dispatch_once(&qword_2CBBB0, &stru_243658);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBBA8, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)liveTransformFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBBC0 != -1)
  {
    dispatch_once(&qword_2CBBC0, &stru_243678);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBBB8, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (id)layerContentsGravityFromString:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  NSString *v6;

  v3 = a3;
  if (qword_2CBBD0 != -1)
    dispatch_once(&qword_2CBBD0, &stru_243698);
  v4 = kCAGravityResize;
  if (v3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBBC8, "objectForKeyedSubscript:", v3))) != 0)
  {
    v6 = v5;

    v4 = v6;
  }
  else
  {
    v6 = 0;
  }

  return v4;
}

+ (int64_t)imageRenderingModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBBE0 != -1)
  {
    dispatch_once(&qword_2CBBE0, &stru_2436B8);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBBD8, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "integerValue");

LABEL_6:
  return (int64_t)v6;
}

+ (id)videoGravityFromString:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  NSString *v6;

  v3 = a3;
  if (qword_2CBBF0 != -1)
    dispatch_once(&qword_2CBBF0, &stru_2436D8);
  v4 = AVLayerVideoGravityResizeAspect;
  if (v3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBBE8, "objectForKeyedSubscript:", v3))) != 0)
  {
    v6 = v5;

    v4 = v6;
  }
  else
  {
    v6 = 0;
  }

  return v4;
}

+ (unint64_t)axisFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBC00 != -1)
  {
    dispatch_once(&qword_2CBC00, &stru_2436F8);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBBF8, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)userInterfaceStyleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CBC10 != -1)
  {
    dispatch_once(&qword_2CBC10, &stru_243718);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBC08, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  unint64_t v7;
  NSString *v8;
  void *v9;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v10;
  unint64_t v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  id v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[TUIBox width](self, "width");
  v8 = TUILengthDescription((uint64_t)v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[TUIBox height](self, "height");
  v12 = TUILengthDescription((uint64_t)v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p w=%@ h=%@ anchor-position=%lu"), v5, self, v9, v13, -[TUIBox anchorPosition](self, "anchorPosition")));

  -[TUIBox appendBoxDescription:](self, "appendBoxDescription:", v14);
  v15 = TUIProtocolCast(&OBJC_PROTOCOL___TUIModelContaining, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_opt_new(NSMutableArray);
  objc_msgSend(v16, "appendContainedChildrenToArray:", v17);
  if (-[NSMutableArray count](v17, "count"))
  {
    objc_msgSend(v14, "appendFormat:", CFSTR(" children=["));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v17;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v25;
      v21 = "";
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v14, "appendFormat:", CFSTR("%s%@"), v21, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v22));
          v22 = (char *)v22 + 1;
          v21 = ", ";
        }
        while (v19 != v22);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v21 = ", ";
      }
      while (v19);
    }

    objc_msgSend(v14, "appendFormat:", CFSTR("]"));
  }
  objc_msgSend(v14, "appendFormat:", CFSTR(">"));

  return (NSString *)v14;
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (void)setAxIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  TUI::Util::PartialStruct::Storage::~Storage((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (id).cxx_construct
{
  self->_storage._data = 0;
  TUI::Box::Flags::Flags((unsigned int *)&self->_flags);
  return self;
}

@end
