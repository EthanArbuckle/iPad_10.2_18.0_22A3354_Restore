@implementation UIPreviewMenuItem

+ (id)itemWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setStyle:", a4);
  objc_msgSend(v10, "setTitle:", v9);

  objc_msgSend(v10, "setHandler:", v8);
  return v10;
}

+ (id)itemWithTitle:(id)a3 style:(int64_t)a4 items:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setStyle:", a4);
  objc_msgSend(v10, "setTitle:", v9);

  objc_msgSend(v10, "_setSubitems:", v8);
  return v10;
}

+ (id)_itemWithTitle:(id)a3 style:(int64_t)a4 image:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(v13, "setStyle:", a4);
  objc_msgSend(v13, "setTitle:", v12);

  objc_msgSend(v13, "setHandler:", v10);
  objc_msgSend(v13, "setImage:", v11);

  return v13;
}

+ (id)_itemWithTitle:(id)a3 color:(id)a4 image:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setTitle:", v13);

  objc_msgSend(v14, "setStyle:", 0);
  objc_msgSend(v14, "setHandler:", v10);

  objc_msgSend(v14, "_setColor:", v12);
  objc_msgSend(v14, "setImage:", v11);

  return v14;
}

+ (id)itemWithViewControllerPreviewAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__UIPreviewMenuItem_itemWithViewControllerPreviewAction___block_invoke;
  v9[3] = &unk_1E16C1280;
  v10 = v4;
  v6 = v4;
  objc_msgSend(a1, "itemWithTitle:style:handler:", v5, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__UIPreviewMenuItem_itemWithViewControllerPreviewAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, *(_QWORD *)(a1 + 32), v6);

  }
}

- (void)setStyle:(int64_t)a3
{
  id v5;

  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 2)
    {
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPreviewMenuItem _setColor:](self, "_setColor:");
    }
    else
    {
      -[UIPreviewMenuItem _setColor:](self, "_setColor:", 0);
      if (a3 != 1)
        return;
      _UIImageWithName(CFSTR("UIPreviewMenuItemCheckmark.png"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPreviewMenuItem setImage:](self, "setImage:");
    }

  }
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
  -[UIPreviewMenuItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setStyle:", -[UIPreviewMenuItem style](self, "style"));
  -[UIPreviewMenuItem handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandler:", v6);

  -[UIPreviewMenuItem identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v7);

  -[UIPreviewMenuItem _color](self, "_color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setColor:", v8);

  -[UIPreviewMenuItem _subitems](self, "_subitems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSubitems:", v9);

  return v4;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)_subitems
{
  return self->__subitems;
}

- (void)_setSubitems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)_color
{
  return self->_color;
}

- (void)_setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->__subitems, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
