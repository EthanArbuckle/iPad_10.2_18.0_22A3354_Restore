@implementation TPView

- (void)updateConstraints
{
  objc_super v3;

  if (!-[TPView isConstraintsLoaded](self, "isConstraintsLoaded"))
  {
    -[TPView updateFonts](self, "updateFonts");
    -[TPView loadConstraints](self, "loadConstraints");
    -[TPView setConstraintsLoaded:](self, "setConstraintsLoaded:", 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)TPView;
  -[TPView updateConstraints](&v3, sel_updateConstraints);
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

- (BOOL)isConstraintsLoaded
{
  return self->_constraintsLoaded;
}

- (TPView)initWithFrame:(CGRect)a3
{
  TPView *v3;
  TPView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPView;
  v3 = -[TPView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TPView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;

  -[TPView traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_accessiblityConstraintsEnabled = objc_msgSend(v3, "isPreferredContentSizeCategoryAccessible");

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (TPView)init
{
  return -[TPView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (TPView)initWithCoder:(id)a3
{
  TPView *v3;
  TPView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPView;
  v3 = -[TPView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TPView commonInit](v3, "commonInit");
  return v4;
}

- (void)unloadConstraints
{
  void *v3;

  -[TPView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPView removeConstraints:](self, "removeConstraints:", v3);

  -[TPView setConstraintsLoaded:](self, "setConstraintsLoaded:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPView;
  v4 = a3;
  -[TPView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[TPView traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = objc_msgSend(v5, "isPreferredContentSizeCategoryAccessible");
    v9 = (void *)*MEMORY[0x1E0DC4938];
    v10 = v8 ^ -[TPView isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled");
    if (v6 == v9)
    {
      if (v10)
        self->_accessiblityConstraintsEnabled = v8;
    }
    else
    {
      if (v10)
        -[TPView setAccessiblityConstraintsEnabled:](self, "setAccessiblityConstraintsEnabled:", v8);
      -[TPView updateFonts](self, "updateFonts");
      -[TPView updateConstraintsConstants](self, "updateConstraintsConstants");
    }
  }

}

- (void)setAccessiblityConstraintsEnabled:(BOOL)a3
{
  if (self->_accessiblityConstraintsEnabled != a3)
  {
    self->_accessiblityConstraintsEnabled = a3;
    -[TPView unloadConstraints](self, "unloadConstraints");
    -[TPView updateConstraints](self, "updateConstraints");
  }
}

- (BOOL)isAccessiblityConstraintsEnabled
{
  return self->_accessiblityConstraintsEnabled;
}

@end
