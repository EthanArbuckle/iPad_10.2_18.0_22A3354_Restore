@implementation PXMoveAssetsToPersonalLibraryAction

- (id)actionIdentifier
{
  return CFSTR("MoveAssetsToPersonalLibrary");
}

- (id)localizedActionName
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToPersonalLibrary"));
}

- (void)performAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryMoveAssetsToPersonalLibrary(v5, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAssetsAction assets](self, "assets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryMoveAssetsToSharedLibrary(v5, v4);

}

@end
