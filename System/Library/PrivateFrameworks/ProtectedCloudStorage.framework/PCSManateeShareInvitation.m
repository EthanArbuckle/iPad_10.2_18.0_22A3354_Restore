@implementation PCSManateeShareInvitation

- (BOOL)hasExportedPCSData
{
  return self->_exportedPCSData != 0;
}

- (BOOL)hasShareePublicKeyData
{
  return self->_shareePublicKeyData != 0;
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
  v8.super_class = (Class)PCSManateeShareInvitation;
  -[PCSManateeShareInvitation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSManateeShareInvitation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *exportedPCSData;
  NSData *shareePublicKeyData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  exportedPCSData = self->_exportedPCSData;
  if (exportedPCSData)
    objc_msgSend(v3, "setObject:forKey:", exportedPCSData, CFSTR("exportedPCSData"));
  shareePublicKeyData = self->_shareePublicKeyData;
  if (shareePublicKeyData)
    objc_msgSend(v4, "setObject:forKey:", shareePublicKeyData, CFSTR("shareePublicKeyData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PCSManateeShareInvitationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_exportedPCSData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_shareePublicKeyData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_exportedPCSData)
  {
    objc_msgSend(v4, "setExportedPCSData:");
    v4 = v5;
  }
  if (self->_shareePublicKeyData)
  {
    objc_msgSend(v5, "setShareePublicKeyData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_exportedPCSData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_shareePublicKeyData, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *exportedPCSData;
  NSData *shareePublicKeyData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((exportedPCSData = self->_exportedPCSData, !((unint64_t)exportedPCSData | v4[1]))
     || -[NSData isEqual:](exportedPCSData, "isEqual:")))
  {
    shareePublicKeyData = self->_shareePublicKeyData;
    if ((unint64_t)shareePublicKeyData | v4[2])
      v7 = -[NSData isEqual:](shareePublicKeyData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_exportedPCSData, "hash");
  return -[NSData hash](self->_shareePublicKeyData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[PCSManateeShareInvitation setExportedPCSData:](self, "setExportedPCSData:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[PCSManateeShareInvitation setShareePublicKeyData:](self, "setShareePublicKeyData:");
    v4 = v5;
  }

}

- (NSData)exportedPCSData
{
  return self->_exportedPCSData;
}

- (void)setExportedPCSData:(id)a3
{
  objc_storeStrong((id *)&self->_exportedPCSData, a3);
}

- (NSData)shareePublicKeyData
{
  return self->_shareePublicKeyData;
}

- (void)setShareePublicKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_shareePublicKeyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareePublicKeyData, 0);
  objc_storeStrong((id *)&self->_exportedPCSData, 0);
}

@end
