@implementation PLDisconnectedManagedObjectContext

- (BOOL)isDatabaseCreationContext
{
  return 1;
}

- (void)setPhotoLibrary:(id)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObjectContext.m"), 1764, CFSTR("PLDisconnectedManagedObjectContext can't be associated with a photoLibrary"));

  }
}

+ (BOOL)canMergeRemoteChanges
{
  return 0;
}

+ (BOOL)shouldHavePhotoLibrary
{
  return 0;
}

@end
