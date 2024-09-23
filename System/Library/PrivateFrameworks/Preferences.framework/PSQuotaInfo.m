@implementation PSQuotaInfo

- (PSQuotaInfo)init
{
  PSQuotaInfo *v2;
  uint64_t v3;
  NSMutableDictionary *mediaKindDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSQuotaInfo;
  v2 = -[PSQuotaInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mediaKindDict = v2->_mediaKindDict;
    v2->_mediaKindDict = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setStorageInUse:(unint64_t)a3 forMediaKind:(int64_t)a4
{
  NSMutableDictionary *mediaKindDict;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  mediaKindDict = self->_mediaKindDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mediaKindDict, "setObject:forKeyedSubscript:", v8, v7);

}

- (unint64_t)storageInUseForMediaKind:(int64_t)a3
{
  NSMutableDictionary *mediaKindDict;
  void *v4;
  void *v5;
  unint64_t v6;

  mediaKindDict = self->_mediaKindDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mediaKindDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (unint64_t)totalStorage
{
  return self->_totalStorage;
}

- (void)setTotalStorage:(unint64_t)a3
{
  self->_totalStorage = a3;
}

- (unint64_t)usedStorage
{
  return self->_usedStorage;
}

- (void)setUsedStorage:(unint64_t)a3
{
  self->_usedStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaKindDict, 0);
}

@end
