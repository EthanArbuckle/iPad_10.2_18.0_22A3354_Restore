@implementation PLDuplicateAsset

- (PLDuplicateAsset)initWithAsset:(id)a3
{
  return -[PLDuplicateAsset initWithAsset:cloudScopedIdentifier:enableEXIFDataAccess:](self, "initWithAsset:cloudScopedIdentifier:enableEXIFDataAccess:", a3, 0, 0);
}

- (PLDuplicateAsset)initWithAsset:(id)a3 cloudScopedIdentifier:(id)a4 enableEXIFDataAccess:(BOOL)a5
{
  id v10;
  id v11;
  PLDuplicateAsset *v12;
  PLDuplicateAsset *v13;
  uint64_t v14;
  void *assetCloudScopedIdentifier;
  uint64_t v16;
  NSString *v17;
  int v18;
  uint64_t v19;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateAsset.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PLDuplicateAsset;
  v12 = -[PLDuplicateAsset init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_asset, a3);
    if (v11)
    {
      v14 = objc_msgSend(v11, "copy");
      assetCloudScopedIdentifier = v13->_assetCloudScopedIdentifier;
      v13->_assetCloudScopedIdentifier = (NSString *)v14;
    }
    else
    {
      objc_msgSend(v10, "cloudAssetGUID");
      assetCloudScopedIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(assetCloudScopedIdentifier, "copy");
      v17 = v13->_assetCloudScopedIdentifier;
      v13->_assetCloudScopedIdentifier = (NSString *)v16;

    }
    v18 = -[PLManagedAsset duplicateAssetVisibilityState](v13->_asset, "duplicateAssetVisibilityState");
    v19 = 1;
    if (!v18)
      v19 = 2;
    v13->_mergeStatus = v19;
    v13->_enableEXIFDataAccess = a5;
    v13->_resourceSwapDisabled = 0;
    -[PLDuplicateAsset _configureInitPropertiesWithAsset:](v13, "_configureInitPropertiesWithAsset:", v10);
  }

  return v13;
}

- (void)_configureInitPropertiesWithAsset:(id)a3
{
  id v4;
  NSManagedObjectID *v5;
  NSManagedObjectID *assetObjectID;
  void *v7;
  NSString *v8;
  NSString *assetObjectIDDescription;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *assetUUID;
  void *v16;
  NSString *v17;
  NSString *originalFilename;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "additionalAttributes");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue();
  assetObjectID = self->_assetObjectID;
  self->_assetObjectID = v5;

  -[NSManagedObjectID URIRepresentation](self->_assetObjectID, "URIRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relativePath");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetObjectIDDescription = self->_assetObjectIDDescription;
  self->_assetObjectIDDescription = v8;

  objc_msgSend(v19, "originalWidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");
  objc_msgSend(v19, "originalHeight");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_originalResolution = objc_msgSend(v12, "integerValue") * v11;

  objc_msgSend(v4, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (NSString *)objc_msgSend(v13, "copy");
  assetUUID = self->_assetUUID;
  self->_assetUUID = v14;

  objc_msgSend(v19, "originalFilename");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSString *)objc_msgSend(v16, "copy");
  originalFilename = self->_originalFilename;
  self->_originalFilename = v17;

  self->_score = -[PLDuplicateAsset _buildBaseScore](self, "_buildBaseScore");
  self->_duplicateAssetVisibilityState = -[PLDuplicateAsset _calculateDuplicateAssetVisibilityState](self, "_calculateDuplicateAssetVisibilityState");

}

- (signed)_calculateDuplicateAssetVisibilityState
{
  void *v2;
  int v3;

  -[PLDuplicateAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeLibraryScopeParticipationState");

  if (v3 == 1)
    return 100;
  else
    return 1;
}

- (id)duplicateAssetVisibilityStateString
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = -[PLDuplicateAsset duplicateAssetVisibilityState](self, "duplicateAssetVisibilityState");
  v3 = CFSTR("R");
  v4 = CFSTR("H");
  if (v2 != 100)
    v4 = 0;
  if (v2 != 2)
    v3 = v4;
  v5 = CFSTR("X");
  v6 = CFSTR("V");
  if (v2 != 1)
    v6 = 0;
  if (v2)
    v5 = v6;
  if (v2 <= 1)
    return (id)v5;
  else
    return (id)v3;
}

