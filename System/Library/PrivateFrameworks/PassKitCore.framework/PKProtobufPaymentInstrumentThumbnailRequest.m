@implementation PKProtobufPaymentInstrumentThumbnailRequest

- (BOOL)hasPassIdentifier
{
  return self->_passIdentifier != 0;
}

- (BOOL)hasManifestHash
{
  return self->_manifestHash != 0;
}

- (void)setWidth:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHeight:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PKProtobufPaymentInstrumentThumbnailRequest;
  -[PKProtobufPaymentInstrumentThumbnailRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrumentThumbnailRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passIdentifier;
  NSString *manifestHash;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passIdentifier, CFSTR("passIdentifier"));
  manifestHash = self->_manifestHash;
  if (manifestHash)
    objc_msgSend(v4, "setObject:forKey:", manifestHash, CFSTR("manifestHash"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_width);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("width"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("height"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentInstrumentThumbnailRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_passIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_manifestHash)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (unsigned)requestTypeCode
{
  return 7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_passIdentifier)
  {
    objc_msgSend(v4, "setPassIdentifier:");
    v4 = v6;
  }
  if (self->_manifestHash)
  {
    objc_msgSend(v6, "setManifestHash:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_width;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_height;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_manifestHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_width;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_height;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passIdentifier;
  NSString *manifestHash;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  passIdentifier = self->_passIdentifier;
  if ((unint64_t)passIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](passIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](manifestHash, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_width != *((double *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_height != *((double *)v4 + 1))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double width;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double height;
  double v13;
  long double v14;
  double v15;

  v3 = -[NSString hash](self->_passIdentifier, "hash");
  v4 = -[NSString hash](self->_manifestHash, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    width = self->_width;
    v8 = -width;
    if (width >= 0.0)
      v8 = self->_width;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 1) != 0)
  {
    height = self->_height;
    v13 = -height;
    if (height >= 0.0)
      v13 = self->_height;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  char v5;
  double *v6;

  v4 = (double *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufPaymentInstrumentThumbnailRequest setPassIdentifier:](self, "setPassIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufPaymentInstrumentThumbnailRequest setManifestHash:](self, "setManifestHash:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_width = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_height = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passIdentifier, a3);
}

- (NSString)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
}

@end
