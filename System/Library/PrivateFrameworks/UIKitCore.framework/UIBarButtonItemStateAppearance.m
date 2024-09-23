@implementation UIBarButtonItemStateAppearance

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)_clearOwner
{
  self->_owner = 0;
}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  NSDictionary *v4;
  void *v5;
  NSDictionary *v6;
  char v7;
  NSDictionary *v8;
  _QWORD v9[5];
  NSDictionary *v10;

  v4 = titleTextAttributes;
  if (!-[NSDictionary count](v4, "count"))
  {

    v4 = 0;
  }
  -[_UIBarButtonItemData titleTextAttributesForState:](self->_data, "titleTextAttributesForState:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v8 == v6)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = -[NSDictionary isEqual:](v8, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__UIBarButtonItemStateAppearance_setTitleTextAttributes___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[UIBarButtonItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);

  }
LABEL_11:

}

- (void)_writeToStorage:(id)a3
{
  UIBarButtonItemAppearance *owner;
  _UIBarButtonItemData *data;
  void (**v6)(id);
  _UIBarButtonItemData *v7;
  _UIBarButtonItemData *v8;

  owner = self->_owner;
  if (owner)
  {
    -[UIBarButtonItemAppearance _writeToStorage:](owner, "_writeToStorage:", a3);
  }
  else
  {
    data = self->_data;
    v6 = (void (**)(id))a3;
    -[_UIBarAppearanceData writableInstance](data, "writableInstance");
    v7 = (_UIBarButtonItemData *)objc_claimAutoreleasedReturnValue();
    v8 = self->_data;
    self->_data = v7;

    v6[2](v6);
  }

}

uint64_t __57__UIBarButtonItemStateAppearance_setTitleTextAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTitleTextAttributes:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)_initWithOwner:(id)a3 data:(id)a4 state:(int64_t)a5
{
  UIBarButtonItemAppearance *v8;
  id v9;
  UIBarButtonItemStateAppearance *v10;
  UIBarButtonItemStateAppearance *v11;
  objc_super v13;

  v8 = (UIBarButtonItemAppearance *)a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIBarButtonItemStateAppearance;
  v10 = -[UIBarButtonItemStateAppearance init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_owner = v8;
    objc_storeStrong((id *)&v10->_data, a4);
    v11->_state = a5;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemEffects, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (UIBarButtonItemStateAppearance)init
{
  -[UIBarButtonItemStateAppearance doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NSDictionary)titleTextAttributes
{
  return (NSDictionary *)-[_UIBarButtonItemData titleTextAttributesForState:](self->_data, "titleTextAttributesForState:", self->_state);
}

- (UIOffset)titlePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UIBarButtonItemData titlePositionAdjustmentForState:](self->_data, "titlePositionAdjustmentForState:", self->_state);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical;
  double horizontal;
  double v6;
  double v7;
  _QWORD v9[7];

  vertical = titlePositionAdjustment.vertical;
  horizontal = titlePositionAdjustment.horizontal;
  -[_UIBarButtonItemData titlePositionAdjustmentForState:](self->_data, "titlePositionAdjustmentForState:", self->_state);
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__UIBarButtonItemStateAppearance_setTitlePositionAdjustment___block_invoke;
    v9[3] = &unk_1E16B4E70;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    -[UIBarButtonItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);
  }
}

uint64_t __61__UIBarButtonItemStateAppearance_setTitlePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTitlePositionAdjustment:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIImage)backgroundImage
{
  return (UIImage *)-[_UIBarButtonItemData backgroundImageForState:](self->_data, "backgroundImageForState:", self->_state);
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  UIImage *v4;
  void *v5;
  UIImage *v6;
  BOOL v7;
  UIImage *v8;
  _QWORD v9[5];
  UIImage *v10;

  v4 = backgroundImage;
  -[_UIBarButtonItemData backgroundImageForState:](self->_data, "backgroundImageForState:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = -[UIImage isEqual:](v8, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__UIBarButtonItemStateAppearance_setBackgroundImage___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[UIBarButtonItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);

  }
LABEL_9:

}

uint64_t __53__UIBarButtonItemStateAppearance_setBackgroundImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setBackgroundImage:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (UIOffset)backgroundImagePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UIBarButtonItemData backgroundImagePositionAdjustmentForState:](self->_data, "backgroundImagePositionAdjustmentForState:", self->_state);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setBackgroundImagePositionAdjustment:(UIOffset)backgroundImagePositionAdjustment
{
  double vertical;
  double horizontal;
  double v6;
  double v7;
  _QWORD v9[7];

  vertical = backgroundImagePositionAdjustment.vertical;
  horizontal = backgroundImagePositionAdjustment.horizontal;
  -[_UIBarButtonItemData backgroundImagePositionAdjustmentForState:](self->_data, "backgroundImagePositionAdjustmentForState:", self->_state);
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__UIBarButtonItemStateAppearance_setBackgroundImagePositionAdjustment___block_invoke;
    v9[3] = &unk_1E16B4E70;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    -[UIBarButtonItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);
  }
}

uint64_t __71__UIBarButtonItemStateAppearance_setBackgroundImagePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setBackgroundImagePositionAdjustment:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (_UIBarButtonItemData)data
{
  return self->_data;
}

- (NSArray)itemEffects
{
  return self->_itemEffects;
}

- (void)setItemEffects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
