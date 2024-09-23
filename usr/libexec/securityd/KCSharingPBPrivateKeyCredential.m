@implementation KCSharingPBPrivateKeyCredential

- (BOOL)hasAccessGroup
{
  return self->_accessGroup != 0;
}

- (void)setKeyType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_keyType = a3;
}

- (void)setHasKeyType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasKeyType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasApplicationTag
{
  return self->_applicationTag != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasApplicationLabel
{
  return self->_applicationLabel != 0;
}

- (BOOL)hasKeyMaterial
{
  return self->_keyMaterial != 0;
}

- (void)setKeySizeInBits:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_keySizeInBits = a3;
}

- (void)setHasKeySizeInBits:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeySizeInBits
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEffectiveKeySize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_effectiveKeySize = a3;
}

- (void)setHasEffectiveKeySize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEffectiveKeySize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCSharingPBPrivateKeyCredential;
  v3 = -[KCSharingPBPrivateKeyCredential description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBPrivateKeyCredential dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accessGroup;
  void *v6;
  NSData *applicationTag;
  NSString *label;
  NSData *applicationLabel;
  NSData *keyMaterial;
  char has;
  void *v12;
  PBUnknownFields *unknownFields;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  accessGroup = self->_accessGroup;
  if (accessGroup)
    objc_msgSend(v3, "setObject:forKey:", accessGroup, CFSTR("accessGroup"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_keyType));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("keyType"));

  }
  applicationTag = self->_applicationTag;
  if (applicationTag)
    objc_msgSend(v4, "setObject:forKey:", applicationTag, CFSTR("applicationTag"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKey:", label, CFSTR("label"));
  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
    objc_msgSend(v4, "setObject:forKey:", applicationLabel, CFSTR("applicationLabel"));
  keyMaterial = self->_keyMaterial;
  if (keyMaterial)
    objc_msgSend(v4, "setObject:forKey:", keyMaterial, CFSTR("keyMaterial"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_keySizeInBits));
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("keySizeInBits"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 1) == 0)
        goto LABEL_16;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_effectiveKeySize));
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("effectiveKeySize"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_23:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_creationDate));
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("creationDate"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_modificationDate));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("modificationDate"));

  }
LABEL_18:
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CA354((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;
  NSString *accessGroup;
  NSData *applicationTag;
  NSString *label;
  NSData *applicationLabel;
  NSData *keyMaterial;
  char has;
  id v12;

  v4 = a3;
  v5 = v4;
  accessGroup = self->_accessGroup;
  v12 = v4;
  if (accessGroup)
  {
    PBDataWriterWriteStringField(v4, accessGroup, 1);
    v5 = v12;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt64Field(v5, self->_keyType, 2);
    v5 = v12;
  }
  applicationTag = self->_applicationTag;
  if (applicationTag)
  {
    PBDataWriterWriteDataField(v5, applicationTag, 3);
    v5 = v12;
  }
  label = self->_label;
  if (label)
  {
    PBDataWriterWriteStringField(v5, label, 4);
    v5 = v12;
  }
  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    PBDataWriterWriteDataField(v5, applicationLabel, 5);
    v5 = v12;
  }
  keyMaterial = self->_keyMaterial;
  if (keyMaterial)
  {
    PBDataWriterWriteDataField(v5, keyMaterial, 6);
    v5 = v12;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field(v5, self->_keySizeInBits, 7);
    v5 = v12;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 1) == 0)
        goto LABEL_16;
LABEL_21:
      PBDataWriterWriteDoubleField(v5, 9, self->_creationDate);
      v5 = v12;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt64Field(v5, self->_effectiveKeySize, 8);
  v5 = v12;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_16:
  if ((has & 0x10) != 0)
  {
LABEL_17:
    PBDataWriterWriteDoubleField(v5, 10, self->_modificationDate);
    v5 = v12;
  }
LABEL_18:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accessGroup, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v5 + 5) = self->_keyType;
    *((_BYTE *)v5 + 96) |= 8u;
  }
  v8 = -[NSData copyWithZone:](self->_applicationTag, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v8;

  v10 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 11);
  *((_QWORD *)v5 + 11) = v10;

  v12 = -[NSData copyWithZone:](self->_applicationLabel, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v12;

  v14 = -[NSData copyWithZone:](self->_keyMaterial, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 10);
  *((_QWORD *)v5 + 10) = v14;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v5 + 4) = self->_keySizeInBits;
    *((_BYTE *)v5 + 96) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_creationDate;
      *((_BYTE *)v5 + 96) |= 1u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v5 + 3) = self->_effectiveKeySize;
  *((_BYTE *)v5 + 96) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *((_QWORD *)v5 + 6) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v5 + 96) |= 0x10u;
  }
