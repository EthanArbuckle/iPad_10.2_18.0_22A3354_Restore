@implementation SiriUIMessageContentTemplateView

- (SiriUIMessageContentTemplateView)initWithDataSource:(id)a3
{
  id v4;
  SiriUIMessageContentTemplateView *v5;
  void *v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  id textBalloonView;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriUIMessageContentTemplateView;
  v5 = -[SiriUIBaseTemplateView initWithDataSource:](&v12, sel_initWithDataSource_, v4);
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)getCKTextBalloonViewClass_softClass;
    v17 = getCKTextBalloonViewClass_softClass;
    if (!getCKTextBalloonViewClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getCKTextBalloonViewClass_block_invoke;
      v13[3] = &unk_24D7D9460;
      v13[4] = &v14;
      __getCKTextBalloonViewClass_block_invoke((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    v8 = [v7 alloc];
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textBalloonView = v5->_textBalloonView;
    v5->_textBalloonView = (id)v9;

    objc_msgSend(v5->_textBalloonView, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v5->_textBalloonView, "prepareForDisplayIfNeeded");
    -[SiriUIMessageContentTemplateView addSubview:](v5, "addSubview:", v5->_textBalloonView);
    -[SiriUIMessageContentTemplateView reloadData](v5, "reloadData");
  }

  return v5;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  id textBalloonView;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)SiriUIMessageContentTemplateView;
  -[SiriUIMessageContentTemplateView layoutSubviews](&v14, sel_layoutSubviews);
  -[SiriUIMessageContentTemplateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "templatedContentMargins");

  v12 = -[SiriUIMessageContentTemplateView semanticContentAttribute](self, "semanticContentAttribute");
  textBalloonView = self->_textBalloonView;
  -[SiriUIMessageContentTemplateView _textBalloonViewBoundingSize](self, "_textBalloonViewBoundingSize");
  objc_msgSend(textBalloonView, "sizeThatFits:");
  if (v12 != 4)
  {
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.height = v10;
    CGRectGetWidth(v15);
  }
  UIRectCenteredYInRect();
  objc_msgSend(self->_textBalloonView, "setFrame:");
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIMessageContentTemplateView;
  -[SiriUIMessageContentTemplateView setSemanticContentAttribute:](&v4, sel_setSemanticContentAttribute_, a3);
  objc_msgSend(self->_textBalloonView, "setOrientation:", -[SiriUIMessageContentTemplateView semanticContentAttribute](self, "semanticContentAttribute") != 4);
  objc_msgSend(self->_textBalloonView, "prepareForDisplayIfNeeded");
}

- (double)desiredHeight
{
  id textBalloonView;
  double v3;

  textBalloonView = self->_textBalloonView;
  -[SiriUIMessageContentTemplateView _textBalloonViewBoundingSize](self, "_textBalloonViewBoundingSize");
  objc_msgSend(textBalloonView, "sizeThatFits:");
  return v3 + 88.0;
}

- (void)reloadData
{
  void *v3;
  int v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id textBalloonView;
  id v14;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)SiriUIMessageContentTemplateView;
  -[SiriUIBaseTemplateView reloadData](&v15, sel_reloadData);
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sentStatus");
  textBalloonView = self->_textBalloonView;
  v5 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v3, "content");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v16[1] = *MEMORY[0x24BDF6600];
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 4;
  }
  if (v6)
    v10 = v6;
  else
    v10 = &stru_24D7DA7D8;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2, textBalloonView);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithString:attributes:", v10, v11);
  objc_msgSend(v14, "setAttributedText:", v12);

  objc_msgSend(self->_textBalloonView, "setColor:", v9);
  objc_msgSend(self->_textBalloonView, "prepareForDisplayIfNeeded");
  -[SiriUIMessageContentTemplateView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)_textBalloonViewBoundingSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[SiriUIMessageContentTemplateView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templatedContentMargins");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v4 - (v11 + v15);
  v17 = v6 - (v9 + v13);
  result.height = v17;
  result.width = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textBalloonView, 0);
}

@end
