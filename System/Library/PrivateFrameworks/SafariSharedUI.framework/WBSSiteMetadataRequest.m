@implementation WBSSiteMetadataRequest

- (WBSSiteMetadataRequest)initWithURL:(id)a3 extraInfo:(id)a4
{
  id v7;
  id v8;
  WBSSiteMetadataRequest *v9;
  WBSSiteMetadataRequest *v10;
  uint64_t v11;
  NSDictionary *extraInfo;
  os_activity_t v13;
  OS_os_activity *activity;
  NSObject *v15;
  WBSSiteMetadataRequest *v16;
  WBSSiteMetadataRequest *v17;
  _QWORD block[4];
  WBSSiteMetadataRequest *v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSSiteMetadataRequest;
  v9 = -[WBSSiteMetadataRequest init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v11 = objc_msgSend(v8, "copy");
    extraInfo = v10->_extraInfo;
    v10->_extraInfo = (NSDictionary *)v11;

    v13 = _os_activity_create(&dword_1A840B000, "Site Metadata Request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DETACHED);
    activity = v10->_activity;
    v10->_activity = (OS_os_activity *)v13;

    v15 = v10->_activity;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__WBSSiteMetadataRequest_initWithURL_extraInfo___block_invoke;
    block[3] = &unk_1E5441CB8;
    v16 = v10;
    v20 = v16;
    os_activity_apply(v15, block);
    v17 = v16;

  }
  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

void __48__WBSSiteMetadataRequest_initWithURL_extraInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v4 = v2;
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 141558275;
    v7 = 1752392040;
    v8 = 2117;
    v9 = v5;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Beginning site metadata request for %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (WBSSiteMetadataRequest)init
{
  return -[WBSSiteMetadataRequest initWithURL:extraInfo:](self, "initWithURL:extraInfo:", 0, 0);
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSSiteMetadataRequest *v4;
  WBSSiteMetadataRequest *v5;
  NSURL *url;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  NSDictionary *extraInfo;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;

  v4 = (WBSSiteMetadataRequest *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      url = self->_url;
      -[WBSSiteMetadataRequest url](v5, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (url)
      {
        v9 = -[NSURL isEqual:](url, "isEqual:", v7);

        if ((v9 & 1) == 0)
          goto LABEL_13;
      }
      else
      {

        if (v8)
          goto LABEL_13;
      }
      extraInfo = self->_extraInfo;
      -[WBSSiteMetadataRequest extraInfo](v5, "extraInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (extraInfo)
      {
        v14 = -[NSDictionary isEqual:](extraInfo, "isEqual:", v12);

        if ((v14 & 1) != 0)
        {
LABEL_11:
          v15 = objc_opt_class();
          v10 = v15 == objc_opt_class();
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {

        if (!v13)
          goto LABEL_11;
      }
LABEL_13:
      v10 = 0;
      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, url: %@>"), objc_opt_class(), self, self->_url);
}

- (NSDictionary)extraInfo
{
  return self->_extraInfo;
}

@end
