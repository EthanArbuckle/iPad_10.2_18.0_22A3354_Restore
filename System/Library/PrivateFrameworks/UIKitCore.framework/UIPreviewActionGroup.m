@implementation UIPreviewActionGroup

+ (UIPreviewActionGroup)actionGroupWithTitle:(NSString *)title style:(UIPreviewActionStyle)style actions:(NSArray *)actions
{
  NSArray *v8;
  NSString *v9;
  id v10;

  v8 = actions;
  v9 = title;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setTitle:", v9);

  objc_msgSend(v10, "setStyle:", style);
  objc_msgSend(v10, "_setActions:", v8);

  return (UIPreviewActionGroup *)v10;
}

+ (id)_actionGroupWithTitle:(id)a3 style:(int64_t)a4 color:(id)a5 actions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(v13, "setTitle:", v12);

  objc_msgSend(v13, "setStyle:", a4);
  objc_msgSend(v13, "_setColor:", v11);

  objc_msgSend(v13, "_setActions:", v10);
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIPreviewActionGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setStyle:", -[UIPreviewActionGroup style](self, "style"));
  -[UIPreviewActionGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  -[UIPreviewActionGroup _color](self, "_color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setColor:", v7);

  -[UIPreviewActionGroup _actions](self, "_actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setActions:", v8);

  -[UIPreviewActionGroup image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v9);

  return v4;
}

- (id)_effectiveColor
{
  void *v3;

  -[UIPreviewActionGroup _color](self, "_color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UIPreviewActionGroup style](self, "style") == 2)
    {
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_effectiveImage
{
  void *v3;

  -[UIPreviewActionGroup image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UIPreviewActionGroup style](self, "style") == 1)
    {
      +[UIPreviewAction _checkmarkImage](UIPreviewAction, "_checkmarkImage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (id)_actionGroupWithPreviewMenuItemWithSubactions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v5, "setStyle:", objc_msgSend(v4, "style"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v4;
  objc_msgSend(v4, "_subitems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "_subitems");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14
          && (v15 = (void *)v14,
              objc_msgSend(v13, "_subitems"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "count"),
              v16,
              v15,
              v17))
        {
          +[UIPreviewActionGroup _actionGroupWithPreviewMenuItemWithSubactions:](UIPreviewActionGroup, "_actionGroupWithPreviewMenuItemWithSubactions:", v13);
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[UIPreviewAction _actionWithPreviewMenuItem:](UIPreviewAction, "_actionWithPreviewMenuItem:", v13);
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v19 = (void *)v18;
        objc_msgSend(v7, "addObject:", v18);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setActions:", v20);

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)_color
{
  return self->_color;
}

- (void)_setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)_actions
{
  return self->_actions;
}

- (void)_setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
