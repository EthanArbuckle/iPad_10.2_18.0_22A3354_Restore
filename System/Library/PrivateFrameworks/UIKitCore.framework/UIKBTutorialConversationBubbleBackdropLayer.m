@implementation UIKBTutorialConversationBubbleBackdropLayer

- (UIKBTutorialConversationBubbleBackdropLayer)init
{
  UIKBTutorialConversationBubbleBackdropLayer *v2;
  UIKBTutorialConversationBubbleBackdropLayer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)UIKBTutorialConversationBubbleBackdropLayer;
  v2 = -[UIKBTutorialConversationBubbleBackdropLayer init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIKBTutorialConversationBubbleBackdropLayer _updateBackgroundColor](v2, "_updateBackgroundColor");
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", CFSTR("default"), *MEMORY[0x1E0CD2D88]);
    objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E1A96350, *MEMORY[0x1E0CD2D90]);
    v5 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D58]);
    objc_msgSend(v4, "setValue:forKeyPath:", v5, *MEMORY[0x1E0CD2D70]);
    v6 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D28]);
    objc_msgSend(v4, "setValue:forKeyPath:", v6, *MEMORY[0x1E0CD2D68]);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E1A96360, *MEMORY[0x1E0CD2CB8]);
    v11[0] = v4;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialConversationBubbleBackdropLayer setFilters:](v3, "setFilters:", v8);

  }
  return v3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[UIKBTutorialConversationBubbleBackdropLayer _updateBackgroundColor](self, "_updateBackgroundColor");
  }
}

- (void)_updateBackgroundColor
{
  unint64_t userInterfaceStyle;
  double v4;
  double v5;
  void *v6;
  id v7;

  userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle < 2)
  {
    v4 = 0.9;
    v5 = 1.0;
LABEL_6:
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (userInterfaceStyle == 2)
  {
    v5 = 0.278431373;
    v4 = 0.75;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:
  v7 = objc_retainAutorelease(v6);
  -[UIKBTutorialConversationBubbleBackdropLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end
