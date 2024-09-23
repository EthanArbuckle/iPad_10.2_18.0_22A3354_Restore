@implementation SKUIAssetViewElement

- (SKUIAssetViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIAssetViewElement *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSURL *keyCertificateURL;
  void *v21;
  uint64_t v22;
  NSURL *keyServerURL;
  void *v24;
  void *v25;
  uint64_t v26;
  NSURL *url;
  void *v29;
  id v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAssetViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUIAssetViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v31, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("offset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    v30 = v9;
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v12, "doubleValue");
    else
      v13 = 0x7FF8000000000000;
    *(_QWORD *)&v11->_initialPlaybackTime = v13;
    objc_msgSend(v8, "getAttribute:", CFSTR("duration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v14, "doubleValue");
    else
      v15 = 0x7FF8000000000000;
    *(_QWORD *)&v11->_playbackDuration = v15;
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      v11->_itemIdentifier = objc_msgSend(v16, "longLongValue");
    objc_msgSend(v8, "getAttribute:", *MEMORY[0x1E0D3A458]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
      objc_storeStrong((id *)&v11->_secureKeyDeliveryType, v17);
    objc_msgSend(v8, "getAttribute:", CFSTR("key-cert-url"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v18);
      keyCertificateURL = v11->_keyCertificateURL;
      v11->_keyCertificateURL = (NSURL *)v19;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("key-server-url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v21);
      keyServerURL = v11->_keyServerURL;
      v11->_keyServerURL = (NSURL *)v22;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("is-itunes-stream"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_ITunesStream = objc_msgSend(v24, "BOOLValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "length"))
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v25);
      url = v11->_url;
      v11->_url = (NSURL *)v26;

    }
    v9 = v30;
  }

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIAssetViewElement *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSURL *v9;
  NSURL *keyCertificateURL;
  NSURL *v11;
  NSURL *keyServerURL;
  NSString *v13;
  NSString *secureKeyDeliveryType;
  NSURL *v15;
  NSURL *url;
  objc_super v18;

  v4 = (SKUIAssetViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUIAssetViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v18, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIAssetViewElement initialPlaybackTime](v4, "initialPlaybackTime");
    self->_initialPlaybackTime = v7;
    self->_itemIdentifier = -[SKUIAssetViewElement itemIdentifier](v4, "itemIdentifier");
    -[SKUIAssetViewElement playbackDuration](v4, "playbackDuration");
    self->_playbackDuration = v8;
    -[SKUIAssetViewElement keyCertificateURL](v4, "keyCertificateURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    keyCertificateURL = self->_keyCertificateURL;
    self->_keyCertificateURL = v9;

    -[SKUIAssetViewElement keyServerURL](v4, "keyServerURL");
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    keyServerURL = self->_keyServerURL;
    self->_keyServerURL = v11;

    -[SKUIAssetViewElement secureKeyDeliveryType](v4, "secureKeyDeliveryType");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    secureKeyDeliveryType = self->_secureKeyDeliveryType;
    self->_secureKeyDeliveryType = v13;

    self->_ITunesStream = -[SKUIAssetViewElement isITunesStream](v4, "isITunesStream");
    -[SKUIAssetViewElement URL](v4, "URL");
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v15;

  }
  return v6;
}

- (double)initialPlaybackTime
{
  return self->_initialPlaybackTime;
}

- (void)setInitialPlaybackTime:(double)a3
{
  self->_initialPlaybackTime = a3;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (NSString)secureKeyDeliveryType
{
  return self->_secureKeyDeliveryType;
}

- (NSURL)URL
{
  return self->_url;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_secureKeyDeliveryType, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAssetViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
