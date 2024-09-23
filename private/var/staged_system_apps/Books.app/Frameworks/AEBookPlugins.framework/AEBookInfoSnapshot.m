@implementation AEBookInfoSnapshot

+ (id)aeBookInfoSnapshotFromBookInfo:(id)a3 ordinal:(unint64_t)a4
{
  id v5;
  AEBookInfoSnapshot *v6;
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

  v5 = a3;
  v6 = objc_opt_new(AEBookInfoSnapshot);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheItem"));
  -[AEBookInfoSnapshot setCacheItem:](v6, "setCacheItem:", v7);

  -[AEBookInfoSnapshot setBkPageProgressionDirection:](v6, "setBkPageProgressionDirection:", objc_msgSend(v5, "bkPageProgressionDirection"));
  -[AEBookInfoSnapshot setIsFixedLayout:](v6, "setIsFixedLayout:", objc_msgSend(v5, "isFixedLayout"));
  -[AEBookInfoSnapshot setObeyPageBreaks:](v6, "setObeyPageBreaks:", objc_msgSend(v5, "obeyPageBreaks"));
  -[AEBookInfoSnapshot setShouldAllowRemoteInspection:](v6, "setShouldAllowRemoteInspection:", objc_msgSend(v5, "shouldAllowRemoteInspection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "respectImageSizeClass"));
  -[AEBookInfoSnapshot setRespectImageSizeClass:](v6, "setRespectImageSizeClass:", v8);

  -[AEBookInfoSnapshot setRespectImageSizeClassIsPrefix:](v6, "setRespectImageSizeClassIsPrefix:", objc_msgSend(v5, "respectImageSizeClassIsPrefix"));
  -[AEBookInfoSnapshot setHasBuiltInFonts:](v6, "setHasBuiltInFonts:", objc_msgSend(v5, "hasBuiltInFonts"));
  -[AEBookInfoSnapshot setShouldDisableOptimizeSpeed:](v6, "setShouldDisableOptimizeSpeed:", objc_msgSend(v5, "shouldDisableOptimizeSpeed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookLanguage"));
  -[AEBookInfoSnapshot setBookLanguage:](v6, "setBookLanguage:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  -[AEBookInfoSnapshot setAssetID:](v6, "setAssetID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spineIndexInPackage"));
  -[AEBookInfoSnapshot setSpineIndexInPackage:](v6, "setSpineIndexInPackage:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentWithOrdinal:", a4));
  if (!v12)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentWithOrdinal:", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "manifestId"));
  -[AEBookInfoSnapshot setManifestId:](v6, "setManifestId:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlForDocument:", v12));
  -[AEBookInfoSnapshot setUrl:](v6, "setUrl:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fixedLayoutWidth"));
  -[AEBookInfoSnapshot setFixedLayoutWidth:](v6, "setFixedLayoutWidth:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fixedLayoutHeight"));
  -[AEBookInfoSnapshot setFixedLayoutHeight:](v6, "setFixedLayoutHeight:", v16);

  return v6;
}

- (CGSize)fixedLayoutSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfoSnapshot fixedLayoutWidth](self, "fixedLayoutWidth"));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfoSnapshot fixedLayoutHeight](self, "fixedLayoutHeight"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
  objc_storeStrong((id *)&self->_cacheItem, a3);
}

- (int)bkPageProgressionDirection
{
  return self->_bkPageProgressionDirection;
}

- (void)setBkPageProgressionDirection:(int)a3
{
  self->_bkPageProgressionDirection = a3;
}

- (BOOL)isFixedLayout
{
  return self->_isFixedLayout;
}

- (void)setIsFixedLayout:(BOOL)a3
{
  self->_isFixedLayout = a3;
}

- (NSNumber)fixedLayoutWidth
{
  return self->_fixedLayoutWidth;
}

- (void)setFixedLayoutWidth:(id)a3
{
  objc_storeStrong((id *)&self->_fixedLayoutWidth, a3);
}

- (NSNumber)fixedLayoutHeight
{
  return self->_fixedLayoutHeight;
}

- (void)setFixedLayoutHeight:(id)a3
{
  objc_storeStrong((id *)&self->_fixedLayoutHeight, a3);
}

- (BOOL)obeyPageBreaks
{
  return self->_obeyPageBreaks;
}

- (void)setObeyPageBreaks:(BOOL)a3
{
  self->_obeyPageBreaks = a3;
}

- (BOOL)shouldAllowRemoteInspection
{
  return self->_shouldAllowRemoteInspection;
}

- (void)setShouldAllowRemoteInspection:(BOOL)a3
{
  self->_shouldAllowRemoteInspection = a3;
}

- (BOOL)respectImageSizeClassIsPrefix
{
  return self->_respectImageSizeClassIsPrefix;
}

- (void)setRespectImageSizeClassIsPrefix:(BOOL)a3
{
  self->_respectImageSizeClassIsPrefix = a3;
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->_shouldDisableOptimizeSpeed;
}

- (void)setShouldDisableOptimizeSpeed:(BOOL)a3
{
  self->_shouldDisableOptimizeSpeed = a3;
}

- (NSString)respectImageSizeClass
{
  return self->_respectImageSizeClass;
}

- (void)setRespectImageSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasBuiltInFonts
{
  return self->_hasBuiltInFonts;
}

- (void)setHasBuiltInFonts:(BOOL)a3
{
  self->_hasBuiltInFonts = a3;
}

- (NSString)bookLanguage
{
  return self->_bookLanguage;
}

- (void)setBookLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)manifestId
{
  return self->_manifestId;
}

- (void)setManifestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)spineIndexInPackage
{
  return self->_spineIndexInPackage;
}

- (void)setSpineIndexInPackage:(id)a3
{
  objc_storeStrong((id *)&self->_spineIndexInPackage, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_spineIndexInPackage, 0);
  objc_storeStrong((id *)&self->_manifestId, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_bookLanguage, 0);
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);
  objc_storeStrong((id *)&self->_fixedLayoutHeight, 0);
  objc_storeStrong((id *)&self->_fixedLayoutWidth, 0);
  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end
