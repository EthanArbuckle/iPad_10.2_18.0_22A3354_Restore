@implementation PHProject(PhotosUICore)

- (id)px_rootCollectionList
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "photoLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "px_virtualCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootProjectCollectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (const)px_navigationURLHost
{
  return CFSTR("project");
}

@end
