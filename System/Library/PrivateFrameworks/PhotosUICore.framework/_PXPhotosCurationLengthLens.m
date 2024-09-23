@implementation _PXPhotosCurationLengthLens

- (_PXPhotosCurationLengthLens)initWithCurationLength:(int64_t)a3 isDefault:(BOOL)a4
{
  void *v7;
  void *v10;

  if ((unint64_t)(a3 - 1) >= 5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewLens.m"), 203, CFSTR("Creating a lens with undefined curation length is not supported."));

      abort();
    }
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotosGridLensSummary"), CFSTR("LemonadeLocalizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PXPhotosViewLens initWithTitle:symbolName:defaultSectionBodyStyle:](self, "initWithTitle:symbolName:defaultSectionBodyStyle:", v7, 0, 3);

  }
  self->_curationLength = a3;
  self->_isDefaultCurationLength = a4;
  return self;
}

- (BOOL)allowsActionType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _PXPhotosViewLensAllowedActionsForCuratedLens_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_PXPhotosViewLensAllowedActionsForCuratedLens_onceToken, &__block_literal_global_254_152976);
  v5 = objc_msgSend((id)_PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions, "containsObject:", v4);

  return v5;
}

- (BOOL)wantsCuration
{
  return 1;
}

- (BOOL)ignoresTopSafeAreaInset
{
  return 1;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (BOOL)isDefaultCurationLength
{
  return self->_isDefaultCurationLength;
}

@end
