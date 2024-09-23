@implementation TUIRatingsBox

- (TUIRatingsBox)init
{
  TUIRatingsBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIRatingsBox;
  result = -[TUIStatefulElementBox init](&v3, "init");
  if (result)
    result->super.super.super._storage._data = TUIRatingsBoxStorageDataset | 1;
  return result;
}

- (void)setRating:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super.super.super._storage;
  v4 = a3;
  if (v4 == 0.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super.super._storage, 0x25u);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x25u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super.super._storage, 0x25u, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)rating
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super.super._storage, 0x25u);
  if (v2)
    return *v2;
  else
    return 0.0;
}

- (void)setSize:(unint64_t)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->super.super.super._flags + 6);
  v4 = (*(_DWORD *)&self->super.super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super.super._flags
                                                                         + 2) | (v3 << 16)) << 32)) & 0xFFFFFFF3FFFFFFFFLL | ((a3 & 3) << 34);
  *(_DWORD *)&self->super.super.super._flags = self->super.super.super._flags;
  *((_BYTE *)&self->super.super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super.super._flags + 2) = WORD2(v4);
}

- (unint64_t)size
{
  return ((unint64_t)*((unsigned __int16 *)&self->super.super.super._flags + 2) >> 2) & 3;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIRatingsBoxLayout, a2);
}

+ (unint64_t)sizeFromWidth:(id *)a3
{
  double v3;
  unint64_t result;
  double v5;
  double v6;

  v3 = *(float *)&a3;
  +[TUIRatingsBox imageSizeForSize:](TUIRatingsBox, "imageSizeForSize:", 0);
  result = 0;
  if (v5 < v3)
  {
    +[TUIRatingsBox imageSizeForSize:](TUIRatingsBox, "imageSizeForSize:", 1);
    if (v6 >= v3)
      return 1;
    else
      return 2;
  }
  return result;
}

+ (double)spacingForSize:(unint64_t)a3
{
  double result;

  result = 4.0;
  if (a3 == 1)
    result = 9.0;
  if (a3 == 2)
    return 13.0;
  return result;
}

+ (CGSize)starSizeForSize:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 12.0;
  if (a3 == 1)
    v3 = 24.0;
  if (a3 == 2)
    v3 = 36.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)imageSizeForSize:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[TUIRatingsBox starSizeForSize:](TUIRatingsBox, "starSizeForSize:");
  v5 = v4;
  v7 = v6 * 5.0;
  +[TUIRatingsBox spacingForSize:](TUIRatingsBox, "spacingForSize:", a3);
  v9 = v7 + v8 * 4.0;
  v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (double)spacingForSize:(unint64_t)a3 layoutSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a1, "spacingForSize:");
  v9 = v8;
  objc_msgSend(a1, "imageSizeForSize:", a3);
  v11 = width / v10;
  v13 = height / v12;
  if (v11 >= v13)
    v11 = v13;
  return v9 * v11;
}

+ (CGSize)starSizeForSize:(unint64_t)a3 layoutSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a1, "starSizeForSize:");
  v9 = v8;
  v11 = v10;
  objc_msgSend(a1, "imageSizeForSize:", a3);
  v13 = width / v12;
  v15 = height / v14;
  if (v13 < v15)
    v15 = v13;
  v16 = v9 * v15;
  v17 = v11 * v15;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (id)foregroundImageName
{
  return objc_msgSend(a1, "starRatingImageNameFromKind:", 2);
}

+ (id)starRatingImageNameFromKind:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", off_23E8E0[a3]);
}

+ (id)starRatingImage:(unint64_t)a3 size:(unint64_t)a4 fromCache:(id)a5 withScale:(double)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;

  v10 = a5;
  v12 = objc_msgSend((id)objc_opt_class(a1, v11), "starRatingImageNameFromKind:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend((id)objc_opt_class(a1, v14), "starSizeForSize:", a4);
  v16 = v15;
  if (UIAccessibilityIsBoldTextEnabled())
    v17 = 7;
  else
    v17 = 0;
  LOBYTE(v21) = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:", v13, v17, 0, 0, 0, 0, v16, a6, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, v21));
  v19 = objc_msgSend(v18, "newImageWithoutContentInsets");

  return v19;
}

+ (unint64_t)backgroundKindFromString:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("solid")))
    return 2;
  else
    return 0;
}

@end
