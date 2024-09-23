@implementation PXSurveyQuestionDefaultConfiguration

- (PXSurveyQuestionDefaultConfiguration)initWithTitle:(id)a3
{
  id v4;
  PXSurveyQuestionDefaultConfiguration *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSurveyQuestionDefaultConfiguration;
  v5 = -[PXSurveyQuestionDefaultConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_isStale = 0;
  }

  return v5;
}

- (PXSurveyQuestionDefaultConfiguration)init
{
  return -[PXSurveyQuestionDefaultConfiguration initWithTitle:](self, "initWithTitle:", &stru_1E5149688);
}

- (UIView)contentView
{
  UIView *placeholderView;
  UIView *v4;
  UIView *v5;
  void *v6;

  placeholderView = self->_placeholderView;
  if (!placeholderView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_placeholderView;
    self->_placeholderView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_placeholderView, "setBackgroundColor:", v6);

    placeholderView = self->_placeholderView;
  }
  return placeholderView;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (CGRect)contentRectForOneUp
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[UIView setFrame:](self->_placeholderView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)title
{
  return self->_title;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