- (id)_additionalDescriptionDictionaryWithPIIDetails:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLDuplicateAsset veryShortDescription](self, "veryShortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("objectIDDescription"));

  -[PLDuplicateAsset assetUUID](self, "assetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("uuid"));

  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_originalFilename, CFSTR("filename"));
  -[PLDuplicateAsset duplicateAssetVisibilityStateString](self, "duplicateAssetVisibilityStateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("visibility"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLDuplicateAsset score](self, "score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("score"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mergeStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("mergeStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_originalResolution);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("originalResolution"));

  if (-[PLDuplicateAsset hasModifiedUserLocation](self, "hasModifiedUserLocation"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("hasModifiedUserLocation"));
  if (-[PLDuplicateAsset hasModifiedUserTimezone](self, "hasModifiedUserTimezone"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("hasModifiedUserTimezone"));
  if (-[PLDuplicateAsset hasModifiedUserDateCreated](self, "hasModifiedUserDateCreated"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasModifiedUserDateCreated"));
  if (-[PLDuplicateAsset resourceSwapDisabled](self, "resourceSwapDisabled"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("resourceSwapDisabled"));
  return v5;
}

- (id)_additionalDescriptionWithPIIDetails:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  -[PLDuplicateAsset _additionalDescriptionDictionaryWithPIIDetails:](self, "_additionalDescriptionDictionaryWithPIIDetails:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("objectIDDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("[%@"), v7);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("/%@]"), v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" score:[%@]"), v9);

  -[PLDuplicateAsset _additionalDescriptionState:](self, "_additionalDescriptionState:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" state:[%@]"), v10);

  if (v3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filename"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" filename:[%@]"), v11);

  }
  return v6;
}

- (id)_additionalDescriptionState:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mergeStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("m%@:"), v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringToIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("v%@:"), v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceSwapDisabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringToIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("rd%@:"), v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasModifiedUserLocation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringToIndex:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("ul%@:"), v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasModifiedUserTimezone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "substringToIndex:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("utz%@:"), v14);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasModifiedUserDateCreated"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "substringToIndex:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("ud%@:"), v16);

  return v5;
}

- (NSDictionary)jsonDescriptionData
{
  return (NSDictionary *)-[PLDuplicateAsset _additionalDescriptionDictionaryWithPIIDetails:](self, "_additionalDescriptionDictionaryWithPIIDetails:", 1);
}

- (id)description
{
  return -[PLDuplicateAsset _additionalDescriptionWithPIIDetails:](self, "_additionalDescriptionWithPIIDetails:", 1);
}

- (NSString)privateDescription
{
  return (NSString *)-[PLDuplicateAsset _additionalDescriptionWithPIIDetails:](self, "_additionalDescriptionWithPIIDetails:", 0);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLDuplicateAsset;
  -[PLDuplicateAsset description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _additionalDescriptionWithPIIDetails:](self, "_additionalDescriptionWithPIIDetails:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setMergeStatus:(int64_t)a3
{
  unint64_t mergeStatus;

  mergeStatus = self->_mergeStatus;
  if (mergeStatus < 2)
    goto LABEL_2;
  if (mergeStatus == 2 && a3 == 0)
  {
    a3 = 0;
LABEL_2:
    self->_mergeStatus = a3;
  }
}

- (BOOL)isMergeReady
{
  return self->_mergeStatus == 1;
}

- (BOOL)isCPLEnabled
{
  NSNumber *isCPLEnabled;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  isCPLEnabled = self->_isCPLEnabled;
  if (!isCPLEnabled)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[PLDuplicateAsset asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_isCPLEnabled;
    self->_isCPLEnabled = v7;

    isCPLEnabled = self->_isCPLEnabled;
  }
  return -[NSNumber BOOLValue](isCPLEnabled, "BOOLValue");
}

- (int64_t)score
{
  int64_t result;

  result = self->_score;
  if (result == -100)
  {
    result = -[PLDuplicateAsset _buildBaseScore](self, "_buildBaseScore");
    self->_score = result;
  }
  return result;
}

- (BOOL)hasModifiedUserLocation
{
  NSNumber *hasUserModifiedLocation;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  NSNumber *v19;
  NSNumber *v20;

  hasUserModifiedLocation = self->_hasUserModifiedLocation;
  if (hasUserModifiedLocation)
    return -[NSNumber BOOLValue](hasUserModifiedLocation, "BOOLValue");
  -[PLDuplicateAsset asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latitude");
  v11 = v10;

  -[PLDuplicateAsset asset](self, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "longitude");
  v14 = v13;

  if (v11 == -180.0 && v14 == -180.0)
  {
    v15 = 0;
  }
  else
  {
    v15 = 1;
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(v7, "doubleValue");
        v17 = v16;
        objc_msgSend(v8, "doubleValue");
        v15 = vabdd_f64(v17 + v18, v11 + v14) > 2.22044605e-16;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v20 = self->_hasUserModifiedLocation;
  self->_hasUserModifiedLocation = v19;

  return v15;
}

- (BOOL)hasModifiedUserTimezone
{
  NSNumber *hasUserModifiedTimezone;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSNumber *v14;
  NSNumber *v15;

  hasUserModifiedTimezone = self->_hasUserModifiedTimezone;
  if (hasUserModifiedTimezone)
    return -[NSNumber BOOLValue](hasUserModifiedTimezone, "BOOLValue");
  -[PLDuplicateAsset asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeZoneOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLDuplicateAsset asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extendedAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timezoneOffset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_5;
    if (!-[PLDuplicateAsset enableEXIFDataAccess](self, "enableEXIFDataAccess"))
      goto LABEL_9;
    -[PLDuplicateAsset asset](self, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadataFromMediaPropertiesOrOriginalResource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "timeZoneOffset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_5:
      v11 = objc_msgSend(v7, "isEqualToNumber:", v10) ^ 1;

    }
    else
    {
LABEL_9:
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v15 = self->_hasUserModifiedTimezone;
  self->_hasUserModifiedTimezone = v14;

  return v11;
}

- (BOOL)hasModifiedUserDateCreated
{
  NSNumber *hasUserModifiedDateCreated;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;

  hasUserModifiedDateCreated = self->_hasUserModifiedDateCreated;
  if (hasUserModifiedDateCreated)
    return -[NSNumber BOOLValue](hasUserModifiedDateCreated, "BOOLValue");
  -[PLDuplicateAsset asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLDuplicateAsset asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateCreated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_5;
    if (!-[PLDuplicateAsset enableEXIFDataAccess](self, "enableEXIFDataAccess"))
      goto LABEL_9;
    -[PLDuplicateAsset asset](self, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadataFromMediaPropertiesOrOriginalResource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "utcCreationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_5:
      v10 = -[PLDuplicateAsset _correctedCompareDate:otherDate:](self, "_correctedCompareDate:otherDate:", v6, v9) != 0;

    }
    else
    {
LABEL_9:
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = self->_hasUserModifiedDateCreated;
  self->_hasUserModifiedDateCreated = v13;

  return v10;
}

- (BOOL)hasModifiedUserTitle
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PLDuplicateAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  return -[PLDuplicateAsset compare:enabledMergeComparison:](self, "compare:enabledMergeComparison:", a3, 0);
}

- (int64_t)compare:(id)a3 enabledMergeComparison:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v57;
  int64_t v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v4 = a4;
  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PLDuplicateAsset score](self, "score");
  v58 = v7;
  v8 = objc_msgSend(v6, "score");
  v57 = v8;
  -[PLDuplicateAsset asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasAdjustments");

  objc_msgSend(v6, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasAdjustments");

  if (!v10 || !v12)
    goto LABEL_12;
  -[PLDuplicateAsset asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "additionalAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unmanagedAdjustment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "adjustmentTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "additionalAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unmanagedAdjustment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "adjustmentTimestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDuplicateAsset _updateScoresUsingLatestDateWithDate:otherDate:score:otherScore:](self, "_updateScoresUsingLatestDateWithDate:otherDate:score:otherScore:", v16, v20, &v58, &v57);
  if (v7 != v58)
  {
    PLDuplicateDetectionGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v22, v58);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v25, CFSTR("latest Adjustment"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v60 = v24;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v8 != v57)
  {
    PLDuplicateDetectionGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v22, v57);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v23, CFSTR("latest Adjustment"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v60 = v24;
LABEL_9:
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  if (-[PLDuplicateAsset hasModifiedUserTitle](self, "hasModifiedUserTitle")
    && (objc_msgSend(v6, "hasModifiedUserTitle") & 1) != 0
    || -[PLDuplicateAsset hasModifiedUserLocation](self, "hasModifiedUserLocation")
    && objc_msgSend(v6, "hasModifiedUserLocation"))
  {
    -[PLDuplicateAsset asset](self, "asset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "modificationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "asset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "modificationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v57;
    v31 = v58;
    -[PLDuplicateAsset _updateScoresUsingLatestDateWithDate:otherDate:score:otherScore:](self, "_updateScoresUsingLatestDateWithDate:otherDate:score:otherScore:", v27, v29, &v58, &v57);
    if (v31 == v58)
    {
      if (v30 == v57)
      {
LABEL_24:

        goto LABEL_25;
      }
      PLDuplicateDetectionGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v33, v57);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v34, CFSTR("latest user modification"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v60 = v35;
LABEL_22:
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      }
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v33, v58);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v36, CFSTR("latest user modification"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v60 = v35;
        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
LABEL_25:
  v37 = -[PLDuplicateAsset originalResolution](self, "originalResolution");
  if (v37 <= objc_msgSend(v6, "originalResolution"))
  {
    v42 = -[PLDuplicateAsset originalResolution](self, "originalResolution");
    if (v42 >= objc_msgSend(v6, "originalResolution"))
      goto LABEL_33;
    v57 += 25;
    PLDuplicateDetectionGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v39, v57);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v43, CFSTR("originalResolution"), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v60 = v41;
      goto LABEL_31;
    }
  }
  else
  {
    v58 += 25;
    PLDuplicateDetectionGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v39, v58);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v40, CFSTR("originalResolution"), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v60 = v41;
LABEL_31:
      _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }

LABEL_33:
  if (v58 == v57)
    -[PLDuplicateAsset _tieBreakerComparisonScoreWithOtherAsset:score:otherScore:](self, "_tieBreakerComparisonScoreWithOtherAsset:score:otherScore:", v6, &v58, &v57);
  PLDuplicateDetectionGetLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v46 = v57;
    v45 = (void *)v58;
    -[PLDuplicateAsset shortDescription](self, "shortDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v60 = v45;
    v61 = 2048;
    v62 = v46;
    v63 = 2114;
    v64 = v47;
    v65 = 2114;
    v66 = v48;
    _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_INFO, "Duplicate Asset: comparisonScore [%tu:%tu][%{public}@:%{public}@]", buf, 0x2Au);

  }
  if (v4)
  {
    -[PLDuplicateAsset _mergeComparisonScoreModifierWithOtherAsset:score:otherScore:](self, "_mergeComparisonScoreModifierWithOtherAsset:score:otherScore:", v6, &v58, &v57);
    PLDuplicateDetectionGetLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v51 = v57;
      v50 = (void *)v58;
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v60 = v50;
      v61 = 2048;
      v62 = v51;
      v63 = 2114;
      v64 = v52;
      v65 = 2114;
      v66 = v53;
      _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_INFO, "Duplicate Asset: post-mergeComparisonScore [%tu:%tu][%{public}@:%{public}@]", buf, 0x2Au);

    }
  }
  v54 = 1;
  if (v58 >= v57)
    v54 = -1;
  if (v58 == v57)
    v55 = 0;
  else
    v55 = v54;

  return v55;
}

- (int64_t)_correctedCompareDate:(id)a3 otherDate:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  double v8;
  double v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToDate:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v9 = fabs(v8);
    v10 = -1;
    if (v8 >= 0.0)
      v10 = 1;
    if (v9 >= 1.0)
      v7 = v10;
    else
      v7 = 0;
  }

  return v7;
}

- (void)_tieBreakerComparisonScoreWithOtherAsset:(id)a3 score:(int64_t *)a4 otherScore:(int64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int64_t *v14;
  NSObject *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  int v20;
  int64_t v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!-[PLDuplicateAsset hasModifiedUserDateCreated](self, "hasModifiedUserDateCreated")
    && (objc_msgSend(v8, "hasModifiedUserDateCreated") & 1) == 0)
  {
    -[PLDuplicateAsset asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateCreated");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateCreated");
    v12 = objc_claimAutoreleasedReturnValue();

    if (v10 && v12)
    {
      v13 = -[PLDuplicateAsset _correctedCompareDate:otherDate:](self, "_correctedCompareDate:otherDate:", v10, v12);
      v14 = a4;
      if (v13 != -1)
      {
        v14 = a5;
        if (v13 != 1)
          goto LABEL_13;
      }
    }
    else
    {
      if (v10)
        v14 = a4;
      else
        v14 = a5;
      if (!(v10 | v12))
        goto LABEL_13;
    }
    *v14 += 5;
LABEL_13:

  }
  if (*a4 != *a5)
  {
    PLDuplicateDetectionGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *a4;
      v17 = *a5;
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218754;
      v21 = v16;
      v22 = 2048;
      v23 = v17;
      v24 = 2114;
      v25 = v18;
      v26 = 2114;
      v27 = v19;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Duplicate Asset: tie breaker comparisonScore [%tu:%tu][%{public}@:%{public}@]", (uint8_t *)&v20, 0x2Au);

    }
  }

}

- (void)_mergeComparisonScoreModifierWithOtherAsset:(id)a3 score:(int64_t *)a4 otherScore:(int64_t *)a5
{
  PLDuplicateAsset *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  int64_t v32;
  id v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  PLDuplicateAsset *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PLDuplicateAsset *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  PLDuplicateAsset *v59;
  PLDuplicateAsset *v60;
  _QWORD v61[2];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  id v65;
  _QWORD v66[3];

  v66[2] = *MEMORY[0x1E0C80C00];
  v9 = (PLDuplicateAsset *)a3;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_67:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateAsset.m"), 508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score"));

    if (a5)
      goto LABEL_4;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateAsset.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("other"));

  if (!a4)
    goto LABEL_67;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateAsset.m"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherScore"));

LABEL_4:
  -[PLDuplicateAsset setResourceSwapDisabled:](self, "setResourceSwapDisabled:", 0);
  -[PLDuplicateAsset setResourceSwapDisabled:](v9, "setResourceSwapDisabled:", 0);
  if (!-[PLDuplicateAsset isCPLEnabled](self, "isCPLEnabled"))
  {
    PLDuplicateDetectionGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Duplicate Asset: iCPL not enabled, skipping further comparison score updates", buf, 2u);
    }
    goto LABEL_19;
  }
  -[PLDuplicateAsset asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "activeLibraryScopeParticipationState");

  -[PLDuplicateAsset asset](v9, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "activeLibraryScopeParticipationState");

  v14 = v11 == 1;
  v15 = v13 == 1 && v11 == 1;
  if (v13 == 1)
    v14 = 1;
  if (v11 == v13 || !v14)
  {
    if (v15)
    {
LABEL_22:
      -[PLDuplicateAsset assetCloudScopedIdentifier](self, "assetCloudScopedIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset assetCloudScopedIdentifier](v9, "assetCloudScopedIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (!v20 || !v21)
      {
        if (v20)
          v40 = v9;
        else
          v40 = self;
        -[PLDuplicateAsset setMergeStatus:](v40, "setMergeStatus:", 2);
        PLDuplicateDetectionGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
LABEL_53:

          if (v15)
            goto LABEL_20;
          goto LABEL_54;
        }
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v27 = objc_claimAutoreleasedReturnValue();
        -[PLDuplicateAsset shortDescription](v9, "shortDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = (uint64_t)v27;
        v64 = 2114;
        v65 = v29;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Duplicate Asset: CPL assets missing cloud identifiers: [%{public}@ : %{public}@]", buf, 0x16u);
        goto LABEL_51;
      }
      v61[0] = v20;
      v61[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_39963);
      v24 = objc_claimAutoreleasedReturnValue();

      -[NSObject objectAtIndexedSubscript:](v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v20);

      if (v26)
      {
        *a4 = *a5 + 1;
        PLDuplicateDetectionGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v57, *a4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v28, CFSTR("cloudScopedIdentifier"), 0);
          v55 = objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v29 = (void *)v55;
          v63 = v55;
LABEL_50:
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_51:
        }
      }
      else
      {
        *a5 = *a4 + 1;
        PLDuplicateDetectionGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](v9, "shortDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v57, *a5);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v47, CFSTR("cloudScopedIdentifier"), 0);
          v56 = objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v29 = (void *)v56;
          v63 = v56;
          goto LABEL_50;
        }
      }

      goto LABEL_53;
    }
    v66[0] = self;
    v66[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PLDuplicateAsset _validCPLAssetsWithAssets:](self, "_validCPLAssetsWithAssets:", v30);

    if (!v31)
    {
      v60 = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[PLDuplicateAsset _validCPLAssetsWithAssets:](self, "_validCPLAssetsWithAssets:", v41);

      if (v42)
      {
        *a4 = *a5 + 1;
        -[PLDuplicateAsset setResourceSwapDisabled:](self, "setResourceSwapDisabled:", 1);
        PLDuplicateDetectionGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v43, *a4);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v44, CFSTR("master"), 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v63 = (uint64_t)v45;
LABEL_47:
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
LABEL_19:

        goto LABEL_20;
      }
      v59 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[PLDuplicateAsset _validCPLAssetsWithAssets:](self, "_validCPLAssetsWithAssets:", v49);

      if (!v50)
        goto LABEL_20;
      *a5 = *a4 + 1;
      -[PLDuplicateAsset setResourceSwapDisabled:](v9, "setResourceSwapDisabled:", 1);
      PLDuplicateDetectionGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](v9, "shortDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v37, *a5);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v51, CFSTR("master"), 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v63 = (uint64_t)v39;
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_20;
    }
    v58 = 0;
    v32 = -[PLDuplicateAsset compareResource:error:](self, "compareResource:error:", v9, &v58);
    v33 = v58;
    if (v33)
    {
      -[PLDuplicateAsset setMergeStatus:](self, "setMergeStatus:", 2);
      -[PLDuplicateAsset setMergeStatus:](v9, "setMergeStatus:", 2);
      PLDuplicateDetectionGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        -[PLDuplicateAsset shortDescription](v9, "shortDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = (uint64_t)v35;
        v64 = 2112;
        v65 = v33;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Duplicate Asset: Resource comparison failure for duplicate asset: %{public}@. Error: %@", buf, 0x16u);

      }
    }
    else
    {
      switch(v32)
      {
        case 1:
          *a4 = *a5 + 1;
          break;
        case 0:
          goto LABEL_22;
        case -1:
          *a5 = *a4 + 1;
          break;
      }
    }

