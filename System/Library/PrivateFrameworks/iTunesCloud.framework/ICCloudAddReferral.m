@implementation ICCloudAddReferral

- (void)encodeWithCoder:(id)a3
{
  NSString *playlistGlobalID;
  id v5;

  playlistGlobalID = self->_playlistGlobalID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", playlistGlobalID, CFSTR("playlistGlobalID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_albumAdamID, CFSTR("albumAdamID"));

}

- (ICCloudAddReferral)initWithCoder:(id)a3
{
  id v4;
  ICCloudAddReferral *v5;
  uint64_t v6;
  NSString *playlistGlobalID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCloudAddReferral;
  v5 = -[ICCloudAddReferral init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playlistGlobalID"));
    v6 = objc_claimAutoreleasedReturnValue();
    playlistGlobalID = v5->_playlistGlobalID;
    v5->_playlistGlobalID = (NSString *)v6;

    v5->_albumAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("albumAdamID"));
  }

  return v5;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (int64_t)albumAdamID
{
  return self->_albumAdamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistGlobalID, 0);
}

+ (id)referralWithPlaylistGlobalID:(id)a3
{
  id v3;
  ICCloudAddReferral *v4;
  uint64_t v5;
  NSString *playlistGlobalID;

  v3 = a3;
  v4 = objc_alloc_init(ICCloudAddReferral);
  v5 = objc_msgSend(v3, "copy");

  playlistGlobalID = v4->_playlistGlobalID;
  v4->_playlistGlobalID = (NSString *)v5;

  return v4;
}

+ (id)referralWithAlbumAdamID:(int64_t)a3
{
  ICCloudAddReferral *v4;

  v4 = objc_alloc_init(ICCloudAddReferral);
  v4->_albumAdamID = a3;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
