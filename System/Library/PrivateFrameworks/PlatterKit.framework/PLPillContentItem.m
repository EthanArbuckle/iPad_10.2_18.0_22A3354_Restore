@implementation PLPillContentItem

- (PLPillContentItem)initWithText:(id)a3
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, a3, 1, 0, 0);
}

- (PLPillContentItem)initWithAttributedText:(id)a3
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, a3, 1, 0, 0);
}

- (PLPillContentItem)initWithText:(id)a3 style:(unint64_t)a4
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, a3, a4, 0, 0);
}

- (PLPillContentItem)initWithAttributedText:(id)a3 style:(unint64_t)a4
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, a3, a4, 0, 0);
}

- (PLPillContentItem)initWithAccessoryView:(id)a3
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, &stru_1E91D3B40, 1, a3, 0);
}

- (PLPillContentItem)initWithText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, a3, a4, a5, 0);
}

- (PLPillContentItem)initWithAttributedText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:](self, "_initWithIdentifier:text:style:accessoryView:solo:", 0, a3, a4, a5, 0);
}

- (id)_initWithIdentifier:(id)a3 text:(id)a4 style:(unint64_t)a5 accessoryView:(id)a6 solo:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  PLPillContentItem *v15;
  uint64_t v16;
  void *identifier;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  id text;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PLPillContentItem;
  v15 = -[PLPillContentItem init](&v23, sel_init);
  if (v15)
  {
    if (v12)
    {
      v16 = objc_msgSend(v12, "copy");
      identifier = v15->_identifier;
      v15->_identifier = (NSString *)v16;
    }
    else
    {
      identifier = (void *)objc_opt_new();
      objc_msgSend(identifier, "UUIDString");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v15->_identifier;
      v15->_identifier = (NSString *)v18;

    }
    v20 = objc_msgSend(v13, "copy");
    text = v15->_text;
    v15->_text = (id)v20;

    v15->_style = a5;
    objc_storeStrong((id *)&v15->_accessoryView, a6);
    v15->_solo = a7;
  }

  return v15;
}

- (NSString)text
{
  id text;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  text = self->_text;
  v3 = objc_opt_class();
  v4 = text;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSAttributedString)attributedText
{
  id text;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  text = self->_text;
  v3 = objc_opt_class();
  v4 = text;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return (NSAttributedString *)v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_identifier);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_style);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_accessoryView);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_solo);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t style;
  UIView *accessoryView;
  UIView *v9;
  BOOL v10;
  int solo;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[PLPillContentItem isLikePillContentItem:](self, "isLikePillContentItem:", v5))
    {
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings() && (style = self->_style, style == objc_msgSend(v5, "style")))
      {
        accessoryView = self->_accessoryView;
        objc_msgSend(v5, "accessoryView");
        v9 = (UIView *)objc_claimAutoreleasedReturnValue();
        if (accessoryView == v9)
        {
          solo = self->_solo;
          v10 = solo == objc_msgSend(v5, "isSolo");
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isLikePillContentItem:(id)a3
{
  NSString *identifier;
  void *v4;

  identifier = self->_identifier;
  objc_msgSend(a3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v4);

  return (char)identifier;
}

- (PLPillContentItem)itemWithText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, v4, self->_style, self->_accessoryView, 0);

  return (PLPillContentItem *)v5;
}

- (PLPillContentItem)itemWithAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, v4, self->_style, self->_accessoryView, 0);

  return (PLPillContentItem *)v5;
}

- (PLPillContentItem)itemWithStyle:(unint64_t)a3
{
  return (PLPillContentItem *)-[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, self->_text, a3, self->_accessoryView, 0);
}

- (PLPillContentItem)itemWithText:(id)a3 style:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, v6, a4, self->_accessoryView, 0);

  return (PLPillContentItem *)v7;
}

- (PLPillContentItem)itemWithAttributedText:(id)a3 style:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, v6, a4, self->_accessoryView, 0);

  return (PLPillContentItem *)v7;
}

- (PLPillContentItem)itemWithText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, v9, a4, v8, 0);

  return (PLPillContentItem *)v10;
}

- (PLPillContentItem)itemWithAttributedText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, v9, a4, v8, 0);

  return (PLPillContentItem *)v10;
}

- (id)debugDescription
{
  return -[PLPillContentItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PLPillContentItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PLPillContentItem *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PLPillContentItem_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E91D3568;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __59__PLPillContentItem_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("identifier"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("text"), 1);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("style"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("accessoryView"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("solo"), 1);
}

- (unint64_t)style
{
  return self->_style;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong(&self->_text, 0);
  objc_destroyWeak((id *)&self->_wrapperView);
}

- (PLPillContentWrapperView)wrapperView
{
  return (PLPillContentWrapperView *)objc_loadWeakRetained((id *)&self->_wrapperView);
}

- (void)setWrapperView:(id)a3
{
  PLPillContentWrapperView **p_wrapperView;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_wrapperView = &self->_wrapperView;
  WeakRetained = objc_loadWeakRetained((id *)p_wrapperView);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_wrapperView, obj);
    v6 = obj;
  }

}

- (BOOL)isSolo
{
  return self->_solo;
}

- (id)soloItem
{
  return -[PLPillContentItem _initWithIdentifier:text:style:accessoryView:solo:]([PLPillContentItem alloc], "_initWithIdentifier:text:style:accessoryView:solo:", self->_identifier, self->_text, self->_style, self->_accessoryView, 1);
}

- (void)updateWithContentItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLPillContentItem wrapperView](self, "wrapperView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithContentItem:", v4);

}

@end