LABEL_54:
    if (*a4 <= *a5)
      v48 = v9;
    else
      v48 = self;
    -[PLDuplicateAsset setResourceSwapDisabled:](v48, "setResourceSwapDisabled:", 1);
    goto LABEL_20;
  }
  -[PLDuplicateAsset asset](self, "asset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "duplicateAssetVisibilityState");

  if ((v17 - 1) < 2)
  {
    *a5 = *a4 + 1;
    PLDuplicateDetectionGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](v9, "shortDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v37, *a5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v38, CFSTR("duplicateAssetVisibilityState"), 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v63 = (uint64_t)v39;
LABEL_35:
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      goto LABEL_36;
    }
    goto LABEL_36;
  }
  if (v17 == 100)
  {
    *a4 = *a5 + 1;
    PLDuplicateDetectionGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v43, *a4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v46, CFSTR("duplicateAssetVisibilityState"), 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v63 = (uint64_t)v45;
      goto LABEL_47;
    }
    goto LABEL_19;
  }
  if (!v17)
  {
    -[PLDuplicateAsset setMergeStatus:](self, "setMergeStatus:", 2);
    PLDuplicateDetectionGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[PLDuplicateAsset shortDescription](v9, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = (uint64_t)v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Duplicate Asset: Invalid visibility state PLDuplicateAssetVisibilityStateNotDuplicate for duplicate asset: %{public}@", buf, 0xCu);

    }
    goto LABEL_19;
  }
LABEL_20:

}

- (BOOL)_validCPLAssetsWithAssets:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PLDuplicateAsset__validCPLAssetsWithAssets___block_invoke;
  v6[3] = &unk_1E36698F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_updateScoresUsingLatestDateWithDate:(id)a3 otherDate:(id)a4 score:(int64_t *)a5 otherScore:(int64_t *)a6
{
  uint64_t v8;

  if (a3 && a4)
  {
    v8 = objc_msgSend(a3, "compare:", a4);
    if (v8 == 1)
    {
      a6 = a5;
      if (!a5)
        return;
    }
    else if (v8 != -1 || !a6)
    {
      return;
    }
    *a6 += 5;
  }
}

- (int64_t)compareResource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int64_t v31;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  PLDuplicateAssetScoreTuple v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString **v43;
  uint64_t *v44;
  void *v45;
  PLDuplicateAssetScoreTuple v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint8_t buf[4];
  _BYTE v57[10];
  _BYTE v58[10];
  _QWORD v59[2];
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  -[PLDuplicateAsset _compareResourcesResetPropertiesWithOther:](self, "_compareResourcesResetPropertiesWithOther:", v6);
  v51 = v8;
  if ((objc_msgSend(v7, "isReferencedAsset") & 1) != 0 || (objc_msgSend(v8, "isReferencedAsset") & 1) != 0)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_4;
  }
  v33 = objc_msgSend(v7, "kind");
  if (v33 != objc_msgSend(v8, "kind"))
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0D74498];
    v60 = *MEMORY[0x1E0CB2D50];
    v61 = CFSTR("Resource comparison skipped asset has incompatible asset kind");
    v42 = (void *)MEMORY[0x1E0C99D80];
    v43 = &v61;
    v44 = &v60;
LABEL_24:
    objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 49407, v45);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v55 = -1;
    goto LABEL_35;
  }
  v34 = objc_msgSend(v7, "kind");
  if ((v34 - 1) < 2)
  {
    v39 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesAdditionalChecksFromOther:](self, "_compareResourcesAdditionalChecksFromOther:", v6);
    goto LABEL_26;
  }
  if (v34 == 3)
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0D74498];
    v62 = *MEMORY[0x1E0CB2D50];
    v63[0] = CFSTR("Resource comparison skipped asset has unknown asset kind");
    v42 = (void *)MEMORY[0x1E0C99D80];
    v43 = (const __CFString **)v63;
    v44 = &v62;
    goto LABEL_24;
  }
  if (v34)
  {
    v10 = 0;
    goto LABEL_35;
  }
  v35 = objc_msgSend(v7, "kindSubtype");
  v36 = objc_msgSend(v8, "kindSubtype");
  v37 = objc_msgSend(v7, "playbackStyle");
  v38 = objc_msgSend(v8, "playbackStyle");
  if (v37 == v38 && v35 == v36)
  {
    v39 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesMatchingPlaybackStyleAndKindSubTypeCheckFromOther:](self, "_compareResourcesMatchingPlaybackStyleAndKindSubTypeCheckFromOther:", v6);
