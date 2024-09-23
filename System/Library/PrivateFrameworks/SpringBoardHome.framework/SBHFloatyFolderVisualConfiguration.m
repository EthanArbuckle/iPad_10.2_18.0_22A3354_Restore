@implementation SBHFloatyFolderVisualConfiguration

- (double)titleFontSize
{
  return self->_titleFontSize;
}

- (CGSize)contentBackgroundSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentBackgroundSize.width;
  height = self->_contentBackgroundSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)titleHorizontalInset
{
  return self->_titleHorizontalInset;
}

- (double)pageControlAreaHeight
{
  return self->_pageControlAreaHeight;
}

- (CGSize)pageControlCustomPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_pageControlCustomPadding.width;
  height = self->_pageControlCustomPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_OWORD *)result + 3) = self->_contentBackgroundSize;
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_continuousCornerRadius;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_titleFontSize;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_titleHorizontalInset;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_pageControlAreaHeight;
    *((_OWORD *)result + 4) = self->_pageControlCustomPadding;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_rubberBandIntervalForOverscroll;
  }
  return result;
}

- (SBHFloatyFolderVisualConfiguration)init
{
  SBHFloatyFolderVisualConfiguration *v2;
  CGFloat v3;
  CGFloat v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHFloatyFolderVisualConfiguration;
  v2 = -[SBHFloatyFolderVisualConfiguration init](&v7, sel_init);
  if (v2)
  {
    +[SBFolderBackgroundView folderBackgroundSize](SBFolderBackgroundView, "folderBackgroundSize");
    v2->_contentBackgroundSize.width = v3;
    v2->_contentBackgroundSize.height = v4;
    +[SBFolderBackgroundView cornerRadiusToInsetContent](SBFolderBackgroundView, "cornerRadiusToInsetContent");
    v2->_continuousCornerRadius = v5;
    *(_OWORD *)&v2->_titleFontSize = xmmword_1D0190EC0;
    *(_OWORD *)&v2->_pageControlAreaHeight = xmmword_1D0190ED0;
    v2->_pageControlCustomPadding = (CGSize)*MEMORY[0x1E0C9D820];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  SBHFloatyFolderVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  double *v7;
  BOOL v8;
  BOOL v9;

  v4 = (SBHFloatyFolderVisualConfiguration *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = self->_contentBackgroundSize.width == v7[6] && self->_contentBackgroundSize.height == v7[7];
      if (v8
        && self->_continuousCornerRadius == v7[1]
        && self->_titleFontSize == v7[2]
        && self->_titleHorizontalInset == v7[3]
        && self->_pageControlAreaHeight == v7[4])
      {
        v9 = 0;
        if (self->_pageControlCustomPadding.width == v7[8] && self->_pageControlCustomPadding.height == v7[9])
          v9 = self->_rubberBandIntervalForOverscroll == v7[5];
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_contentBackgroundSize.width
                          + self->_contentBackgroundSize.height
                          + self->_continuousCornerRadius
                          + self->_titleFontSize
                          + self->_titleHorizontalInset
                          + self->_pageControlAreaHeight
                          + self->_pageControlCustomPadding.width
                          + self->_pageControlCustomPadding.height
                          + self->_rubberBandIntervalForOverscroll);
}

- (NSString)description
{
  return (NSString *)-[SBHFloatyFolderVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHFloatyFolderVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHFloatyFolderVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  CGSize v13;

  -[SBHFloatyFolderVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFloatyFolderVisualConfiguration contentBackgroundSize](self, "contentBackgroundSize");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("contentBackgroundSize"));
  -[SBHFloatyFolderVisualConfiguration continuousCornerRadius](self, "continuousCornerRadius");
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("continuousCornerRadius"));
  -[SBHFloatyFolderVisualConfiguration titleFontSize](self, "titleFontSize");
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("titleFontSize"));
  -[SBHFloatyFolderVisualConfiguration titleHorizontalInset](self, "titleHorizontalInset");
  v8 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("titleHorizontalInset"));
  -[SBHFloatyFolderVisualConfiguration pageControlAreaHeight](self, "pageControlAreaHeight");
  v9 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("pageControlAreaHeight"));
  -[SBHFloatyFolderVisualConfiguration pageControlCustomPadding](self, "pageControlCustomPadding");
  NSStringFromCGSize(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("pageControlCustomPadding"));

  -[SBHFloatyFolderVisualConfiguration rubberBandIntervalForOverscroll](self, "rubberBandIntervalForOverscroll");
  v11 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("rubberBandIntervalForOverscroll"));
  return v4;
}

- (void)setContentBackgroundSize:(CGSize)a3
{
  self->_contentBackgroundSize = a3;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (void)setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
}

- (void)setTitleFontSize:(double)a3
{
  self->_titleFontSize = a3;
}

- (void)setTitleHorizontalInset:(double)a3
{
  self->_titleHorizontalInset = a3;
}

- (void)setPageControlAreaHeight:(double)a3
{
  self->_pageControlAreaHeight = a3;
}

- (void)setPageControlCustomPadding:(CGSize)a3
{
  self->_pageControlCustomPadding = a3;
}

- (double)rubberBandIntervalForOverscroll
{
  return self->_rubberBandIntervalForOverscroll;
}

- (void)setRubberBandIntervalForOverscroll:(double)a3
{
  self->_rubberBandIntervalForOverscroll = a3;
}

@end
