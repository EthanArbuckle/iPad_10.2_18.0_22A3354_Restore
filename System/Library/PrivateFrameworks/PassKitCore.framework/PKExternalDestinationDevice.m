@implementation PKExternalDestinationDevice

- (PKExternalDestinationDevice)init
{

  return 0;
}

- (PKExternalDestinationDevice)initWithDictionary:(id)a3
{
  id v4;
  PKExternalDestinationDevice *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *osType;
  uint64_t v14;
  NSString *model;
  void *v16;
  void *v17;
  uint64_t v18;
  NSURL *imageURL2x;
  uint64_t v20;
  NSURL *imageURL3x;
  PKExternalDestinationDevice *v22;
  objc_super v24;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  v24.receiver = self;
  v24.super_class = (Class)PKExternalDestinationDevice;
  v5 = -[PKExternalDestinationDevice init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("deviceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("deviceSerialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    if (v5->_identifier && v5->_serialNumber)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
      v10 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v10;

      v5->_eligibilityStatus = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("eligibilityStatus"));
      objc_msgSend(v4, "PKStringForKey:", CFSTR("deviceType"));
      v12 = objc_claimAutoreleasedReturnValue();
      osType = v5->_osType;
      v5->_osType = (NSString *)v12;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("deviceModelType"));
      v14 = objc_claimAutoreleasedReturnValue();
      model = v5->_model;
      v5->_model = (NSString *)v14;

      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("deviceImageUrl"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "PKDictionaryForKey:", CFSTR("infobox"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "PKURLForKey:", CFSTR("2x"));
      v18 = objc_claimAutoreleasedReturnValue();
      imageURL2x = v5->_imageURL2x;
      v5->_imageURL2x = (NSURL *)v18;

      objc_msgSend(v17, "PKURLForKey:", CFSTR("3x"));
      v20 = objc_claimAutoreleasedReturnValue();
      imageURL3x = v5->_imageURL3x;
      v5->_imageURL3x = (NSURL *)v20;

      goto LABEL_6;
    }

    self = 0;
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
LABEL_6:
  self = v5;
  v22 = self;
LABEL_9:

  return v22;
}

- (PKExternalDestinationDevice)initWithIdentifier:(id)a3 serialNumber:(id)a4
{
  id v7;
  id v8;
  PKExternalDestinationDevice *v9;
  PKExternalDestinationDevice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKExternalDestinationDevice;
  v9 = -[PKExternalDestinationDevice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_serialNumber, a4);
    v10->_eligibilityStatus = 1;
  }

  return v10;
}