LABEL_26:
    v10 = 0;
    v55 = (int)v39;
    goto LABEL_35;
  }
  if (v35 == v36)
  {
    v54 = 0;
    v46 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesMatchingKindSubtypeCheckFromOther:error:](self, "_compareResourcesMatchingKindSubtypeCheckFromOther:error:", v6, &v54);
    v47 = v54;
  }
  else if (v37 == v38)
  {
    v53 = 0;
    v46 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesMatchingPlaybackStyleCheckFromOther:error:](self, "_compareResourcesMatchingPlaybackStyleCheckFromOther:error:", v6, &v53);
    v47 = v53;
  }
  else
  {
    v52 = 0;
    v46 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesNotMatchingPlaybackStyleAndKindSubTypeCheckFromOther:error:](self, "_compareResourcesNotMatchingPlaybackStyleAndKindSubTypeCheckFromOther:error:", v6, &v52);
    v47 = v52;
  }
  v10 = v47;
  v55 = (int)v46;
LABEL_35:
  v9 = v55;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v55);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v9 >> 16));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "compare:", v49);

  if ((_WORD)v9 != 0xFFFF || v50)
  {
    -[PLDuplicateAsset _compareResourceReverseCheckFromOther:score:](self, "_compareResourceReverseCheckFromOther:score:", v6, &v55);
    v9 = v55;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v9 >> 16));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  v14 = v10;
  v15 = v14;
  if ((_WORD)v9 == 0xFFFF && !v13 && a4)
    *a4 = objc_retainAutorelease(v14);

  v16 = v55;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v55);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v16 >> 16));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "compare:", v18);

  if ((_WORD)v16 == 0xFFFF && !v19)
  {
    PLDuplicateDetectionGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v57 = v21;
      *(_WORD *)&v57[8] = 2114;
      *(_QWORD *)v58 = v22;
      *(_WORD *)&v58[8] = 2112;
      v59[0] = v15;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Duplicate Asset: Resource matching error for assets [%{public}@ -> %{public}@]. Error: %@", buf, 0x20u);

    }
  }
  PLDuplicateDetectionGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (__int16)v55;
    v25 = SHIWORD(v55);
    -[PLDuplicateAsset shortDescription](self, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v57 = v24;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v25;
    *(_WORD *)v58 = 2114;
    *(_QWORD *)&v58[2] = v26;
    LOWORD(v59[0]) = 2114;
    *(_QWORD *)((char *)v59 + 2) = v27;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "Duplicate Asset: Resource comparisonScore [%d:%d][%{public}@:%{public}@] (Final)", buf, 0x22u);

  }
  v28 = v55;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v55);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v28 >> 16));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "compare:", v30);

  return v31;
}

- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingPlaybackStyleAndKindSubTypeCheckFromOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PLDuplicateAssetScoreTuple v33;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "RAWBadgeAttribute");
  if (v7 == objc_msgSend(v6, "RAWBadgeAttribute"))
    goto LABEL_2;
  v10 = objc_msgSend(v5, "RAWBadgeAttribute");
  if ((v10 - 1) < 2)
  {
    v16 = objc_msgSend(v6, "RAWBadgeAttribute");
    if (v16 != 3 && v16)
      goto LABEL_2;
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 0, 5, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v19, CFSTR("R+J vs non-R+J"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      v9 = 0;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v10 == 3)
  {
    v21 = objc_msgSend(v6, "RAWBadgeAttribute");
    if ((v21 - 1) < 2)
    {
      PLDuplicateDetectionGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v24, CFSTR("non-R+J vs R+J"), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v36 = v25;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        v8 = 0;
        v9 = 5;
        goto LABEL_20;
      }
LABEL_15:
      v8 = 0;
      v9 = 5;
      goto LABEL_20;
    }
    if (v21)
    {
LABEL_2:
      v8 = 0;
      v9 = 0;
      goto LABEL_21;
    }
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 0, 5, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v28, CFSTR("RAW vs non-RAW"), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v36 = v29;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      v9 = 0;
      v8 = 5;
      goto LABEL_20;
    }
LABEL_19:
    v9 = 0;
    v8 = 5;
    goto LABEL_20;
  }
  if (v10)
    goto LABEL_2;
  PLDuplicateDetectionGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    goto LABEL_15;
  -[PLDuplicateAsset shortDescription](self, "shortDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _PLDuplicateAssetLogString((uint64_t)v14, CFSTR("non-RAW vs RAW"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  *(_DWORD *)buf = 138543362;
  v36 = v15;
  _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

  v8 = 0;
LABEL_20:

LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "compare:", v31);

  if (!v32)
  {
    v33 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesAdditionalChecksFromOther:](self, "_compareResourcesAdditionalChecksFromOther:", v4);
    LOWORD(v9) = v33.var0;
    LODWORD(v8) = HIWORD(*(unsigned int *)&v33);
  }

  return (PLDuplicateAssetScoreTuple)((unsigned __int16)v9 | ((unsigned __int16)v8 << 16));
}

- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingKindSubtypeCheckFromOther:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  int var0;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  PLDuplicateAssetScoreTuple v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "kindSubtype");
  v10 = 0;
  LODWORD(v11) = 0;
  v12 = 0x1E0CB3000uLL;
  if (v9 > 99)
  {
    var0 = 0;
    if ((v9 - 100) < 5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D74498];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("Unexpected processing a video kindSubtype");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 49407, v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      PLDuplicateDetectionGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v17;
        v47 = 2114;
        v48 = v18;
        v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
LABEL_5:
        _os_log_impl(&dword_199541000, (os_log_t)v11, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);

      }
LABEL_6:

      LODWORD(v11) = 0xFFFF;
      var0 = 0xFFFF;
    }
    goto LABEL_11;
  }
  if (v9 < 2)
  {
LABEL_10:
    v20 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesAdditionalChecksFromOther:](self, "_compareResourcesAdditionalChecksFromOther:", v6);
    v10 = 0;
    LODWORD(v11) = HIWORD(*(unsigned int *)&v20);
    var0 = (unsigned __int16)v20.var0;
    goto LABEL_11;
  }
  if (v9 != 2)
  {
    var0 = 0;
    if (v9 != 10)
      goto LABEL_11;
    goto LABEL_10;
  }
  switch(objc_msgSend(v7, "playbackStyle"))
  {
    case 0u:
      PLDuplicateDetectionGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v38, CFSTR("playbackStyle"), CFSTR("matching kindSubtype"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v46 = v39;
        _os_log_impl(&dword_199541000, (os_log_t)v11, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        v12 = 0x1E0CB3000uLL;
      }

      LODWORD(v11) = 0;
      v10 = 0;
      var0 = 5;
      break;
    case 1u:
    case 2u:
    case 3u:
    case 5u:
      v27 = objc_msgSend(v7, "playbackStyle");
      if (v27 <= objc_msgSend(v8, "playbackStyle"))
        v11 = 0;
      else
        v11 = 5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "compare:", v29);

      if (v30)
      {
        PLDuplicateDetectionGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 0, v11, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v34, CFSTR("playbackStyle"), CFSTR("matching kindSubtype"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v46 = v35;
          _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      var0 = 0;
      v10 = 0;
      v12 = 0x1E0CB3000;
      break;
    case 4u:
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0D74498];
      v49 = *MEMORY[0x1E0CB2D50];
      v50[0] = CFSTR("Unexpected processing a video playbackStyle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 49407, v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      PLDuplicateDetectionGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      objc_msgSend(v6, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v17;
      v47 = 2114;
      v48 = v18;
      v19 = "Duplicate Asset: Resource matching error, unexpected processing a video playbackStyle [%{public}@ -> %{public}@]";
      goto LABEL_5;
    default:
      LODWORD(v11) = 0;
      var0 = 0;
      v10 = 0;
      break;
  }
LABEL_11:
  objc_msgSend(*(id *)(v12 + 2024), "numberWithShort:", (__int16)var0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v12 + 2024), "numberWithShort:", (__int16)v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "compare:", v22);

  v24 = v10;
  v25 = v24;
  if (var0 == 0xFFFF && !v23 && a4)
    *a4 = objc_retainAutorelease(v24);

  return (PLDuplicateAssetScoreTuple)(var0 | ((_DWORD)v11 << 16));
}

