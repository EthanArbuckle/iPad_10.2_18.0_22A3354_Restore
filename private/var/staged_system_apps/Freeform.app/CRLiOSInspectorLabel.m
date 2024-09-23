@implementation CRLiOSInspectorLabel

- (CRLiOSInspectorLabel)initWithFrame:(CGRect)a3
{
  CRLiOSInspectorLabel *v3;
  CRLiOSInspectorLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInspectorLabel;
  v3 = -[CRLiOSInspectorLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CRLiOSInspectorLabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CRLiOSInspectorLabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
    -[CRLiOSInspectorLabel setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", 0.5);
    -[CRLiOSInspectorLabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[CRLiOSInspectorLabel setAllowsDefaultTighteningForTruncation:](v4, "setAllowsDefaultTighteningForTruncation:", 1);
    -[CRLiOSInspectorLabel setLineBreakMode:](v4, "setLineBreakMode:", 4);
  }
  return v4;
}

- (void)updateConstraints
{
  unsigned int v3;
  int64_t v4;
  objc_super v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSInspectorLabel;
  -[CRLiOSInspectorLabel updateConstraints](&v7, "updateConstraints");
  v3 = -[CRLiOSInspectorLabel p_isAccessibilitySize](self, "p_isAccessibilitySize");
  v4 = -[CRLiOSInspectorLabel externalNumberOfLines](self, "externalNumberOfLines");
  if (v3)
  {
    -[CRLiOSInspectorLabel setNumberOfLines:](&v6, "setNumberOfLines:", v4, v5.receiver, v5.super_class, self, CRLiOSInspectorLabel);
  }
  else if (!v4)
  {
    -[CRLiOSInspectorLabel setNumberOfLines:](&v5, "setNumberOfLines:", 2, self, CRLiOSInspectorLabel, v6.receiver, v6.super_class);
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorLabel;
  -[CRLiOSInspectorLabel intrinsicContentSize](&v11, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = -[CRLiOSInspectorLabel containsTrailingMargin](self, "containsTrailingMargin");
  v8 = 16.0;
  if (!v7)
    v8 = -0.0;
  v9 = v4 + v8;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setNumberOfLines:(int64_t)a3
{
  objc_super v5;

  -[CRLiOSInspectorLabel setExternalNumberOfLines:](self, "setExternalNumberOfLines:");
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInspectorLabel;
  -[CRLiOSInspectorLabel setNumberOfLines:](&v5, "setNumberOfLines:", a3);
}

- (void)setText:(id)a3
{
  -[CRLiOSInspectorLabel crl_setTextAllowingHyphenation:](self, "crl_setTextAllowingHyphenation:", a3);
}

- (BOOL)p_isAccessibilitySize
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (BOOL)containsTrailingMargin
{
  return self->_containsTrailingMargin;
}

- (void)setContainsTrailingMargin:(BOOL)a3
{
  self->_containsTrailingMargin = a3;
}

- (int64_t)externalNumberOfLines
{
  return self->_externalNumberOfLines;
}

- (void)setExternalNumberOfLines:(int64_t)a3
{
  self->_externalNumberOfLines = a3;
}

@end
