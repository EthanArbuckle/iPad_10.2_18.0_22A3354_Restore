@implementation UIKeyboardEmojiScrubBarView

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v4;
    if (self && self->_isFirstPartyStickers)
    {
      +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self, "setBackgroundColor:", v5);
LABEL_13:

      return;
    }
    if (objc_msgSend(v4, "lightKeyboard"))
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BC0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCompositingFilter:", v6);

      if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") == 100)
      {
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.380392157, 1.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self, "setBackgroundColor:", v8);

        -[UIView layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v9;
        LODWORD(v10) = 1061779669;
LABEL_12:
        objc_msgSend(v9, "setOpacity:", v10);
        goto LABEL_13;
      }
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.435294118, 0.4, 0.368627451, 1.0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E80]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCompositingFilter:", v11);

      +[UIColor whiteColor](UIColor, "whiteColor");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v13);

    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    LODWORD(v10) = 1058642330;
    goto LABEL_12;
  }
}

@end
