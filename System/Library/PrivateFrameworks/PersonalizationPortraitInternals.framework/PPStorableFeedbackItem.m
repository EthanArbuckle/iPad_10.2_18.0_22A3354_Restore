@implementation PPStorableFeedbackItem

- (void)setFeedbackType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedbackType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasItemString
{
  return self->_itemString != 0;
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
  v8.super_class = (Class)PPStorableFeedbackItem;
  -[PPStorableFeedbackItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPStorableFeedbackItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *itemString;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_feedbackType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("feedbackType"));

  }
  itemString = self->_itemString;
  if (itemString)
    objc_msgSend(v3, "setObject:forKey:", itemString, CFSTR("itemString"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPStorableFeedbackItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_itemString)
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
    v4[2] = self->_feedbackType;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_itemString)
  {
    v5 = v4;
    objc_msgSend(v4, "setItemString:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_feedbackType;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_itemString, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *itemString;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_feedbackType != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  itemString = self->_itemString;
  if ((unint64_t)itemString | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](itemString, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_feedbackType;
  else
    v2 = 0;
  return -[NSString hash](self->_itemString, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_feedbackType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[PPStorableFeedbackItem setItemString:](self, "setItemString:");
    v4 = v5;
  }

}

- (unsigned)feedbackType
{
  return self->_feedbackType;
}

- (NSString)itemString
{
  return self->_itemString;
}

- (void)setItemString:(id)a3
{
  objc_storeStrong((id *)&self->_itemString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemString, 0);
}

@end
