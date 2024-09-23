@implementation BKLibraryBookshelfNoBooks

+ (id)_createDescriptionHeaderLabel:(CGRect)a3
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  return v3;
}

+ (id)_createDescriptionDetailLabel:(CGRect)a3
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  return v3;
}

+ (void)adjustHeight:(id)a3 withDataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  CGRect v34;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainHeaderMetrics"));
  v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noBooksDescriptionHeaderFontAttributes"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainHeaderMetrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "noBooksDescriptionFontAttributes"));

  objc_msgSend(v6, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainHeaderMetrics"));
  objc_msgSend(v18, "noBooksDescriptionTopMargin");
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainHeaderMetrics"));
  objc_msgSend(v21, "noBooksDescriptionSpacing");
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainHeaderMetrics"));
  objc_msgSend(v24, "noBooksDescriptionWidth");
  v26 = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfNoBooks _createDescriptionHeaderLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionHeaderLabel:", v11, v13, v15, v17));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfNoBooks _createDescriptionDetailLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionDetailLabel:", v11, v13, v15, v17));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noBooksDescriptionHeader"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v29, v33));
  objc_msgSend(v27, "setAttributedText:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noBooksDescription"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v31, v9));
  objc_msgSend(v28, "setAttributedText:", v32);

  +[BKLibraryBookshelfNoBooks _layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:](BKLibraryBookshelfNoBooks, "_layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:", v27, v28, v20, v26, v23, v11, v13, v15, v17);
  objc_msgSend(v28, "frame");
  objc_msgSend(v6, "setFrame:", v11, v13, v15, CGRectGetMaxY(v34) * 1.2);

}

+ (void)_layoutDescriptionHeader:(id)a3 detail:(id)a4 topMargin:(double)a5 descWidth:(double)a6 spacing:(double)a7 inRect:(CGRect)a8
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat rect;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v33 = a3;
  v16 = a4;
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "attributedText"));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedText"));

    if (v19)
    {
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v20 = CGRectGetHeight(v34);
      objc_msgSend(v33, "sizeThatFits:", width, CGRectZero.size.height);
      rect = v21;
      v32 = a7;
      v22 = round(v20 * a5 / 100.0);
      objc_msgSend(v33, "setFrame:", (width - width) * 0.5, v22, width, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedText"));
      objc_msgSend(v23, "size");
      v24 = a6;
      v26 = v25;

      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v27 = CGRectGetWidth(v35);
      if (v27 >= v26 / v24)
        v28 = v26 / v24;
      else
        v28 = v27;
      objc_msgSend(v16, "sizeThatFits:", v28, 1.79769313e308);
      v30 = v29;
      v36.origin.x = (width - width) * 0.5;
      v36.origin.y = v22;
      v36.size.width = width;
      v36.size.height = rect;
      objc_msgSend(v16, "setFrame:", (width - v28) * 0.5, CGRectGetMaxY(v36) + v32, v28, v30);
    }
  }

}

