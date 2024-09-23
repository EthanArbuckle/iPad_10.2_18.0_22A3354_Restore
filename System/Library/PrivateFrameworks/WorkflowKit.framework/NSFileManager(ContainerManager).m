@implementation NSFileManager(ContainerManager)

- (id)wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:()ContainerManager error:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+ContainerManager.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier.length"));

  }
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");
  v7 = container_create_or_lookup_path_for_current_user();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
