@implementation PXLibraryFilterState

- (void)setViewMode:(int64_t)a3
{
  void *v5;
  int v6;
  _QWORD v7[5];

  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    -[PXLibraryFilterObservableViewMode setViewMode:](self->_viewModeObservable, "setViewMode:");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__PXLibraryFilterState_setViewMode___block_invoke;
    v7[3] = &unk_1E51479C8;
    v7[4] = self;
    -[PXLibraryFilterState performChanges:](self, "performChanges:", v7);
    -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasSharedLibraryOrPreview");

    PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview(a3, v6);
  }
}

- (void)preferencesDidChange
{
  void *v3;
  int v4;
  CFIndex LibraryFilterViewModeWithSharedLibraryOrPreview;
  int AppBooleanValue;
  BOOL v7;
  uint64_t v8;
  Boolean keyExistsAndHasValidFormat;

  -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSharedLibraryOrPreview");

  if (v4)
  {
    LibraryFilterViewModeWithSharedLibraryOrPreview = PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview(1);
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SharedLibraryBadgingEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v7 = AppBooleanValue == 0;
    else
      v7 = 0;
    v8 = !v7;
    -[PXLibraryFilterState setViewMode:](self, "setViewMode:", LibraryFilterViewModeWithSharedLibraryOrPreview);
    -[PXLibraryFilterState setSharedLibraryBadgeEnabled:](self, "setSharedLibraryBadgeEnabled:", v8);
  }
  else
  {
    -[PXLibraryFilterState setViewMode:](self, "setViewMode:", 0);
  }
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_viewModeObservable, 0);
}

- (PXLibraryFilterState)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5;
  PXLibraryFilterState *v6;
  PXLibraryFilterState *v7;
  int v8;
  _TtC12PhotosUICore33PXLibraryFilterObservableViewMode *v9;
  _TtC12PhotosUICore33PXLibraryFilterObservableViewMode *viewModeObservable;
  int AppBooleanValue;
  BOOL v12;
  char v13;
  objc_super v15;
  Boolean keyExistsAndHasValidFormat;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXLibraryFilterState;
  v6 = -[PXLibraryFilterState init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharedLibraryStatusProvider, a3);
    v8 = objc_msgSend(v5, "hasSharedLibraryOrPreview");
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v7->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v7, PXSharedLibraryStatusProviderObservationContext_37675);
    v7->_viewMode = PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview(v8);
    v9 = -[PXLibraryFilterObservableViewMode initWithViewMode:]([_TtC12PhotosUICore33PXLibraryFilterObservableViewMode alloc], "initWithViewMode:", v7->_viewMode);
    viewModeObservable = v7->_viewModeObservable;
    v7->_viewModeObservable = v9;

    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SharedLibraryBadgingEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v12 = AppBooleanValue == 0;
    else
      v12 = 0;
    v13 = !v12;
    v7->_sharedLibraryBadgeEnabled = v13;
    if (v5)
      PXRegisterPreferencesObserver(v7);
  }

  return v7;
}

- (BOOL)isFiltering
{
  return !-[PXLibraryFilterState isLibraryFilterActive:](self, "isLibraryFilterActive:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    PXUnregisterPreferencesObserver(self);
  v4.receiver = self;
  v4.super_class = (Class)PXLibraryFilterState;
  -[PXLibraryFilterState dealloc](&v4, sel_dealloc);
}

- (BOOL)isLibraryFilterActive:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;

  v4 = -[PXLibraryFilterState viewMode](self, "viewMode");
  v5 = a3 == 1;
  if (a3 == 2)
    v5 = 2;
  return v4 == v5;
}

