@implementation PhotosControlArbitraryPersistentContainer

+ (id)defaultDirectoryURL
{
  return (id)s_directoryURL;
}

+ (void)setDefaultDirectoryURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PhotosControlPhotoLibraryCommand.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v6 = (void *)s_directoryURL;
  s_directoryURL = (uint64_t)v5;

}

@end
