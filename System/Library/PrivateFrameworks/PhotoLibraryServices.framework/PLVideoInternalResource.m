@implementation PLVideoInternalResource

- (PLVideoInternalResource)initWithBackingResource:(id)a3
{
  id v6;
  PLVideoInternalResource *v7;
  PLVideoInternalResource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLVideoInternalResourceContext.m"), 36, CFSTR("Backing resource required"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PLVideoInternalResource;
  v7 = -[PLVideoInternalResource init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_backingResource, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PLVideoInternalResource;
  if (-[PLVideoInternalResource isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[PLInternalResource isEqual:](self->_backingResource, "isEqual:", v4[2]);
    else
      v5 = 0;
  }

  return v5;
}

- (unsigned)storeClassID
{
  return -[PLInternalResource dataStoreClassID](self->_backingResource, "dataStoreClassID");
}

- (unsigned)version
{
  return -[PLInternalResource version](self->_backingResource, "version");
}

- (BOOL)isOriginalVideo
{
  PLInternalResource *v2;
  BOOL v3;

  v2 = self->_backingResource;
  v3 = -[PLInternalResource resourceType](v2, "resourceType") == 1
    && !-[PLInternalResource version](v2, "version")
    && (-[PLInternalResource recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (BOOL)isOriginalVideoComplement
{
  return -[PLInternalResource dataStoreSubtype](self->_backingResource, "dataStoreSubtype") == 18;
}

- (BOOL)isLocallyAvailable
{
  void *v2;
  BOOL v3;

  -[PLInternalResource dataStoreKey](self->_backingResource, "dataStoreKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isLocallyGeneratable
{
  void *v3;
  unsigned int v4;
  BOOL result;
  void *v6;
  int v7;

  if (-[PLInternalResource recipeID](self->_backingResource, "recipeID") != 0x20000
    && -[PLInternalResource recipeID](self->_backingResource, "recipeID") != 131272
    && -[PLInternalResource recipeID](self->_backingResource, "recipeID") != 131280)
  {
    return 0;
  }
  -[PLInternalResource asset](self->_backingResource, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deferredProcessingNeeded");

  if (v4 > 0xB)
    return 0;
  result = 1;
  if (((1 << v4) & 0x9F9) != 0)
  {
    -[PLInternalResource asset](self->_backingResource, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "videoDeferredProcessingNeeded");

    return v7 == 1;
  }
  return result;
}

- (BOOL)isPlayable
{
  NSNumber *cachedIsPlayable;
  NSNumber *v4;
  NSNumber *v5;

  cachedIsPlayable = self->_cachedIsPlayable;
  if (!cachedIsPlayable)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLInternalResource isPlayableVideo](self->_backingResource, "isPlayableVideo"));
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedIsPlayable;
    self->_cachedIsPlayable = v4;

    cachedIsPlayable = self->_cachedIsPlayable;
  }
  return -[NSNumber BOOLValue](cachedIsPlayable, "BOOLValue");
}

- (id)cachedIsPlayable
{
  return self->_cachedIsPlayable;
}

- (BOOL)isDownloadable
{
  return -[PLInternalResource isInCloud](self->_backingResource, "isInCloud");
}

- (BOOL)isStreamable
{
  PLVideoInternalResource *v2;
  void *v3;

  v2 = self;
  -[PLInternalResource dataStore](self->_backingResource, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "canStreamResource:", v2->_backingResource);

  return (char)v2;
}

- (BOOL)isLargeQuality
{
  return -[PLInternalResource recipeID](self->_backingResource, "recipeID") == 131077;
}

- (BOOL)matchesOrExceedsQualityLevel:(unsigned int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[PLInternalResource dataStore](self->_backingResource, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "videoResource:matchesOrExceedsQualityLevel:", self->_backingResource, v3);

  return v3;
}

- (id)fileURLIfLocal
{
  void *v3;
  void *v4;
  void *v5;

  -[PLInternalResource dataStoreKey](self->_backingResource, "dataStoreKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLInternalResource assetID](self->_backingResource, "assetID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLForAssetID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasAssociatedMediaMetadata
{
  unint64_t v3;

  v3 = -[PLInternalResource cplType](self->_backingResource, "cplType");
  if (v3 != 1)
    LOBYTE(v3) = -[PLInternalResource cplType](self->_backingResource, "cplType") == 16
              && -[PLInternalResource version](self->_backingResource, "version") == 2;
  return v3;
}

- (BOOL)isHDRDerivative
{
  return -[PLInternalResource recipeID](self->_backingResource, "recipeID") == 131475;
}

- (BOOL)isSDRFallback
{
  return -[PLInternalResource recipeID](self->_backingResource, "recipeID") == 131079;
}

- (BOOL)isHDROrSDRDependingOnMasterVideo
{
  return -[PLInternalResource recipeID](self->_backingResource, "recipeID") == 131077;
}

- (id)uniformTypeIdentifier
{
  void *v2;
  void *v3;

  -[PLInternalResource uniformTypeIdentifier](self->_backingResource, "uniformTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)additionalDescription
{
  void *v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLInternalResource recipeID](self->_backingResource, "recipeID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[PLInternalResource version](self->_backingResource, "version");
  if (v5 > 2)
    v6 = CFSTR("cur");
  else
    v6 = off_1E3662340[v5];
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", -[PLInternalResource cplType](self->_backingResource, "cplType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ver: %@, recipe: %@, cplType: %@"), v7, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v16;

  -[PLInternalResource dataStore](self->_backingResource, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLInternalResource asset](self->_backingResource, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForSubtype:", -[PLInternalResource dataStoreSubtype](self->_backingResource, "dataStoreSubtype"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLInternalResource unorientedWidth](self->_backingResource, "unorientedWidth");
  v9 = -[PLInternalResource unorientedHeight](self->_backingResource, "unorientedHeight");
  PLResourceLocalAvailabilityName(-[PLInternalResource localAvailability](self->_backingResource, "localAvailability"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLInternalResource remoteAvailability](self->_backingResource, "remoteAvailability");
  v12 = CFSTR("missing");
  if (v11 == 1)
    v12 = CFSTR("available");
  if (!v11)
    v12 = CFSTR("unavailable");
  v13 = v12;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p> asset=%@ dataStoreSubtype=%@ size=%lldx%lld availability remote/local=%@/%@"), v4, self, v6, v7, v8, v9, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (PLInternalResource)backingResource
{
  return self->_backingResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingResource, 0);
  objc_storeStrong((id *)&self->_cachedIsPlayable, 0);
}

+ (BOOL)deviceSupportsHDR
{
  return objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceIsEligibleForHDRPlayback");
}

@end