- (NSString)deviceClass
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;

  v3 = self->_osType;
  if (v3 == CFSTR("iOS"))
    return (NSString *)CFSTR("iPhone");
  v4 = v3;
  if (v3)
  {
    v5 = -[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("iOS"));

    if (!v5)
      return (NSString *)CFSTR("iPhone");
  }
  v6 = self->_osType;
  if (v6 == CFSTR("iPadOS"))
    return (NSString *)CFSTR("iPad");
  v7 = v6;
  if (v6)
  {
    v8 = -[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("iPadOS"));

    if (!v8)
      return (NSString *)CFSTR("iPad");
  }
  v9 = self->_osType;
  if (v9 == CFSTR("WatchOS"))
    return (NSString *)CFSTR("Watch");
  v10 = v9;
  if (v9)
  {
    v11 = -[__CFString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", CFSTR("WatchOS"));

    if (!v11)
      return (NSString *)CFSTR("Watch");
  }
  v12 = self->_osType;
  if (v12 == CFSTR("macOS"))
    return (NSString *)CFSTR("Mac");
  v13 = v12;
  if (v12)
  {
    v14 = -[__CFString caseInsensitiveCompare:](v12, "caseInsensitiveCompare:", CFSTR("macOS"));

    if (!v14)
      return (NSString *)CFSTR("Mac");
  }
  v15 = self->_osType;
  if (v15 == CFSTR("visionOS"))
    return (NSString *)CFSTR("RealityDevice");
  v16 = v15;
  if (v15
    && (v17 = -[__CFString caseInsensitiveCompare:](v15, "caseInsensitiveCompare:", CFSTR("visionOS")),
        v16,
        !v17))
  {
    return (NSString *)CFSTR("RealityDevice");
  }
  else
  {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExternalDestinationDevice)initWithCoder:(id)a3
{
  id v4;
  PKExternalDestinationDevice *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *osType;
  uint64_t v15;
  NSString *model;
  uint64_t v17;
  NSURL *imageURL2x;
  uint64_t v19;
  NSURL *imageURL3x;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKExternalDestinationDevice;
  v5 = -[PKExternalDestinationDevice init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibilityStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eligibilityStatus = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osType"));
    v13 = objc_claimAutoreleasedReturnValue();
    osType = v5->_osType;
    v5->_osType = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v15 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL2x"));
    v17 = objc_claimAutoreleasedReturnValue();
    imageURL2x = v5->_imageURL2x;
    v5->_imageURL2x = (NSURL *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL3x"));
    v19 = objc_claimAutoreleasedReturnValue();
    imageURL3x = v5->_imageURL3x;
    v5->_imageURL3x = (NSURL *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eligibilityStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("eligibilityStatus"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_osType, CFSTR("osType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageURL2x, CFSTR("imageURL2x"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageURL3x, CFSTR("imageURL3x"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("serialNumber: '%@'; "), self->_serialNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("name: '%@'; "), self->_name);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eligibilityStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("eligibilityStatus: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("osType: '%@'; "), self->_osType);
  objc_msgSend(v6, "appendFormat:", CFSTR("model: '%@'; "), self->_model);
  objc_msgSend(v6, "appendFormat:", CFSTR("imageURL2x: '%@'; "), self->_imageURL2x);
  objc_msgSend(v6, "appendFormat:", CFSTR("imageURL3x: '%@'; "), self->_imageURL3x);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_osType);
  objc_msgSend(v3, "safelyAddObject:", self->_model);
  objc_msgSend(v3, "safelyAddObject:", self->_imageURL2x);
  objc_msgSend(v3, "safelyAddObject:", self->_imageURL3x);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_eligibilityStatus - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKExternalDestinationDevice *v4;
  PKExternalDestinationDevice *v5;
  BOOL v6;

  v4 = (PKExternalDestinationDevice *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKExternalDestinationDevice isEqualToExternalDestinationDevice:](self, "isEqualToExternalDestinationDevice:", v5);

  return v6;
}

- (BOOL)isEqualToExternalDestinationDevice:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSString *serialNumber;
  NSString *v9;
  NSString *name;
  NSString *v11;
  NSString *osType;
  NSString *v13;
  NSString *model;
  NSString *v15;
  NSURL *imageURL2x;
  NSURL *v17;
  NSURL *imageURL3x;
  NSURL *v19;
  char v20;

  v4 = a3;
  if (!v4)
    goto LABEL_38;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_38;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_38;
  }
  serialNumber = self->_serialNumber;
  v9 = (NSString *)v4[2];
  if (serialNumber && v9)
  {
    if ((-[NSString isEqual:](serialNumber, "isEqual:") & 1) == 0)
      goto LABEL_38;
  }
  else if (serialNumber != v9)
  {
    goto LABEL_38;
  }
  name = self->_name;
  v11 = (NSString *)v4[3];
  if (name && v11)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
      goto LABEL_38;
  }
  else if (name != v11)
  {
    goto LABEL_38;
  }
  if (self->_eligibilityStatus != v4[4])
    goto LABEL_38;
  osType = self->_osType;
  v13 = (NSString *)v4[5];
  if (osType && v13)
  {
    if ((-[NSString isEqual:](osType, "isEqual:") & 1) == 0)
      goto LABEL_38;
  }
  else if (osType != v13)
  {
    goto LABEL_38;
  }
  model = self->_model;
  v15 = (NSString *)v4[6];
  if (model && v15)
  {
    if ((-[NSString isEqual:](model, "isEqual:") & 1) == 0)
      goto LABEL_38;
  }
  else if (model != v15)
  {
    goto LABEL_38;
  }
  imageURL2x = self->_imageURL2x;
  v17 = (NSURL *)v4[7];
  if (!imageURL2x || !v17)
  {
    if (imageURL2x == v17)
      goto LABEL_34;
LABEL_38:
    v20 = 0;
    goto LABEL_39;
  }
  if ((-[NSURL isEqual:](imageURL2x, "isEqual:") & 1) == 0)
    goto LABEL_38;
LABEL_34:
  imageURL3x = self->_imageURL3x;
  v19 = (NSURL *)v4[8];
  if (imageURL3x && v19)
    v20 = -[NSURL isEqual:](imageURL3x, "isEqual:");
  else
    v20 = imageURL3x == v19;
LABEL_39:

  return v20;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (NSString)osType
{
  return self->_osType;
}

- (void)setOsType:(id)a3
{
  objc_storeStrong((id *)&self->_osType, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSURL)imageURL2x
{
  return self->_imageURL2x;
}

- (void)setImageURL2x:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL2x, a3);
}

- (NSURL)imageURL3x
{
  return self->_imageURL3x;
}

- (void)setImageURL3x:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL3x, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL3x, 0);
  objc_storeStrong((id *)&self->_imageURL2x, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_osType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