- (PLDuplicateAssetScoreTuple)_compareResourcesMatchingPlaybackStyleCheckFromOther:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "kindSubtype");
  v10 = 0;
  v11 = 0;
  if (v9 <= 99)
  {
    if ((v9 - 1) < 2)
    {
      v23 = objc_msgSend(v7, "kindSubtype");
      v11 = 5;
      if (v23 <= (int)objc_msgSend(v8, "kindSubtype"))
      {
        v28 = objc_msgSend(v8, "kindSubtype");
        if (v28 == 10)
          v12 = 0;
        else
          v12 = 5;
        if (v28 == 10)
          v29 = 5;
        else
          v29 = 0;
        v11 = v29;
      }
      else
      {
        v12 = 0;
      }
      PLDuplicateDetectionGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), v12, v11, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v32, CFSTR("pano/live photo"), CFSTR("matching playbackStyle"));
        v61 = v6;
        v33 = v7;
        v34 = v8;
        v35 = a4;
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v69 = v36;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        a4 = v35;
        v8 = v34;
        v7 = v33;
        v6 = v61;
      }
    }
    else
    {
      if (v9)
      {
        v12 = 0;
        if (v9 != 10)
          goto LABEL_30;
        if (objc_msgSend(v8, "kindSubtype") == 10)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0D74498];
          v64 = *MEMORY[0x1E0CB2D50];
          v65 = CFSTR("Unexpected processing kindSubtype PLAssetSubtypeScreenshot");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 49407, v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          PLDuplicateDetectionGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_6;
          objc_msgSend(v6, "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v17;
          v70 = 2114;
          v71 = v18;
          v19 = "Duplicate Asset: Resource matching error, unexpected processing kind subtype PLAssetSubtypeScreenshot [%"
                "{public}@ -> %{public}@]";
          goto LABEL_5;
        }
        PLDuplicateDetectionGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 5;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v45, CFSTR("screenshot"), CFSTR("matching playbackStyle"));
          v46 = a4;
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v69 = v47;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

          a4 = v46;
          v11 = 0;
          v10 = 0;
          goto LABEL_29;
        }
LABEL_44:
        v11 = 0;
        v10 = 0;
        v12 = 5;
        goto LABEL_29;
      }
      v24 = objc_msgSend(v8, "kindSubtype");
      v10 = 0;
      v11 = 0;
      if (v24 > 99)
      {
        v12 = 0;
        if ((v24 - 100) < 5)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0D74498];
          v66 = *MEMORY[0x1E0CB2D50];
          v67 = CFSTR("Unexpected processing video kindSubtype");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 49407, v27);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          PLDuplicateDetectionGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_6;
          objc_msgSend(v6, "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v17;
          v70 = 2114;
          v71 = v18;
          v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
          goto LABEL_5;
        }
        goto LABEL_30;
      }
      if ((v24 - 1) < 2)
      {
        PLDuplicateDetectionGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_44;
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 5;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v55, CFSTR("pano/live photo"), CFSTR("matching playbackStyle"));
        v56 = a4;
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v69 = v57;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        a4 = v56;
        v11 = 0;
      }
      else
      {
        if (!v24)
        {
          v58 = (void *)MEMORY[0x1E0CB35C8];
          v59 = *MEMORY[0x1E0D74498];
          v72 = *MEMORY[0x1E0CB2D50];
          v73[0] = CFSTR("Unexpected processing kindSubtype PLAssetSubtypeNone");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "errorWithDomain:code:userInfo:", v59, 49407, v60);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          PLDuplicateDetectionGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_6;
          objc_msgSend(v6, "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v17;
          v70 = 2114;
          v71 = v18;
          v19 = "Duplicate Asset: Resource matching error, unexpected processing kind subtype PLAssetSubtypeNone [%{publi"
                "c}@ -> %{public}@]";
          goto LABEL_5;
        }
        v12 = 0;
        if (v24 != 10)
          goto LABEL_30;
        PLDuplicateDetectionGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v12 = 0;
          v10 = 0;
          v11 = 5;
          goto LABEL_29;
        }
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 5;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 0, 5, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v50, CFSTR("screenshot"), CFSTR("matching playbackStyle"));
        v51 = a4;
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v69 = v52;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        a4 = v51;
        v12 = 0;
      }
    }
    v10 = 0;
    goto LABEL_29;
  }
  v12 = 0;
  if ((v9 - 100) < 5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74498];
    v62 = *MEMORY[0x1E0CB2D50];
    v63 = CFSTR("Unexpected processing video kindSubtype");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 49407, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PLDuplicateDetectionGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_6:
      v11 = 0xFFFF;
      v12 = 0xFFFF;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v6, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset shortDescription](self, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v69 = v17;
    v70 = 2114;
    v71 = v18;
    v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
LABEL_5:
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);

    goto LABEL_6;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "compare:", v38);

  v40 = v10;
  v41 = v40;
  if (v12 == 0xFFFF && !v39 && a4)
    *a4 = objc_retainAutorelease(v40);

  return (PLDuplicateAssetScoreTuple)(v12 | (v11 << 16));
}

- (PLDuplicateAssetScoreTuple)_compareResourcesNotMatchingPlaybackStyleAndKindSubTypeCheckFromOther:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  signed int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  unsigned __int16 var0;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PLDuplicateAssetScoreTuple v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "kindSubtype");
  v10 = objc_msgSend(v7, "kindSubtype");
  v11 = 0;
  v12 = 0;
  if (v10 > 9)
  {
    if ((v10 - 100) < 5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D74498];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = CFSTR("Unexpected processing video kindSubtype");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 49407, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PLDuplicateDetectionGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        var0 = -1;
        v12 = -65536;
        goto LABEL_7;
      }
      objc_msgSend(v6, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v17;
      v52 = 2114;
      v53 = v18;
      v19 = "Duplicate Asset: Resource matching error, unexpected processing a video kind subtype [%{public}@ -> %{public}@]";
LABEL_5:
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);

      goto LABEL_6;
    }
    var0 = 0;
    if (v10 != 10)
      goto LABEL_7;
    if (v9)
    {
      if ((unsigned __int16)v9 != 2)
      {
        v43 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0D74498];
        v48 = *MEMORY[0x1E0CB2D50];
        v49 = CFSTR("Unexpected processing kindSubtype");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, 49407, v45);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        PLDuplicateDetectionGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_6;
        objc_msgSend(v6, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v17;
        v52 = 2114;
        v53 = v18;
        v19 = "Duplicate Asset: Resource matching error, unexpected processing of kindSubtype [%{public}@ -> %{public}@]";
        goto LABEL_5;
      }
      PLDuplicateDetectionGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v33, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v38, CFSTR("live photo/screenshot"), CFSTR("no matching"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v51 = v36;
        goto LABEL_34;
      }
LABEL_35:

      v12 = 0;
      v11 = 0;
      var0 = 5;
      goto LABEL_7;
    }
LABEL_38:
    v39 = (PLDuplicateAssetScoreTuple)-[PLDuplicateAsset _compareResourcesAdditionalChecksFromOther:](self, "_compareResourcesAdditionalChecksFromOther:", v6);
    var0 = v39.var0;
    v11 = 0;
    v12 = *(_DWORD *)&v39 & 0xFFFF0000;
    goto LABEL_7;
  }
  if (!v10)
  {
    if (v9 == 10)
      goto LABEL_21;
    if ((unsigned __int16)v9 == 2)
    {
LABEL_23:
      PLDuplicateDetectionGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        goto LABEL_35;
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v35, CFSTR("live photo over image"), CFSTR("no matching"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v51 = v36;
LABEL_34:
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      goto LABEL_35;
    }
    if ((unsigned __int16)v9 == 1)
    {
LABEL_21:
      if (objc_msgSend(v7, "playbackStyle") == 2)
        goto LABEL_38;
      if (v9 == 2)
        goto LABEL_23;
    }
    v12 = 0;
    var0 = 0;
    v11 = 0;
    goto LABEL_7;
  }
  if (v10 == 1)
  {
    if (v9)
    {
      if ((unsigned __int16)v9 == 2)
      {
        PLDuplicateDetectionGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          goto LABEL_35;
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 5, 0, v33, v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v37, CFSTR("live photo over pano"), CFSTR("no matching"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v51 = v36;
        goto LABEL_34;
      }
    }
    else if (objc_msgSend(v8, "playbackStyle") == 2)
    {
      goto LABEL_38;
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0D74498];
    v54 = *MEMORY[0x1E0CB2D50];
    v55[0] = CFSTR("Unexpected processing kindSubtype");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 49407, v42);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLDuplicateDetectionGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    objc_msgSend(v6, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset shortDescription](self, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v17;
    v52 = 2114;
    v53 = v18;
    v19 = "Duplicate Asset: Resource matching error, unexpected processing of kindSubtype [%{public}@ -> %{public}@]";
    goto LABEL_5;
  }
  var0 = 0;
  if (v10 == 2)
  {
    PLDuplicateDetectionGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), 0, 5, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v30, CFSTR("live photo"), CFSTR("no matching"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v51 = v31;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
    var0 = 0;
    v11 = 0;
    v12 = 327680;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)var0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v12 >> 16));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "compare:", v22);

  v24 = v11;
  v25 = v24;
  if (var0 == 0xFFFF && !v23 && a4)
    *a4 = objc_retainAutorelease(v24);

  return (PLDuplicateAssetScoreTuple)(var0 | v12);
}

