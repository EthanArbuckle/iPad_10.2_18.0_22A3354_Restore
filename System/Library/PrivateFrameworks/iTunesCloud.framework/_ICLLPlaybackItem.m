@implementation _ICLLPlaybackItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackItem;
  -[_ICLLPlaybackItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLPlaybackItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *itemId;
  NSString *mediaId;
  void *v7;
  _ICLLPlaybackItemContainer *container;
  void *v9;
  void *v10;
  _ICLLMediaInfo *mediaInfo;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  itemId = self->_itemId;
  if (itemId)
    objc_msgSend(v3, "setObject:forKey:", itemId, CFSTR("itemId"));
  mediaId = self->_mediaId;
  if (mediaId)
    objc_msgSend(v4, "setObject:forKey:", mediaId, CFSTR("mediaId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_contributingParticipantId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("contributingParticipantId"));

  }
  container = self->_container;
  if (container)
  {
    -[_ICLLPlaybackItemContainer dictionaryRepresentation](container, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("container"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExplicit);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("isExplicit"));

  }
  mediaInfo = self->_mediaInfo;
  if (mediaInfo)
  {
    -[_ICLLMediaInfo dictionaryRepresentation](mediaInfo, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("mediaInfo"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sectionType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("sectionType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_itemId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_mediaId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_container)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_mediaInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_contributingParticipantId;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v10 = -[_ICLLPlaybackItemContainer copyWithZone:](self->_container, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_isExplicit;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  v12 = -[_ICLLMediaInfo copyWithZone:](self->_mediaInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_sectionType;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *itemId;
  NSString *mediaId;
  char has;
  char v8;
  _ICLLPlaybackItemContainer *container;
  _ICLLMediaInfo *mediaInfo;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](itemId, "isEqual:"))
      goto LABEL_29;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](mediaId, "isEqual:"))
      goto LABEL_29;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 56);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_contributingParticipantId != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_29;
  }
  container = self->_container;
  if ((unint64_t)container | *((_QWORD *)v4 + 2))
  {
    if (!-[_ICLLPlaybackItemContainer isEqual:](container, "isEqual:"))
      goto LABEL_29;
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 56);
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0)
      goto LABEL_29;
    if (self->_isExplicit)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_29;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_29;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_29;
  }
  mediaInfo = self->_mediaInfo;
  if (!((unint64_t)mediaInfo | *((_QWORD *)v4 + 5)))
    goto LABEL_25;
  if (!-[_ICLLMediaInfo isEqual:](mediaInfo, "isEqual:"))
  {
LABEL_29:
    v11 = 0;
    goto LABEL_30;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 56);
LABEL_25:
  v11 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_sectionType != *((_DWORD *)v4 + 12))
      goto LABEL_29;
    v11 = 1;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_itemId, "hash");
  v4 = -[NSString hash](self->_mediaId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_contributingParticipantId;
  else
    v5 = 0;
  v6 = -[_ICLLPlaybackItemContainer hash](self->_container, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_isExplicit;
  else
    v7 = 0;
  v8 = -[_ICLLMediaInfo hash](self->_mediaInfo, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_sectionType;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
