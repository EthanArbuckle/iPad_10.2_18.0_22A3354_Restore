@implementation ICPlayActivityEventContainerIDs

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_adamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" adamID: %lli"), self->_adamID);
  if (-[NSString length](self->_cloudAlbumID, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" cloudAlbumID: %@"), self->_cloudAlbumID);
  if (self->_cloudPlaylistID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" cloudPlaylistID: %llu"), self->_cloudPlaylistID);
  if (-[NSString length](self->_globalPlaylistID, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" globalPlaylistID: %@"), self->_globalPlaylistID);
  if (-[NSString length](self->_playlistVersionHash, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" playlistVersionHash: %@"), self->_playlistVersionHash);
  if (-[NSString length](self->_stationHash, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" stationHash: %@"), self->_stationHash);
  if (-[NSString length](self->_stationStringID, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" stationStringID: %@"), self->_stationStringID);
  if (self->_stationID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" stationID: %lli"), self->_stationID);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ICPlayActivityEventContainerIDs)initWithCoder:(id)a3
{
  id v4;
  ICPlayActivityEventContainerIDs *v5;
  uint64_t v6;
  NSString *cloudAlbumID;
  uint64_t v8;
  NSString *globalPlaylistID;
  uint64_t v10;
  NSString *playlistVersionHash;
  uint64_t v12;
  NSString *stationHash;
  uint64_t v14;
  NSString *stationStringID;

  v4 = a3;
  v5 = -[ICPlayActivityEventContainerIDs init](self, "init");
  if (v5)
  {
    v5->_adamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventContainerIDsAdamID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPlayActivityEventContainerIDsCloudAlbumID"));
    v6 = objc_claimAutoreleasedReturnValue();
    cloudAlbumID = v5->_cloudAlbumID;
    v5->_cloudAlbumID = (NSString *)v6;

    v5->_cloudPlaylistID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventContainerIDsCloudPlaylistID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPlayActivityEventContainerIDsGlobalPlaylistID"));
    v8 = objc_claimAutoreleasedReturnValue();
    globalPlaylistID = v5->_globalPlaylistID;
    v5->_globalPlaylistID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPlayActivityEventContainerIDsPlaylistVersionHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    playlistVersionHash = v5->_playlistVersionHash;
    v5->_playlistVersionHash = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPlayActivityEventContainerIDsStationHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    stationHash = v5->_stationHash;
    v5->_stationHash = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPlayActivityEventContainerIDsStationStringID"));
    v14 = objc_claimAutoreleasedReturnValue();
    stationStringID = v5->_stationStringID;
    v5->_stationStringID = (NSString *)v14;

    v5->_stationID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventContainerIDsStationID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t adamID;
  id v5;

  adamID = self->_adamID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", adamID, CFSTR("ICPlayActivityEventContainerIDsAdamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudAlbumID, CFSTR("ICPlayActivityEventContainerIDsCloudAlbumID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_cloudPlaylistID, CFSTR("ICPlayActivityEventContainerIDsCloudPlaylistID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_globalPlaylistID, CFSTR("ICPlayActivityEventContainerIDsGlobalPlaylistID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playlistVersionHash, CFSTR("ICPlayActivityEventContainerIDsPlaylistVersionHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stationHash, CFSTR("ICPlayActivityEventContainerIDsStationHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stationStringID, CFSTR("ICPlayActivityEventContainerIDsStationStringID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_stationID, CFSTR("ICPlayActivityEventContainerIDsStationID"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityEventContainerIDs _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    v4[1] = (id)self->_adamID;
    objc_storeStrong(v4 + 2, self->_cloudAlbumID);
    v5[3] = (id)self->_cloudPlaylistID;
    objc_storeStrong(v5 + 4, self->_globalPlaylistID);
    objc_storeStrong(v5 + 5, self->_playlistVersionHash);
    objc_storeStrong(v5 + 7, self->_stationHash);
    objc_storeStrong(v5 + 8, self->_stationStringID);
    v5[6] = (id)self->_stationID;
  }
  return v5;
}

- (int64_t)adamID
{
  return self->_adamID;
}

- (NSString)cloudAlbumID
{
  return self->_cloudAlbumID;
}

- (unint64_t)cloudPlaylistID
{
  return self->_cloudPlaylistID;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (NSString)playlistVersionHash
{
  return self->_playlistVersionHash;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_playlistVersionHash, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
