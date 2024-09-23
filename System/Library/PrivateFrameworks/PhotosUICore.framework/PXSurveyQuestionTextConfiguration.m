@implementation PXSurveyQuestionTextConfiguration

- (PXSurveyQuestionTextConfiguration)initWithTitle:(id)a3 questionText:(id)a4 shouldScaleForLongText:(BOOL)a5
{
  id v8;
  id v9;
  PXSurveyQuestionTextConfiguration *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *questionText;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSurveyQuestionTextConfiguration;
  v10 = -[PXSurveyQuestionTextConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    questionText = v10->_questionText;
    v10->_questionText = (NSString *)v13;

    v10->_isStale = 0;
    v10->_shouldScaleForLongText = a5;
  }

  return v10;
}

- (PXSurveyQuestionTextConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionTextConfiguration.m"), 35, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionTextConfiguration init]");

  abort();
}

- (UIView)contentView
{
  UILabel *questionLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  double v12;
  void *v13;

  questionLabel = self->_questionLabel;
  if (!questionLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_questionLabel;
    self->_questionLabel = v5;

    -[UILabel setTextAlignment:](self->_questionLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_questionLabel, "setTextColor:", v7);

    -[PXSurveyQuestionTextConfiguration questionText](self, "questionText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_questionLabel, "setText:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_questionLabel, "setBackgroundColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AE8], 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_questionLabel;
    if (self->_shouldScaleForLongText)
    {
      -[UILabel setNumberOfLines:](v11, "setNumberOfLines:", 0);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_questionLabel, "setAdjustsFontSizeToFitWidth:", 0);
      -[UILabel setLineBreakMode:](self->_questionLabel, "setLineBreakMode:", 0);
      v12 = 26.0;
    }
    else
    {
      -[UILabel setMinimumScaleFactor:](v11, "setMinimumScaleFactor:", 0.75);
      -[UILabel setNumberOfLines:](self->_questionLabel, "setNumberOfLines:", 1);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_questionLabel, "setAdjustsFontSizeToFitWidth:", 1);
      v12 = 64.0;
    }
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_questionLabel, "setFont:", v13);

    questionLabel = self->_questionLabel;
  }
  return (UIView *)questionLabel;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[UILabel setFrame:](self->_questionLabel, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

- (NSString)questionText
{
  return self->_questionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_questionText, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_questionLabel, 0);
}

@end
