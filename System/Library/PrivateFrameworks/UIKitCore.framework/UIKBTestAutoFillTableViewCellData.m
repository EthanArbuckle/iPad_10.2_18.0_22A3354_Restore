@implementation UIKBTestAutoFillTableViewCellData

- (UIKBTestAutoFillTableViewCellData)initWithCell:(id)a3 height:(double)a4
{
  id v7;
  UIKBTestAutoFillTableViewCellData *v8;
  UIKBTestAutoFillTableViewCellData *v9;
  UIKBTestAutoFillTableViewCellData *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBTestAutoFillTableViewCellData;
  v8 = -[UIKBTestAutoFillTableViewCellData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cell, a3);
    v9->_height = a4;
    v10 = v9;
  }

  return v9;
}

- (UIKBTestAutoFillTableViewCellData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  UIKBTestAutoFillTableViewCellData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("cell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
  v7 = v6;

  v8 = -[UIKBTestAutoFillTableViewCellData initWithCell:height:](self, "initWithCell:height:", v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  UITableViewCell *cell;
  id v5;

  cell = self->_cell;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cell, CFSTR("cell"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("height"), self->_height);

}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
