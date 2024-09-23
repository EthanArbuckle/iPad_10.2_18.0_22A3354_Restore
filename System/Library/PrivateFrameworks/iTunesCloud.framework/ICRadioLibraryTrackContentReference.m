@implementation ICRadioLibraryTrackContentReference

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICRadioLibraryTrackContentReference kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryTrackContentReference storeAdamIdentifier](self, "storeAdamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryTrackContentReference storeCloudIdentifier](self, "storeCloudIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryTrackContentReference universalCloudLibraryID](self, "universalCloudLibraryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryTrackContentReference name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICRadioLibraryTrackContentReference: %p kind=%@ adamID=%@ cloudID=%@ ulid=%@ title='%@'>"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)albumArtistName
{
  if (self->_albumArtistName)
    return self->_albumArtistName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)albumName
{
  if (self->_albumName)
    return self->_albumName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)artistName
{
  if (self->_artistName)
    return self->_artistName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)composerName
{
  if (self->_composerName)
    return self->_composerName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)copyright
{
  if (self->_copyright)
    return self->_copyright;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)genreName
{
  if (self->_genreName)
    return self->_genreName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)kind
{
  if (self->_kind)
    return self->_kind;
  else
    return (NSString *)CFSTR("song");
}

- (NSString)name
{
  if (self->_name)
    return self->_name;
  else
    return (NSString *)&stru_1E4391778;
}

