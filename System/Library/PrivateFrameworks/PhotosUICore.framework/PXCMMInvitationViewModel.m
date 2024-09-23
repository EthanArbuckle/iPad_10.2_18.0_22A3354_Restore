@implementation PXCMMInvitationViewModel

- (PXCMMInvitationViewModel)init
{
  PXCMMInvitationViewModel *v2;
  PXCMMInvitationViewModel *v3;
  NSString *posterTitle;
  NSString *posterSubtitle;
  uint64_t v6;
  UIColor *opaqueAncestorBackgroundColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCMMInvitationViewModel;
  v2 = -[PXCMMInvitationViewModel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    posterTitle = v2->_posterTitle;
    v2->_posterTitle = (NSString *)&stru_1E5149688;

    posterSubtitle = v3->_posterSubtitle;
    v3->_posterSubtitle = (NSString *)&stru_1E5149688;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = objc_claimAutoreleasedReturnValue();
    opaqueAncestorBackgroundColor = v3->_opaqueAncestorBackgroundColor;
    v3->_opaqueAncestorBackgroundColor = (UIColor *)v6;

  }
  return v3;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMInvitationViewModel;
  -[PXCMMInvitationViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setIsNew:(BOOL)a3
{
  if (self->_isNew != a3)
  {
    self->_isNew = a3;
    -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setOwner:(id)a3
{
  PXCMMInvitationParticipant *v5;
  PXCMMInvitationParticipant *v6;

  v5 = (PXCMMInvitationParticipant *)a3;
  if (self->_owner != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_owner, a3);
    -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 1024);
    v5 = v6;
  }

}

- (void)setPosterTitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *posterTitle;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModel.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterTitle"));

  }
  v5 = self->_posterTitle;
  if (v5 == v10)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v10, "isEqualToString:", v5);

    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      posterTitle = self->_posterTitle;
      self->_posterTitle = v7;

      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setPosterSubtitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *posterSubtitle;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModel.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterSubtitle"));

  }
  v5 = self->_posterSubtitle;
  if (v5 == v10)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v10, "isEqualToString:", v5);

    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      posterSubtitle = self->_posterSubtitle;
      self->_posterSubtitle = v7;

      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setPosterAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_posterAsset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_posterAsset, a3);
    -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 8);
    v5 = v6;
  }

}

- (void)setPosterMediaProvider:(id)a3
{
  PXUIImageProvider *v5;
  PXUIImageProvider *v6;

  v5 = (PXUIImageProvider *)a3;
  if (self->_posterMediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_posterMediaProvider, a3);
    -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 16);
    v5 = v6;
  }

}

- (void)setAttributedPosterTitle:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedPosterTitle;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedPosterTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      attributedPosterTitle = self->_attributedPosterTitle;
      self->_attributedPosterTitle = v6;

      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setAttributedTitle:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedTitle;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      attributedTitle = self->_attributedTitle;
      self->_attributedTitle = v6;

      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setAttributedSubtitle1:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedSubtitle1;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedSubtitle1;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      attributedSubtitle1 = self->_attributedSubtitle1;
      self->_attributedSubtitle1 = v6;

      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 64);
    }
  }

}

- (void)setAttributedSubtitle2:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedSubtitle2;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedSubtitle2;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      attributedSubtitle2 = self->_attributedSubtitle2;
      self->_attributedSubtitle2 = v6;

      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 128);
    }
  }

}

- (void)setOpaqueAncestorBackgroundColor:(id)a3
{
  UIColor *v6;
  UIColor *v7;
  char v8;
  void *v9;
  UIColor *v10;

  v10 = (UIColor *)a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMInvitationViewModel.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueAncestorBackgroundColor"));

  }
  v6 = self->_opaqueAncestorBackgroundColor;
  if (v6 == v10)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIColor isEqual:](v6, "isEqual:", v10);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_opaqueAncestorBackgroundColor, a3);
      -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PXCMMInvitationViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (PXCMMInvitationParticipant)owner
{
  return self->_owner;
}

- (NSString)posterTitle
{
  return self->_posterTitle;
}

- (NSString)posterSubtitle
{
  return self->_posterSubtitle;
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (NSAttributedString)attributedPosterTitle
{
  return self->_attributedPosterTitle;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSAttributedString)attributedSubtitle1
{
  return self->_attributedSubtitle1;
}

- (NSAttributedString)attributedSubtitle2
{
  return self->_attributedSubtitle2;
}

- (UIColor)opaqueAncestorBackgroundColor
{
  return self->_opaqueAncestorBackgroundColor;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueAncestorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle2, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle1, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_attributedPosterTitle, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_posterSubtitle, 0);
  objc_storeStrong((id *)&self->_posterTitle, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
