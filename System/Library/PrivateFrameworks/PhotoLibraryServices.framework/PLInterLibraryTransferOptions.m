@implementation PLInterLibraryTransferOptions

- (id)_sortedEntityNamesAsString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLInterLibraryTransferOptions excludedEntityNames](self, "excludedEntityNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLInterLibraryTransferOptions _sortedEntityNamesAsString](self, "_sortedEntityNamesAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (excluding %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLInterLibraryTransferOptions _sortedEntityNamesAsString](self, "_sortedEntityNamesAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> (excluding %@)"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLInterLibraryTransferOptions excludedEntityNames](self, "excludedEntityNames");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("excludedEntityNames"));

}

- (PLInterLibraryTransferOptions)initWithCoder:(id)a3
{
  id v4;
  PLInterLibraryTransferOptions *v5;
  void *v6;
  uint64_t v7;
  NSSet *excludedEntityNames;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLInterLibraryTransferOptions;
  v5 = -[PLInterLibraryTransferOptions init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("excludedEntityNames"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      excludedEntityNames = v5->_excludedEntityNames;
      v5->_excludedEntityNames = (NSSet *)v7;

    }
  }

  return v5;
}

- (NSSet)excludedEntityNames
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExcludedEntityNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSSet)excludedAttributeNames
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExcludedAttributeNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)updateExistingObjects
{
  return self->_updateExistingObjects;
}

- (void)setUpdateExistingObjects:(BOOL)a3
{
  self->_updateExistingObjects = a3;
}

- (BOOL)allowSavedAssetTypeChanges
{
  return self->_allowSavedAssetTypeChanges;
}

- (void)setAllowSavedAssetTypeChanges:(BOOL)a3
{
  self->_allowSavedAssetTypeChanges = a3;
}

- (BOOL)ignoreMissingSourceFiles
{
  return self->_ignoreMissingSourceFiles;
}

- (void)setIgnoreMissingSourceFiles:(BOOL)a3
{
  self->_ignoreMissingSourceFiles = a3;
}

- (BOOL)ignoreMissingSourceFileURLs
{
  return self->_ignoreMissingSourceFileURLs;
}

- (void)setIgnoreMissingSourceFileURLs:(BOOL)a3
{
  self->_ignoreMissingSourceFileURLs = a3;
}

- (NSArray)keysForDeDupe
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeysForDeDupe:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unsigned)allowDeleteOfSavedAssetTypes
{
  return self->_allowDeleteOfSavedAssetTypes;
}

- (void)setAllowDeleteOfSavedAssetTypes:(unsigned __int16)a3
{
  self->_allowDeleteOfSavedAssetTypes = a3;
}

- (BOOL)skipContextSave
{
  return self->_skipContextSave;
}

- (void)setSkipContextSave:(BOOL)a3
{
  self->_skipContextSave = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysForDeDupe, 0);
  objc_storeStrong((id *)&self->_excludedAttributeNames, 0);
  objc_storeStrong((id *)&self->_excludedEntityNames, 0);
}

+ (id)newTransferOptionsForAssetsFromSyndicationToSystem
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init((Class)a1);
  v19 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedComment entityName](PLCloudSharedComment, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedKeyword entityName](PLManagedKeyword, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMemory entityName](PLMemory, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMoment entityName](PLMoment, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMomentShare entityName](PLMomentShare, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson entityName](PLPerson, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPersonReference entityName](PLPersonReference, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShareParticipant entityName](PLShareParticipant, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion entityName](PLSuggestion, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v19, "initWithObjects:", v23, v18, v22, v17, v21, v20, v16, v15, v14, v13, v12, v3, v4, v5, v6, v7, 0);
  objc_msgSend(v2, "setExcludedEntityNames:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v2, "setExcludedAttributeNames:", v9);

  objc_msgSend(v2, "setUpdateExistingObjects:", 1);
  objc_msgSend(v2, "setAllowSavedAssetTypeChanges:", 0);
  objc_msgSend(v2, "setIgnoreMissingSourceFiles:", 1);
  objc_msgSend(v2, "setIgnoreMissingSourceFileURLs:", 1);
  v24[0] = CFSTR("additionalAttributes.syndicationIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeysForDeDupe:", v10);

  objc_msgSend(v2, "setAllowDeleteOfSavedAssetTypes:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"));
  return v2;
}

+ (id)newTransferOptionsForPersonFromSystemToSyndication
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;

  v16 = objc_alloc_init((Class)a1);
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDetectedFaceGroup entityName](PLDetectedFaceGroup, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedKeyword entityName](PLManagedKeyword, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson entityName](PLPerson, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPersonReference entityName](PLPersonReference, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShareParticipant entityName](PLShareParticipant, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUserFeedback entityName](PLUserFeedback, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v17, "initWithObjects:", v18, v14, v2, v15, v13, v3, v4, v5, v6, v7, v8, 0);
  objc_msgSend(v16, "setExcludedEntityNames:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("faceCount"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExcludedAttributeNames:", v10);

  objc_msgSend(v16, "setUpdateExistingObjects:", 1);
  v11 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v16, "setKeysForDeDupe:", v11);

  return v16;
}

+ (id)newTransferOptionsForFaceCropFromSyndicationToSystem
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_alloc_init((Class)a1);
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson entityName](PLPerson, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, 0);
  objc_msgSend(v2, "setExcludedEntityNames:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v2, "setExcludedAttributeNames:", v8);

  objc_msgSend(v2, "setUpdateExistingObjects:", 0);
  v9 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v2, "setKeysForDeDupe:", v9);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