- (BOOL)isEqual:(id)a3
{
  PXLibraryFilterState *v4;
  PXLibraryFilterState *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (PXLibraryFilterState *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXLibraryFilterState viewMode](self, "viewMode");
      v7 = -[PXLibraryFilterState viewMode](v5, "viewMode");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (PXLibraryFilterState)init
{
  return -[PXLibraryFilterState initWithSharedLibraryStatusProvider:](self, "initWithSharedLibraryStatusProvider:", 0);
}

- (NSString)description
{
  unint64_t v2;
  void *v3;

  v2 = -[PXLibraryFilterState viewMode](self, "viewMode");
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E511BDE0[v2], objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXLibraryFilterState *v4;
  void *v5;
  uint64_t v6;

  v4 = [PXLibraryFilterState alloc];
  -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:](v4, "initWithSharedLibraryStatusProvider:", v5);

  *(_QWORD *)(v6 + 104) = -[PXLibraryFilterState viewMode](self, "viewMode");
  *(_BYTE *)(v6 + 96) = -[PXLibraryFilterState isSharedLibraryBadgeEnabled](self, "isSharedLibraryBadgeEnabled");
  return (id)v6;
}

- (void)setSharedLibraryBadgeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v4[5];

  if (self->_sharedLibraryBadgeEnabled != a3)
  {
    v3 = a3;
    self->_sharedLibraryBadgeEnabled = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__PXLibraryFilterState_setSharedLibraryBadgeEnabled___block_invoke;
    v4[3] = &unk_1E51479C8;
    v4[4] = self;
    -[PXLibraryFilterState performChanges:](self, "performChanges:", v4);
    PXPreferencesSetBool(CFSTR("SharedLibraryBadgingEnabled"), v3);
  }
}

- (unsigned)sharingFilter
{
  return PXSharingFilterFromLibraryFilterViewMode(-[PXLibraryFilterState viewMode](self, "viewMode"));
}

- (int64_t)observableViewMode
{
  return -[PXLibraryFilterObservableViewMode viewMode](self->_viewModeObservable, "viewMode");
}

- (id)predicateForUseCase:(unint64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLibraryFilterState.m"), 171, CFSTR("Use of this method is deprecated: %@"), v6);

  return 0;
}

- (NSString)localizedDescription
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;

  v3 = -[PXLibraryFilterState viewMode](self, "viewMode");
  if (v3 == 2)
  {
    -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hasPreview");
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_Shared"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3 == 1)
    {
      v4 = CFSTR("PXSharedLibrary_FilterMenu_Personal");
    }
    else
    {
      if (v3)
      {
        v6 = &stru_1E5149688;
        return (NSString *)v6;
      }
      v4 = CFSTR("PXSharedLibrary_FilterMenu_All");
    }
    PXLocalizedSharedLibraryString(v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)localizedFooterDescription
{
  int64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = -[PXLibraryFilterState viewMode](self, "viewMode");
  if (v3 == 2)
  {
    -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPreview"))
      v6 = CFSTR("PXSharedLibrary_FilterFooter_Preview");
    else
      v6 = CFSTR("PXSharedLibrary_FilterFooter_Shared");
    PXLocalizedSharedLibraryString(v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3 == 1)
    {
      v4 = CFSTR("PXSharedLibrary_FilterFooter_Personal");
    }
    else
    {
      if (v3)
      {
        v7 = &stru_1E5149688;
        return (NSString *)v7;
      }
      v4 = CFSTR("PXSharedLibrary_FilterFooter_All");
    }
    PXLocalizedSharedLibraryString(v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  char v7;

  if ((a4 & 3) != 0 && (void *)PXSharedLibraryStatusProviderObservationContext_37675 == a5)
  {
    -[PXLibraryFilterState sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSharedLibraryOrPreview");

    if ((v7 & 1) == 0)
      -[PXLibraryFilterState setViewMode:](self, "setViewMode:", 0);
  }
}

- (BOOL)isSharedLibraryBadgeEnabled
{
  return self->_sharedLibraryBadgeEnabled;
}

- (_TtC12PhotosUICore33PXLibraryFilterObservableViewMode)viewModeObservable
{
  return self->_viewModeObservable;
}

uint64_t __53__PXLibraryFilterState_setSharedLibraryBadgeEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
}

uint64_t __36__PXLibraryFilterState_setViewMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

@end
