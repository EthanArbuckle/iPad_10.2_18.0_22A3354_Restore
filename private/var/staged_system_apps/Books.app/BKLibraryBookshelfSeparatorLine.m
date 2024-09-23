@implementation BKLibraryBookshelfSeparatorLine

- (BKLibraryBookshelfSeparatorLine)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfSeparatorLine *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKLibraryBookshelfSeparatorLine;
  v3 = -[BKLibraryBookshelfSeparatorLine initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    -[BKLibraryBookshelfSeparatorLine setSeparatorline:](v3, "setSeparatorline:", v4);

    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor")));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine separatorline](v3, "separatorline"));
    objc_msgSend(v7, "setStrokeColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v10 = 1.0 / v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine separatorline](v3, "separatorline"));
    objc_msgSend(v11, "setLineWidth:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine layer](v3, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine separatorline](v3, "separatorline"));
    objc_msgSend(v12, "addSublayer:", v13);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double MaxX;
  id v16;
  id v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.receiver = self;
  v19.super_class = (Class)BKLibraryBookshelfSeparatorLine;
  -[BKLibraryBookshelfSeparatorLine layoutSubviews](&v19, "layoutSubviews");
  -[BKLibraryBookshelfSeparatorLine bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine separatorline](self, "separatorline"));
  objc_msgSend(v12, "lineWidth");
  v14 = v13 * -0.5 + 1.0;

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  objc_msgSend(v11, "moveToPoint:", v4, CGRectGetMaxY(v20) - v14);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  MaxX = CGRectGetMaxX(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  objc_msgSend(v11, "addLineToPoint:", MaxX, CGRectGetMaxY(v22) - v14);
  v16 = objc_retainAutorelease(v11);
  v17 = objc_msgSend(v16, "CGPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine separatorline](self, "separatorline"));
  objc_msgSend(v18, "setPath:", v17);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfSeparatorLine;
  -[BKLibraryBookshelfSeparatorLine applyLayoutAttributes:](&v8, "applyLayoutAttributes:", v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "foregroundColor")));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSeparatorLine separatorline](self, "separatorline"));
  objc_msgSend(v7, "setStrokeColor:", v6);

}

- (CAShapeLayer)separatorline
{
  return self->_separatorline;
}

- (void)setSeparatorline:(id)a3
{
  objc_storeStrong((id *)&self->_separatorline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorline, 0);
}

@end
