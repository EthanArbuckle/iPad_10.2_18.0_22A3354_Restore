@implementation WLKDeltaContinuationMetadata

- (WLKDeltaContinuationMetadata)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  WLKDeltaContinuationMetadata *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *playbackURL;
  uint64_t v12;
  NSString *adamID;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WLKDeltaContinuationMetadata;
  v7 = -[WLKContinuationMetadataBase initWithDictionary:context:](&v15, sel_initWithDictionary_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("changeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_deltaType = objc_msgSend((id)objc_opt_class(), "_deltaTypeForString:", v8);
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("playableUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      playbackURL = v7->_playbackURL;
      v7->_playbackURL = (NSURL *)v10;

    }
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("adamId"));
    v12 = objc_claimAutoreleasedReturnValue();
    adamID = v7->_adamID;
    v7->_adamID = (NSString *)v12;

  }
  return v7;
}

+ (int64_t)_deltaTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Add")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Remove"));

  return v4;
}

- (int64_t)deltaType
{
  return self->_deltaType;
}

- (NSURL)playbackURL
{
  return self->_playbackURL;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_playbackURL, 0);
}

@end
