@implementation SKUIMediaPlayerItemStatus

- (SKUIMediaPlayerItemStatus)init
{
  objc_super v4;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaPlayerItemStatus init].cold.1();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIMediaPlayerItemStatus;
  return -[SKUIMediaPlayerItemStatus init](&v4, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 40) = self->_currentTime;
  *(double *)(v5 + 40) = self->_duration;
  v6 = -[NSString copyWithZone:](self->_itemIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_QWORD *)(v5 + 56) = self->_itemType;
  *(_QWORD *)(v5 + 64) = self->_playState;
  v8 = -[NSString copyWithZone:](self->_storeID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_storeAlbumID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIMediaPlayerItemStatus;
  -[SKUIMediaPlayerItemStatus description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [duration: %f  currentTime: %f state:%li storeId:%@ storeAlbumId:%@ itemIdentifier:%@]"), v4, *(_QWORD *)&self->_duration, *(_QWORD *)&self->_currentTime, self->_playState, self->_storeID, self->_storeAlbumID, self->_itemIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeAlbumID
{
  return self->_storeAlbumID;
}

- (void)setStoreAlbumID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)hideDuration
{
  return self->_hideDuration;
}

- (void)setHideDuration:(BOOL)a3
{
  self->_hideDuration = a3;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (int64_t)playState
{
  return self->_playState;
}

- (void)setPlayState:(int64_t)a3
{
  self->_playState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAlbumID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaPlayerItemStatus init]";
}

@end
