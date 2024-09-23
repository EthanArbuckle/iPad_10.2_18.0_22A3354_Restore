@implementation TTKKey

- (TTKKey)initWithUIKBTree:(id)a3 layoutUtils:(id)a4
{
  id v6;
  TTKKey *v7;
  TTKKey *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TTKKey;
  v7 = -[TTKKey init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_key, a3);

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[TTKKey string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree frame](self->_key, "frame");
  v7 = v6;
  -[UIKBTree frame](self->_key, "frame");
  v9 = v8;
  -[UIKBTree frame](self->_key, "frame");
  v11 = v10;
  -[UIKBTree frame](self->_key, "frame");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@' @ {{%g, %g}, {%g, %g}}>"), v4, self, v5, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)string
{
  void *v3;
  ACTKeyboardLayoutUtils *layoutUtils;
  id v5;
  void *v6;

  -[UIKBTree representedString](self->_key, "representedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  layoutUtils = self->_layoutUtils;
  if (layoutUtils)
  {
    -[ACTKeyboardLayoutUtils representedStringForKey:shifted:](layoutUtils, "representedStringForKey:shifted:", self->_key, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return (NSString *)v6;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBTree frame](self->_key, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)center
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[UIKBTree frame](self->_key, "frame");
  v4 = v3;
  -[UIKBTree frame](self->_key, "frame");
  v6 = v4 + v5 * 0.5;
  -[UIKBTree frame](self->_key, "frame");
  v8 = v7;
  -[UIKBTree frame](self->_key, "frame");
  v10 = v8 + v9 * 0.5;
  v11 = v6;
  result.y = v10;
  result.x = v11;
  return result;
}

- (signed)keyCode
{
  return self->_keyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutUtils, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
