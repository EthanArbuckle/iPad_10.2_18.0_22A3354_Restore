@implementation SKUIPlayableAsset

- (SKUIPlayableAsset)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIPlayableAsset *result;
  objc_super v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIPlayableAsset init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIPlayableAsset;
  result = -[SKUIPlayableAsset init](&v12, sel_init);
  if (result)
  {
    result->_initialPlaybackTime = NAN;
    result->_playbackDuration = NAN;
  }
  return result;
}

- (SKUIPlayableAsset)initWithContentURL:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIPlayableAsset *v14;
  SKUIPlayableAsset *v15;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIPlayableAsset initWithContentURL:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = -[SKUIPlayableAsset init](self, "init");
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_contentURL, a3);

  return v15;
}

- (SKUIPlayableAsset)initWithVideoViewElement:(id)a3 assetViewElement:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIPlayableAsset *v16;
  SKUIPlayableAsset *v17;
  uint64_t v18;
  NSURL *contentURL;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSURL *keyCertificateURL;
  uint64_t v25;
  NSURL *keyServerURL;
  double v27;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIPlayableAsset initWithVideoViewElement:assetViewElement:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = -[SKUIPlayableAsset init](self, "init");
  v17 = v16;
  if (v7 && v16)
  {
    objc_msgSend(v7, "URL");
    v18 = objc_claimAutoreleasedReturnValue();
    contentURL = v17->_contentURL;
    v17->_contentURL = (NSURL *)v18;

    objc_msgSend(v7, "initialPlaybackTime");
    v17->_initialPlaybackTime = v20;
    v21 = objc_msgSend(v7, "itemIdentifier");
    v17->_storeItemIdentifier = v21;
    if (!v21)
      v17->_storeItemIdentifier = objc_msgSend(v6, "itemIdentifier");
    objc_msgSend(v7, "secureKeyDeliveryType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_shouldUseITunesStoreSecureKeyDelivery = objc_msgSend(v22, "isEqualToString:", 0x1E73BE270);

    v17->_ITunesStream = objc_msgSend(v7, "isITunesStream");
    objc_msgSend(v7, "keyCertificateURL");
    v23 = objc_claimAutoreleasedReturnValue();
    keyCertificateURL = v17->_keyCertificateURL;
    v17->_keyCertificateURL = (NSURL *)v23;

    objc_msgSend(v7, "keyServerURL");
    v25 = objc_claimAutoreleasedReturnValue();
    keyServerURL = v17->_keyServerURL;
    v17->_keyServerURL = (NSURL *)v25;

    objc_msgSend(v7, "playbackDuration");
    v17->_playbackDuration = v27;
  }

  return v17;
}

- (SKUIPlayableAsset)initWithVideo:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIPlayableAsset *v13;
  SKUIPlayableAsset *v14;
  uint64_t v15;
  NSURL *contentURL;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPlayableAsset initWithVideo:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIPlayableAsset init](self, "init");
  v14 = v13;
  if (v4 && v13)
  {
    objc_msgSend(v4, "URL");
    v15 = objc_claimAutoreleasedReturnValue();
    contentURL = v14->_contentURL;
    v14->_contentURL = (NSURL *)v15;

  }
  return v14;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)initialPlaybackTime
{
  return self->_initialPlaybackTime;
}

- (void)setInitialPlaybackTime:(double)a3
{
  self->_initialPlaybackTime = a3;
}

- (BOOL)isITunesStream
{
  return self->_ITunesStream;
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(double)a3
{
  self->_playbackDuration = a3;
}

- (BOOL)shouldUseITunesStoreSecureKeyDelivery
{
  return self->_shouldUseITunesStoreSecureKeyDelivery;
}

- (void)setShouldUseITunesStoreSecureKeyDelivery:(BOOL)a3
{
  self->_shouldUseITunesStoreSecureKeyDelivery = a3;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_storeItemIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithContentURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithVideoViewElement:(uint64_t)a3 assetViewElement:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithVideo:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
