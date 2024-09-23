@implementation PXRemoveLibrarySharingSuggestionAction

- (id)actionIdentifier
{
  return CFSTR("RemoveLibrarySharingSuggestionAction");
}

- (id)localizedActionName
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_RemoveFromSharedLibrarySuggestions"));
}

- (void)performAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryRemoveSharingSuggestions(v5, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryAddSharingSuggestions(v5, v4);

}

@end
