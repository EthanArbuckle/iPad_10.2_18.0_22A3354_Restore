@implementation ICRadioLibraryArtistContentReference

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICRadioLibraryArtistContentReference storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryArtistContentReference representativeCloudIdentifier](self, "representativeCloudIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryArtistContentReference artistName](self, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICRadioLibraryArtistContentReference: %p adamID=%@ representativeItemCloudID=%@ artistName='%@'>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)artistName
{
  if (self->_artistName)
    return self->_artistName;
  else
    return (NSString *)&stru_1E4391778;
}

- (int64_t)contentType
{
  return 2;
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryArtistContentReference rawContentDictionaryWithSubscriptionStatus:](self, "rawContentDictionaryWithSubscriptionStatus:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("library-artist"));
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("use-artist"));

  return v6;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSNumber *representativeCloudIdentifier;
  NSNumber *storeIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICRadioLibraryArtistContentReference;
  -[ICRadioContentReference rawContentDictionaryWithSubscriptionStatus:](&v10, sel_rawContentDictionaryWithSubscriptionStatus_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (-[NSString length](self->_artistName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_artistName, CFSTR("artist-name"));
  representativeCloudIdentifier = self->_representativeCloudIdentifier;
  if (representativeCloudIdentifier)
    objc_msgSend(v6, "setObject:forKey:", representativeCloudIdentifier, CFSTR("rep-cloud-id"));
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier)
    objc_msgSend(v6, "setObject:forKey:", storeIdentifier, CFSTR("artist-id"));
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryArtistContentReference;
  v5 = -[ICRadioContentReference copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSNumber copyWithZone:](self->_representativeCloudIdentifier, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSNumber copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (ICRadioLibraryArtistContentReference)initWithCoder:(id)a3
{
  id v4;
  ICRadioLibraryArtistContentReference *v5;
  uint64_t v6;
  NSString *artistName;
  uint64_t v8;
  NSNumber *representativeCloudIdentifier;
  uint64_t v10;
  NSNumber *storeIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryArtistContentReference;
  v5 = -[ICRadioContentReference initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("an"));
    v6 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cid"));
    v8 = objc_claimAutoreleasedReturnValue();
    representativeCloudIdentifier = v5->_representativeCloudIdentifier;
    v5->_representativeCloudIdentifier = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRadioLibraryArtistContentReference;
  v4 = a3;
  -[ICRadioContentReference encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_artistName, CFSTR("an"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_representativeCloudIdentifier, CFSTR("cid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("id"));

}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)representativeCloudIdentifier
{
  return self->_representativeCloudIdentifier;
}

- (void)setRepresentativeCloudIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_representativeCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
