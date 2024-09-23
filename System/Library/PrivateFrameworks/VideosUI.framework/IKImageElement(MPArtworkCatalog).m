@implementation IKImageElement(MPArtworkCatalog)

- (id)artworkCatalog
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[VideosExtrasRootViewController currentController](VideosExtrasRootViewController, "currentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CC2328]);
  objc_msgSend(v2, "artworkDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithToken:dataSource:", a1, v4);

  objc_msgSend(v2, "artworkDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "areRepresentationsAvailableForCatalog:", v5);

  if ((_DWORD)v4)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

@end