- (int64_t)contentType
{
  return 3;
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryTrackContentReference rawContentDictionaryWithSubscriptionStatus:](self, "rawContentDictionaryWithSubscriptionStatus:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("library-track"));
  return v6;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSNumber *compilation;
  NSNumber *discCount;
  NSNumber *discNumber;
  NSNumber *duration;
  double v11;
  void *v12;
  NSNumber *fileSize;
  NSNumber *storeAdamIdentifier;
  NSNumber *storeCloudIdentifier;
  NSNumber *trackCount;
  NSNumber *trackNumber;
  NSNumber *year;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICRadioLibraryTrackContentReference;
  -[ICRadioContentReference rawContentDictionaryWithSubscriptionStatus:](&v20, sel_rawContentDictionaryWithSubscriptionStatus_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSString length](self->_albumArtistName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_albumArtistName, CFSTR("album-artist"));
  if (-[NSString length](self->_albumName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_albumName, CFSTR("playlist-name"));
  if (-[NSString length](self->_artistName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_artistName, CFSTR("artist-name"));
  compilation = self->_compilation;
  if (compilation)
    objc_msgSend(v6, "setObject:forKey:", compilation, CFSTR("compilation"));
  if (-[NSString length](self->_composerName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_composerName, CFSTR("composer-name"));
  if (-[NSString length](self->_copyright, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_copyright, CFSTR("copyright"));
  discCount = self->_discCount;
  if (discCount)
    objc_msgSend(v6, "setObject:forKey:", discCount, CFSTR("disc-count"));
  discNumber = self->_discNumber;
  if (discNumber)
    objc_msgSend(v6, "setObject:forKey:", discNumber, CFSTR("disc-number"));
  duration = self->_duration;
  if (duration)
  {
    -[NSNumber doubleValue](duration, "doubleValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)(v11 * 1000.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("duration"));

  }
  fileSize = self->_fileSize;
  if (fileSize)
    objc_msgSend(v6, "setObject:forKey:", fileSize, CFSTR("size"));
  if (-[NSString length](self->_genreName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_genreName, CFSTR("genre-name"));
  if (-[NSString length](self->_kind, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_kind, CFSTR("kind"));
  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_name, CFSTR("item-name"));
  storeAdamIdentifier = self->_storeAdamIdentifier;
  if (storeAdamIdentifier)
    objc_msgSend(v6, "setObject:forKey:", storeAdamIdentifier, CFSTR("item-id"));
  storeCloudIdentifier = self->_storeCloudIdentifier;
  if (storeCloudIdentifier)
    objc_msgSend(v6, "setObject:forKey:", storeCloudIdentifier, CFSTR("cloud-id"));
  trackCount = self->_trackCount;
  if (trackCount)
    objc_msgSend(v6, "setObject:forKey:", trackCount, CFSTR("track-count"));
  trackNumber = self->_trackNumber;
  if (trackNumber)
    objc_msgSend(v6, "setObject:forKey:", trackNumber, CFSTR("track-number"));
  year = self->_year;
  if (year)
    objc_msgSend(v6, "setObject:forKey:", year, CFSTR("year"));
  if (-[NSString length](self->_universalCloudLibraryID, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_universalCloudLibraryID, CFSTR("track-ulid"));
  if (-[NSString length](self->_containerID, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_containerID, CFSTR("container-id"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)ICRadioLibraryTrackContentReference;
  v5 = -[ICRadioContentReference copyWithZone:](&v47, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_albumArtistName, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSString copyWithZone:](self->_albumName, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[NSNumber copyWithZone:](self->_compilation, "copyWithZone:", a3);
    v13 = (void *)v5[11];
    v5[11] = v12;

    v14 = -[NSString copyWithZone:](self->_composerName, "copyWithZone:", a3);
    v15 = (void *)v5[5];
    v5[5] = v14;

    v16 = -[NSString copyWithZone:](self->_copyright, "copyWithZone:", a3);
    v17 = (void *)v5[6];
    v5[6] = v16;

    v18 = -[NSNumber copyWithZone:](self->_discCount, "copyWithZone:", a3);
    v19 = (void *)v5[7];
    v5[7] = v18;

    v20 = -[NSNumber copyWithZone:](self->_discNumber, "copyWithZone:", a3);
    v21 = (void *)v5[8];
    v5[8] = v20;

    v22 = -[NSNumber copyWithZone:](self->_duration, "copyWithZone:", a3);
    v23 = (void *)v5[12];
    v5[12] = v22;

    v24 = -[NSNumber copyWithZone:](self->_fileSize, "copyWithZone:", a3);
    v25 = (void *)v5[9];
    v5[9] = v24;

    v26 = -[NSString copyWithZone:](self->_genreName, "copyWithZone:", a3);
    v27 = (void *)v5[10];
    v5[10] = v26;

    v28 = -[NSString copyWithZone:](self->_kind, "copyWithZone:", a3);
    v29 = (void *)v5[13];
    v5[13] = v28;

    v30 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v31 = (void *)v5[14];
    v5[14] = v30;

    v32 = -[NSNumber copyWithZone:](self->_storeAdamIdentifier, "copyWithZone:", a3);
    v33 = (void *)v5[15];
    v5[15] = v32;

    v34 = -[NSNumber copyWithZone:](self->_storeCloudIdentifier, "copyWithZone:", a3);
    v35 = (void *)v5[16];
    v5[16] = v34;

    v36 = -[NSNumber copyWithZone:](self->_trackCount, "copyWithZone:", a3);
    v37 = (void *)v5[17];
    v5[17] = v36;

    v38 = -[NSNumber copyWithZone:](self->_trackNumber, "copyWithZone:", a3);
    v39 = (void *)v5[18];
    v5[18] = v38;

    v40 = -[NSNumber copyWithZone:](self->_year, "copyWithZone:", a3);
    v41 = (void *)v5[19];
    v5[19] = v40;

    v42 = -[NSString copyWithZone:](self->_containerID, "copyWithZone:", a3);
    v43 = (void *)v5[1];
    v5[1] = v42;

    v44 = -[NSString copyWithZone:](self->_universalCloudLibraryID, "copyWithZone:", a3);
    v45 = (void *)v5[20];
    v5[20] = v44;

  }
  return v5;
}

- (ICRadioLibraryTrackContentReference)initWithCoder:(id)a3
{
  id v4;
  ICRadioLibraryTrackContentReference *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *albumArtistName;
  uint64_t v9;
  NSString *albumName;
  uint64_t v11;
  NSString *artistName;
  uint64_t v13;
  NSString *composerName;
  uint64_t v15;
  NSString *copyright;
  uint64_t v17;
  NSString *genreName;
  uint64_t v19;
  NSString *kind;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSString *universalCloudLibraryID;
  uint64_t v25;
  uint64_t v26;
  NSNumber *compilation;
  uint64_t v28;
  NSNumber *discCount;
  uint64_t v30;
  NSNumber *discNumber;
  uint64_t v32;
  NSNumber *duration;
  uint64_t v34;
  NSNumber *fileSize;
  uint64_t v36;
  NSNumber *storeCloudIdentifier;
  uint64_t v38;
  NSNumber *storeAdamIdentifier;
  uint64_t v40;
  NSNumber *trackCount;
  uint64_t v42;
  NSNumber *trackNumber;
  uint64_t v44;
  NSNumber *year;
  uint64_t v46;
  NSString *containerID;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)ICRadioLibraryTrackContentReference;
  v5 = -[ICRadioContentReference initWithCoder:](&v49, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("albumArtist"));
    v7 = objc_claimAutoreleasedReturnValue();
    albumArtistName = v5->_albumArtistName;
    v5->_albumArtistName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("album"));
    v9 = objc_claimAutoreleasedReturnValue();
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("artist"));
    v11 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("composer"));
    v13 = objc_claimAutoreleasedReturnValue();
    composerName = v5->_composerName;
    v5->_composerName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("copyright"));
    v15 = objc_claimAutoreleasedReturnValue();
    copyright = v5->_copyright;
    v5->_copyright = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("genreName"));
    v17 = objc_claimAutoreleasedReturnValue();
    genreName = v5->_genreName;
    v5->_genreName = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("kind"));
    v19 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("name"));
    v21 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("universalLibraryID"));
    v23 = objc_claimAutoreleasedReturnValue();
    universalCloudLibraryID = v5->_universalCloudLibraryID;
    v5->_universalCloudLibraryID = (NSString *)v23;

    v25 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("compilation"));
    v26 = objc_claimAutoreleasedReturnValue();
    compilation = v5->_compilation;
    v5->_compilation = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("discCount"));
    v28 = objc_claimAutoreleasedReturnValue();
    discCount = v5->_discCount;
    v5->_discCount = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("discNumber"));
    v30 = objc_claimAutoreleasedReturnValue();
    discNumber = v5->_discNumber;
    v5->_discNumber = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("duration"));
    v32 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("fileSize"));
    v34 = objc_claimAutoreleasedReturnValue();
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("cloudID"));
    v36 = objc_claimAutoreleasedReturnValue();
    storeCloudIdentifier = v5->_storeCloudIdentifier;
    v5->_storeCloudIdentifier = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("id"));
    v38 = objc_claimAutoreleasedReturnValue();
    storeAdamIdentifier = v5->_storeAdamIdentifier;
    v5->_storeAdamIdentifier = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("trackCount"));
    v40 = objc_claimAutoreleasedReturnValue();
    trackCount = v5->_trackCount;
    v5->_trackCount = (NSNumber *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("trackNumber"));
    v42 = objc_claimAutoreleasedReturnValue();
    trackNumber = v5->_trackNumber;
    v5->_trackNumber = (NSNumber *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("year"));
    v44 = objc_claimAutoreleasedReturnValue();
    year = v5->_year;
    v5->_year = (NSNumber *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerID"));
    v46 = objc_claimAutoreleasedReturnValue();
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v46;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRadioLibraryTrackContentReference;
  v4 = a3;
  -[ICRadioContentReference encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumArtistName, CFSTR("albumArtist"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumName, CFSTR("album"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_artistName, CFSTR("artist"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compilation, CFSTR("compilation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_composerName, CFSTR("composer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_copyright, CFSTR("copyright"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_discCount, CFSTR("discCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_discNumber, CFSTR("discNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileSize, CFSTR("fileSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_genreName, CFSTR("genreName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeCloudIdentifier, CFSTR("cloudID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeAdamIdentifier, CFSTR("id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackCount, CFSTR("trackCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackNumber, CFSTR("trackNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_year, CFSTR("year"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerID, CFSTR("containerID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_universalCloudLibraryID, CFSTR("universalLibraryID"));

}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAlbumArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setComposerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCopyright:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)discCount
{
  return self->_discCount;
}

- (void)setDiscCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)discNumber
{
  return self->_discNumber;
}

- (void)setDiscNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setGenreName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)isCompilation
{
  return self->_compilation;
}

- (void)setCompilation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)storeAdamIdentifier
{
  return self->_storeAdamIdentifier;
}

- (void)setStoreAdamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)storeCloudIdentifier
{
  return self->_storeCloudIdentifier;
}

- (void)setStoreCloudIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)trackCount
{
  return self->_trackCount;
}

- (void)setTrackCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (void)setTrackNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)year
{
  return self->_year;
}

- (void)setYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)universalCloudLibraryID
{
  return self->_universalCloudLibraryID;
}

- (void)setUniversalCloudLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalCloudLibraryID, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_trackNumber, 0);
  objc_storeStrong((id *)&self->_trackCount, 0);
  objc_storeStrong((id *)&self->_storeCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_storeAdamIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_compilation, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_discNumber, 0);
  objc_storeStrong((id *)&self->_discCount, 0);
  objc_storeStrong((id *)&self->_copyright, 0);
  objc_storeStrong((id *)&self->_composerName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
