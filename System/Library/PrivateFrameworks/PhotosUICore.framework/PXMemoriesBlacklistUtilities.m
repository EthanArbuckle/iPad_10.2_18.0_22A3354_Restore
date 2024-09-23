@implementation PXMemoriesBlacklistUtilities

+ (id)personWithLocalIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID = %@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v6);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 1);
  v11[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v7);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)accessoryUIViewSpecForBlacklistedFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 1)
  {
    objc_msgSend(v4, "personLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "personWithLocalIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXMemoriesBlacklistPersonAccessoryViewSpec specWithPerson:](PXMemoriesBlacklistPersonAccessoryViewSpec, "specWithPerson:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "type") == 4096)
  {
    objc_msgSend(v4, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXMemoriesBlacklistPlaceLocationAccessoryViewSpec specWithLocation:regionRadius:](PXMemoriesBlacklistPlaceLocationAccessoryViewSpec, "specWithLocation:regionRadius:", v8, -1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "type") == 0x20000)
  {
    +[PXMemoriesBlacklistPlaceAreaAccesoryViewSpec spec](PXMemoriesBlacklistPlaceAreaAccesoryViewSpec, "spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
