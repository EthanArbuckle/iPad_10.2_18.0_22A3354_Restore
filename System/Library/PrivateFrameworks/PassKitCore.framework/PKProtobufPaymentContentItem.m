@implementation PKProtobufPaymentContentItem

- (BOOL)hasImageRequest
{
  return self->_imageRequest != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setCentered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_centered = a3;
}

- (void)setHasCentered:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCentered
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
  v8.super_class = (Class)PKProtobufPaymentContentItem;
  -[PKProtobufPaymentContentItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentContentItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *imageRequest;
  NSData *image;
  NSData *title;
  NSData *label;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  imageRequest = self->_imageRequest;
  if (imageRequest)
    objc_msgSend(v3, "setObject:forKey:", imageRequest, CFSTR("imageRequest"));
  image = self->_image;
  if (image)
    objc_msgSend(v4, "setObject:forKey:", image, CFSTR("image"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKey:", label, CFSTR("label"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_centered);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("centered"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentContentItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_imageRequest)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_imageRequest)
  {
    objc_msgSend(v4, "setImageRequest:");
    v4 = v5;
  }
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_label)
  {
    objc_msgSend(v5, "setLabel:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[40] = self->_centered;
    v4[44] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_imageRequest, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_image, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSData copyWithZone:](self->_title, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSData copyWithZone:](self->_label, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_centered;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *imageRequest;
  NSData *image;
  NSData *title;
  NSData *label;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  imageRequest = self->_imageRequest;
  if ((unint64_t)imageRequest | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](imageRequest, "isEqual:"))
      goto LABEL_12;
  }
  image = self->_image;
  if ((unint64_t)image | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](image, "isEqual:"))
      goto LABEL_12;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](title, "isEqual:"))
      goto LABEL_12;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](label, "isEqual:"))
      goto LABEL_12;
  }
  v9 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
    {
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    if (self->_centered)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_12;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_12;
    }
    v9 = 1;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSData hash](self->_imageRequest, "hash");
  v4 = -[NSData hash](self->_image, "hash");
  v5 = -[NSData hash](self->_title, "hash");
  v6 = -[NSData hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_centered;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufPaymentContentItem setImageRequest:](self, "setImageRequest:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufPaymentContentItem setImage:](self, "setImage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufPaymentContentItem setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufPaymentContentItem setLabel:](self, "setLabel:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_centered = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)imageRequest
{
  return self->_imageRequest;
}

- (void)setImageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_imageRequest, a3);
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSData)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSData)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)centered
{
  return self->_centered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
