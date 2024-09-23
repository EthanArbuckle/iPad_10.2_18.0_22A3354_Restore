@implementation UITabBarItemStateAppearance

- (void)_clearOwner
{
  self->_owner = 0;
}

- (void)setIconColor:(UIColor *)iconColor
{
  UIColor *v4;
  void *v5;
  UIColor *v6;
  BOOL v7;
  UIColor *v8;
  _QWORD v9[5];
  UIColor *v10;

  v4 = iconColor;
  -[_UITabBarItemData iconColorForState:](self->_data, "iconColorForState:", self->_state);
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
      v7 = -[UIColor isEqual:](v8, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__UITabBarItemStateAppearance_setIconColor___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);

  }
LABEL_9:

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
  -[_UITabBarItemData titleTextAttributesForState:](self->_data, "titleTextAttributesForState:", self->_state);
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
    v9[2] = __54__UITabBarItemStateAppearance_setTitleTextAttributes___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);

  }
LABEL_11:

}

- (void)_writeToStorage:(id)a3
{
  UITabBarItemAppearance *owner;
  _UITabBarItemData *data;
  void (**v6)(id);
  _UITabBarItemData *v7;
  _UITabBarItemData *v8;

  owner = self->_owner;
  if (owner)
  {
    -[UITabBarItemAppearance _writeToStorage:](owner, "_writeToStorage:", a3);
  }
  else
  {
    data = self->_data;
    v6 = (void (**)(id))a3;
    -[_UIBarAppearanceData writableInstance](data, "writableInstance");
    v7 = (_UITabBarItemData *)objc_claimAutoreleasedReturnValue();
    v8 = self->_data;
    self->_data = v7;

    v6[2](v6);
  }

}

uint64_t __54__UITabBarItemStateAppearance_setTitleTextAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTitleTextAttributes:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __44__UITabBarItemStateAppearance_setIconColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setIconColor:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemEffects, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)_initWithOwner:(id)a3 data:(id)a4 state:(int64_t)a5
{
  UITabBarItemAppearance *v8;
  id v9;
  UITabBarItemStateAppearance *v10;
  UITabBarItemStateAppearance *v11;
  objc_super v13;

  v8 = (UITabBarItemAppearance *)a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITabBarItemStateAppearance;
  v10 = -[UITabBarItemStateAppearance init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_owner = v8;
    objc_storeStrong((id *)&v10->_data, a4);
    v11->_state = a5;
  }

  return v11;
}

- (UITabBarItemStateAppearance)init
{
  -[UITabBarItemStateAppearance doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NSDictionary)titleTextAttributes
{
  return (NSDictionary *)-[_UITabBarItemData titleTextAttributesForState:](self->_data, "titleTextAttributesForState:", self->_state);
}

- (UIOffset)titlePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UITabBarItemData titlePositionAdjustmentForState:](self->_data, "titlePositionAdjustmentForState:", self->_state);
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
  -[_UITabBarItemData titlePositionAdjustmentForState:](self->_data, "titlePositionAdjustmentForState:", self->_state);
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__UITabBarItemStateAppearance_setTitlePositionAdjustment___block_invoke;
    v9[3] = &unk_1E16B4E70;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);
  }
}

uint64_t __58__UITabBarItemStateAppearance_setTitlePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTitlePositionAdjustment:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIColor)iconColor
{
  return (UIColor *)-[_UITabBarItemData iconColorForState:](self->_data, "iconColorForState:", self->_state);
}

- (NSDictionary)badgeTextAttributes
{
  return (NSDictionary *)-[_UITabBarItemData badgeTextAttributesForState:](self->_data, "badgeTextAttributesForState:", self->_state);
}

- (void)setBadgeTextAttributes:(NSDictionary *)badgeTextAttributes
{
  NSDictionary *v4;
  void *v5;
  NSDictionary *v6;
  char v7;
  NSDictionary *v8;
  _QWORD v9[5];
  NSDictionary *v10;

  v4 = badgeTextAttributes;
  if (!-[NSDictionary count](v4, "count"))
  {

    v4 = 0;
  }
  -[_UITabBarItemData badgeTextAttributesForState:](self->_data, "badgeTextAttributesForState:", self->_state);
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
    v9[2] = __54__UITabBarItemStateAppearance_setBadgeTextAttributes___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);

  }
LABEL_11:

}

uint64_t __54__UITabBarItemStateAppearance_setBadgeTextAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setBadgeTextAttributes:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (UIOffset)badgeTitlePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UITabBarItemData badgeTitlePositionAdjustmentForState:](self->_data, "badgeTitlePositionAdjustmentForState:", self->_state);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setBadgeTitlePositionAdjustment:(UIOffset)badgeTitlePositionAdjustment
{
  double vertical;
  double horizontal;
  double v6;
  double v7;
  _QWORD v9[7];

  vertical = badgeTitlePositionAdjustment.vertical;
  horizontal = badgeTitlePositionAdjustment.horizontal;
  -[_UITabBarItemData badgeTitlePositionAdjustmentForState:](self->_data, "badgeTitlePositionAdjustmentForState:", self->_state);
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__UITabBarItemStateAppearance_setBadgeTitlePositionAdjustment___block_invoke;
    v9[3] = &unk_1E16B4E70;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);
  }
}

uint64_t __63__UITabBarItemStateAppearance_setBadgeTitlePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setBadgeTitlePositionAdjustment:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIColor)badgeBackgroundColor
{
  return (UIColor *)-[_UITabBarItemData badgeBackgroundColorForState:](self->_data, "badgeBackgroundColorForState:", self->_state);
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor
{
  UIColor *v4;
  void *v5;
  UIColor *v6;
  BOOL v7;
  UIColor *v8;
  _QWORD v9[5];
  UIColor *v10;

  v4 = badgeBackgroundColor;
  -[_UITabBarItemData badgeBackgroundColorForState:](self->_data, "badgeBackgroundColorForState:", self->_state);
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
      v7 = -[UIColor isEqual:](v8, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__UITabBarItemStateAppearance_setBadgeBackgroundColor___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v8;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);

  }
LABEL_9:

}

uint64_t __55__UITabBarItemStateAppearance_setBadgeBackgroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setBadgeBackgroundColor:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (UIOffset)badgePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UITabBarItemData badgePositionAdjustmentForState:](self->_data, "badgePositionAdjustmentForState:", self->_state);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setBadgePositionAdjustment:(UIOffset)badgePositionAdjustment
{
  double vertical;
  double horizontal;
  double v6;
  double v7;
  _QWORD v9[7];

  vertical = badgePositionAdjustment.vertical;
  horizontal = badgePositionAdjustment.horizontal;
  -[_UITabBarItemData badgePositionAdjustmentForState:](self->_data, "badgePositionAdjustmentForState:", self->_state);
  if (horizontal != v7 || vertical != v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__UITabBarItemStateAppearance_setBadgePositionAdjustment___block_invoke;
    v9[3] = &unk_1E16B4E70;
    v9[4] = self;
    *(double *)&v9[5] = horizontal;
    *(double *)&v9[6] = vertical;
    -[UITabBarItemStateAppearance _writeToStorage:](self, "_writeToStorage:", v9);
  }
}

uint64_t __58__UITabBarItemStateAppearance_setBadgePositionAdjustment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setBadgePositionAdjustment:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (_UITabBarItemData)_data
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
