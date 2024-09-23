@implementation PXSharedLibraryInvitationsHorizontalGadgetProvider

- (void)_updateGadgets
{
  void *v4;
  _BOOL4 ShouldDisplayInvitation;
  void *v6;
  PXHorizontalCollectionGadget *v7;
  void *v8;
  PXSharedLibraryInvitationsGadgetProvider *v9;
  void *v10;
  PXSharedLibraryInvitationsGadgetProvider *v11;
  PXHorizontalCollectionGadget *v12;
  void *v13;
  void *v14;
  PXHorizontalCollectionGadget *v15;
  _QWORD v16[4];
  PXHorizontalCollectionGadget *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_didGenerateGadgets)
  {
    -[PXSharedLibraryInvitationsHorizontalGadgetProvider statusProvider](self, "statusProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldDisplayInvitation = PXSharedLibraryShouldDisplayInvitation(v4);

    if (ShouldDisplayInvitation)
    {
      -[PXGadgetProvider gadgets](self, "gadgets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsHorizontalGadgetProvider.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[horizontalGadget isKindOfClass:[PXHorizontalCollectionGadget class]]"));

        }
      }
      else
      {
        v9 = [PXSharedLibraryInvitationsGadgetProvider alloc];
        -[PXSharedLibraryInvitationsHorizontalGadgetProvider statusProvider](self, "statusProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[PXSharedLibraryInvitationsGadgetProvider initWithSharedLibraryStatusProvider:](v9, "initWithSharedLibraryStatusProvider:", v10);

        v12 = [PXHorizontalCollectionGadget alloc];
        v18[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[PXHorizontalCollectionGadget initWithProviders:](v12, "initWithProviders:", v13);

        -[PXHorizontalCollectionGadget setGadgetType:](v7, "setGadgetType:", 19);
        -[PXHorizontalCollectionGadget setDefaultColumnSpan:](v7, "setDefaultColumnSpan:", 3);
        -[PXHorizontalCollectionGadget setIsFixedHeight:](v7, "setIsFixedHeight:", 1);
        -[PXHorizontalCollectionGadget performChanges:](v7, "performChanges:", &__block_literal_global_191624);

      }
    }
    else
    {
      v7 = 0;
    }
    -[PXGadgetProvider gadgets](self, "gadgets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();

    if (v15 != v7)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68__PXSharedLibraryInvitationsHorizontalGadgetProvider__updateGadgets__block_invoke_2;
      v16[3] = &unk_1E5145360;
      v17 = v7;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v16);

    }
  }
}

- (PXSharedLibraryInvitationsHorizontalGadgetProvider)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5;
  PXSharedLibraryInvitationsHorizontalGadgetProvider *v6;
  PXSharedLibraryInvitationsHorizontalGadgetProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryInvitationsHorizontalGadgetProvider;
  v6 = -[PXGadgetProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statusProvider, a3);

  return v7;
}

- (PXSharedLibraryInvitationsHorizontalGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsHorizontalGadgetProvider.m"), 77, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryInvitationsHorizontalGadgetProvider init]");

  abort();
}

- (PXSharedLibraryInvitationsHorizontalGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsHorizontalGadgetProvider.m"), 81, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryInvitationsHorizontalGadgetProvider initWithIdentifier:]");

  abort();
}

- (void)loadDataForGadgets
{
  id v3;

  -[PXSharedLibraryInvitationsHorizontalGadgetProvider statusProvider](self, "statusProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_191611);

}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  unint64_t ShouldDisplayInvitation;

  -[PXSharedLibraryInvitationsHorizontalGadgetProvider statusProvider](self, "statusProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldDisplayInvitation = PXSharedLibraryShouldDisplayInvitation(v2);

  return ShouldDisplayInvitation;
}

- (void)generateGadgets
{
  self->_didGenerateGadgets = 1;
  -[PXSharedLibraryInvitationsHorizontalGadgetProvider _updateGadgets](self, "_updateGadgets");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_191611 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryInvitationsHorizontalGadgetProvider.m"), 107, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXSharedLibraryInvitationsHorizontalGadgetProvider _updateGadgets](self, "_updateGadgets");

}

- (NSDate)mostRecentContentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (int64_t)forYouContentIdentifier
{
  return 0;
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

void __68__PXSharedLibraryInvitationsHorizontalGadgetProvider__updateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = a2;
    objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addGadgets:", v4, v5, v6);

  }
  else
  {
    v4 = a2;
    objc_msgSend(v4, "removeAllGadgets");
  }

}

void __68__PXSharedLibraryInvitationsHorizontalGadgetProvider__updateGadgets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationsGadgetTitle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCollectionTitle:", v3);

}

@end
