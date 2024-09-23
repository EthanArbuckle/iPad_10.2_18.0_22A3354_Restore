@implementation TUIKey

- (NSString)representedString
{
  return (NSString *)-[UIKBTree representedString](self->_backingTree, "representedString");
}

- (void)setPaddedFrame:(CGRect)a3
{
  -[UIKBTree setPaddedFrame:](self->_backingTree, "setPaddedFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setFrame:(CGRect)a3
{
  -[UIKBTree setFrame:](self->_backingTree, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)paddedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBTree paddedFrame](self->_backingTree, "paddedFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBTree frame](self->_backingTree, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setKeyShape:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIKBTree shape](self->_backingTree, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
    -[UIKBTree setShape:](self->_backingTree, "setShape:", v6);

}

- (UIKBShape)keyShape
{
  return (UIKBShape *)-[UIKBTree shape](self->_backingTree, "shape");
}

- (id)stringFromShape:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E24FB090[a3];
}

- (id)stringFromLayoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return CFSTR("Unknown");
  else
    return off_1E24FB0A8[a3 - 2];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUIKey stringFromShape:](self, "stringFromShape:", -[TUIKey layoutShape](self, "layoutShape"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKey stringFromLayoutType:](self, "stringFromLayoutType:", -[TUIKey layoutType](self, "layoutType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKey multiplier](self, "multiplier");
  v8 = v7;
  -[TUIKey displayString](self, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; shape = %@; type = %@; multiplier = %0.2f; display = %@"),
    v4,
    self,
    v5,
    v6,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIKBTree)backingTree
{
  return self->_backingTree;
}

- (void)setBackingTree:(id)a3
{
  objc_storeStrong((id *)&self->_backingTree, a3);
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (void)setKeyplane:(id)a3
{
  objc_storeStrong((id *)&self->_keyplane, a3);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutShape
{
  return self->_layoutShape;
}

- (void)setLayoutShape:(int64_t)a3
{
  self->_layoutShape = a3;
}

- (BOOL)inGridLayout
{
  return self->_inGridLayout;
}

- (void)setInGridLayout:(BOOL)a3
{
  self->_inGridLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_backingTree, 0);
}

+ (id)keyFromKBTree:(id)a3
{
  id v3;
  TUIKey *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(TUIKey);
  -[TUIKey setLayoutType:](v4, "setLayoutType:", -1);
  -[TUIKey setLayoutShape:](v4, "setLayoutShape:", 0);
  -[TUIKey setMultiplier:](v4, "setMultiplier:", 0.0);
  -[TUIKey setBackingTree:](v4, "setBackingTree:", v3);
  objc_msgSend(v3, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKey setDisplayString:](v4, "setDisplayString:", v5);
  return v4;
}

+ (id)keyFromKBTree:(id)a3 layoutType:(int64_t)a4 layoutShape:(int64_t)a5 multiplier:(double)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  +[TUIKey keyFromKBTree:](TUIKey, "keyFromKBTree:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLayoutType:", a4);
  objc_msgSend(v10, "setLayoutShape:", a5);
  objc_msgSend(v10, "setMultiplier:", a6);
  objc_msgSend(v10, "setBackingTree:", v9);
  objc_msgSend(v9, "displayString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDisplayString:", v11);
  return v10;
}

+ (int64_t)layoutTypeForKey:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  int64_t v6;
  void *v8;
  unsigned int v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "displayType");
  v5 = objc_msgSend(v3, "interactionType");
  if (v4 <= 0x35)
  {
    if (((1 << v4) & 0x38000304A4703CLL) != 0)
    {
      v6 = 3;
      goto LABEL_4;
    }
    if (v4 == 25)
    {
      v6 = 4;
      goto LABEL_4;
    }
    if (v4 == 50)
    {
      objc_msgSend(v3, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsString:", CFSTR("Middle"));

      v6 = v9;
      goto LABEL_4;
    }
  }
  v10 = 4;
  if (v5 != 15)
    v10 = 2;
  if (((1 << v5) & 0x26000026E70) != 0)
    v10 = 3;
  if (v5 <= 0x29)
    v6 = v10;
  else
    v6 = 2;
LABEL_4:

  return v6;
}

@end
