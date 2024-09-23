@implementation VUIDocumentPreFetchedDataPlaybackUpNext

- (id)jsonData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_opt_new();
  -[VUIDocumentPreFetchedDataPlaybackUpNext host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[VUIDocumentPreFetchedDataPlaybackUpNext host](self, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("host"));

  }
  if (-[VUIDocumentPreFetchedDataPlaybackUpNext updateEvent](self, "updateEvent"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("upNext"), CFSTR("updateComponentType"));
  if (-[VUIDocumentPreFetchedDataPlaybackUpNext canAutoPlay](self, "canAutoPlay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext canAutoPlay](self, "canAutoPlay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canAutoPlay"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext isPostPlay](self, "isPostPlay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isPostPlay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext isLiveStream](self, "isLiveStream"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isLiveStream"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlaybackUpNext refetchUpNextData](self, "refetchUpNextData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("refetchUpNextData"));

  -[VUIDocumentPreFetchedDataPlaybackUpNext showID](self, "showID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[VUIDocumentPreFetchedDataPlaybackUpNext showID](self, "showID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("showId"));

  }
  -[VUIDocumentPreFetchedDataPlaybackUpNext productID](self, "productID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[VUIDocumentPreFetchedDataPlaybackUpNext productID](self, "productID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("id"));

  }
  -[VUIDocumentPreFetchedDataPlaybackUpNext adamID](self, "adamID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[VUIDocumentPreFetchedDataPlaybackUpNext adamID](self, "adamID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("adamId"));

  }
  -[VUIDocumentPreFetchedDataPlaybackUpNext excludedCanonicals](self, "excludedCanonicals");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[VUIDocumentPreFetchedDataPlaybackUpNext excludedCanonicals](self, "excludedCanonicals");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("excludedCanonicals"));

  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)showID
{
  return self->_showID;
}

- (void)setShowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)excludedCanonicals
{
  return self->_excludedCanonicals;
}

- (void)setExcludedCanonicals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)updateEvent
{
  return self->_updateEvent;
}

- (void)setUpdateEvent:(BOOL)a3
{
  self->_updateEvent = a3;
}

- (BOOL)canAutoPlay
{
  return self->_canAutoPlay;
}

- (void)setCanAutoPlay:(BOOL)a3
{
  self->_canAutoPlay = a3;
}

- (BOOL)isPostPlay
{
  return self->_isPostPlay;
}

- (void)setIsPostPlay:(BOOL)a3
{
  self->_isPostPlay = a3;
}

- (BOOL)isLiveStream
{
  return self->_isLiveStream;
}

- (void)setIsLiveStream:(BOOL)a3
{
  self->_isLiveStream = a3;
}

- (BOOL)refetchUpNextData
{
  return self->_refetchUpNextData;
}

- (void)setRefetchUpNextData:(BOOL)a3
{
  self->_refetchUpNextData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedCanonicals, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
