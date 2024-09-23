@implementation APPBButton

- (int)predefined
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_predefined;
  else
    return 100000;
}

- (void)setPredefined:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_predefined = a3;
}

- (void)setHasPredefined:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredefined
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)predefinedAsString:(int)a3
{
  if ((a3 - 100000) >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1002155D0[a3 - 100000];
}

- (int)StringAsPredefined:(id)a3
{
  int v3;
  id v4;

  v3 = 100000;
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("BUY_NOW")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DOWNLOAD_NOW")) & 1) != 0)
    {
      v3 = 100001;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("READ_MORE")) & 1) != 0)
    {
      v3 = 100002;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SUBSCRIBE_NOW")) & 1) != 0)
    {
      v3 = 100003;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("VIEW_MORE")) & 1) != 0)
    {
      v3 = 100004;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("LEARN_MORE")) & 1) != 0)
    {
      v3 = 100005;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("TRY_IT_FREE")))
    {
      v3 = 100006;
    }
    else
    {
      v3 = 100000;
    }
  }

  return v3;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasAccessText
{
  return self->_accessText != 0;
}

- (BOOL)hasButtonStyle
{
  return self->_buttonStyle != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBButton;
  v3 = -[APPBButton description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBButton dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *text;
  NSString *accessText;
  APPBButtonStyle *buttonStyle;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_predefined - 100000;
    if (v4 >= 7)
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_predefined));
    else
      v5 = off_1002155D0[v4];
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("predefined"));

  }
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  accessText = self->_accessText;
  if (accessText)
    objc_msgSend(v3, "setObject:forKey:", accessText, CFSTR("accessText"));
  buttonStyle = self->_buttonStyle;
  if (buttonStyle)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPBButtonStyle dictionaryRepresentation](buttonStyle, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("buttonStyle"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBButtonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *text;
  NSString *accessText;
  APPBButtonStyle *buttonStyle;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_predefined, 1);
    v4 = v8;
  }
  text = self->_text;
  if (text)
  {
    PBDataWriterWriteStringField(v8, text, 2);
    v4 = v8;
  }
  accessText = self->_accessText;
  if (accessText)
  {
    PBDataWriterWriteStringField(v8, accessText, 3);
    v4 = v8;
  }
  buttonStyle = self->_buttonStyle;
  if (buttonStyle)
  {
    PBDataWriterWriteSubmessage(v8, buttonStyle, 4);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_predefined;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_text)
  {
    objc_msgSend(v4, "setText:");
    v4 = v5;
  }
  if (self->_accessText)
  {
    objc_msgSend(v5, "setAccessText:");
    v4 = v5;
  }
  if (self->_buttonStyle)
  {
    objc_msgSend(v5, "setButtonStyle:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_predefined;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[NSString copyWithZone:](self->_accessText, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[APPBButtonStyle copyWithZone:](self->_buttonStyle, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *text;
  NSString *accessText;
  APPBButtonStyle *buttonStyle;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_predefined != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  text = self->_text;
  if ((unint64_t)text | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](text, "isEqual:"))
    goto LABEL_13;
  accessText = self->_accessText;
  if ((unint64_t)accessText | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accessText, "isEqual:"))
      goto LABEL_13;
  }
  buttonStyle = self->_buttonStyle;
  if ((unint64_t)buttonStyle | *((_QWORD *)v4 + 2))
    v8 = -[APPBButtonStyle isEqual:](buttonStyle, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_predefined;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_text, "hash") ^ v3;
  v5 = -[NSString hash](self->_accessText, "hash");
  return v4 ^ v5 ^ -[APPBButtonStyle hash](self->_buttonStyle, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  APPBButtonStyle *buttonStyle;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_predefined = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[APPBButton setText:](self, "setText:");
    v5 = v8;
  }
  if (v5[1])
  {
    -[APPBButton setAccessText:](self, "setAccessText:");
    v5 = v8;
  }
  buttonStyle = self->_buttonStyle;
  v7 = v5[2];
  if (buttonStyle)
  {
    if (v7)
    {
      -[APPBButtonStyle mergeFrom:](buttonStyle, "mergeFrom:");
LABEL_12:
      v5 = v8;
    }
  }
  else if (v7)
  {
    -[APPBButton setButtonStyle:](self, "setButtonStyle:");
    goto LABEL_12;
  }

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)accessText
{
  return self->_accessText;
}

- (void)setAccessText:(id)a3
{
  objc_storeStrong((id *)&self->_accessText, a3);
}

- (APPBButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_buttonStyle, 0);
  objc_storeStrong((id *)&self->_accessText, 0);
}

@end
