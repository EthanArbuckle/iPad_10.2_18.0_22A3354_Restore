@implementation CSDMessagingHandle

+ (CSDMessagingHandle)handleWithTUHandle:(id)a3
{
  id v3;
  CSDMessagingHandle *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(CSDMessagingHandle);
    objc_msgSend(v3, "isoCountryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDMessagingHandle setIsoCountryCode:](v4, "setIsoCountryCode:", v5);

    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDMessagingHandle setValue:](v4, "setValue:", v6);

    objc_msgSend(v3, "siriDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDMessagingHandle setSiriDisplayName:](v4, "setSiriDisplayName:", v7);

    v8 = objc_msgSend(v3, "type");
    if ((unint64_t)(v8 - 1) <= 2)
      -[CSDMessagingHandle setType:](v4, "setType:", v8);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (TUHandle)tuHandle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CSDMessagingHandle value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    switch(-[CSDMessagingHandle type](self, "type"))
    {
      case 0:
        if (!objc_msgSend(v3, "destinationIdIsEmailAddress"))
          goto LABEL_7;
        goto LABEL_9;
      case 1:
LABEL_7:
        +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v3);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 2:
        -[CSDMessagingHandle isoCountryCode](self, "isoCountryCode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v3, v6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 3:
LABEL_9:
        +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v3);
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v4 = (void *)v5;
        break;
      default:
        v4 = 0;
        break;
    }
    -[CSDMessagingHandle siriDisplayName](self, "siriDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSiriDisplayName:", v7);

  }
  else
  {
    v4 = 0;
  }

  return (TUHandle *)v4;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return *((id *)&off_1E38A4B50 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Generic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneNumber")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAddress")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (BOOL)hasSiriDisplayName
{
  return self->_siriDisplayName != 0;
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
  v8.super_class = (Class)CSDMessagingHandle;
  -[CSDMessagingHandle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingHandle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  void *v5;
  NSString *value;
  NSString *isoCountryCode;
  NSString *siriDisplayName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)*((_QWORD *)&off_1E38A4B50 + type);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKey:", value, CFSTR("value"));
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode)
    objc_msgSend(v3, "setObject:forKey:", isoCountryCode, CFSTR("isoCountryCode"));
  siriDisplayName = self->_siriDisplayName;
  if (siriDisplayName)
    objc_msgSend(v3, "setObject:forKey:", siriDisplayName, CFSTR("siriDisplayName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CSDMessagingHandleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_siriDisplayName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_type;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v5, "setIsoCountryCode:");
    v4 = v5;
  }
  if (self->_siriDisplayName)
  {
    objc_msgSend(v5, "setSiriDisplayName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_siriDisplayName, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *value;
  NSString *isoCountryCode;
  NSString *siriDisplayName;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](value, "isEqual:"))
    goto LABEL_13;
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:"))
      goto LABEL_13;
  }
  siriDisplayName = self->_siriDisplayName;
  if ((unint64_t)siriDisplayName | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](siriDisplayName, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_value, "hash") ^ v3;
  v5 = -[NSString hash](self->_isoCountryCode, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_siriDisplayName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_type = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[CSDMessagingHandle setValue:](self, "setValue:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[CSDMessagingHandle setIsoCountryCode:](self, "setIsoCountryCode:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[CSDMessagingHandle setSiriDisplayName:](self, "setSiriDisplayName:");
    v4 = v5;
  }

}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_siriDisplayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_siriDisplayName, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
}

@end
