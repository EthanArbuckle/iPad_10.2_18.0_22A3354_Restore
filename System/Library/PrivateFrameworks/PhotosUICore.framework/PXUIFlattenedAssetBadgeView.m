@implementation PXUIFlattenedAssetBadgeView

- (BOOL)isOpaque
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXUIFlattenedAssetBadgeView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXUIFlattenedAssetBadgeView;
    -[PXUIAssetBadgeView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[PXUIFlattenedAssetBadgeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIFlattenedAssetBadgeView;
  -[PXUIFlattenedAssetBadgeView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[PXUIFlattenedAssetBadgeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGContext *CurrentContext;
  uint64_t v17;
  void (**v18)(void *, _PXUIAssetBadgeImageView *);
  void (**v19)(void *, UILabel *);
  _QWORD v20[8];
  _QWORD aBlock[8];
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXUIFlattenedAssetBadgeView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  CurrentContext = UIGraphicsGetCurrentContext();
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  CGContextClearRect(CurrentContext, v22);
  -[UIImage drawInRect:](self->_backgroundImage, "drawInRect:", v9, v11, v13, v15);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke;
  aBlock[3] = &__block_descriptor_64_e34_v16__0___PXUIAssetBadgeImageView_8l;
  *(CGFloat *)&aBlock[4] = x;
  *(CGFloat *)&aBlock[5] = y;
  *(CGFloat *)&aBlock[6] = width;
  *(CGFloat *)&aBlock[7] = height;
  v18 = (void (**)(void *, _PXUIAssetBadgeImageView *))_Block_copy(aBlock);
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke_2;
  v20[3] = &__block_descriptor_64_e17_v16__0__UILabel_8l;
  *(CGFloat *)&v20[4] = x;
  *(CGFloat *)&v20[5] = y;
  *(CGFloat *)&v20[6] = width;
  *(CGFloat *)&v20[7] = height;
  v19 = (void (**)(void *, UILabel *))_Block_copy(v20);
  v18[2](v18, self->super._bottomLeadingImageView);
  v18[2](v18, self->super._bottomTrailingImageView);
  v19[2](v19, self->super._bottomLabel);

}

- (void)_setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

void __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke(CGRect *a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 v10;
  void *v11;
  double v12;
  void *v13;
  CGRect v14;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v13 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v13;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v13, "frame");
      x = v14.origin.x;
      y = v14.origin.y;
      width = v14.size.width;
      height = v14.size.height;
      v10 = CGRectIntersectsRect(v14, a1[1]);
      v4 = v13;
      if (v10)
      {
        objc_msgSend(v13, "image");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "alpha");
        objc_msgSend(v11, "drawInRect:blendMode:alpha:", 0, x, y, width, height, v12);

        v4 = v13;
      }
    }
  }

}

void __40__PXUIFlattenedAssetBadgeView_drawRect___block_invoke_2(CGRect *a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 v10;
  void *v11;
  CGRect v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v11 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v11;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v11, "frame");
      x = v12.origin.x;
      y = v12.origin.y;
      width = v12.size.width;
      height = v12.size.height;
      v10 = CGRectIntersectsRect(v12, a1[1]);
      v4 = v11;
      if (v10)
      {
        objc_msgSend(v11, "drawTextInRect:", x, y, width, height);
        v4 = v11;
      }
    }
  }

}

@end
