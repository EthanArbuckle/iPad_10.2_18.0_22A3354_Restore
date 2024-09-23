@implementation SiriSharedUICompactConversationSnippetVibrancyView

- (SiriSharedUICompactConversationSnippetVibrancyView)initWithStyle:(int64_t)a3
{
  SiriSharedUICompactConversationSnippetVibrancyView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIVisualEffectView *visualEffectView;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SiriSharedUICompactConversationSnippetVibrancyView;
  v4 = -[SiriSharedUICompactConversationSnippetVibrancyView init](&v15, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactConversationSnippetVibrancyView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = -[SiriSharedUICompactConversationSnippetVibrancyView _blurEffectStyleForVibrancyViewStyle:](v4, "_blurEffectStyleForVibrancyViewStyle:", a3);
    v7 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectForBlurEffect:style:", v8, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SiriSharedUICompactConversationSnippetVibrancyView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v9);
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v10;

    -[UIVisualEffectView setUserInteractionEnabled:](v4->_visualEffectView, "setUserInteractionEnabled:", 0);
    -[UIVisualEffectView contentView](v4->_visualEffectView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    -[SiriSharedUICompactConversationSnippetVibrancyView addSubview:](v4, "addSubview:", v4->_visualEffectView);
    -[SiriSharedUICompactConversationSnippetVibrancyView setClipsToBounds:](v4, "setClipsToBounds:", 1);

  }
  return v4;
}

- (void)layoutSubviews
{
  UIVisualEffectView *visualEffectView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUICompactConversationSnippetVibrancyView;
  -[SiriSharedUICompactConversationSnippetVibrancyView layoutSubviews](&v4, sel_layoutSubviews);
  visualEffectView = self->_visualEffectView;
  -[SiriSharedUICompactConversationSnippetVibrancyView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](visualEffectView, "setFrame:");
}

- (int64_t)_blurEffectStyleForVibrancyViewStyle:(int64_t)a3
{
  if (a3 == 1)
    return 14;
  else
    return 8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
