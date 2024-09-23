@implementation SBSConnectedDisplayInfo

- (SBSConnectedDisplayInfo)initWithIdentifier:(id)a3 deviceName:(id)a4 displayName:(id)a5 size:(CGSize)a6 mirrored:(BOOL)a7 supportedScales:(unint64_t)a8 displayModeSettings:(id)a9 arrangement:(id)a10
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  SBSConnectedDisplayInfo *v21;
  SBSConnectedDisplayInfo *v22;
  id v26;
  objc_super v27;

  height = a6.height;
  width = a6.width;
  v26 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)SBSConnectedDisplayInfo;
  v21 = -[SBSConnectedDisplayInfo init](&v27, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_deviceName, a4);
    objc_storeStrong((id *)&v22->_displayName, a5);
    v22->_size.width = width;
    v22->_size.height = height;
    v22->_mirrored = a7;
    objc_storeStrong((id *)&v22->_displayModeSettings, a9);
    v22->_supportedScales = a8;
    objc_storeStrong((id *)&v22->_arrangement, a10);
  }

  return v22;
}

- (SBSConnectedDisplayInfo)initWithCoder:(id)a3
{
  id v4;
  SBSConnectedDisplayInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *deviceName;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  SBSRelativeDisplayArrangement *arrangement;
  uint64_t v16;
  SBSDisplayModeSettings *displayModeSettings;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSConnectedDisplayInfo;
  v5 = -[SBSConnectedDisplayInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v10;

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
    v5->_size.width = v12;
    v5->_size.height = v13;
    v5->_mirrored = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mirrored"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrangement"));
    v14 = objc_claimAutoreleasedReturnValue();
    arrangement = v5->_arrangement;
    v5->_arrangement = (SBSRelativeDisplayArrangement *)v14;

    v5->_supportedScales = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedScales"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayModeSettings"));
    v16 = objc_claimAutoreleasedReturnValue();
    displayModeSettings = v5->_displayModeSettings;
    v5->_displayModeSettings = (SBSDisplayModeSettings *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("size"), self->_size.width, self->_size.height);
  objc_msgSend(v5, "encodeBool:forKey:", self->_mirrored, CFSTR("mirrored"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrangement, CFSTR("arrangement"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedScales, CFSTR("supportedScales"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayModeSettings, CFSTR("displayModeSettings"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "appendString:withName:", self->_displayName, CFSTR("displayName"));
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_mirrored, CFSTR("mirrored"));
  v5 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("size"), self->_size.width, self->_size.height);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_arrangement, CFSTR("arrangement"));
  v7 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_supportedScales, CFSTR("supportedScales"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayModeSettings, CFSTR("displayModeSettings"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isMirrored
{
  return self->_mirrored;
}

- (SBSRelativeDisplayArrangement)arrangement
{
  return self->_arrangement;
}

- (unint64_t)supportedScales
{
  return self->_supportedScales;
}

- (SBSDisplayModeSettings)displayModeSettings
{
  return self->_displayModeSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayModeSettings, 0);
  objc_storeStrong((id *)&self->_arrangement, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
