@implementation OBTrayButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBTrayButton;
  objc_msgSendSuper2(&v5, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OBTrayButton;
  -[OBTrayButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, a3);
  -[OBTrayButton attributedTitleForState:](self, "attributedTitleForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v4, 0);

  -[OBTrayButton attributedTitleForState:](self, "attributedTitleForState:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v5, 1);

  -[OBTrayButton attributedTitleForState:](self, "attributedTitleForState:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v6, 4);

  -[OBTrayButton attributedTitleForState:](self, "attributedTitleForState:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v7, 8);

  -[OBTrayButton attributedTitleForState:](self, "attributedTitleForState:", 16711680);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v8, 16711680);

  -[OBTrayButton attributedTitleForState:](self, "attributedTitleForState:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v9, 2);

  -[OBTrayButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)showsBusyIndicator
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  -[OBTrayButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsActivityIndicator");

  if ((v4 & 1) == 0)
  {
    -[OBTrayButton configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsActivityIndicator:", 1);
    -[OBTrayButton setConfiguration:](self, "setConfiguration:", v5);
    -[OBTrayButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    v6.receiver = self;
    v6.super_class = (Class)OBTrayButton;
    -[OBTrayButton setEnabled:](&v6, sel_setEnabled_, 0);

  }
}

- (void)hidesBusyIndicator
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[OBTrayButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsActivityIndicator");

  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)OBTrayButton;
    -[OBTrayButton setEnabled:](&v6, sel_setEnabled_, 1);
    -[OBTrayButton configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsActivityIndicator:", 0);
    -[OBTrayButton setConfiguration:](self, "setConfiguration:", v5);
    -[OBTrayButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");

  }
}

+ (double)standardHeight
{
  return 50.0;
}

- (id)_fontTextStyle
{
  return (id)*MEMORY[0x1E0DC4A88];
}

- (id)buttonFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[OBTrayButton _fontTextStyle](self, "_fontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton fontForStyle:maxSizeCategory:](self, "fontForStyle:maxSizeCategory:", v3, *MEMORY[0x1E0DC48C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v5, "boldSystemFontOfSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)lastTitleLabelHeight
{
  return self->_lastTitleLabelHeight;
}

- (void)setLastTitleLabelHeight:(double)a3
{
  self->_lastTitleLabelHeight = a3;
}

@end
