@implementation PSSegmentTableCell

- (PSSegmentTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSSegmentTableCell *v5;
  PSSegmentTableCell *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSSegmentTableCell;
  v5 = -[PSControlTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSControlTableCell control](v5, "control");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAutosizeText:", 1);

    -[PSSegmentTableCell textLabel](v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  -[PSControlTableCell control](self, "control");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSControlTableCell control](self, "control");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "selectedSegmentIndex");

  objc_msgSend(v5, "removeAllSegments");
  objc_msgSend(v4, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v7, "objectAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (void *)v13;
      else
        v15 = v12;
      objc_msgSend(v5, "insertSegmentWithTitle:atIndex:animated:", v15, objc_msgSend(v5, "numberOfSegments"), 0);

    }
  }
  objc_msgSend(v4, "values");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSegmentTableCell setValues:titleDictionary:](self, "setValues:titleDictionary:", v16, v17);

  objc_msgSend(v5, "setSelectedSegmentIndex:", v18);
  v19.receiver = self;
  v19.super_class = (Class)PSSegmentTableCell;
  -[PSControlTableCell refreshCellContentsWithSpecifier:](&v19, sel_refreshCellContentsWithSpecifier_, v4);

}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSSegmentTableCell;
  -[PSTableCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (id)newControl
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEA990]);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", &stru_1E4A69238);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithItems:", v3);

  return v4;
}

- (id)titleLabel
{
  return 0;
}

- (BOOL)canReload
{
  int v3;

  v3 = -[PSSegmentTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  if (v3)
    LOBYTE(v3) = -[PSSegmentTableCell tag](self, "tag") == 9;
  return v3;
}

- (void)setValues:(id)a3 titleDictionary:(id)a4
{
  NSArray *v6;
  NSDictionary *v7;
  NSArray *values;
  NSDictionary *titleDict;
  NSArray *v10;

  v6 = (NSArray *)a3;
  v7 = (NSDictionary *)a4;
  values = self->_values;
  self->_values = v6;
  v10 = v6;

  titleDict = self->_titleDict;
  self->_titleDict = v7;

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)PSSegmentTableCell;
  -[PSTableCell layoutSubviews](&v20, sel_layoutSubviews);
  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("alwaysShowSeparator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PSSegmentTableCell setSeparatorStyle:](self, "setSeparatorStyle:", 0);
  -[PSSegmentTableCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  -[PSControlTableCell control](self, "control");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  if (v14 == 2.0)
    v15 = 7.5;
  else
    v15 = 7.0;
  v21.origin.x = v11;
  v21.origin.y = v12;
  v21.size.width = v7;
  v21.size.height = v9;
  v22 = CGRectInset(v21, 5.0, v15);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;

  objc_msgSend(v10, "setFrame:", x, y, width, height);
}

- (id)controlValue
{
  unint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = -[UIControl selectedSegmentIndex](self->super._control, "selectedSegmentIndex");
  if ((v3 & 0x8000000000000000) != 0 || (v4 = v3, v3 >= -[NSArray count](self->_values, "count")))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_values, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setValue:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  id v7;

  v7 = a3;
  if (self->super.super._value != v7)
  {
    objc_storeStrong(&self->super.super._value, a3);
    v5 = -[NSArray indexOfObject:](self->_values, "indexOfObject:", v7);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 0;
    else
      v6 = v5;
    -[UIControl setSelectedSegmentIndex:](self->super._control, "setSelectedSegmentIndex:", v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDict, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
