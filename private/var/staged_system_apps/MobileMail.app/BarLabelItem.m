@implementation BarLabelItem

+ (id)_boldAttributes
{
  if (qword_1005A9A58 != -1)
    dispatch_once(&qword_1005A9A58, &stru_10051A790);
  return (id)qword_1005A9A50;
}

+ (id)_defaultAttributes
{
  if (qword_1005A9A68 != -1)
    dispatch_once(&qword_1005A9A68, &stru_10051A7B0);
  return (id)qword_1005A9A60;
}

- (BarLabelItem)initWithTitle:(id)a3 style:(int64_t)a4
{
  return -[BarLabelItem initWithTitle:width:style:](self, "initWithTitle:width:style:", a3, a4, 0.0);
}

- (BarLabelItem)initWithWidth:(double)a3 style:(int64_t)a4
{
  return -[BarLabelItem initWithTitle:width:style:](self, "initWithTitle:width:style:", 0, a4, a3);
}

- (BarLabelItem)initWithTitle:(id)a3 width:(double)a4 style:(int64_t)a5
{
  id v7;
  id v8;
  BarLabelItem *v9;
  BarLabelItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v12.receiver = self;
  v12.super_class = (Class)BarLabelItem;
  v9 = -[BarLabelItem initWithCustomView:](&v12, "initWithCustomView:", v8);
  v10 = v9;
  if (v9)
  {
    v9->_itemStyle = a5;
    -[BarLabelItem setTitle:](v9, "setTitle:", v7);
  }

  return v10;
}

- (void)setTitle:(id)a3
{
  void *v4;
  int64_t itemStyle;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BarLabelItem customView](self, "customView"));
  if (v11)
  {
    itemStyle = self->_itemStyle;
    if (itemStyle)
    {
      if (itemStyle != 1)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v6 = objc_msgSend((id)objc_opt_class(self), "_boldAttributes");
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    else
    {
      v8 = objc_msgSend((id)objc_opt_class(self), "_defaultAttributes");
      v7 = objc_claimAutoreleasedReturnValue(v8);
    }
    v9 = (void *)v7;
LABEL_9:
    v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v11, v9);
    objc_msgSend(v4, "setAttributedText:", v10);
    objc_msgSend(v4, "sizeToFit");

    goto LABEL_10;
  }
  objc_msgSend(v4, "setText:", 0);
LABEL_10:

}

@end
