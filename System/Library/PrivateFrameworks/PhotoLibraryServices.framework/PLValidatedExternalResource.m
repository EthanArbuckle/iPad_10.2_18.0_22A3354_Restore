@implementation PLValidatedExternalResource

- (PLValidatedExternalResource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLValidatedExternalResource;
  return -[PLValidatedExternalResource init](&v3, sel_init);
}

- (BOOL)isOriginalResource
{
  PLValidatedExternalResource *v2;
  BOOL v3;

  v2 = self;
  if (-[PLValidatedExternalResource version](v2, "version"))
    v3 = 0;
  else
    v3 = (-[PLValidatedExternalResource recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (BOOL)isDerivative
{
  return -[PLValidatedExternalResource recipeID](self, "recipeID") & 1;
}

- (BOOL)hasRecipe
{
  return -[PLValidatedExternalResource recipeID](self, "recipeID") != 0;
}

- (BOOL)isPlayableVideo
{
  return 0;
}

- (unint64_t)cplTypeWithAssetID:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (-[PLValidatedExternalResource isDerivative](self, "isDerivative"))
  {
    v5 = +[PLResourceInstaller derivativeCPLTypeFromRecipeID:version:](PLResourceInstaller, "derivativeCPLTypeFromRecipeID:version:", -[PLValidatedExternalResource recipeID](self, "recipeID"), -[PLValidatedExternalResource version](self, "version"));
  }
  else
  {
    -[PLValidatedExternalResource fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PLValidatedExternalResource version](self, "version")
      || (objc_msgSend(v4, "filename"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToString:", v8),
          v8,
          (v9 & 1) == 0))
    {
      v10 = -[PLValidatedExternalResource resourceType](self, "resourceType");
      v11 = -[PLValidatedExternalResource version](self, "version");
      -[PLValidatedExternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = +[PLResourceInstaller nonDerivativeCPLTypeFromResourceType:version:uniformTypeIdentifier:](PLResourceInstaller, "nonDerivativeCPLTypeFromResourceType:version:uniformTypeIdentifier:", v10, v11, v12);

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (void)setTrashedStateFromURL
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  __int16 v11;

  -[PLValidatedExternalResource fileURL](self, "fileURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = +[PLInternalResource supportsTrashedStateForResourceIdentity:](PLInternalResource, "supportsTrashedStateForResourceIdentity:", self);

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D73200];
      -[PLValidatedExternalResource fileURL](self, "fileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "persistedAttributesForFileAtURL:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      if (objc_msgSend(v8, "getUInt16:forKey:", &v11, *MEMORY[0x1E0D74000]))
        v9 = v11 == 0;
      else
        v9 = 1;
      if (!v9)
      {
        -[PLValidatedExternalResource setTrashedState:](self, "setTrashedState:", 1);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2592000.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLValidatedExternalResource setTrashedDate:](self, "setTrashedDate:", v10);

      }
    }
  }
}

- (BOOL)isEqualToValidatedExternalResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !PLResourceIdentityIsEqual(self, v4))
    goto LABEL_8;
  -[PLValidatedExternalResource fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_6;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[PLValidatedExternalResource fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 1;
LABEL_9:

  return v9;
}

- (void)persistResourceTypeToFileURL
{
  void *v3;
  void *v4;
  unsigned __int16 v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D73200];
  -[PLValidatedExternalResource fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filesystemPersistenceBatchItemForFileAtURL:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[PLValidatedExternalResource resourceType](self, "resourceType");
  objc_msgSend(v6, "setUInt16:forKey:", v5, *MEMORY[0x1E0D73FB8]);
  objc_msgSend(v6, "persist");

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLValidatedExternalResource resourceType](self, "resourceType");
  if (v6 > 0x1F)
    v7 = CFSTR("invalid");
  else
    v7 = off_1E3662240[v6];
  v8 = v7;
  v9 = -[PLValidatedExternalResource version](self, "version");
  if (v9 > 2)
    v10 = CFSTR("cur");
  else
    v10 = off_1E3662340[v9];
  v11 = v10;
  v12 = -[PLValidatedExternalResource unorientedWidth](self, "unorientedWidth");
  v13 = -[PLValidatedExternalResource unorientedHeight](self, "unorientedHeight");
  -[PLValidatedExternalResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> type: %@, ver: %@, width: %lu, height: %lu, uti: %@"), v5, self, v8, v11, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
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

- (NSString)codecFourCharCode
{
  return self->_codecFourCharCode;
}

- (void)setCodecFourCharCode:(id)a3
{
  objc_storeStrong((id *)&self->_codecFourCharCode, a3);
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, a3);
}

- (int64_t)dataLength
{
  return self->_dataLength;
}

- (void)setDataLength:(int64_t)a3
{
  self->_dataLength = a3;
}

- (NSNumber)sidecarIndex
{
  return self->_sidecarIndex;
}

- (void)setSidecarIndex:(id)a3
{
  objc_storeStrong((id *)&self->_sidecarIndex, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (signed)trashedState
{
  return self->_trashedState;
}

- (void)setTrashedState:(signed __int16)a3
{
  self->_trashedState = a3;
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (void)setTrashedDate:(id)a3
{
  objc_storeStrong((id *)&self->_trashedDate, a3);
}

- (int64_t)ptpTrashedState
{
  return self->_ptpTrashedState;
}

- (void)setPtpTrashedState:(int64_t)a3
{
  self->_ptpTrashedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_sidecarIndex, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_codecFourCharCode, 0);
}

+ (id)resourceWithExternalResource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setResourceType:", objc_msgSend(v4, "resourceType"));
  objc_msgSend(v5, "setVersion:", objc_msgSend(v4, "version"));
  objc_msgSend(v5, "setRecipeID:", objc_msgSend(v4, "recipeID"));
  objc_msgSend(v4, "uniformTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniformTypeIdentifier:", v6);

  objc_msgSend(v4, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileURL:", v7);

  objc_msgSend(v5, "setDataLength:", objc_msgSend(v4, "dataLength"));
  objc_msgSend(v5, "setUnorientedWidth:", objc_msgSend(v4, "unorientedWidth"));
  objc_msgSend(v5, "setUnorientedHeight:", objc_msgSend(v4, "unorientedHeight"));
  objc_msgSend(v4, "codecFourCharCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCodecFourCharCode:", v8);

  objc_msgSend(v5, "setTrashedState:", objc_msgSend(v4, "trashedState"));
  objc_msgSend(v4, "trashedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrashedDate:", v9);

  objc_msgSend(v5, "setPtpTrashedState:", objc_msgSend(v4, "ptpTrashedState"));
  objc_msgSend(v4, "sidecarIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSidecarIndex:", v10);
  return v5;
}

@end
