@implementation PXSharedLibraryInvitationGadget

- (PXSharedLibraryInvitationGadget)initWithSharedLibraryStatusProvider:(id)a3 invitation:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXSharedLibraryInvitationGadget *v11;
  PXSharedLibraryInvitationGadget *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationGadget.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedLibraryStatusProvider"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationGadget.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryInvitationGadget;
  v11 = -[PXSharedLibraryInvitationGadget init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusProvider, a3);
    objc_storeStrong((id *)&v12->_invitation, a4);
  }

  return v12;
}

- (PXSharedLibraryInvitationGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationGadget.m"), 55, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryInvitationGadget init]");

  abort();
}

- (unint64_t)gadgetType
{
  return 19;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  PXSharedLibraryInvitationView *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self->_invitationView;
  if (!v6)
  {
    v6 = objc_alloc_init(PXSharedLibraryInvitationView);
    -[PXSharedLibrary owner](self->_invitation, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationView setOwner:](v6, "setOwner:", v9);

  }
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  -[PXSharedLibraryInvitationView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v7, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  PXSharedLibraryInvitationView *invitationView;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PXSharedLibraryInvitationView *v12;

  v12 = (PXSharedLibraryInvitationView *)a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationGadget.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationView px_descriptionForAssertionMessage](v12, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationGadget.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  invitationView = self->_invitationView;
  self->_invitationView = v12;

  -[PXSharedLibraryInvitationView setDelegate:](self->_invitationView, "setDelegate:", self);
  -[PXSharedLibrary owner](self->_invitation, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryInvitationView setOwner:](self->_invitationView, "setOwner:", v6);

}

- (void)userDidSelectGadget
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  if (self->_invitation)
  {
    -[PXSharedLibraryInvitationGadget delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationEnvironmentForGadget:", self);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[PXSharedLibraryInvitationGadget statusProvider](self, "statusProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryViewInvitation((uint64_t)v4, self->_invitation, 0, v6, CFSTR("Invitation Gadget"), 0);

  }
  else
  {
    PLSharedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Invitation Gadget: Attempting to view nil shared library invitation!", buf, 2u);
    }

  }
}

- (BOOL)supportsHighlighting
{
  return 1;
}

- (id)uniqueGadgetIdentifier
{
  void *v2;
  void *v3;

  -[PXSharedLibraryInvitationGadget invitation](self, "invitation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)invitationViewSizeThatFitsDidChange:(id)a3
{
  id v4;

  -[PXSharedLibraryInvitationGadget delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 64);

}

- (id)contextMenuActionsForInvitationView:(id)a3
{
  return PXSharedLibraryContextMenuActionsForGadget(self, self->_invitation, a3);
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (PXSharedLibrary)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitationView, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
