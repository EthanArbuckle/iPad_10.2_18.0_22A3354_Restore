@implementation PXCloudQuotaView

- (PXCloudQuotaView)initWithContentView:(id)a3
{
  id v6;
  PXCloudQuotaView *v7;
  PXCloudQuotaView *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentView"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCloudQuotaView;
  v7 = -[PXCloudQuotaView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentView, a3);
    -[PXCloudQuotaView addSubview:](v8, "addSubview:", v6);
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCloudQuotaView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCloudQuotaView;
  -[PXCloudQuotaView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXCloudQuotaView bounds](self, "bounds");
  -[PXCloudQuotaView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;

  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  -[PXCloudQuotaView contentViewFont](self, "contentViewFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCloudQuotaView contentViewSizeForWidth:](self, "contentViewSizeForWidth:", a3);
  UICeilToViewScale();
  v9 = v8;
  objc_msgSend(v7, "ascender");
  UICeilToViewScale();
  v11 = v10;
  if (a4)
    -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, v10, a3, v9);
  v17.origin.x = 0.0;
  v17.origin.y = v11;
  v17.size.width = a3;
  v17.size.height = v9;
  CGRectGetMaxY(v17);
  objc_msgSend(v7, "descender");
  UICeilToViewScale();
  v13 = v12;

  v14 = a3;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)contentViewFont
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 90, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCloudQuotaView contentViewFont]", v6);

  abort();
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 94, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCloudQuotaView contentViewSizeForWidth:]", v7);

  abort();
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)offerLevel
{
  return self->_offerLevel;
}

- (void)setOfferLevel:(int64_t)a3
{
  self->_offerLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
