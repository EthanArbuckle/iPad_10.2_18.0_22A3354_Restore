@implementation PLFileSystemPersistenceAttributes

- (PLFileSystemPersistenceAttributes)initWithAttributes:(id)a3 unknownAttributes:(id)a4
{
  id v7;
  id v8;
  PLFileSystemPersistenceAttributes *v9;
  PLFileSystemPersistenceAttributes *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLFileSystemPersistenceAttributes;
  v9 = -[PLFileSystemPersistenceAttributes init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributes, a3);
    objc_storeStrong((id *)&v10->_unknownAttributes, a4);
  }

  return v10;
}

- (void)dealloc
{
  NSDictionary *attributes;
  objc_super v4;

  attributes = self->_attributes;
  self->_attributes = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLFileSystemPersistenceAttributes;
  -[PLFileSystemPersistenceAttributes dealloc](&v4, sel_dealloc);
}

- (id)dataForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (id)UUIDStringForKey:(id)a3
{
  void *v3;
  void *v4;

  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringFromUUIDData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)getUInt16:(unsigned __int16 *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  unsigned __int16 v9;

  v9 = 0;
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length") == 2)
  {
    objc_msgSend(v6, "getBytes:length:", &v9, 2);
    *a3 = v9;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)getInt32:(int *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  int v9;

  v9 = 0;
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length") == 4)
  {
    objc_msgSend(v6, "getBytes:length:", &v9, 4);
    *a3 = v9;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v9;

  v9 = 0;
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length") == 8)
  {
    objc_msgSend(v6, "getBytes:length:", &v9, 8);
    *a3 = v9;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stringForKey:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  char v7;

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v7 = 0;
    objc_msgSend(v4, "getBytes:length:", &v7, 1);
    if (v7)
      v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    else
      v5 = CFSTR("\\0");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSDictionary *unknownAttributes;
  id v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[4];
  id v77;
  unsigned __int16 v78;
  unsigned __int16 v79;
  uint64_t v80;
  unsigned __int16 v81;
  unsigned __int16 v82;
  unsigned __int16 v83;
  unsigned int v84;
  unsigned __int16 v85;
  unsigned __int16 v86;
  unsigned int v87;
  unsigned __int16 v88;
  unsigned __int16 v89;
  unsigned __int16 v90;
  unsigned __int16 v91;
  unsigned __int16 v92;
  unsigned __int16 v93;
  unsigned __int16 v94;
  unsigned __int16 v95;
  unsigned __int16 v96;
  unsigned __int16 v97;
  objc_super v98;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v98.receiver = self;
  v98.super_class = (Class)PLFileSystemPersistenceAttributes;
  -[PLFileSystemPersistenceAttributes description](&v98, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFileSystemPersistenceAttributes UUIDStringForKey:](self, "UUIDStringForKey:", CFSTR("com.apple.assetsd.UUID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.UUID"), v6);
  v97 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v97, CFSTR("com.apple.assetsd.assetType")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.assetType"), v97);
  }
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.creatorBundleID"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.creatorBundleID"), v8);
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.importedByDisplayName"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.importedByDisplayName"), v10);
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.dbRebuildUuid"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.dbRebuildUuid"), v12);
  v96 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v96, CFSTR("com.apple.assetsd.dbRebuildInProgress")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.dbRebuildInProgress"), v96);
  }
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.cloudAsset.UUID"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.cloudAsset.UUID"), v14);
  v95 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v95, CFSTR("com.apple.assetsd.cloudAsset.placeholderKind")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.cloudAsset.placeholderKind"), v95);
  }
  v94 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v94, CFSTR("com.apple.assetsd.inProgress.publishable")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.inProgress.publishable"), v94);
  }
  v69 = v15;
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.inProgress.destinationPath"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.inProgress.destinationPath"), v16);
  v68 = v17;
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", CFSTR("com.apple.assetsd.inProgress.cameraAdjustmentsData"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %lu bytes"), CFSTR("com.apple.assetsd.inProgress.cameraAdjustmentsData"), objc_msgSend(v18, "length"));
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.inProgress.filteredPreviewImagePath"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.inProgress.filteredPreviewImagePath"), v20);
  v66 = v21;
  v93 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v93, CFSTR("com.apple.assetsd.cloudJobRecoveryCount")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.cloudJobRecoveryCount"), v93);
  }
  -[PLFileSystemPersistenceAttributes UUIDStringForKey:](self, "UUIDStringForKey:", CFSTR("com.apple.assetsd.avalanche.UUID"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.avalanche.UUID"), v22);
  v92 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v92, CFSTR("com.apple.assetsd.avalanche.type")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.avalanche.type"), v92);
  }
  v91 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v91, CFSTR("com.apple.assetsd.hidden")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.hidden"), v91);
  }
  v90 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v90, CFSTR("com.apple.assetsd.favorite")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.favorite"), v90);
  }
  v89 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v89, CFSTR("com.apple.assetsd.trashed")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.trashed"), v89);
  }
  v67 = v19;
  v88 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v88, CFSTR("com.apple.assetsd.deferredProcessing")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.deferredProcessing"), v88);
  }
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.publicGlobalUUID"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.publicGlobalUUID"), v24);
  v64 = v25;
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.title"));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.title"), v26);
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.accessibilityDescription"));
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.accessibilityDescription"), v28);
  v62 = v29;
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.timeZoneName"));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.timeZoneName"), v30);
  v70 = v13;
  v71 = v11;
  v72 = v9;
  v73 = v7;
  v87 = 0;
  if (-[PLFileSystemPersistenceAttributes getInt32:forKey:](self, "getInt32:forKey:", &v87, CFSTR("com.apple.assetsd.timeZoneOffset")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.timeZoneOffset"), v87);
  }
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", CFSTR("com.apple.assetsd.customCreationDate"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v75, 0, 0, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      PLMillisecondDateFormatter();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringFromDate:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.customCreationDate"), v34);

    }
  }
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", CFSTR("com.apple.assetsd.customLocation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %lu bytes"), CFSTR("com.apple.assetsd.customLocation"), objc_msgSend(v35, "length"));
  v60 = v36;
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.description"));
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.description"), v37);
  v59 = v38;
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", CFSTR("com.apple.assetsd.addedDate"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v74, 0, 0, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      PLMillisecondDateFormatter();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringFromDate:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.addedDate"), v41);

    }
  }
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.originalFilename"));
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  if (v42)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.originalFilename"), v42);
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.mediaGroupUUID"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.mediaGroupUUID"), v44);
  -[PLFileSystemPersistenceAttributes dataForKey:](self, "dataForKey:", CFSTR("com.apple.assetsd.extraDurationData"));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v46;
  if (v46)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.extraDurationData"), v46);
  v63 = v27;
  v86 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v86, CFSTR("com.apple.assetsd.videoComplementVisibility")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.videoComplementVisibility"), v86);
  }
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.placeAnnotationData"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %lu bytes"), CFSTR("com.apple.assetsd.placeAnnotationData"), objc_msgSend(v48, "length"));
  v61 = v31;
  v85 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v85, CFSTR("com.apple.assetsd.importedBy")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.importedBy"), v85);
  }
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.socGroupIdentifier"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %lu bytes"), CFSTR("com.apple.assetsd.socGroupIdentifier"), objc_msgSend(v50, "length"));
  v84 = 0;
  if (-[PLFileSystemPersistenceAttributes getInt32:forKey:](self, "getInt32:forKey:", &v84, CFSTR("com.apple.assetsd.inProgress.semanticDevelopment")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.inProgress.semanticDevelopment"), v84);
  }
  v65 = v23;
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.syndicationIdentifier"));
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v52)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.syndicationIdentifier"), v52);
  -[PLFileSystemPersistenceAttributes stringForKey:](self, "stringForKey:", CFSTR("com.apple.assetsd.libraryScopeAssetContributorsToUpdate"));
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v54;
  if (v54)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %@"), CFSTR("com.apple.assetsd.libraryScopeAssetContributorsToUpdate"), v54);
  v83 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v83, CFSTR("com.apple.assetsd.syndicationHistory")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.syndicationHistory"), v83);
  }
  v82 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v82, CFSTR("com.apple.assetsd.sceneAnalysisIsFromPreivew")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.sceneAnalysisIsFromPreivew"), v82);
  }
  v81 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v81, CFSTR("com.apple.assetsd.viewPresentation")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.viewPresentation"), v81);
  }
  v80 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt64:forKey:](self, "getUInt64:forKey:", &v80, CFSTR("com.apple.assetsd.libraryScopeShareState")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %llu"), CFSTR("com.apple.assetsd.libraryScopeShareState"), v80);
  }
  v79 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v79, CFSTR("com.apple.assetsd.demoContent")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.demoContent"), v79);
  }
  v78 = 0;
  if (-[PLFileSystemPersistenceAttributes getUInt16:forKey:](self, "getUInt16:forKey:", &v78, CFSTR("com.apple.assetsd.currentSleetCast")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ -> %d"), CFSTR("com.apple.assetsd.currentSleetCast"), v78);
  }
  if (-[NSDictionary count](self->_unknownAttributes, "count"))
  {
    objc_msgSend(v5, "appendString:", CFSTR("\n--unknown attributes--"));
    unknownAttributes = self->_unknownAttributes;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __48__PLFileSystemPersistenceAttributes_description__block_invoke;
    v76[3] = &unk_1E376B988;
    v77 = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](unknownAttributes, "enumerateKeysAndObjectsUsingBlock:", v76);

  }
  v57 = v5;

  return v57;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

void __48__PLFileSystemPersistenceAttributes_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "appendFormat:", CFSTR("\n %@ -> %lu bytes"), v5, objc_msgSend(a3, "length"));

}

@end
