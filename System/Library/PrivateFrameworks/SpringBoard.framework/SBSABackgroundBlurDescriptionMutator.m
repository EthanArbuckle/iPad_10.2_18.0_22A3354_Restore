@implementation SBSABackgroundBlurDescriptionMutator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurDescription, 0);
}

- (SBSABackgroundBlurDescriptionMutator)initWithBackgroundBlurDescription:(id)a3
{
  id v5;
  SBSABackgroundBlurDescriptionMutator *v6;
  SBSABackgroundBlurDescriptionMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSABackgroundBlurDescriptionMutator;
  v6 = -[SBSABackgroundBlurDescriptionMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backgroundBlurDescription, a3);

  return v7;
}

- (void)setBlurHidden:(BOOL)a3
{
  -[SBSABackgroundBlurDescription _setBlurHidden:](self->_backgroundBlurDescription, "_setBlurHidden:", a3);
}

- (void)setBlurFrame:(CGRect)a3
{
  -[SBSABackgroundBlurDescription _setBlurFrame:](self->_backgroundBlurDescription, "_setBlurFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isBlurHidden
{
  return -[SBSABackgroundBlurDescription isBlurHidden](self->_backgroundBlurDescription, "isBlurHidden");
}

- (CGRect)blurFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBSABackgroundBlurDescription blurFrame](self->_backgroundBlurDescription, "blurFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; backgroundBlurDescription: %@>"),
               objc_opt_class(),
               self,
               self->_backgroundBlurDescription);
}

- (SBSABackgroundBlurDescription)backgroundBlurDescription
{
  return self->_backgroundBlurDescription;
}

@end
