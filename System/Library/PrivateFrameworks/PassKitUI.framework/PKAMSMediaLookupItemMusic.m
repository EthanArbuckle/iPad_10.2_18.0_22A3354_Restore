@implementation PKAMSMediaLookupItemMusic

- (PKAMSMediaLookupItemMusic)init
{

  return 0;
}

- (PKAMSMediaLookupItemMusic)initWithType:(unint64_t)a3 artwork:(id)a4 animatedArtworkURL:(id)a5 displayName:(id)a6 itemDescription:(id)a7 musicURL:(id)a8 appleCurated:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id *v19;
  id v21;
  id v22;

  v22 = a4;
  v21 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (a3 <= 2)
  {
    v19 = -[PKAMSMediaLookupItem _initWithType:](self, "_initWithType:", a3);
    objc_storeStrong(v19 + 3, a4);
    objc_storeStrong(v19 + 4, a5);
    objc_storeStrong(v19 + 5, a6);
    objc_storeStrong(v19 + 6, a7);
    objc_storeStrong(v19 + 7, a8);
    *((_BYTE *)v19 + 16) = a9;
    self = v19;
  }

  return self;
}

- (PKAMSMediaLookupItemMusic)initWithCoder:(id)a3
{
  id v4;
  PKAMSMediaLookupItemMusic *v5;
  uint64_t v6;
  NSData *artwork;
  uint64_t v8;
  NSURL *animatedArtworkURL;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSString *itemDescription;
  uint64_t v14;
  NSURL *musicURL;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAMSMediaLookupItemMusic;
  v5 = -[PKAMSMediaLookupItem initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artwork"));
    v6 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("animatedArtworkURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    animatedArtworkURL = v5->_animatedArtworkURL;
    v5->_animatedArtworkURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("musicURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    musicURL = v5->_musicURL;
    v5->_musicURL = (NSURL *)v14;

    v5->_appleCurated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appleCurated"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAMSMediaLookupItemMusic;
  v4 = a3;
  -[PKAMSMediaLookupItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_artwork, CFSTR("artwork"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_animatedArtworkURL, CFSTR("animatedArtworkURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemDescription, CFSTR("itemDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_musicURL, CFSTR("musicURL"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_appleCurated, CFSTR("appleCurated"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAMSMediaLookupItemMusic;
  v4 = -[PKAMSMediaLookupItem copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_artwork);
  objc_storeStrong(v4 + 4, self->_animatedArtworkURL);
  objc_storeStrong(v4 + 5, self->_displayName);
  objc_storeStrong(v4 + 6, self->_itemDescription);
  objc_storeStrong(v4 + 7, self->_musicURL);
  *((_BYTE *)v4 + 16) = self->_appleCurated;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKAMSMediaLookupItemMusic *v4;
  PKAMSMediaLookupItemMusic *v5;
  BOOL v6;

  v4 = (PKAMSMediaLookupItemMusic *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAMSMediaLookupItemMusic isEqualToMusicItem:](self, "isEqualToMusicItem:", v5);

  return v6;
}

- (BOOL)isEqualToMusicItem:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAMSMediaLookupItemMusic;
  if (!-[PKAMSMediaLookupItem isEqualToItem:](&v16, sel_isEqualToItem_, v4)
    || !PKEqualObjects()
    || !PKEqualObjects())
  {
    goto LABEL_21;
  }
  v5 = (void *)v4[5];
  v6 = self->_displayName;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_17;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_21;
  }
  v11 = (void *)v4[6];
  v6 = self->_itemDescription;
  v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_19;
  }
  v8 = v12;
  if (!v6 || !v12)
  {
LABEL_17:

LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_21;
LABEL_19:
  if (!PKEqualObjects())
    goto LABEL_21;
  v14 = self->_appleCurated == *((unsigned __int8 *)v4 + 16);
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKAMSMediaLookupItemMusic;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKAMSMediaLookupItem hash](&v8, sel_hash));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_artwork);
  objc_msgSend(v3, "safelyAddObject:", self->_animatedArtworkURL);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_itemDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_musicURL);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appleCurated);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  v6 = PKCombinedHash();
  return v6;
}

- (NSData)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)animatedArtworkURL
{
  return self->_animatedArtworkURL;
}

- (void)setAnimatedArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_animatedArtworkURL, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (NSURL)musicURL
{
  return self->_musicURL;
}

- (void)setMusicURL:(id)a3
{
  objc_storeStrong((id *)&self->_musicURL, a3);
}

- (BOOL)appleCurated
{
  return self->_appleCurated;
}

- (void)setAppleCurated:(BOOL)a3
{
  self->_appleCurated = a3;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_musicURL, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_animatedArtworkURL, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
