@implementation SBSAElementContextMutator

- (SBSAElementContextMutator)initWithSystemApertureElementContext:(id)a3
{
  id v5;
  SBSAElementContextMutator *v6;
  SBSAElementContextMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementContextMutator;
  v6 = -[SBSAElementContextMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_systemApertureElementContext, a3);

  return v7;
}

- (NSString)clientIdentifier
{
  return -[SBSAElementContext clientIdentifier](self->_systemApertureElementContext, "clientIdentifier");
}

- (void)setClientIdentifier:(id)a3
{
  -[SBSAElementContext _setClientIdentifier:](self->_systemApertureElementContext, "_setClientIdentifier:", a3);
}

- (NSString)elementIdentifier
{
  return -[SBSAElementContext elementIdentifier](self->_systemApertureElementContext, "elementIdentifier");
}

- (void)setElementIdentifier:(id)a3
{
  -[SBSAElementContext _setElementIdentifier:](self->_systemApertureElementContext, "_setElementIdentifier:", a3);
}

- (int64_t)layoutMode
{
  return -[SBSAElementContext layoutMode](self->_systemApertureElementContext, "layoutMode");
}

- (void)setLayoutMode:(int64_t)a3
{
  -[SBSAElementContext _setLayoutMode:](self->_systemApertureElementContext, "_setLayoutMode:", a3);
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[SBSAElementContext preferredEdgeOutsets](self->_systemApertureElementContext, "preferredEdgeOutsets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3
{
  -[SBSAElementContext _setPreferredEdgeOutsets:](self->_systemApertureElementContext, "_setPreferredEdgeOutsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (int64_t)interfaceOrientation
{
  return -[SBSAElementContext interfaceOrientation](self->_systemApertureElementContext, "interfaceOrientation");
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  -[SBSAElementContext _setInterfaceOrientation:](self->_systemApertureElementContext, "_setInterfaceOrientation:", a3);
}

- (int64_t)systemApertureCustomLayout
{
  return -[SBSAElementContext systemApertureCustomLayout](self->_systemApertureElementContext, "systemApertureCustomLayout");
}

- (void)setSystemApertureCustomLayout:(int64_t)a3
{
  -[SBSAElementContext _setSystemApertureCustomLayout:](self->_systemApertureElementContext, "_setSystemApertureCustomLayout:", a3);
}

- (int64_t)systemApertureCustomLayoutCustomAnimationStyle
{
  return -[SBSAElementContext systemApertureCustomLayoutCustomAnimationStyle](self->_systemApertureElementContext, "systemApertureCustomLayoutCustomAnimationStyle");
}

- (void)setSystemApertureCustomLayoutCustomAnimationStyle:(int64_t)a3
{
  -[SBSAElementContext _setSystemApertureCustomLayoutCustomAnimationStyle:](self->_systemApertureElementContext, "_setSystemApertureCustomLayoutCustomAnimationStyle:", a3);
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return -[SBSAElementContext systemApertureLayoutCustomizingOptions](self->_systemApertureElementContext, "systemApertureLayoutCustomizingOptions");
}

- (void)setSystemApertureLayoutCustomizingOptions:(int64_t)a3
{
  -[SBSAElementContext _setSystemApertureLayoutCustomizingOptions:](self->_systemApertureElementContext, "_setSystemApertureLayoutCustomizingOptions:", a3);
}

- (int64_t)activeDynamicAnimation
{
  return -[SBSAElementContext activeDynamicAnimation](self->_systemApertureElementContext, "activeDynamicAnimation");
}

- (void)setActiveDynamicAnimation:(int64_t)a3
{
  -[SBSAElementContext _setActiveDynamicAnimation:](self->_systemApertureElementContext, "_setActiveDynamicAnimation:", a3);
}

- (UIColor)keyColor
{
  return -[SBSAElementContext keyColor](self->_systemApertureElementContext, "keyColor");
}

- (void)setKeyColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SBSAElementContext keyColor](self->_systemApertureElementContext, "keyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
    -[SBSAElementContext _setKeyColor:](self->_systemApertureElementContext, "_setKeyColor:", v6);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; systemApertureElementContext: %@>"),
               objc_opt_class(),
               self,
               self->_systemApertureElementContext);
}

- (SBSAElementContext)systemApertureElementContext
{
  return self->_systemApertureElementContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemApertureElementContext, 0);
}

@end
