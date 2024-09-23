@implementation SBSAElementDescriptionMutator

- (SBSAElementDescriptionMutator)initWithElementDescription:(id)a3
{
  id v5;
  SBSAElementDescriptionMutator *v6;
  SBSAElementDescriptionMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementDescriptionMutator;
  v6 = -[SBSAElementDescriptionMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elementDescription, a3);

  return v7;
}

- (NSUUID)interfaceElementIdentifier
{
  return -[SBSAElementDescription interfaceElementIdentifier](self->_elementDescription, "interfaceElementIdentifier");
}

- (void)setInterfaceElementIdentifier:(id)a3
{
  -[SBSAElementDescription _setInterfaceElementIdentifier:](self->_elementDescription, "_setInterfaceElementIdentifier:", a3);
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  return -[SBSAElementDescription associatedSystemApertureElementIdentity](self->_elementDescription, "associatedSystemApertureElementIdentity");
}

- (void)setAssociatedSystemApertureElementIdentity:(id)a3
{
  void *v4;
  char v5;
  SBSAElementDescription *elementDescription;
  SBSAElementIdentification *v7;
  void *v8;
  void *v9;
  SBSAElementIdentification *v10;
  id v11;

  v11 = a3;
  -[SBSAElementDescriptionMutator associatedSystemApertureElementIdentity](self, "associatedSystemApertureElementIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    elementDescription = self->_elementDescription;
    if (v11)
    {
      v7 = [SBSAElementIdentification alloc];
      objc_msgSend(v11, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "elementIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v7, "initWithClientIdentifier:elementIdentifier:", v8, v9);
      -[SBSAElementDescription _setAssociatedSystemApertureElementIdentity:](elementDescription, "_setAssociatedSystemApertureElementIdentity:", v10);

    }
    else
    {
      -[SBSAElementDescription _setAssociatedSystemApertureElementIdentity:](elementDescription, "_setAssociatedSystemApertureElementIdentity:", 0);
    }
  }

}

- (int)appearState
{
  return -[SBSAElementDescription appearState](self->_elementDescription, "appearState");
}

- (void)setAppearState:(int)a3
{
  -[SBSAElementDescription _setAppearState:](self->_elementDescription, "_setAppearState:", *(_QWORD *)&a3);
}

- (double)sensorObscuringShadowProgress
{
  double result;

  -[SBSAElementDescription sensorObscuringShadowProgress](self->_elementDescription, "sensorObscuringShadowProgress");
  return result;
}

- (void)setSensorObscuringShadowProgress:(double)a3
{
  -[SBSAElementDescription _setSensorObscuringShadowProgress:](self->_elementDescription, "_setSensorObscuringShadowProgress:", a3);
}

- (double)leadingViewBlurProgress
{
  double result;

  -[SBSAElementDescription leadingViewBlurProgress](self->_elementDescription, "leadingViewBlurProgress");
  return result;
}

- (void)setLeadingViewBlurProgress:(double)a3
{
  -[SBSAElementDescription _setLeadingViewBlurProgress:](self->_elementDescription, "_setLeadingViewBlurProgress:", a3);
}

- (double)leadingViewAlpha
{
  double result;

  -[SBSAElementDescription leadingViewAlpha](self->_elementDescription, "leadingViewAlpha");
  return result;
}

- (void)setLeadingViewAlpha:(double)a3
{
  -[SBSAElementDescription _setLeadingViewAlpha:](self->_elementDescription, "_setLeadingViewAlpha:", a3);
}

- (double)leadingViewSquishProgress
{
  double result;

  -[SBSAElementDescription leadingViewSquishProgress](self->_elementDescription, "leadingViewSquishProgress");
  return result;
}

- (void)setLeadingViewSquishProgress:(double)a3
{
  -[SBSAElementDescription _setLeadingViewSquishProgress:](self->_elementDescription, "_setLeadingViewSquishProgress:", a3);
}

- (CGSize)leadingViewScale
{
  double v2;
  double v3;
  CGSize result;

  -[SBSAElementDescription leadingViewScale](self->_elementDescription, "leadingViewScale");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLeadingViewScale:(CGSize)a3
{
  -[SBSAElementDescription _setLeadingViewScale:](self->_elementDescription, "_setLeadingViewScale:", a3.width, a3.height);
}

- (double)trailingViewBlurProgress
{
  double result;

  -[SBSAElementDescription trailingViewBlurProgress](self->_elementDescription, "trailingViewBlurProgress");
  return result;
}

- (void)setTrailingViewBlurProgress:(double)a3
{
  -[SBSAElementDescription _setTrailingViewBlurProgress:](self->_elementDescription, "_setTrailingViewBlurProgress:", a3);
}

- (double)trailingViewAlpha
{
  double result;

  -[SBSAElementDescription trailingViewAlpha](self->_elementDescription, "trailingViewAlpha");
  return result;
}

- (void)setTrailingViewAlpha:(double)a3
{
  -[SBSAElementDescription _setTrailingViewAlpha:](self->_elementDescription, "_setTrailingViewAlpha:", a3);
}

- (double)trailingViewSquishProgress
{
  double result;

  -[SBSAElementDescription trailingViewSquishProgress](self->_elementDescription, "trailingViewSquishProgress");
  return result;
}

- (void)setTrailingViewSquishProgress:(double)a3
{
  -[SBSAElementDescription _setTrailingViewSquishProgress:](self->_elementDescription, "_setTrailingViewSquishProgress:", a3);
}

- (CGSize)trailingViewScale
{
  double v2;
  double v3;
  CGSize result;

  -[SBSAElementDescription trailingViewScale](self->_elementDescription, "trailingViewScale");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTrailingViewScale:(CGSize)a3
{
  -[SBSAElementDescription _setTrailingViewScale:](self->_elementDescription, "_setTrailingViewScale:", a3.width, a3.height);
}

- (double)minimalViewBlurProgress
{
  double result;

  -[SBSAElementDescription minimalViewBlurProgress](self->_elementDescription, "minimalViewBlurProgress");
  return result;
}

- (void)setMinimalViewBlurProgress:(double)a3
{
  -[SBSAElementDescription _setMinimalViewBlurProgress:](self->_elementDescription, "_setMinimalViewBlurProgress:", a3);
}

- (double)minimalViewAlpha
{
  double result;

  -[SBSAElementDescription minimalViewAlpha](self->_elementDescription, "minimalViewAlpha");
  return result;
}

- (void)setMinimalViewAlpha:(double)a3
{
  -[SBSAElementDescription _setMinimalViewAlpha:](self->_elementDescription, "_setMinimalViewAlpha:", a3);
}

- (double)minimalViewSquishProgress
{
  double result;

  -[SBSAElementDescription minimalViewSquishProgress](self->_elementDescription, "minimalViewSquishProgress");
  return result;
}

- (void)setMinimalViewSquishProgress:(double)a3
{
  -[SBSAElementDescription _setMinimalViewSquishProgress:](self->_elementDescription, "_setMinimalViewSquishProgress:", a3);
}

- (CGSize)minimalViewScale
{
  double v2;
  double v3;
  CGSize result;

  -[SBSAElementDescription minimalViewScale](self->_elementDescription, "minimalViewScale");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMinimalViewScale:(CGSize)a3
{
  -[SBSAElementDescription _setMinimalViewScale:](self->_elementDescription, "_setMinimalViewScale:", a3.width, a3.height);
}

- (double)customContentBlurProgress
{
  double result;

  -[SBSAElementDescription customContentBlurProgress](self->_elementDescription, "customContentBlurProgress");
  return result;
}

- (void)setCustomContentBlurProgress:(double)a3
{
  -[SBSAElementDescription _setCustomContentBlurProgress:](self->_elementDescription, "_setCustomContentBlurProgress:", a3);
}

- (double)customContentAlpha
{
  double result;

  -[SBSAElementDescription customContentAlpha](self->_elementDescription, "customContentAlpha");
  return result;
}

- (void)setCustomContentAlpha:(double)a3
{
  -[SBSAElementDescription _setCustomContentAlpha:](self->_elementDescription, "_setCustomContentAlpha:", a3);
}

- (double)snapshotViewBlurProgress
{
  double result;

  -[SBSAElementDescription snapshotViewBlurProgress](self->_elementDescription, "snapshotViewBlurProgress");
  return result;
}

- (void)setSnapshotViewBlurProgress:(double)a3
{
  -[SBSAElementDescription _setSnapshotViewBlurProgress:](self->_elementDescription, "_setSnapshotViewBlurProgress:", a3);
}

- (double)snapshotViewAlpha
{
  double result;

  -[SBSAElementDescription snapshotViewAlpha](self->_elementDescription, "snapshotViewAlpha");
  return result;
}

- (void)setSnapshotViewAlpha:(double)a3
{
  -[SBSAElementDescription _setSnapshotViewAlpha:](self->_elementDescription, "_setSnapshotViewAlpha:", a3);
}

- (NSString)snapshotReason
{
  return -[SBSAElementDescription snapshotReason](self->_elementDescription, "snapshotReason");
}

- (void)setSnapshotReason:(id)a3
{
  -[SBSAElementDescription _setSnapshotReason:](self->_elementDescription, "_setSnapshotReason:", a3);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; elementDescription: %@>"),
                       objc_opt_class(),
                       self,
                       self->_elementDescription);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementDescription, 0);
}

@end
