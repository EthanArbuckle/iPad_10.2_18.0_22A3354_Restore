@implementation ICSharedListeningItem

- (ICSharedListeningItem)initWithProtobuf:(id)a3 identity:(id)a4
{
  id *v6;
  id v7;
  ICSharedListeningItem *v8;
  id v9;
  uint64_t v10;
  NSString *identifier;
  id v12;
  id v13;
  uint64_t v14;
  NSString *mediaIdentifier;
  BOOL v16;
  uint64_t v17;
  ICLiveLinkIdentity *contributorIdentity;
  uint64_t v19;
  NSDictionary *playParams;
  uint64_t v22;
  NSString *v23;
  objc_super v24;

  v6 = (id *)a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ICSharedListeningItem;
  v8 = -[ICSharedListeningItem init](&v24, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = v6[3];
      v10 = objc_msgSend(v9, "copy");
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v10;

      v12 = v6[4];
    }
    else
    {
      v22 = objc_msgSend(0, "copy");
      v23 = v8->_identifier;
      v8->_identifier = (NSString *)v22;

      v12 = 0;
    }
    v13 = v12;
    v14 = objc_msgSend(v13, "copy");
    mediaIdentifier = v8->_mediaIdentifier;
    v8->_mediaIdentifier = (NSString *)v14;

    v16 = v6 && ((_BYTE)v6[7] & 2) != 0 && *((_DWORD *)v6 + 12) == 2;
    v8->_isAutoPlayItem = v16;
    v17 = objc_msgSend(v7, "copy");
    contributorIdentity = v8->_contributorIdentity;
    v8->_contributorIdentity = (ICLiveLinkIdentity *)v17;

    -[ICSharedListeningItem _playParamsForPlaybackItemProto:](v8, "_playParamsForPlaybackItemProto:", v6);
    v19 = objc_claimAutoreleasedReturnValue();
    playParams = v8->_playParams;
    v8->_playParams = (NSDictionary *)v19;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p id=%@ mediaID=%@>"), objc_opt_class(), self, self->_identifier, self->_mediaIdentifier);
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ITEM id=%@ mediaID=%-20s>"), self->_identifier, -[NSString UTF8String](self->_mediaIdentifier, "UTF8String"));
}

- (id)_playParamsForPlaybackItemProto:(id)a3
{
  id *v4;
  id *v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  ICSharedListeningItem *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if (v4 && (v6 = v4[5]) != 0 && (v7 = v6[2], v6, v7))
  {
    v8 = v5[5];
    v9 = v8;
    if (v8)
      v10 = (void *)*((_QWORD *)v8 + 2);
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    if (v14 || !v13)
    {
      v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = v5[5];
        v18 = v17;
        if (v17)
          v19 = (void *)*((_QWORD *)v17 + 2);
        else
          v19 = 0;
        v20 = v19;
        *(_DWORD *)buf = 134218498;
        v24 = self;
        v25 = 2114;
        v26 = v20;
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ILL %p: _playParamsForPlaybackItemProto: Error deserializing playParams: %{public}@ error: %{public}@", buf, 0x20u);

      }
      v15 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v15 = v13;
    }

  }
  else
  {
    v15 = (id)MEMORY[0x1E0C9AA70];
  }

  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (BOOL)isAutoPlayItem
{
  return self->_isAutoPlayItem;
}

- (ICLiveLinkIdentity)contributorIdentity
{
  return self->_contributorIdentity;
}

- (NSDictionary)playParams
{
  return self->_playParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playParams, 0);
  objc_storeStrong((id *)&self->_contributorIdentity, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (ICSharedListeningItem)itemWithMediaIdentifier:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  MSVNanoIDCreateTaggedPointer();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = objc_msgSend(v3, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return (ICSharedListeningItem *)v4;
}

@end
