@implementation MTATimerCollectionControlButton

- (MTATimerCollectionControlButton)initWithFrame:(CGRect)a3
{
  MTATimerCollectionControlButton *v3;
  MTATimerCollectionControlButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerCollectionControlButton;
  v3 = -[MTATimerCollectionControlButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTATimerCollectionControlButton setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MTATimerCollectionControlButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTATimerCollectionControlButton;
  -[MTATimerCollectionControlButton setHighlighted:](&v11, "setHighlighted:");
  if (!v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionControlButton normalBackgroundColor](self, "normalBackgroundColor"));

    if (v7)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[MTATimerCollectionControlButton normalBackgroundColor](self, "normalBackgroundColor"));
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionControlButton tintColor](self, "tintColor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "normalShade"));
LABEL_9:
    v10 = (void *)v9;
    -[MTATimerCollectionControlButton setBackgroundColor:](self, "setBackgroundColor:", v9);

    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionControlButton highlightedBackgroundColor](self, "highlightedBackgroundColor"));

  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionControlButton tintColor](self, "tintColor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "highlightedShade"));
    goto LABEL_9;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[MTATimerCollectionControlButton highlightedBackgroundColor](self, "highlightedBackgroundColor"));
LABEL_6:
  v8 = (void *)v6;
  -[MTATimerCollectionControlButton setBackgroundColor:](self, "setBackgroundColor:", v6);
LABEL_10:

}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (void)setNormalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
}

@end
