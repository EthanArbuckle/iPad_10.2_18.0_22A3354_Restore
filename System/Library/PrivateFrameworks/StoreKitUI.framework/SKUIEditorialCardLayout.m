@implementation SKUIEditorialCardLayout

- (SKUIEditorialCardLayout)initWithCard:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  SKUIEditorialCardLayout *v10;
  NSMutableArray *v11;
  NSMutableArray *allLockups;
  id v13;
  SKUIEditorialCardLayout *v14;
  uint64_t v15;
  SKUILockupViewElement *primaryLockup;
  double v17;
  CGFloat v18;
  float v19;
  _QWORD v21[4];
  id v22;
  SKUIEditorialCardLayout *v23;
  _QWORD *v24;
  _QWORD v25[4];
  objc_super v26;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialCardLayout initWithCard:width:context:].cold.1();
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIEditorialCardLayout;
  v10 = -[SKUIEditorialCardLayout init](&v26, sel_init);
  if (v10)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allLockups = v10->_allLockups;
    v10->_allLockups = v11;

    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__SKUIEditorialCardLayout_initWithCard_width_context___block_invoke;
    v21[3] = &unk_1E73A3C78;
    v13 = v9;
    v22 = v13;
    v24 = v25;
    v14 = v10;
    v23 = v14;
    objc_msgSend(v8, "enumerateChildrenUsingBlock:", v21);
    v15 = -[NSMutableArray count](v10->_allLockups, "count");
    primaryLockup = v14->_primaryLockup;
    if (primaryLockup)
    {
      +[SKUIVerticalLockupView preferredSizeForViewElement:context:](SKUIVerticalLockupView, "preferredSizeForViewElement:context:", primaryLockup, v13);
      v14->_primaryLockupSize.width = v17;
      v14->_primaryLockupSize.height = v18;
      a4 = a4 - (v17 + 15.0);
      --v15;
    }
    if (v15 >= 1)
    {
      v19 = (a4 + (double)(v15 - 1) * -15.0) / (double)v15;
      v14->_secondaryLockupWidth = floorf(v19);
    }

    _Block_object_dispose(v25, 8);
  }

  return v10;
}

void __54__SKUIEditorialCardLayout_initWithCard_width_context___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "elementType") == 66)
  {
    objc_msgSend(v10, "firstChildForElementType:", 49);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstChildForElementType:", 152);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = v4;
    if (v4 || (v7 = (void *)v5) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "sizeForViewElement:width:", v7, 0.0);
      if (v8 > 0.00000011920929)
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        if (v8 > *(double *)(v9 + 24))
        {
          *(double *)(v9 + 24) = v8;
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), a2);
        }
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v10);

  }
}

- (NSArray)allLockups
{
  return &self->_allLockups->super;
}

- (SKUILockupViewElement)primaryLockup
{
  return self->_primaryLockup;
}

- (CGSize)primaryLockupSize
{
  double width;
  double height;
  CGSize result;

  width = self->_primaryLockupSize.width;
  height = self->_primaryLockupSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)secondaryLockupWidth
{
  return self->_secondaryLockupWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLockup, 0);
  objc_storeStrong((id *)&self->_allLockups, 0);
}

- (void)initWithCard:width:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorialCardLayout initWithCard:width:context:]";
}

@end