- (PLDuplicateAssetScoreTuple)_compareResourcesAdditionalChecksFromOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  int v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  __int16 v78;
  __int16 v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  __int16 v96;
  __int16 v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  int v104;
  __int16 v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _BOOL4 v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  uint8_t buf[4];
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v118 = 0;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "originalResolution");
  v8 = 0;
  if (v7 != -[PLDuplicateAsset originalResolution](self, "originalResolution"))
  {
    v9 = objc_msgSend(v4, "originalResolution");
    if (v9 <= -[PLDuplicateAsset originalResolution](self, "originalResolution"))
      LOWORD(v118) = 5;
    else
      HIWORD(v118) = 5;
    PLDuplicateDetectionGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v13, CFSTR("resolution"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v120 = v14;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
    v8 = v118;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v8 >> 16));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

  if (!v17)
  {
    v18 = objc_msgSend(v5, "kind");
    if (v18 == objc_msgSend(v6, "kind") && !objc_msgSend(v6, "kind"))
    {
      v19 = objc_msgSend(v5, "kindSubtype");
      if (v19 == objc_msgSend(v6, "kindSubtype") && objc_msgSend(v6, "kindSubtype") == 2)
      {
        objc_msgSend(v5, "firstPersistedResourceMatching:", &__block_literal_global_148);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstPersistedResourceMatching:", &__block_literal_global_149);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "unorientedWidth");
        v23 = objc_msgSend(v20, "unorientedHeight") * v22;
        v24 = objc_msgSend(v21, "unorientedWidth");
        v25 = objc_msgSend(v21, "unorientedHeight");
        if (v23 != v25 * v24)
        {
          if (v23 <= v25 * v24)
            LOWORD(v118) = 5;
          else
            HIWORD(v118) = 5;
          PLDuplicateDetectionGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            -[PLDuplicateAsset shortDescription](self, "shortDescription");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "shortDescription");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v116, v114);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _PLDuplicateAssetLogString((uint64_t)v27, CFSTR("videoComplementResolution"), 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            *(_DWORD *)buf = 138543362;
            v120 = v28;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

          }
        }

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v118);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v118 >> 16));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "compare:", v30);

  if (!v31)
  {
    objc_msgSend(v5, "additionalAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "originalStableHash");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalAttributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "originatingAssetIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "isEqualToString:", v35);

    if (v36)
    {
      HIWORD(v118) = 5;
      PLDuplicateDetectionGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v40, CFSTR("originatingAssetIdentifier"), 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v120 = v41;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v118);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v118 >> 16));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "compare:", v43);

  if (!v44)
  {
    v45 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v6, "uniformTypeIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "typeWithIdentifier:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(v4, "originalResolution");
    if (v48 != -[PLDuplicateAsset originalResolution](self, "originalResolution"))
      goto LABEL_94;
    if ((objc_msgSend(v47, "conformsToType:", *MEMORY[0x1E0CEC5B8]) & 1) != 0)
      goto LABEL_94;
    -[PLDuplicateAsset _compareUTICheckFromOther:scoreTuple:](self, "_compareUTICheckFromOther:scoreTuple:", v4, &v118);
    v49 = v118;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v118);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (v49 >> 16));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "compare:", v51);

    if (v52)
    {
LABEL_94:

      goto LABEL_95;
    }
    if (-[PLDuplicateAsset locationUpdated](self, "locationUpdated"))
    {
LABEL_53:
      v77 = objc_msgSend(v6, "hasAdjustments");
      if (v77 != objc_msgSend(v5, "hasAdjustments"))
      {
        if (objc_msgSend(v6, "hasAdjustments"))
          v78 = 5;
        else
          v78 = 0;
        LOWORD(v118) = v78 + v118;
        if (objc_msgSend(v5, "hasAdjustments"))
          v79 = 5;
        else
          v79 = 0;
        HIWORD(v118) += v79;
        PLDuplicateDetectionGetLog();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "shortDescription");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v83, CFSTR("adjustments"), 0);
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v120 = v84;
          _os_log_impl(&dword_199541000, v80, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      v85 = objc_msgSend(v6, "hdrType");
      if (v85 != objc_msgSend(v5, "hdrType"))
      {
        v86 = objc_msgSend(v6, "hdrType");
        if (v86 <= (int)objc_msgSend(v5, "hdrType"))
          v87 = 0;
        else
          v87 = 5;
        LOWORD(v118) = v87 + v118;
        v88 = objc_msgSend(v5, "hdrType");
        if (v88 <= (int)objc_msgSend(v6, "hdrType"))
          v89 = 0;
        else
          v89 = 5;
        HIWORD(v118) += v89;
        PLDuplicateDetectionGetLog();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "shortDescription");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v93, CFSTR("HDR"), 0);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v120 = v94;
          _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      v95 = objc_msgSend(v6, "depthType");
      if (v95 != objc_msgSend(v5, "depthType"))
      {
        if (objc_msgSend(v5, "depthType"))
          v96 = 0;
        else
          v96 = 5;
        LOWORD(v118) = v96 + v118;
        if (objc_msgSend(v6, "depthType"))
          v97 = 0;
        else
          v97 = 5;
        HIWORD(v118) += v97;
        PLDuplicateDetectionGetLog();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "shortDescription");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v101, CFSTR("Depth Data"), 0);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v120 = v102;
          _os_log_impl(&dword_199541000, v98, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      v103 = objc_msgSend(v5, "playbackVariation");
      if (v103 != objc_msgSend(v6, "playbackVariation"))
      {
        v104 = objc_msgSend(v5, "playbackVariation");
        if ((v104 - 1) >= 3)
        {
          if (!v104)
            LOWORD(v118) = v118 + 5;
        }
        else
        {
          if (objc_msgSend(v6, "playbackVariation"))
            v105 = 0;
          else
            v105 = 5;
          HIWORD(v118) += v105;
        }
        PLDuplicateDetectionGetLog();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "shortDescription");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v109, CFSTR("Variation"), 0);
          v110 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v120 = v110;
          _os_log_impl(&dword_199541000, v106, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      goto LABEL_94;
    }
    objc_msgSend(v6, "location");
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v53)
      v55 = +[PLLocationUtils locationIsCoarse:](PLLocationUtils, "locationIsCoarse:", v53);
    else
      v55 = 0;
    v113 = v55;
    if (v54)
      v112 = +[PLLocationUtils locationIsCoarse:](PLLocationUtils, "locationIsCoarse:", v54);
    else
      v112 = 0;
    v117 = (void *)v54;
    objc_msgSend(v6, "extendedAttributes");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "latitude");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v6, "extendedAttributes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "longitude");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59 != 0;

    }
    else
    {
      v60 = 0;
    }
    v115 = (void *)v53;

    objc_msgSend(v5, "extendedAttributes");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "latitude");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v5, "extendedAttributes");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "longitude");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v64 != 0;

    }
    else
    {
      v65 = 0;
    }

    v66 = v65 || !v60;
    if (((v113 && !v112) & v66) == 1 || !v60 && v65)
    {
      HIWORD(v118) += 5;
      objc_msgSend(v4, "setResourceComparisonPropertyUpdateLocation:", 1);
      PLDuplicateDetectionGetLog();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v75, CFSTR("location"), 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v120 = v76;
        _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      }
      v67 = v117;
    }
    else
    {
      v67 = v117;
      if (((!v112 || v113) & v66 & 1) != 0)
      {
LABEL_52:

        goto LABEL_53;
      }
      LOWORD(v118) = v118 + 5;
      PLDuplicateDetectionGetLog();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v118, (v118 >> 16), v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v71, CFSTR("location"), 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v120 = v72;
        _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        v67 = v117;
      }
    }

    goto LABEL_52;
  }
LABEL_95:

  return (PLDuplicateAssetScoreTuple)v118;
}

