@implementation SBSAContainerViewDescriptionMutator

- (void)setShadowStyle:(int64_t)a3
{
  id v4;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShadowStyle:", a3);

}

- (void)setKeyLineTintColor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBSAContainerViewDescriptionMutator keyLineTintColor](self, "keyLineTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setKeyLineTintColor:", v7);

  }
}

- (UIColor)keyLineTintColor
{
  void *v2;
  void *v3;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyLineTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  void *v4;
  SBSystemApertureContainerRenderingConfiguration v5;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *a3;
  objc_msgSend(v4, "_setRenderingConfiguration:", &v5);

}

- (id)_containerViewDescription
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[SBSAViewDescriptionMutator viewDescription](self, "viewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)setKeyLineMode:(int64_t)a3
{
  id v4;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setKeyLineMode:", a3);

}

- (void)setContentCenter:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContentCenter:", x, y);

}

- (void)setContentBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContentBounds:", x, y, width, height);

}

- (void)setAssociatedSystemApertureElementIdentity:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  SBSAElementIdentification *v7;
  void *v8;
  void *v9;
  SBSAElementIdentification *v10;
  id v11;

  v11 = a3;
  -[SBSAContainerViewDescriptionMutator associatedSystemApertureElementIdentity](self, "associatedSystemApertureElementIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v7 = [SBSAElementIdentification alloc];
      objc_msgSend(v11, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "elementIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v7, "initWithClientIdentifier:elementIdentifier:", v8, v9);
      objc_msgSend(v6, "_setAssociatedSystemApertureElementIdentity:", v10);

    }
    else
    {
      objc_msgSend(v6, "_setAssociatedSystemApertureElementIdentity:", 0);
    }

  }
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  void *v2;
  void *v3;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedSystemApertureElementIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAElementIdentifying *)v3;
}

- (void)setSampledBackgroundLuminanceLevel:(int64_t)a3
{
  id v4;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSampledBackgroundLuminanceLevel:", a3);

}

- (void)setContentScale:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContentScale:", width, height);

}

- (CGSize)contentScale
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScale");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)contentBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)contentCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentCenter");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (int64_t)keyLineMode
{
  void *v2;
  int64_t v3;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyLineMode");

  return v3;
}

- (int64_t)sampledBackgroundLuminanceLevel
{
  void *v2;
  int64_t v3;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sampledBackgroundLuminanceLevel");

  return v3;
}

- (int64_t)shadowStyle
{
  void *v2;
  int64_t v3;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shadowStyle");

  return v3;
}

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  void *v4;
  SBSystemApertureContainerRenderingConfiguration *result;
  void *v6;

  -[SBSAContainerViewDescriptionMutator _containerViewDescription](self, "_containerViewDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "renderingConfiguration");
    v4 = v6;
  }
  else
  {
    retstr->renderingStyle = 0;
    retstr->cloningStyle = 0;
    *(_QWORD *)&retstr->alwaysRenderInSnapshots = 0;
  }

  return result;
}

@end
