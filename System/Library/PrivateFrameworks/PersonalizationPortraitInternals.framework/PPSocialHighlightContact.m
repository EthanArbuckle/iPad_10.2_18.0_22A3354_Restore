@implementation PPSocialHighlightContact

- (void)setIsSignificant:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isSignificant = a3;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSignificant
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (void)setIsMe:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isMe = a3;
}

- (void)setHasIsMe:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMe
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
  v8.super_class = (Class)PPSocialHighlightContact;
  -[PPSocialHighlightContact description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightContact dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *handle;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSignificant);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isSignificant"));

  }
  handle = self->_handle;
  if (handle)
    objc_msgSend(v3, "setObject:forKey:", handle, CFSTR("handle"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMe);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isMe"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPSocialHighlightContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[17] = self->_isSignificant;
    v4[20] |= 2u;
  }
  if (self->_handle)
  {
    v5 = v4;
    objc_msgSend(v4, "setHandle:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_isMe;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 17) = self->_isSignificant;
    *(_BYTE *)(v5 + 20) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v6 + 16) = self->_isMe;
    *(_BYTE *)(v6 + 20) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *handle;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 20);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_15;
    if (self->_isSignificant)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_15;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](handle, "isEqual:"))
      goto LABEL_15;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 20);
  }
  v8 = (v6 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v6 & 1) != 0)
    {
      if (self->_isMe)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_15;
      }
      else if (*((_BYTE *)v4 + 16))
      {
        goto LABEL_15;
      }
      v8 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v8 = 0;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_isSignificant;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_handle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_isMe;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[20] & 2) != 0)
  {
    self->_isSignificant = v4[17];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[PPSocialHighlightContact setHandle:](self, "setHandle:");
    v4 = v5;
  }
  if ((v4[20] & 1) != 0)
  {
    self->_isMe = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
