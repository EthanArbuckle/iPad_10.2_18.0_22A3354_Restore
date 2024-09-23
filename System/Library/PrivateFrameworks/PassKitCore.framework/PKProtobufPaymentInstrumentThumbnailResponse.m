@implementation PKProtobufPaymentInstrumentThumbnailResponse

- (BOOL)hasThumbnailImage
{
  return self->_thumbnailImage != 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2AD72F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOO_LARGE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasManifestHash
{
  return self->_manifestHash != 0;
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
  v8.super_class = (Class)PKProtobufPaymentInstrumentThumbnailResponse;
  -[PKProtobufPaymentInstrumentThumbnailResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrumentThumbnailResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *thumbnailImage;
  uint64_t status;
  __CFString *v7;
  NSString *manifestHash;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
    objc_msgSend(v3, "setObject:forKey:", thumbnailImage, CFSTR("thumbnailImage"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2AD72F8[status];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("status"));

  }
  manifestHash = self->_manifestHash;
  if (manifestHash)
    objc_msgSend(v4, "setObject:forKey:", manifestHash, CFSTR("manifestHash"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentInstrumentThumbnailResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_thumbnailImage)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_manifestHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_thumbnailImage)
  {
    objc_msgSend(v4, "setThumbnailImage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_status;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_manifestHash)
  {
    objc_msgSend(v5, "setManifestHash:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_thumbnailImage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_manifestHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *thumbnailImage;
  NSString *manifestHash;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  thumbnailImage = self->_thumbnailImage;
  if ((unint64_t)thumbnailImage | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](thumbnailImage, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_status != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  manifestHash = self->_manifestHash;
  if ((unint64_t)manifestHash | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](manifestHash, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_thumbnailImage, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_status;
  else
    v4 = 0;
  return v4 ^ -[NSString hash](self->_manifestHash, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufPaymentInstrumentThumbnailResponse setThumbnailImage:](self, "setThumbnailImage:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_status = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufPaymentInstrumentThumbnailResponse setManifestHash:](self, "setManifestHash:");
    v4 = v5;
  }

}

- (NSData)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (NSString)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
}

@end
