@implementation AssetCollectionInfo

- (AssetCollectionInfo)initWithAssetCollection:(id)a3
{
  id v4;
  AssetCollectionInfo *v5;
  uint64_t v6;
  NSString *GUID;
  uint64_t v8;
  NSString *personID;
  uint64_t v10;
  NSDictionary *metaData;
  uint64_t v12;
  NSDate *timestamp;
  uint64_t v14;
  NSString *derivativeUTI;
  uint64_t v16;
  NSString *originalFilename;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  uint64_t v28;
  NSNumber *width;
  uint64_t v30;
  NSNumber *height;
  uint64_t v32;
  NSNumber *originalFilesize;
  void *v34;
  double v35;
  uint64_t v36;
  NSNumber *v37;
  uint64_t v38;
  NSNumber *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)AssetCollectionInfo;
  v5 = -[AssetCollectionInfo init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "GUID");
    v6 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    objc_msgSend(v4, "personID");
    v8 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    v5->_isMine = objc_msgSend(v4, "isMine");
    v5->_isVideo = objc_msgSend(v4, "isVideo");
    v5->_isPhotoIris = objc_msgSend(v4, "isPhotoIris");
    v5->_isDeletable = objc_msgSend(v4, "isDeletable");
    objc_msgSend(v4, "metadata");
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (NSDictionary *)v10;

    objc_msgSend(v4, "timestamp");
    v12 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;

    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    derivativeUTI = v5->_derivativeUTI;
    v5->_derivativeUTI = (NSString *)v14;

    objc_msgSend(v4, "fileName");
    v16 = objc_claimAutoreleasedReturnValue();
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v16;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v4, "assets", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v24 = objc_msgSend(v23, "mediaAssetType");
          if (v24 != 3 && (v24 != 7 || v5->_isPhotoIris))
            continue;
          objc_msgSend(v23, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0D16FD0]);
            v28 = objc_claimAutoreleasedReturnValue();
            width = v5->_width;
            v5->_width = (NSNumber *)v28;

            objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0D16FC8]);
            v30 = objc_claimAutoreleasedReturnValue();
            height = v5->_height;
            v5->_height = (NSNumber *)v30;

            objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0D16FC0]);
            v32 = objc_claimAutoreleasedReturnValue();
            originalFilesize = v5->_originalFilesize;
            v5->_originalFilesize = (NSNumber *)v32;

          }
          objc_msgSend(v23, "type");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
            objc_storeStrong((id *)&v5->_derivativeUTI, v34);

          goto LABEL_20;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_20:

    if (!v5->_width)
    {
      LODWORD(v35) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v5->_width;
      v5->_width = (NSNumber *)v36;

    }
    if (!v5->_height)
    {
      LODWORD(v35) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v5->_height;
      v5->_height = (NSNumber *)v38;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *GUID;
  id v5;

  GUID = self->_GUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", GUID, CFSTR("GUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personID, CFSTR("personID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metaData, CFSTR("metaData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMine, CFSTR("isMine"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isVideo, CFSTR("isVideo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPhotoIris, CFSTR("isPhotoIris"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDeletable, CFSTR("isDeletable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_height, CFSTR("height"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_derivativeUTI, CFSTR("derivativeUTI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalFilesize, CFSTR("originalFilesize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalFilename, CFSTR("originalFilename"));

}

- (AssetCollectionInfo)initWithCoder:(id)a3
{
  id v4;
  AssetCollectionInfo *v5;
  uint64_t v6;
  NSString *GUID;
  uint64_t v8;
  NSString *personID;
  uint64_t v10;
  NSDictionary *metaData;
  uint64_t v12;
  NSNumber *width;
  uint64_t v14;
  NSNumber *height;
  uint64_t v16;
  NSDate *timestamp;
  uint64_t v18;
  NSString *derivativeUTI;
  uint64_t v20;
  NSNumber *originalFilesize;
  uint64_t v22;
  NSString *originalFilename;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AssetCollectionInfo;
  v5 = -[AssetCollectionInfo init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personID"));
    v8 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("metaData"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (NSDictionary *)v10;

    v5->_isMine = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMine"));
    v5->_isVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVideo"));
    v5->_isPhotoIris = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPhotoIris"));
    v5->_isDeletable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeletable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("width"));
    v12 = objc_claimAutoreleasedReturnValue();
    width = v5->_width;
    v5->_width = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("height"));
    v14 = objc_claimAutoreleasedReturnValue();
    height = v5->_height;
    v5->_height = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v16 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("derivativeUTI"));
    v18 = objc_claimAutoreleasedReturnValue();
    derivativeUTI = v5->_derivativeUTI;
    v5->_derivativeUTI = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalFilesize"));
    v20 = objc_claimAutoreleasedReturnValue();
    originalFilesize = v5->_originalFilesize;
    v5->_originalFilesize = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalFilename"));
    v22 = objc_claimAutoreleasedReturnValue();
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v22;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AssetCollectionInfo;
  -[AssetCollectionInfo description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_GUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" GUID: %@"), self->_GUID);
  if (self->_personID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" personID: %@"), self->_personID);
  if (self->_isMine)
    objc_msgSend(v4, "appendFormat:", CFSTR(" isMine: %d"), 1);
  if (self->_isVideo)
    objc_msgSend(v4, "appendFormat:", CFSTR(" isVideo: %d"), 1);
  if (self->_isPhotoIris)
    objc_msgSend(v4, "appendFormat:", CFSTR(" isPhotoIris: %d"), 1);
  if (self->_isDeletable)
    objc_msgSend(v4, "appendFormat:", CFSTR(" isDeletable: %d"), 1);
  if (self->_metaData)
    objc_msgSend(v4, "appendFormat:", CFSTR(" metaData: %@"), self->_metaData);
  if (self->_width)
    objc_msgSend(v4, "appendFormat:", CFSTR(" width: %@"), self->_width);
  if (self->_height)
    objc_msgSend(v4, "appendFormat:", CFSTR(" height: %@"), self->_height);
  if (self->_timestamp)
    objc_msgSend(v4, "appendFormat:", CFSTR(" timestamp: %@"), self->_timestamp);
  if (self->_derivativeUTI)
    objc_msgSend(v4, "appendFormat:", CFSTR(" derivativeUTI: %@"), self->_derivativeUTI);
  if (self->_originalFilesize)
    objc_msgSend(v4, "appendFormat:", CFSTR(" originalFilesize: %@"), self->_originalFilesize);
  if (self->_originalFilename)
    objc_msgSend(v4, "appendFormat:", CFSTR(" originalFilename: %@"), self->_originalFilename);
  return v4;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)personID
{
  return self->_personID;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isPhotoIris
{
  return self->_isPhotoIris;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (NSNumber)width
{
  return self->_width;
}

- (NSNumber)height
{
  return self->_height;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)derivativeUTI
{
  return self->_derivativeUTI;
}

- (NSNumber)originalFilesize
{
  return self->_originalFilesize;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_originalFilesize, 0);
  objc_storeStrong((id *)&self->_derivativeUTI, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
