@implementation ICIAMTriggerCondition

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)dataType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_dataType;
  else
    return 0;
}

- (void)setDataType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)dataTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E438C0B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDataType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Boolean")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("String")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Integer")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)comparisonType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_comparisonType;
  else
    return 0;
}

- (void)setComparisonType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_comparisonType = a3;
}

- (void)setHasComparisonType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComparisonType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)comparisonTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E438C0D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsComparisonType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Equal")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotEqual")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThan")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LessThanOrEqualTo")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GreaterThan")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GreaterThanOrEqualTo")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTriggerValue
{
  return self->_triggerValue != 0;
}

- (int)triggerConditionType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_triggerConditionType;
  else
    return 0;
}

- (void)setTriggerConditionType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_triggerConditionType = a3;
}

- (void)setHasTriggerConditionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTriggerConditionType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)triggerConditionTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Countable");
  if (a3 == 1)
  {
    v3 = CFSTR("Value");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsTriggerConditionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Countable")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Value"));

  return v4;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_kind;
  else
    return 0;
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKind
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)kindAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Event");
  if (a3 == 1)
  {
    v3 = CFSTR("ContextProperty");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsKind:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Event")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ContextProperty"));

  return v4;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMTriggerCondition;
  -[ICIAMTriggerCondition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMTriggerCondition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  char has;
  uint64_t dataType;
  __CFString *v8;
  uint64_t comparisonType;
  __CFString *v10;
  NSString *triggerValue;
  char v12;
  int triggerConditionType;
  __CFString *v14;
  int kind;
  __CFString *v16;
  NSString *bundleIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    dataType = self->_dataType;
    if (dataType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dataType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E438C0B8[dataType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("dataType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    comparisonType = self->_comparisonType;
    if (comparisonType >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_comparisonType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E438C0D0[comparisonType];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("comparisonType"));

  }
  triggerValue = self->_triggerValue;
  if (triggerValue)
    objc_msgSend(v4, "setObject:forKey:", triggerValue, CFSTR("triggerValue"));
  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    triggerConditionType = self->_triggerConditionType;
    if (triggerConditionType)
    {
      if (triggerConditionType == 1)
      {
        v14 = CFSTR("Value");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerConditionType);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("Countable");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("triggerConditionType"));

    v12 = (char)self->_has;
  }
  if ((v12 & 4) != 0)
  {
    kind = self->_kind;
    if (kind)
    {
      if (kind == 1)
      {
        v16 = CFSTR("ContextProperty");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_kind);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = CFSTR("Event");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("kind"));

  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMTriggerConditionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_triggerValue)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_dataType;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_comparisonType;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_triggerValue)
  {
    objc_msgSend(v7, "setTriggerValue:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_triggerConditionType;
    *((_BYTE *)v4 + 48) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_kind;
    *((_BYTE *)v4 + 48) |= 4u;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v7, "setBundleIdentifier:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_dataType;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_comparisonType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_triggerValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_triggerConditionType;
    *(_BYTE *)(v5 + 48) |= 8u;
    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_kind;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char has;
  char v7;
  NSString *triggerValue;
  NSString *bundleIdentifier;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_29;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_dataType != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_comparisonType != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_29;
  }
  triggerValue = self->_triggerValue;
  if ((unint64_t)triggerValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](triggerValue, "isEqual:"))
    {
LABEL_29:
      v10 = 0;
      goto LABEL_30;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_triggerConditionType != *((_DWORD *)v4 + 9))
      goto LABEL_29;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_kind != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_29;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
    v10 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  else
    v10 = 1;
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_dataType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_comparisonType;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_triggerValue, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761 * self->_triggerConditionType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_bundleIdentifier, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761 * self->_kind;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_bundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  char v6;
  int *v7;

  v4 = (int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ICIAMTriggerCondition setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_dataType = v4[5];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 1) != 0)
  {
    self->_comparisonType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ICIAMTriggerCondition setTriggerValue:](self, "setTriggerValue:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_triggerConditionType = v4[9];
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 48);
  }
  if ((v6 & 4) != 0)
  {
    self->_kind = v4[8];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ICIAMTriggerCondition setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v7;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)triggerValue
{
  return self->_triggerValue;
}

- (void)setTriggerValue:(id)a3
{
  objc_storeStrong((id *)&self->_triggerValue, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
