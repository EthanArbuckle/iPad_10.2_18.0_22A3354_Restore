@implementation PLVirtualResource

- (PLVirtualResource)initWithAsset:(id)a3 resourceType:(unsigned int)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6
{
  uint64_t v6;
  id v11;
  PLVirtualResource *v12;
  PLVirtualResource *v13;
  uint64_t v14;
  PLAssetID *assetID;
  void *v16;
  void *v18;
  objc_super v19;

  v6 = *(_QWORD *)&a6;
  v11 = a3;
  if (-[PLVirtualResource isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    -[PLVirtualResource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    v12 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PLVirtualResource;
    v13 = -[PLVirtualResource init](&v19, sel_init);
    if (v13)
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PLVirtualResource.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

      }
      objc_msgSend(v11, "assetID");
      v14 = objc_claimAutoreleasedReturnValue();
      assetID = v13->_assetID;
      v13->_assetID = (PLAssetID *)v14;

      v13->_version = a5;
      v13->_resourceType = a4;
      v13->_recipeID = v6;
      v13->_assetWidth = objc_msgSend(v11, "width");
      v13->_assetHeight = objc_msgSend(v11, "height");
      v13->_isMarkedFullSize = PLIsResourceMarkedFullSizeFromRecipeID(v6);
      -[PLVirtualResource uniformTypeIdentifier](v13, "uniformTypeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_isLosslessEncoded = objc_msgSend(v16, "isLosslessEncoding");

    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (PLVirtualResource)initWithRecipe:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  PLVirtualResource *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLVirtualResource.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipe"));

  }
  v9 = -[PLVirtualResource initWithAsset:resourceType:version:recipeID:](self, "initWithAsset:resourceType:version:recipeID:", v8, 0, 3, objc_msgSend(v7, "recipeID"));

  return v9;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validateForAssetID:resourceIdentity:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isOriginalResource
{
  PLVirtualResource *v2;
  BOOL v3;

  v2 = self;
  if (-[PLVirtualResource version](v2, "version"))
    v3 = 0;
  else
    v3 = (-[PLVirtualResource recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (BOOL)isVirtual
{
  return 1;
}

- (BOOL)isDefaultOrientation
{
  return 1;
}

- (BOOL)isDerivative
{
  return -[PLVirtualResource recipeID](self, "recipeID") & 1;
}

- (unint64_t)cplType
{
  return 0;
}

- (int64_t)dataLength
{
  return 0;
}

- (int64_t)estimatedDataLength
{
  return 0;
}

- (signed)localAvailability
{
  void *v2;

  -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 1;
  else
    return -1;
}

- (int64_t)orientedWidth
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = -[PLVirtualResource unorientedWidth](self, "unorientedWidth");
  v4 = -[PLVirtualResource unorientedHeight](self, "unorientedHeight");
  if ((unint64_t)-[PLVirtualResource orientation](self, "orientation") - 5 >= 4)
    v5 = v3;
  else
    v5 = v4;
  return (uint64_t)(double)v5;
}

- (int64_t)orientedHeight
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = -[PLVirtualResource unorientedWidth](self, "unorientedWidth");
  v4 = -[PLVirtualResource unorientedHeight](self, "unorientedHeight");
  if ((unint64_t)-[PLVirtualResource orientation](self, "orientation") - 5 >= 4)
    v5 = v4;
  else
    v5 = v3;
  return (uint64_t)(double)v5;
}

- (BOOL)isPlayableVideo
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (signed)utiConformanceHint
{
  void *v2;
  signed __int16 v3;

  -[PLVirtualResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformanceHint");

  return v3;
}

- (int)qualitySortValue
{
  int64_t assetWidth;
  int64_t assetHeight;
  int64_t v5;
  int64_t v6;
  int isLosslessEncoded;
  double v8;
  double v9;

  assetWidth = self->_assetWidth;
  assetHeight = self->_assetHeight;
  v5 = -[PLVirtualResource orientedWidth](self, "orientedWidth");
  v6 = -[PLVirtualResource orientedHeight](self, "orientedHeight");
  isLosslessEncoded = self->_isLosslessEncoded;
  if (self->_isMarkedFullSize)
    isLosslessEncoded |= 2u;
  v8 = sqrt((double)(v6 * v5)) / sqrt((double)(assetHeight * assetWidth));
  if (v8 >= 1.0)
    v9 = 32767.0;
  else
    v9 = v8 * 32767.0;
  return isLosslessEncoded | ((int)v9 << 16);
}

- (NSURL)fileURL
{
  void *v3;
  void *v4;
  void *v5;

  -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLVirtualResource assetID](self, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLForAssetID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (id)photosCTLJSONDict
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
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
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLVirtualResource codecFourCharCodeName](self, "codecFourCharCodeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLVirtualResource codecFourCharCodeName](self, "codecFourCharCodeName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("none");
  }
  -[PLVirtualResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("none");
  }
  -[PLVirtualResource dataStore](self, "dataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)objc_opt_class(), "storeClassID");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("uti"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("store"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLVirtualResource dataStoreSubtype](self, "dataStoreSubtype"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("subtype"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLVirtualResource version](self, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLVirtualResource recipeID](self, "recipeID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("recipe"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("codec"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLVirtualResource orientation](self, "orientation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("orientation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLVirtualResource unorientedWidth](self, "unorientedWidth"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("unorientedWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLVirtualResource unorientedHeight](self, "unorientedHeight"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("unorientedHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLVirtualResource localAvailability](self, "localAvailability"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("localAvailability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLVirtualResource remoteAvailability](self, "remoteAvailability"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("remoteAvailability"));

  -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "descriptionForAssetID:", self->_assetID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("dataStoreKey"));

  return v3;
}

- (id)singleLineDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PLVirtualResource resourceType](self, "resourceType");
  if (v7 > 0x1F)
    v8 = CFSTR("invalid");
  else
    v8 = off_1E3662240[v7];
  v9 = v8;
  objc_msgSend(v6, "appendFormat:", CFSTR(" type: %@"), v9);

  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLVirtualResource recipeID](self, "recipeID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" recipeID: %@"), v11);

  v12 = -[PLVirtualResource version](self, "version");
  if (v12 > 2)
    v13 = CFSTR("cur");
  else
    v13 = off_1E3662340[v12];
  v14 = v13;
  objc_msgSend(v6, "appendFormat:", CFSTR(" ver: %@"), v14);

  -[PLVirtualResource dataStore](self, "dataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptionForSubtype:", -[PLVirtualResource dataStoreSubtype](self, "dataStoreSubtype"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" subtype: %@"), v16);

  objc_msgSend(v6, "appendFormat:", CFSTR(" size: (%ld, %ld)"), -[PLVirtualResource unorientedWidth](self, "unorientedWidth"), -[PLVirtualResource unorientedHeight](self, "unorientedHeight"));
  -[PLVirtualResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" uti: %@"), v18);

  if (-[PLVirtualResource localAvailability](self, "localAvailability") == 1)
    v19 = CFSTR("Y");
  else
    v19 = CFSTR("N");
  objc_msgSend(v6, "appendFormat:", CFSTR(" local: %@"), v19);
  if (-[PLVirtualResource remoteAvailability](self, "remoteAvailability") == 1)
    v20 = CFSTR("Y");
  else
    v20 = CFSTR("N");
  objc_msgSend(v6, "appendFormat:", CFSTR(" remote: %@"), v20);
  -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fileURLForAssetID:", self->_assetID);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v6, "appendFormat:", CFSTR(" url: %@"), v22);

  return v6;
}

- (NSString)debugDescription
{
  PLDescriptionBuilder *v3;
  unsigned int v4;
  __CFString *v5;
  __CFString *v6;
  unsigned int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 3, 0);
  v4 = -[PLVirtualResource resourceType](self, "resourceType");
  if (v4 > 0x1F)
    v5 = CFSTR("invalid");
  else
    v5 = off_1E3662240[v4];
  v6 = v5;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("resourceType"), v6);

  v7 = -[PLVirtualResource version](self, "version");
  if (v7 > 2)
    v8 = CFSTR("cur");
  else
    v8 = off_1E3662340[v7];
  v9 = v8;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("version"), v9);

  -[PLVirtualResource dataStore](self, "dataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "storeClassID");
  objc_msgSend(v10, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" (%ld)"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataStore"), v13);
  v14 = -[PLVirtualResource dataStoreSubtype](self, "dataStoreSubtype");
  -[PLVirtualResource dataStore](self, "dataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptionForSubtype:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" (%ld)"), v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataStoreSubtype"), v17);
  if (-[PLVirtualResource recipeID](self, "recipeID"))
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLVirtualResource recipeID](self, "recipeID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("recipeID"), v19);

  }
  -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PLVirtualResource dataStoreKey](self, "dataStoreKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "descriptionForAssetID:", self->_assetID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("dataStoreKey"), v22);

  }
  PLResourceLocalAvailabilityName(-[PLVirtualResource localAvailability](self, "localAvailability"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("localAvailability"), v23);

  PLResourceLocalAvailabilityTargetName(-[PLVirtualResource localAvailabilityTarget](self, "localAvailabilityTarget"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("localAvailabilityTarget"), v24);

  v25 = -[PLVirtualResource remoteAvailability](self, "remoteAvailability");
  if (v25 == 1)
    v26 = CFSTR("available");
  else
    v26 = CFSTR("missing");
  if (!v25)
    v26 = CFSTR("unavailable");
  v27 = v26;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("remoteAvailability"), v27);

  v28 = -[PLVirtualResource remoteAvailabilityTarget](self, "remoteAvailabilityTarget");
  if (v28 == 1)
    v29 = CFSTR("available");
  else
    v29 = CFSTR("missing");
  if (!v28)
    v29 = CFSTR("unavailable");
  v30 = v29;
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("remoteAvailabilityTarget"), v30);

  -[PLDescriptionBuilder appendName:BOOLValue:](v3, "appendName:BOOLValue:", CFSTR("isDerivative"), -[PLVirtualResource isDerivative](self, "isDerivative"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("unorientedWidth"), -[PLVirtualResource unorientedWidth](self, "unorientedWidth"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("unorientedHeight"), -[PLVirtualResource unorientedHeight](self, "unorientedHeight"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("orientation"), -[PLVirtualResource orientation](self, "orientation"));
  -[PLDescriptionBuilder appendName:integerValue:](v3, "appendName:integerValue:", CFSTR("qualitySortValue"), -[PLVirtualResource qualitySortValue](self, "qualitySortValue"));
  -[PLVirtualResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("uniformTypeIdentifier"), v32);

  -[PLVirtualResource codecFourCharCodeName](self, "codecFourCharCodeName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](v3, "appendName:object:", CFSTR("codecFourCharCodeName"), v33);

  -[PLDescriptionBuilder build](v3, "build");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v34;
}

- (PLAssetID)assetID
{
  return self->_assetID;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unsigned int)a3
{
  self->_resourceType = a3;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

- (PLResourceDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (int64_t)dataStoreSubtype
{
  return self->_dataStoreSubtype;
}

- (void)setDataStoreSubtype:(int64_t)a3
{
  self->_dataStoreSubtype = a3;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  return self->_dataStoreKey;
}

- (void)setDataStoreKey:(id)a3
{
  objc_storeStrong((id *)&self->_dataStoreKey, a3);
}

- (signed)localAvailabilityTarget
{
  return self->_localAvailabilityTarget;
}

- (signed)remoteAvailability
{
  return self->_remoteAvailability;
}

- (void)setRemoteAvailability:(signed __int16)a3
{
  self->_remoteAvailability = a3;
}

- (signed)remoteAvailabilityTarget
{
  return self->_remoteAvailabilityTarget;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (int64_t)unorientedWidth
{
  return self->_unorientedWidth;
}

- (void)setUnorientedWidth:(int64_t)a3
{
  self->_unorientedWidth = a3;
}

- (int64_t)unorientedHeight
{
  return self->_unorientedHeight;
}

- (void)setUnorientedHeight:(int64_t)a3
{
  self->_unorientedHeight = a3;
}

- (NSString)codecFourCharCodeName
{
  return self->_codecFourCharCodeName;
}

- (void)setCodecFourCharCodeName:(id)a3
{
  objc_storeStrong((id *)&self->_codecFourCharCodeName, a3);
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, a3);
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (signed)trashedState
{
  return self->_trashedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_codecFourCharCodeName, 0);
  objc_storeStrong((id *)&self->_dataStoreKey, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
