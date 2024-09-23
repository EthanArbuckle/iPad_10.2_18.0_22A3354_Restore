@implementation ICQMediaCloudStorage

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mediaType: %@, displayLabel: %@, displayColor: %@, displayColorDark: %@, storageUsed: %@"), self->_mediaType, self->_displayLabel, self->_displayColor, self->_displayColorDark, self->_storageUsed);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQMediaCloudStorage *v4;

  v4 = objc_alloc_init(ICQMediaCloudStorage);
  -[ICQMediaCloudStorage setMediaType:](v4, "setMediaType:", self->_mediaType);
  -[ICQMediaCloudStorage setDisplayLabel:](v4, "setDisplayLabel:", self->_displayLabel);
  -[ICQMediaCloudStorage setDisplayColor:](v4, "setDisplayColor:", self->_displayColor);
  -[ICQMediaCloudStorage setDisplayColorDark:](v4, "setDisplayColorDark:", self->_displayColorDark);
  -[ICQMediaCloudStorage setStorageUsed:](v4, "setStorageUsed:", self->_storageUsed);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mediaType;
  id v5;

  mediaType = self->_mediaType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mediaType, CFSTR("mediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayLabel, CFSTR("displayLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayColor, CFSTR("displayColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayColorDark, CFSTR("displayColorDark"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageUsed, CFSTR("storageUsed"));

}

- (ICQMediaCloudStorage)initWithCoder:(id)a3
{
  id v4;
  ICQMediaCloudStorage *v5;
  uint64_t v6;
  NSString *mediaType;
  uint64_t v8;
  NSString *displayLabel;
  uint64_t v10;
  NSString *displayColor;
  uint64_t v12;
  NSString *displayColorDark;
  uint64_t v14;
  NSNumber *storageUsed;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICQMediaCloudStorage;
  v5 = -[ICQMediaCloudStorage init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayLabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayLabel = v5->_displayLabel;
    v5->_displayLabel = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayColor = v5->_displayColor;
    v5->_displayColor = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayColorDark"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayColorDark = v5->_displayColorDark;
    v5->_displayColorDark = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageUsed"));
    v14 = objc_claimAutoreleasedReturnValue();
    storageUsed = v5->_storageUsed;
    v5->_storageUsed = (NSNumber *)v14;

  }
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayColor
{
  return self->_displayColor;
}

- (void)setDisplayColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayColorDark
{
  return self->_displayColorDark;
}

- (void)setDisplayColorDark:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)storageUsed
{
  return self->_storageUsed;
}

- (void)setStorageUsed:(id)a3
{
  objc_storeStrong((id *)&self->_storageUsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageUsed, 0);
  objc_storeStrong((id *)&self->_displayColorDark, 0);
  objc_storeStrong((id *)&self->_displayColor, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
}

@end