- (void)_compareUTICheckFromOther:(id)a3 scoreTuple:(PLDuplicateAssetScoreTuple *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v7, "uniformTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "typeWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v8, "uniformTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "typeWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqual:", v14) & 1) != 0)
    goto LABEL_19;
  if (objc_msgSend(v7, "isHEIF"))
    v15 = objc_msgSend(v8, "isJPEG");
  else
    v15 = 0;
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", v15, 1, &v33, v6, CFSTR("UTI"), CFSTR("JPG:HEIF format"));
  if (objc_msgSend(v8, "isHEIF"))
    v16 = objc_msgSend(v7, "isJPEG");
  else
    v16 = 0;
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", v16, 0, &v33, v6, CFSTR("UTI"), CFSTR("HEIF:JPG format"));
  objc_msgSend(MEMORY[0x1E0D752F0], "canonTIFFRAWImageType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", objc_msgSend(v11, "isEqual:", v17), 1, &v33, v6, CFSTR("UTI"), CFSTR("??:TIFF format"));

  objc_msgSend(MEMORY[0x1E0D752F0], "canonTIFFRAWImageType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", objc_msgSend(v14, "isEqual:", v18), 0, &v33, v6, CFSTR("UTI"), CFSTR("TIFF:?? format"));

  objc_msgSend(MEMORY[0x1E0D752F0], "adobePhotoshopType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", objc_msgSend(v11, "isEqual:", v19), 1, &v33, v6, CFSTR("UTI"), CFSTR("??:Photoshop format"));

  objc_msgSend(MEMORY[0x1E0D752F0], "adobePhotoshopType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", objc_msgSend(v14, "isEqual:", v20), 0, &v33, v6, CFSTR("UTI"), CFSTR("Photoshop:?? format"));

  objc_msgSend(MEMORY[0x1E0D752F0], "adobeIllustratorType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", objc_msgSend(v11, "isEqual:", v21), 1, &v33, v6, CFSTR("UTI"), CFSTR("??:Illustrator format"));

  objc_msgSend(MEMORY[0x1E0D752F0], "adobeIllustratorType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset _updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:](self, "_updateScoreOnCondition:incrementOtherScore:scoreTuple:other:propertyName:additionalLogString:", objc_msgSend(v14, "isEqual:", v22), 0, &v33, v6, CFSTR("UTI"), CFSTR("Illustrator:?? format"));

  LODWORD(v22) = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", ((int)v22 >> 16));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "compare:", v24);

  if (!v25)
  {
    v26 = *MEMORY[0x1E0CEC600];
    if (objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0CEC600]))
    {
      -[PLDuplicateAsset _compareResourceTIFFCheckFromAsset:other:scoreProperty:](self, "_compareResourceTIFFCheckFromAsset:other:scoreProperty:", self, v6, (char *)&v33 + 2);
      PLDuplicateDetectionGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:

        goto LABEL_17;
      }
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v33, (v33 >> 16), v32, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v29, CFSTR("??:TIFF format"), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v35 = v30;
    }
    else
    {
      if (!objc_msgSend(v14, "isEqual:", v26))
        goto LABEL_17;
      -[PLDuplicateAsset _compareResourceTIFFCheckFromAsset:other:scoreProperty:](self, "_compareResourceTIFFCheckFromAsset:other:scoreProperty:", v6, self, &v33);
      PLDuplicateDetectionGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), (__int16)v33, (v33 >> 16), v32, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v31, CFSTR("TIFF:?? format"), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v35 = v30;
    }
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    goto LABEL_16;
  }
LABEL_17:
  if (a4)
  {
    a4->var0 += v33;
    a4->var1 += HIWORD(v33);
  }
LABEL_19:

}

- (void)_updateScoreOnCondition:(BOOL)a3 incrementOtherScore:(BOOL)a4 scoreTuple:(PLDuplicateAssetScoreTuple *)a5 other:(id)a6 propertyName:(id)a7 additionalLogString:(id)a8
{
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  PLDuplicateAssetScoreTuple v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  PLDuplicateAssetScoreTuple v26;
  void *v27;
  uint64_t var0;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v11 = a4;
  v12 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = *a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a5->var0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (*(int *)&v17 >> 16));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "compare:", v19);

  if (v20)
    v21 = 1;
  else
    v21 = !v12;
  if (!v21)
  {
    v22 = 2;
    if (!v11)
      v22 = 0;
    *(signed __int16 *)((char *)&a5->var0 + v22) = 5;
    PLDuplicateDetectionGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v34 = v14;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *a5;
      v27 = (void *)MEMORY[0x1E0CB3940];
      var0 = v26.var0;
      v29 = (*(int *)&v26 >> 16);
      v30 = v16;
      v31 = v15;
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), var0, v29, v24, v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v32, v31, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v36 = v33;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      v14 = v34;
    }

  }
}

- (void)_compareResourceTIFFCheckFromAsset:(id)a3 other:(id)a4 scoreProperty:(signed __int16 *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  signed __int16 v20;
  id v21;

  v7 = a4;
  objc_msgSend(a3, "asset");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "additionalAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v9, "dateCreatedSource");

  if ((unint64_t)(v10 - 1) <= 1)
  {
    objc_msgSend(v8, "extendedAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateCreated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v21, "extendedAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateCreated");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v8, "extendedAttributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateCreated");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "extendedAttributes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateCreated");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", v18);
        if (v19 >= 0.0)
          v20 = 0;
        else
          v20 = 5;
        *a5 = v20;

      }
      else
      {
        *a5 = 5;
      }
    }
  }

}

- (void)_compareResourceReverseCheckFromOther:(id)a3 score:(PLDuplicateAssetScoreTuple *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PLDuplicateAssetScoreTuple v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PLDuplicateAssetScoreTuple v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t var0;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originatingAssetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "additionalAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originatingAssetIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 == 0) == (v12 != 0))
  {
    objc_msgSend(v8, "additionalAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originalStableHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "additionalAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originalStableHash");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "isEqualToString:", v16) & 1) == 0
      && !objc_msgSend(v12, "isEqualToString:", v14))
    {
      goto LABEL_20;
    }
    v40 = v16;
    v41 = v14;
    v17 = *a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a4->var0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (*(int *)&v17 >> 16));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "compare:", v19);

    if (v20 == -1)
    {
      v16 = v40;
      v14 = v41;
      if (v12)
      {
        a4->var0 = a4->var1 + 5;
        PLDuplicateDetectionGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
LABEL_11:
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          var0 = a4->var0;
          v29 = (*(_DWORD *)a4 >> 16);
          v30 = (void *)v26;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), var0, v29, v26, v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v31, CFSTR("originatingAssetIdentifier"), CFSTR("reversed"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v41;
          *(_DWORD *)buf = 138543362;
          v43 = v32;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_18:
          v16 = v40;
        }
LABEL_19:

      }
LABEL_20:

      goto LABEL_21;
    }
    v21 = *a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a4->var0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (*(int *)&v21 >> 16));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "compare:", v23);

    if (v24)
    {
      v16 = v40;
      v14 = v41;
      if (v10)
      {
        a4->var1 = a4->var0 + 5;
        PLDuplicateDetectionGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v12)
    {
      a4->var0 = a4->var1 + 5;
      PLDuplicateDetectionGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
    }
    else
    {
      a4->var1 = a4->var0 + 5;
      PLDuplicateDetectionGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = a4->var0;
        v36 = (*(_DWORD *)a4 >> 16);
        v37 = (void *)v33;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: Resource comparisonScore [%d:%d][%@:%@]"), v35, v36, v33, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v38, CFSTR("originatingAssetIdentifier"), CFSTR("reversed"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v43 = v39;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      }
    }
    v14 = v41;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)_compareResourcesResetPropertiesWithOther:(id)a3
{
  id v4;

  v4 = a3;
  -[PLDuplicateAsset setResourceComparisonPropertyUpdateLocation:](self, "setResourceComparisonPropertyUpdateLocation:", 0);
  objc_msgSend(v4, "setResourceComparisonPropertyUpdateLocation:", 0);

}