LABEL_8:
  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accessGroup;
  NSData *applicationTag;
  NSString *label;
  NSData *applicationLabel;
  NSData *keyMaterial;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_36;
  accessGroup = self->_accessGroup;
  if ((unint64_t)accessGroup | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](accessGroup, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_keyType != *((_QWORD *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
LABEL_36:
    v10 = 0;
    goto LABEL_37;
  }
  applicationTag = self->_applicationTag;
  if ((unint64_t)applicationTag | *((_QWORD *)v4 + 9)
    && !-[NSData isEqual:](applicationTag, "isEqual:"))
  {
    goto LABEL_36;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_36;
  }
  applicationLabel = self->_applicationLabel;
  if ((unint64_t)applicationLabel | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](applicationLabel, "isEqual:"))
      goto LABEL_36;
  }
  keyMaterial = self->_keyMaterial;
  if ((unint64_t)keyMaterial | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](keyMaterial, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_keySizeInBits != *((_QWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_effectiveKeySize != *((_QWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_36;
  }
  v10 = (*((_BYTE *)v4 + 96) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x10) == 0 || self->_modificationDate != *((double *)v4 + 6))
      goto LABEL_36;
    v10 = 1;
  }
LABEL_37:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  char has;
  uint64_t v9;
  uint64_t v10;
  double creationDate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double modificationDate;
  double v18;
  long double v19;
  double v20;
  uint64_t v22;
  NSUInteger v23;

  v23 = -[NSString hash](self->_accessGroup, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = -[NSData hash](self->_applicationTag, "hash", 2654435761 * self->_keyType);
  else
    v3 = -[NSData hash](self->_applicationTag, "hash", 0);
  v4 = (unint64_t)v3;
  v5 = -[NSString hash](self->_label, "hash");
  v6 = (unint64_t)-[NSData hash](self->_applicationLabel, "hash");
  v7 = (unint64_t)-[NSData hash](self->_keyMaterial, "hash");
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v15 = 0;
    goto LABEL_16;
  }
  v9 = 2654435761 * self->_keySizeInBits;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v10 = 2654435761 * self->_effectiveKeySize;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  creationDate = self->_creationDate;
  v12 = -creationDate;
  if (creationDate >= 0.0)
    v12 = self->_creationDate;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_16:
  if ((has & 0x10) != 0)
  {
    modificationDate = self->_modificationDate;
    v18 = -modificationDate;
    if (modificationDate >= 0.0)
      v18 = self->_modificationDate;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v22 ^ v23 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[KCSharingPBPrivateKeyCredential setAccessGroup:](self, "setAccessGroup:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    self->_keyType = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[KCSharingPBPrivateKeyCredential setApplicationTag:](self, "setApplicationTag:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[KCSharingPBPrivateKeyCredential setLabel:](self, "setLabel:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[KCSharingPBPrivateKeyCredential setApplicationLabel:](self, "setApplicationLabel:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[KCSharingPBPrivateKeyCredential setKeyMaterial:](self, "setKeyMaterial:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 96);
  if ((v5 & 4) != 0)
  {
    self->_keySizeInBits = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 96);
    if ((v5 & 2) == 0)
    {
LABEL_15:
      if ((v5 & 1) == 0)
        goto LABEL_16;
LABEL_21:
      self->_creationDate = *((double *)v4 + 2);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 96) & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 96) & 2) == 0)
  {
    goto LABEL_15;
  }
  self->_effectiveKeySize = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 96);
  if ((v5 & 1) != 0)
    goto LABEL_21;
LABEL_16:
  if ((v5 & 0x10) != 0)
  {
LABEL_17:
    self->_modificationDate = *((double *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_18:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accessGroup, a3);
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSData)applicationTag
{
  return self->_applicationTag;
}

- (void)setApplicationTag:(id)a3
{
  objc_storeStrong((id *)&self->_applicationTag, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSData)applicationLabel
{
  return self->_applicationLabel;
}

- (void)setApplicationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_applicationLabel, a3);
}

- (NSData)keyMaterial
{
  return self->_keyMaterial;
}

- (void)setKeyMaterial:(id)a3
{
  objc_storeStrong((id *)&self->_keyMaterial, a3);
}

- (int64_t)keySizeInBits
{
  return self->_keySizeInBits;
}

- (int64_t)effectiveKeySize
{
  return self->_effectiveKeySize;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_applicationTag, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
