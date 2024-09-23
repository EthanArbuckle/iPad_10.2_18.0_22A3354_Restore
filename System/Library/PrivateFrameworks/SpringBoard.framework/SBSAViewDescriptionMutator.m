@implementation SBSAViewDescriptionMutator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewDescription, 0);
}

- (SBSAViewDescriptionMutator)initWithViewDescription:(id)a3
{
  id v5;
  SBSAViewDescriptionMutator *v6;
  SBSAViewDescriptionMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAViewDescriptionMutator;
  v6 = -[SBSAViewDescriptionMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewDescription, a3);

  return v7;
}

- (void)setCenter:(CGPoint)a3
{
  -[SBSAViewDescription _setCenter:](self->_viewDescription, "_setCenter:", a3.x, a3.y);
}

- (void)setInterfaceElementIdentifier:(id)a3
{
  -[SBSAViewDescription _setInterfaceElementIdentifier:](self->_viewDescription, "_setInterfaceElementIdentifier:", a3);
}

- (void)setCornerRadius:(double)a3
{
  -[SBSAViewDescription _setCornerRadius:](self->_viewDescription, "_setCornerRadius:", a3);
}

- (void)setBounds:(CGRect)a3
{
  -[SBSAViewDescription _setBounds:](self->_viewDescription, "_setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAlpha:(double)a3
{
  -[SBSAViewDescription _setAlpha:](self->_viewDescription, "_setAlpha:", a3);
}

- (id)viewDescription
{
  return self->_viewDescription;
}

- (void)setScale:(CGSize)a3
{
  -[SBSAViewDescription _setScale:](self->_viewDescription, "_setScale:", a3.width, a3.height);
}

- (void)setBoundsVelocity:(CGRect)a3
{
  -[SBSAViewDescription _setBoundsVelocity:](self->_viewDescription, "_setBoundsVelocity:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSUUID)interfaceElementIdentifier
{
  return -[SBSAViewDescription interfaceElementIdentifier](self->_viewDescription, "interfaceElementIdentifier");
}

- (CGPoint)center
{
  double v2;
  double v3;
  CGPoint result;

  -[SBSAViewDescription center](self->_viewDescription, "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBSAViewDescription bounds](self->_viewDescription, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)cornerRadius
{
  double result;

  -[SBSAViewDescription cornerRadius](self->_viewDescription, "cornerRadius");
  return result;
}

- (double)alpha
{
  double result;

  -[SBSAViewDescription alpha](self->_viewDescription, "alpha");
  return result;
}

- (CGSize)scale
{
  double v2;
  double v3;
  CGSize result;

  -[SBSAViewDescription scale](self->_viewDescription, "scale");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)boundsVelocity
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBSAViewDescription boundsVelocity](self->_viewDescription, "boundsVelocity");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; interfaceElementDescription: %@>"),
               objc_opt_class(),
               self,
               self->_viewDescription);
}

@end
