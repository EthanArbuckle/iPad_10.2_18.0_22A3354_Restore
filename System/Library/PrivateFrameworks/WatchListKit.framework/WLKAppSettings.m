@implementation WLKAppSettings

- (WLKAppSettings)initWithChannelID:(id)a3 accessStatus:(unint64_t)a4 displayName:(id)a5 externalID:(id)a6
{
  id v10;
  id v11;
  id v12;
  WLKAppSettings *v13;
  uint64_t v14;
  NSString *channelID;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSString *externalID;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WLKAppSettings;
  v13 = -[WLKAppSettings init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    channelID = v13->_channelID;
    v13->_channelID = (NSString *)v14;

    v13->_accessStatus = a4;
    v16 = objc_msgSend(v11, "copy");
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    externalID = v13->_externalID;
    v13->_externalID = (NSString *)v18;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  WLKAppSettings *v4;
  BOOL v5;

  v4 = (WLKAppSettings *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WLKAppSettings isEqualToAppSettings:](self, "isEqualToAppSettings:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAppSettings:(id)a3
{
  id v4;
  void *v5;
  unint64_t accessStatus;
  NSString *channelID;
  void *v8;
  NSString *externalID;
  uint64_t v10;
  void *v11;
  char v12;
  NSString *displayName;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessStatus = self->_accessStatus;
    if (accessStatus == objc_msgSend(v4, "accessStatus"))
    {
      channelID = self->_channelID;
      objc_msgSend(v5, "channelID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](channelID, "isEqualToString:", v8))
      {
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      externalID = self->_externalID;
      objc_msgSend(v5, "externalID");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (externalID && v10)
      {
        if ((-[NSString isEqual:](externalID, "isEqual:", v10) & 1) == 0)
        {
LABEL_7:
          v12 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else if ((unint64_t)externalID | v10)
      {
        goto LABEL_7;
      }
      displayName = self->_displayName;
      objc_msgSend(v5, "displayName");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (displayName && v14)
        v12 = -[NSString isEqual:](displayName, "isEqual:", v14);
      else
        v12 = ((unint64_t)displayName | v14) == 0;

      goto LABEL_16;
    }
  }
  v12 = 0;
LABEL_18:

  return v12;
}

+ (BOOL)isExternalID:(id)a3 equalToExternalID:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return ((unint64_t)a3 | (unint64_t)a4) == 0;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_channelID, "hash");
  v4 = -[NSString hash](self->_externalID, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_displayName, "hash") ^ self->_accessStatus;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *externalID;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)WLKAppSettings;
  -[WLKAppSettings description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&self->_channelID;
  externalID = self->_externalID;
  -[WLKAppSettings _statusStrings](self, "_statusStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", self->_accessStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ channelID:%@; displayName:%@; externalID:%@; accessStatus:%@"),
    v4,
    v10,
    externalID,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)JSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_channelID, CFSTR("channelID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accessStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accessStatus"));

  -[WLKAppSettings _statusStrings](self, "_statusStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", self->_accessStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accessStatusString"));

  if (-[NSString length](self->_externalID, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_externalID, CFSTR("externalID"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)_statusStrings
{
  if (_statusStrings_onceToken != -1)
    dispatch_once(&_statusStrings_onceToken, &__block_literal_global_48);
  return (id)_statusStrings___statusStrings;
}

void __32__WLKAppSettings__statusStrings__block_invoke()
{
  void *v0;

  v0 = (void *)_statusStrings___statusStrings;
  _statusStrings___statusStrings = (uint64_t)&unk_1E68CA1C8;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKAppSettings)initWithCoder:(id)a3
{
  id v4;
  WLKAppSettings *v5;
  uint64_t v6;
  NSString *channelID;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *externalID;
  WLKAppSettings *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = -[WLKAppSettings init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppSettings.channelID"));
      v6 = objc_claimAutoreleasedReturnValue();
      channelID = v5->_channelID;
      v5->_channelID = (NSString *)v6;

      v5->_accessStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WLKAppSettings.accessStatus"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppSettings.displayName"));
      v8 = objc_claimAutoreleasedReturnValue();
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppSettings.externalID"));
      v10 = objc_claimAutoreleasedReturnValue();
      externalID = v5->_externalID;
      v5->_externalID = (NSString *)v10;

      v5->_obsolete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKAppSettings.obsolete"));
    }
    self = v5;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_channelID, CFSTR("WLKAppSettings.channelID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_accessStatus, CFSTR("WLKAppSettings.accessStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("WLKAppSettings.displayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalID, CFSTR("WLKAppSettings.externalID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_obsolete, CFSTR("WLKAppSettings.obsolete"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_channelID, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_displayName, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_externalID, "copy");
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  *(_QWORD *)(v4 + 32) = self->_accessStatus;
  *(_BYTE *)(v4 + 8) = self->_obsolete;
  return (id)v4;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)accessStatus
{
  return self->_accessStatus;
}

- (void)setAccessStatus:(unint64_t)a3
{
  self->_accessStatus = a3;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (BOOL)obsolete
{
  return self->_obsolete;
}

- (void)setObsolete:(BOOL)a3
{
  self->_obsolete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end
