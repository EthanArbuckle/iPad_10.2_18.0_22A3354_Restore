@implementation PFPosterShuffleConfiguration

- (PFPosterShuffleConfiguration)initWithShuffleType:(int64_t)a3
{
  PFPosterShuffleConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFPosterShuffleConfiguration;
  result = -[PFPosterShuffleConfiguration init](&v5, sel_init);
  if (result)
  {
    result->_shuffleType = a3;
    result->_shuffleFrequency = 3;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_shuffleSmartAlbums);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_shuffleType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_shuffleFrequency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PFPosterShuffleConfiguration *v4;
  PFPosterShuffleConfiguration *v5;
  int64_t v6;
  int64_t v7;
  id v8;
  id v9;
  int v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v4 = (PFPosterShuffleConfiguration *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PFPosterShuffleConfiguration shuffleType](self, "shuffleType");
      if (v6 != -[PFPosterShuffleConfiguration shuffleType](v5, "shuffleType")
        || (v7 = -[PFPosterShuffleConfiguration shuffleFrequency](self, "shuffleFrequency"),
            v7 != -[PFPosterShuffleConfiguration shuffleFrequency](v5, "shuffleFrequency")))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[PFPosterShuffleConfiguration personLocalIdentifiers](self, "personLocalIdentifiers");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterShuffleConfiguration personLocalIdentifiers](v5, "personLocalIdentifiers");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {

      }
      else
      {
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (!v10)
          goto LABEL_15;
      }
      v12 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums");
      if (v12 == -[PFPosterShuffleConfiguration shuffleSmartAlbums](v5, "shuffleSmartAlbums"))
      {
        -[PFPosterShuffleConfiguration albumCloudIdentifiers](self, "albumCloudIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFPosterShuffleConfiguration albumCloudIdentifiers](v5, "albumCloudIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
          v11 = 1;
        else
          v11 = objc_msgSend(v13, "isEqual:", v14);

        goto LABEL_18;
      }
LABEL_15:
      v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)analyticsPayload
{
  char v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[7];
  _QWORD v23[8];

  v23[7] = *MEMORY[0x1E0C80C00];
  v3 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums");
  v4 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums");
  v5 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums");
  v6 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums");
  v22[0] = CFSTR("shuffle_type");
  v7 = -[PFPosterShuffleConfiguration shuffleType](self, "shuffleType");
  if (v7 > 2)
    v8 = CFSTR("??");
  else
    v8 = off_1E45A1A88[v7];
  v23[0] = v8;
  v22[1] = CFSTR("shuffle_frequency");
  v9 = -[PFPosterShuffleConfiguration shuffleFrequency](self, "shuffleFrequency");
  if (v9 > 4)
    v10 = CFSTR("??");
  else
    v10 = off_1E45A1AA0[v9];
  v11 = (v4 >> 1) & 1;
  v12 = v3 & 1;
  v23[1] = v10;
  v22[2] = CFSTR("shuffle_people_count");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PFPosterShuffleConfiguration personLocalIdentifiers](self, "personLocalIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("people_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = CFSTR("pet_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = CFSTR("nature_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v5 >> 2) & 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v18;
  v22[6] = CFSTR("urban_enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v6 >> 3) & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFPosterShuffleConfiguration *v4;
  uint64_t v5;
  NSSet *personLocalIdentifiers;
  uint64_t v7;
  NSSet *albumCloudIdentifiers;

  v4 = +[PFPosterShuffleConfiguration allocWithZone:](PFPosterShuffleConfiguration, "allocWithZone:", a3);
  v4->_shuffleFrequency = self->_shuffleFrequency;
  v5 = -[NSSet copy](self->_personLocalIdentifiers, "copy");
  personLocalIdentifiers = v4->_personLocalIdentifiers;
  v4->_personLocalIdentifiers = (NSSet *)v5;

  v4->_shuffleSmartAlbums = self->_shuffleSmartAlbums;
  v4->_shuffleType = self->_shuffleType;
  v7 = -[NSSet copy](self->_albumCloudIdentifiers, "copy");
  albumCloudIdentifiers = v4->_albumCloudIdentifiers;
  v4->_albumCloudIdentifiers = (NSSet *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterShuffleConfiguration shuffleType](self, "shuffleType"), CFSTR("shuffleType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterShuffleConfiguration shuffleFrequency](self, "shuffleFrequency"), CFSTR("shuffleFrequency"));
  -[PFPosterShuffleConfiguration personLocalIdentifiers](self, "personLocalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("personLocalIdentifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("shuffleSmartAlbums"));

  -[PFPosterShuffleConfiguration albumCloudIdentifiers](self, "albumCloudIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("albumCloudIdentifiers"));

}

- (PFPosterShuffleConfiguration)initWithCoder:(id)a3
{
  id v4;
  PFPosterShuffleConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *personLocalIdentifiers;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *albumCloudIdentifiers;

  v4 = a3;
  v5 = -[PFPosterShuffleConfiguration initWithShuffleType:](self, "initWithShuffleType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shuffleType")));
  if (v5)
  {
    v5->_shuffleFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shuffleFrequency"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("personLocalIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    personLocalIdentifiers = v5->_personLocalIdentifiers;
    v5->_personLocalIdentifiers = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shuffleSmartAlbums"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shuffleSmartAlbums = objc_msgSend(v11, "unsignedIntegerValue");

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("albumCloudIdentifiers"));
    v15 = objc_claimAutoreleasedReturnValue();
    albumCloudIdentifiers = v5->_albumCloudIdentifiers;
    v5->_albumCloudIdentifiers = (NSSet *)v15;

  }
  return v5;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  int64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PFPosterShuffleConfiguration shuffleType](self, "shuffleType");
  v7 = CFSTR("Manual");
  if (!v6)
    v7 = CFSTR("Smart Albums");
  if (v6 == 2)
    v7 = CFSTR("User Album");
  v8 = v7;
  v9 = -[PFPosterShuffleConfiguration shuffleFrequency](self, "shuffleFrequency");
  if ((unint64_t)(v9 - 1) > 3)
    v10 = CFSTR("None");
  else
    v10 = off_1E45A1E18[v9 - 1];
  v11 = v10;
  -[PFPosterShuffleConfiguration personLocalIdentifiers](self, "personLocalIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PFBitmaskDescription(-[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums"), &unk_1E45CB228, &unk_1E45CB240);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterShuffleConfiguration albumCloudIdentifiers](self, "albumCloudIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; type: %@; frequency: %@; person IDs: %@, Smart Albums: %@, albumCloudIdentifiers: %@>"),
                  v5,
                  self,
                  v8,
                  v11,
                  v12,
                  v13,
                  v14);

  return (NSString *)v15;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (int64_t)shuffleFrequency
{
  return self->_shuffleFrequency;
}

