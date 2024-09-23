@implementation SKUIItemGridCollectionViewLayout

- (SKUIItemGridCollectionViewLayout)init
{
  SKUIItemGridCollectionViewLayout *v3;
  SKUIItemGridCollectionViewLayout *v4;
  objc_super v6;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemGridCollectionViewLayout init].cold.1();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIItemGridCollectionViewLayout;
  v3 = -[UICollectionViewFlowLayout init](&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 0.0);
  }
  return v4;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int ShouldReverseLayoutDirection;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t numberOfColumns;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  BOOL v23;
  uint64_t v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33 = *MEMORY[0x1E0C80C00];
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v31.receiver = self;
  v31.super_class = (Class)SKUIItemGridCollectionViewLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v31, sel_layoutAttributesForElementsInRect_, x, y, width, height);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "indexPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "item");

        if (((v15 / self->_numberOfColumns) & 1) != 0)
          v16 = 568;
        else
          v16 = 552;
        if (*(Class *)((char *)&self->super.super.super.isa + v16))
        {
          objc_msgSend(v13, "setBackgroundColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setBackgroundColor:", v17);

        }
        numberOfColumns = self->_numberOfColumns;
        v19 = 16;
        if (v15 < numberOfColumns)
          v19 = 8;
        v20 = v15 % numberOfColumns == 0;
        v21 = v15 % numberOfColumns == numberOfColumns - 1;
        if (ShouldReverseLayoutDirection)
          v22 = v21;
        else
          v22 = v20;
        if (ShouldReverseLayoutDirection)
          v21 = v20;
        v23 = !v21;
        v24 = 4;
        if (v23)
          v24 = 2;
        if (v22)
          v24 = 1;
        objc_msgSend(v13, "setPosition:", v19 | v24);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }
  return obj;
}

- (UIColor)evenRowBackgroundColor
{
  return self->_evenColor;
}

- (void)setEvenRowBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (UIColor)oddRowBackgroundColor
{
  return self->_oddColor;
}

- (void)setOddRowBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oddColor, 0);
  objc_storeStrong((id *)&self->_evenColor, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItemGridCollectionViewLayout init]";
}

@end