- (int64_t)_buildBaseScore
{
  int64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = -[PLDuplicateAsset _buildUserModifiedScore](self, "_buildUserModifiedScore");
  v51 = v3;
  -[PLDuplicateAsset asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAdjustments");

  if (v5)
  {
    v3 += 15;
    v51 = v3;
    PLDuplicateDetectionGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v7, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v8, CFSTR("adjustmentsState"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v53 = v9;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  -[PLDuplicateAsset asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "favorite");

  if (v11)
  {
    v3 += 20;
    v51 = v3;
    PLDuplicateDetectionGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v13, v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v14, CFSTR("favorite"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v53 = v15;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  -[PLDuplicateAsset asset](self, "asset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "additionalAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "importedBy");

  if (v18 <= 9)
  {
    if (((1 << v18) & 0x360) != 0)
    {
      v3 += 10;
      v51 = v3;
      PLDuplicateDetectionGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      goto LABEL_19;
    }
    if (((1 << v18) & 0x16) != 0)
    {
      v3 += 15;
      v51 = v3;
      PLDuplicateDetectionGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      goto LABEL_19;
    }
    if (((1 << v18) & 0x88) != 0)
    {
      v3 += 5;
      v51 = v3;
      PLDuplicateDetectionGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
LABEL_18:
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v20, v3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v21, CFSTR("importedBy"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v53 = v22;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

      }
LABEL_19:

    }
  }
  -[PLDuplicateAsset asset](self, "asset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "playbackStyle");

  switch(v24)
  {
    case 1:
      -[PLDuplicateAsset _fileFormatIncrementScore:](self, "_fileFormatIncrementScore:", &v51);
      v51 += 10;
      PLDuplicateDetectionGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_29;
      goto LABEL_27;
    case 2:
      v51 = v3 + 5;
      PLDuplicateDetectionGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_29;
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v26, v51);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v27, CFSTR("playbackStyle"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v53 = v28;
      goto LABEL_28;
    case 3:
      -[PLDuplicateAsset _fileFormatIncrementScore:](self, "_fileFormatIncrementScore:", &v51);
      v3 = v51;
      goto LABEL_26;
    case 4:
    case 5:
LABEL_26:
      v51 = v3 + 15;
      PLDuplicateDetectionGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_29;
LABEL_27:
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v26, v51);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v29, CFSTR("playbackStyle"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v53 = v28;
LABEL_28:
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_29:
LABEL_30:
      -[PLDuplicateAsset asset](self, "asset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hdrType");

      if (v31 >= 1)
      {
        v51 += 5;
        PLDuplicateDetectionGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v33, v51);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v34, CFSTR("hdrType"), 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v53 = v35;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      -[PLDuplicateAsset asset](self, "asset");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "kindSubtype");

      if (v37 - 101 <= 3 && v37 != 103 || v37 < 3)
      {
        v51 += 5;
        PLDuplicateDetectionGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v39, v51);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v40, CFSTR("kindSubtype"), 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v53 = v41;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
      }
      -[PLDuplicateAsset asset](self, "asset");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "savedAssetType");

      objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset");
      if ((PLValidatedSavedAssetTypeApplies() & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset"), PLValidatedSavedAssetTypeApplies()))
      {
        v51 = 0;
        PLDuplicateDetectionGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v44, v51);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v45, CFSTR("savedAssetType"), CFSTR("Score was invalidated"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v53 = v46;
          _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        }
        PLDuplicateDetectionGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          PLValidatedSavedAssetTypeDescription();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v48;
          v54 = 2114;
          v55 = v49;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "Duplicate Asset: reset score to 0 based on savedAssetType: %{public}@ [%{public}@]", buf, 0x16u);

        }
      }
      return v51;
    default:
      goto LABEL_30;
  }
}

- (int64_t)_buildUserModifiedScore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[PLDuplicateAsset asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLDuplicateAsset hasModifiedUserTitle](self, "hasModifiedUserTitle"))
  {
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalFilename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
      v7 = 5;
    else
      v7 = 10;

    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v10, CFSTR("title"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v38 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "assetDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "longDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v7 += 5;
    PLDuplicateDetectionGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v15, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v16, CFSTR("longDescription"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "keywords");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 >= 1)
  {
    v7 += 5 * v19;
    PLDuplicateDetectionGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v21, v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v22, CFSTR("keywords"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  if (-[PLDuplicateAsset hasModifiedUserLocation](self, "hasModifiedUserLocation"))
  {
    v7 += 10;
    PLDuplicateDetectionGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v25, v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v26, CFSTR("location"), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  if (-[PLDuplicateAsset hasModifiedUserDateCreated](self, "hasModifiedUserDateCreated"))
  {
    v7 += 10;
    PLDuplicateDetectionGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v29, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v30, CFSTR("dateCreated"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v38 = v31;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }
  if (-[PLDuplicateAsset hasModifiedUserTimezone](self, "hasModifiedUserTimezone"))
  {
    v7 += 10;
    PLDuplicateDetectionGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[PLDuplicateAsset shortDescription](self, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v33, v7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      _PLDuplicateAssetLogString((uint64_t)v34, CFSTR("timeZoneOffset"), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v38 = v35;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

    }
  }

  return v7;
}

- (void)_fileFormatIncrementScore:(int64_t *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLDuplicateAsset asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isJPEG") & 1) == 0)
  {
    if (objc_msgSend(v5, "isHEIF"))
    {
      ++*a3;
      PLDuplicateDetectionGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v7, *a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v8, CFSTR("uniformTypeIdentifier"), CFSTR("HEIF"));
        v9 = objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v25 = v9;
LABEL_8:
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

LABEL_9:
      }
    }
    else
    {
      -[PLDuplicateAsset asset](self, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "RAWBadgeAttribute");

      if (!v11)
      {
        v13 = (void *)MEMORY[0x1E0D752F0];
        objc_msgSend(v5, "uniformTypeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "typeWithIdentifier:", v14);
        v6 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D752F0], "canonTIFFRAWImageType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NSObject isEqual:](v6, "isEqual:", v15);

        if (v16)
        {
          *a3 += 2;
          PLDuplicateDetectionGetLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            goto LABEL_9;
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v17, *a3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v18, CFSTR("uniformTypeIdentifier"), CFSTR("TIFFRaw"));
          v19 = objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v25 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D752F0], "adobePhotoshopType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSObject isEqual:](v6, "isEqual:", v20))
          {

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D752F0], "adobeIllustratorType");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[NSObject isEqual:](v6, "isEqual:", v21);

            if (!v22)
              goto LABEL_10;
          }
          *a3 += 3;
          PLDuplicateDetectionGetLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            goto LABEL_9;
          -[PLDuplicateAsset shortDescription](self, "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v17, *a3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          _PLDuplicateAssetLogString((uint64_t)v23, CFSTR("uniformTypeIdentifier"), CFSTR("Adobe"));
          v19 = objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543362;
          v25 = v19;
        }
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);

        goto LABEL_9;
      }
      *a3 += 4;
      PLDuplicateDetectionGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[PLDuplicateAsset shortDescription](self, "shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate Asset: [%@] score incremented to %td"), v7, *a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _PLDuplicateAssetLogString((uint64_t)v12, CFSTR("packedBadgeAttributes"), CFSTR("RAWBadgeAttributes"));
        v9 = objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v25 = v9;
        goto LABEL_8;
      }
    }
LABEL_10:

  }
}

- (NSManagedObjectID)assetObjectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAssetObjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)assetUUID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAssetUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)assetCloudScopedIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssetCloudScopedIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (signed)duplicateAssetVisibilityState
{
  return self->_duplicateAssetVisibilityState;
}

- (void)setDuplicateAssetVisibilityState:(signed __int16)a3
{
  self->_duplicateAssetVisibilityState = a3;
}

- (PLManagedAsset)asset
{
  return (PLManagedAsset *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int64_t)originalResolution
{
  return self->_originalResolution;
}

- (void)setOriginalResolution:(int64_t)a3
{
  self->_originalResolution = a3;
}

- (BOOL)resourceSwapDisabled
{
  return self->_resourceSwapDisabled;
}

- (void)setResourceSwapDisabled:(BOOL)a3
{
  self->_resourceSwapDisabled = a3;
}

- (BOOL)resourceComparisonPropertyUpdateLocation
{
  return self->_resourceComparisonPropertyUpdateLocation;
}

- (void)setResourceComparisonPropertyUpdateLocation:(BOOL)a3
{
  self->_resourceComparisonPropertyUpdateLocation = a3;
}

- (NSString)resourceSwapAssetUUID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setResourceSwapAssetUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)titleUpdated
{
  return self->_titleUpdated;
}

- (void)setTitleUpdated:(BOOL)a3
{
  self->_titleUpdated = a3;
}

- (BOOL)dateUpdated
{
  return self->_dateUpdated;
}

- (void)setDateUpdated:(BOOL)a3
{
  self->_dateUpdated = a3;
}

- (BOOL)locationUpdated
{
  return self->_locationUpdated;
}

- (void)setLocationUpdated:(BOOL)a3
{
  self->_locationUpdated = a3;
}

- (BOOL)timezoneUpdated
{
  return self->_timezoneUpdated;
}

- (void)setTimezoneUpdated:(BOOL)a3
{
  self->_timezoneUpdated = a3;
}

- (BOOL)iptcUpdated
{
  return self->_iptcUpdated;
}

- (void)setIptcUpdated:(BOOL)a3
{
  self->_iptcUpdated = a3;
}

- (BOOL)facesUpdated
{
  return self->_facesUpdated;
}

- (void)setFacesUpdated:(BOOL)a3
{
  self->_facesUpdated = a3;
}

- (NSString)assetObjectIDDescription
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAssetObjectIDDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (int64_t)mergeStatus
{
  return self->_mergeStatus;
}

- (BOOL)enableEXIFDataAccess
{
  return self->_enableEXIFDataAccess;
}

- (void)setEnableEXIFDataAccess:(BOOL)a3
{
  self->_enableEXIFDataAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetObjectIDDescription, 0);
  objc_storeStrong((id *)&self->_resourceSwapAssetUUID, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetCloudScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_isCPLEnabled, 0);
  objc_storeStrong((id *)&self->_hasUserModifiedLocation, 0);
  objc_storeStrong((id *)&self->_hasUserModifiedTimezone, 0);
  objc_storeStrong((id *)&self->_hasUserModifiedDateCreated, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
}

BOOL __63__PLDuplicateAsset__compareResourcesAdditionalChecksFromOther___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "version"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "cplType") == 18;

  return v3;
}

BOOL __63__PLDuplicateAsset__compareResourcesAdditionalChecksFromOther___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "version"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "cplType") == 18;

  return v3;
}

void __46__PLDuplicateAsset__validCPLAssetsWithAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectIDsForRelationshipNamed:", CFSTR("master"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "count") != 0;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
}

uint64_t __81__PLDuplicateAsset__mergeComparisonScoreModifierWithOtherAsset_score_otherScore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)relationshipKeyPathsForPrefetching
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("additionalAttributes");
  v3[1] = CFSTR("additionalAttributes.assetDescription");
  v3[2] = CFSTR("additionalAttributes.unmanagedAdjustment");
  v3[3] = CFSTR("additionalAttributes.keywords");
  v3[4] = CFSTR("additionalAttributes.editedIPTCAttributes");
  v3[5] = CFSTR("extendedAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipKeyPathsForMergePrefetching
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "relationshipKeyPathsForPrefetching");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("albums");
  v6[1] = CFSTR("libraryScope");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isDuplicateAssetSortChangedObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "duplicateSortPropertyNamesSkip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            LOBYTE(v11) = 0;
            goto LABEL_22;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v7)
          continue;
        break;
      }
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "duplicateSortPropertyNames", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            LOBYTE(v11) = 1;
            goto LABEL_22;
          }
        }
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_22:

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

@end