- (void)setShuffleFrequency:(int64_t)a3
{
  self->_shuffleFrequency = a3;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, a3);
}

- (unint64_t)shuffleSmartAlbums
{
  return self->_shuffleSmartAlbums;
}

- (void)setShuffleSmartAlbums:(unint64_t)a3
{
  self->_shuffleSmartAlbums = a3;
}

- (NSSet)albumCloudIdentifiers
{
  return self->_albumCloudIdentifiers;
}

- (void)setAlbumCloudIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_albumCloudIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIncludePeople:(BOOL)a3
{
  -[PFPosterShuffleConfiguration setShuffleSmartAlbums:](self, "setShuffleSmartAlbums:", -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)includePeople
{
  return -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") & 1;
}

- (void)setIncludePets:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[PFPosterShuffleConfiguration setShuffleSmartAlbums:](self, "setShuffleSmartAlbums:", v5 | v6);
}

- (BOOL)includePets
{
  return (-[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") >> 1) & 1;
}

- (void)setIncludeLandscapes:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") & 0xFFFFFFFFFFFFFFFBLL;
  v6 = 4;
  if (!v3)
    v6 = 0;
  -[PFPosterShuffleConfiguration setShuffleSmartAlbums:](self, "setShuffleSmartAlbums:", v5 | v6);
}

- (BOOL)includeLandscapes
{
  return (-[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") >> 2) & 1;
}

- (void)setIncludeCityscapes:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") & 0xFFFFFFFFFFFFFFF7;
  v6 = 8;
  if (!v3)
    v6 = 0;
  -[PFPosterShuffleConfiguration setShuffleSmartAlbums:](self, "setShuffleSmartAlbums:", v5 | v6);
}

- (BOOL)includeCityscapes
{
  return (-[PFPosterShuffleConfiguration shuffleSmartAlbums](self, "shuffleSmartAlbums") >> 3) & 1;
}

@end