- (BKLibraryBookshelfNoBooks)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BKLibraryBookshelfNoBooks *v7;
  void *v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfNoBooks;
  v7 = -[BKLibraryBookshelfNoBooks initWithFrame:](&v11, "initWithFrame:");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfNoBooks _createDescriptionHeaderLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionHeaderLabel:", x, y, width, height));
    -[BKLibraryBookshelfNoBooks addSubview:](v7, "addSubview:", v8);
    -[BKLibraryBookshelfNoBooks setDescriptionHeaderLabel:](v7, "setDescriptionHeaderLabel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfNoBooks _createDescriptionDetailLabel:](BKLibraryBookshelfNoBooks, "_createDescriptionDetailLabel:", x, y, width, height));
    -[BKLibraryBookshelfNoBooks addSubview:](v7, "addSubview:", v9);
    -[BKLibraryBookshelfNoBooks setDescriptionDetailLabel:](v7, "setDescriptionDetailLabel:", v9);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKLibraryBookshelfNoBooks;
  -[BKLibraryBookshelfNoBooks layoutSubviews](&v18, "layoutSubviews");
  -[BKLibraryBookshelfNoBooks bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks descriptionHeaderLabel](self, "descriptionHeaderLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks descriptionDetailLabel](self, "descriptionDetailLabel"));
  -[BKLibraryBookshelfNoBooks descriptionTopMargin](self, "descriptionTopMargin");
  v14 = v13;
  -[BKLibraryBookshelfNoBooks descriptionWidth](self, "descriptionWidth");
  v16 = v15;
  -[BKLibraryBookshelfNoBooks descriptionSpacing](self, "descriptionSpacing");
  +[BKLibraryBookshelfNoBooks _layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:](BKLibraryBookshelfNoBooks, "_layoutDescriptionHeader:detail:topMargin:descWidth:spacing:inRect:", v11, v12, v14, v16, v17, v4, v6, v8, v10);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryBookshelfNoBooks;
  -[BKLibraryBookshelfNoBooks applyLayoutAttributes:](&v17, "applyLayoutAttributes:", v4);
  v5 = v4;
  if (objc_msgSend(v5, "layoutDebugMode"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.2)));
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks layer](self, "layer"));
    objc_msgSend(v9, "setBorderColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks layer](self, "layer"));
    v11 = v10;
    v12 = 0.5;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks layer](self, "layer"));
    v11 = v10;
    v12 = 0.0;
  }
  objc_msgSend(v10, "setBorderWidth:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  -[BKLibraryBookshelfNoBooks setMainHeaderMetrics:](self, "setMainHeaderMetrics:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  objc_msgSend(v14, "noBooksDescriptionTopMargin");
  -[BKLibraryBookshelfNoBooks setDescriptionTopMargin:](self, "setDescriptionTopMargin:");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  objc_msgSend(v15, "noBooksDescriptionSpacing");
  -[BKLibraryBookshelfNoBooks setDescriptionSpacing:](self, "setDescriptionSpacing:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  objc_msgSend(v16, "noBooksDescriptionWidth");
  -[BKLibraryBookshelfNoBooks setDescriptionWidth:](self, "setDescriptionWidth:");

  -[BKLibraryBookshelfNoBooks _updateLabels](self, "_updateLabels");
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks dataSource](self, "dataSource"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "noBooksDescriptionHeader"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks mainHeaderMetrics](self, "mainHeaderMetrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noBooksDescriptionHeaderFontAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v5, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks descriptionHeaderLabel](self, "descriptionHeaderLabel"));
    objc_msgSend(v9, "setAttributedText:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noBooksDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks mainHeaderMetrics](self, "mainHeaderMetrics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noBooksDescriptionFontAttributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v11, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfNoBooks descriptionDetailLabel](self, "descriptionDetailLabel"));
    objc_msgSend(v15, "setAttributedText:", v14);

    -[BKLibraryBookshelfNoBooks setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  -[BKLibraryBookshelfNoBooks _updateLabels](self, "_updateLabels");
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
}

- (UILabel)descriptionHeaderLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_descriptionHeaderLabel);
}

- (void)setDescriptionHeaderLabel:(id)a3
{
  objc_storeWeak((id *)&self->_descriptionHeaderLabel, a3);
}

- (UILabel)descriptionDetailLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_descriptionDetailLabel);
}

- (void)setDescriptionDetailLabel:(id)a3
{
  objc_storeWeak((id *)&self->_descriptionDetailLabel, a3);
}

- (double)descriptionWidth
{
  return self->_descriptionWidth;
}

- (void)setDescriptionWidth:(double)a3
{
  self->_descriptionWidth = a3;
}

- (double)descriptionTopMargin
{
  return self->_descriptionTopMargin;
}

- (void)setDescriptionTopMargin:(double)a3
{
  self->_descriptionTopMargin = a3;
}

- (double)descriptionSpacing
{
  return self->_descriptionSpacing;
}

- (void)setDescriptionSpacing:(double)a3
{
  self->_descriptionSpacing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionDetailLabel);
  objc_destroyWeak((id *)&self->_descriptionHeaderLabel);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
