@implementation PXSharedLibraryInvitationsGadgetProvider

- (PXSharedLibraryInvitationsGadgetProvider)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5;
  PXSharedLibraryInvitationsGadgetProvider *v6;
  PXSharedLibraryInvitationsGadgetProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryInvitationsGadgetProvider;
  v6 = -[PXGadgetProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statusProvider, a3);

  return v7;
}

- (PXSharedLibraryInvitationsGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsGadgetProvider.m"), 43, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryInvitationsGadgetProvider init]");

  abort();
}

- (PXSharedLibraryInvitationsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsGadgetProvider.m"), 47, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryInvitationsGadgetProvider initWithIdentifier:]");

  abort();
}

- (void)loadDataForGadgets
{
  id v3;

  -[PXSharedLibraryInvitationsGadgetProvider statusProvider](self, "statusProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_58320);

}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  unint64_t ShouldDisplayInvitation;

  -[PXSharedLibraryInvitationsGadgetProvider statusProvider](self, "statusProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldDisplayInvitation = PXSharedLibraryShouldDisplayInvitation(v2);

  return ShouldDisplayInvitation;
}

- (void)generateGadgets
{
  self->_didGenerateGadgets = 1;
  -[PXSharedLibraryInvitationsGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (void)_updateGadgets
{
  void *v3;
  PXSharedLibrary *v4;
  PXSharedLibrary **p_invitation;
  void *v6;
  PXSharedLibraryInvitationGadget *v7;
  PXSharedLibraryInvitationGadget *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PXSharedLibraryInvitationGadget *v12;

  if (self->_didGenerateGadgets)
  {
    -[PXSharedLibraryInvitationsGadgetProvider statusProvider](self, "statusProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (PXSharedLibraryShouldDisplayInvitation(v3))
    {
      objc_msgSend(v3, "invitation");
      v4 = (PXSharedLibrary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    p_invitation = &self->_invitation;
    if (self->_invitation != v4)
    {
      objc_storeStrong((id *)&self->_invitation, v4);
      -[PXGadgetProvider gadgets](self, "gadgets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (*p_invitation)
        v7 = -[PXSharedLibraryInvitationGadget initWithSharedLibraryStatusProvider:invitation:]([PXSharedLibraryInvitationGadget alloc], "initWithSharedLibraryStatusProvider:invitation:", v3, *p_invitation);
      else
        v7 = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__PXSharedLibraryInvitationsGadgetProvider__updateGadgets__block_invoke;
      v10[3] = &unk_1E5142478;
      v11 = v6;
      v12 = v7;
      v8 = v7;
      v9 = v6;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v10);

    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_58320 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsGadgetProvider.m"), 104, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXSharedLibraryInvitationsGadgetProvider _updateGadgets](self, "_updateGadgets");

}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

void __58__PXSharedLibraryInvitationsGadgetProvider__updateGadgets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v3, "removeAllGadgets");
  if (*(_QWORD *)(a1 + 40))
  {
    v5[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addGadgets:", v4);

  }
}

@end
