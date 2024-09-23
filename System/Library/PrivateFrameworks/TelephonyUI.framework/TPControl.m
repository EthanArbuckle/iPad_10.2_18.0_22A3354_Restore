@implementation TPControl

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (TPControl)init
{
  return -[TPControl initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (TPControl)initWithFrame:(CGRect)a3
{
  TPControl *v3;
  TPControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPControl;
  v3 = -[TPControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TPControl commonInit](v3, "commonInit");
  return v4;
}

- (TPControl)initWithCoder:(id)a3
{
  TPControl *v3;
  TPControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPControl;
  v3 = -[TPControl initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TPControl commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;

  -[TPControl traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_accessiblityConstraintsEnabled = objc_msgSend(v3, "isPreferredContentSizeCategoryAccessible");

}

- (void)unloadConstraints
{
  void *v3;

  -[TPControl constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPControl removeConstraints:](self, "removeConstraints:", v3);

  -[TPControl setConstraintsLoaded:](self, "setConstraintsLoaded:", 0);
}

- (void)updateConstraints
{
  objc_super v3;

  if (!-[TPControl isConstraintsLoaded](self, "isConstraintsLoaded"))
  {
    -[TPControl updateFonts](self, "updateFonts");
    -[TPControl loadConstraints](self, "loadConstraints");
    -[TPControl setConstraintsLoaded:](self, "setConstraintsLoaded:", 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)TPControl;
  -[TPControl updateConstraints](&v3, sel_updateConstraints);
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
  v11.super_class = (Class)TPControl;
  v4 = a3;
  -[TPControl traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[TPControl traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = objc_msgSend(v5, "isPreferredContentSizeCategoryAccessible");
    v9 = (void *)*MEMORY[0x1E0DC4938];
    v10 = v8 ^ -[TPControl isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled");
    if (v6 == v9)
    {
      if (v10)
        self->_accessiblityConstraintsEnabled = v8;
    }
    else
    {
      if (v10)
        -[TPControl setAccessiblityConstraintsEnabled:](self, "setAccessiblityConstraintsEnabled:", v8);
      -[TPControl updateFonts](self, "updateFonts");
      -[TPControl updateConstraintsConstants](self, "updateConstraintsConstants");
    }
  }

}

- (void)setAccessiblityConstraintsEnabled:(BOOL)a3
{
  if (self->_accessiblityConstraintsEnabled != a3)
  {
    self->_accessiblityConstraintsEnabled = a3;
    -[TPControl unloadConstraints](self, "unloadConstraints");
    -[TPControl updateConstraints](self, "updateConstraints");
  }
}

- (BOOL)isAccessiblityConstraintsEnabled
{
  return self->_accessiblityConstraintsEnabled;
}

- (BOOL)isConstraintsLoaded
{
  return self->_constraintsLoaded;
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

@end
