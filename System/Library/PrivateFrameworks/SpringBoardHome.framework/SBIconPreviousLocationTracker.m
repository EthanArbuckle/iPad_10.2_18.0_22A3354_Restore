@implementation SBIconPreviousLocationTracker

- (void)captureLocationInfoForIcon:(id)a3 inModel:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMapTable *v10;
  NSMapTable *previousIconLocations;
  SBIconPreviousLocationInfo *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a4, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForIcon:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "folderContainingIndexPath:relativeIndexPath:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8 && (void *)v8 != v6)
    {
      if (!self->_previousIconLocations)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        previousIconLocations = self->_previousIconLocations;
        self->_previousIconLocations = v10;

      }
      v12 = objc_alloc_init(SBIconPreviousLocationInfo);
      -[SBIconPreviousLocationInfo setFolder:](v12, "setFolder:", v9);
      objc_msgSend(v9, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconPreviousLocationInfo setFolderName:](v12, "setFolderName:", v13);

      -[NSMapTable setObject:forKey:](self->_previousIconLocations, "setObject:forKey:", v12, v14);
    }
  }
  else
  {
    v9 = 0;
  }

}

- (id)previousLocationInfoForIcon:(id)a3
{
  return -[NSMapTable objectForKey:](self->_previousIconLocations, "objectForKey:", a3);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_previousIconLocations, 0);
}

@end
