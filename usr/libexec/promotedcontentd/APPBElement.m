@implementation APPBElement

- (void)setElementID:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_elementID = a3;
}

- (void)setHasElementID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElementID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasCaption
{
  return self->_caption != 0;
}

- (BOOL)hasAccessCaption
{
  return self->_accessCaption != 0;
}

- (BOOL)hasCtaButton
{
  return self->_ctaButton != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasStyle
{
  return self->_style != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBElement;
  v3 = -[APPBElement description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBElement dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  APPBAsset *asset;
  void *v6;
  NSString *caption;
  NSString *accessCaption;
  APPBButton *ctaButton;
  void *v10;
  NSString *actionURL;
  APPBStyle *style;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_elementID));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("elementID"));

  }
  asset = self->_asset;
  if (asset)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAsset dictionaryRepresentation](asset, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("asset"));

  }
  caption = self->_caption;
  if (caption)
    objc_msgSend(v3, "setObject:forKey:", caption, CFSTR("caption"));
  accessCaption = self->_accessCaption;
  if (accessCaption)
    objc_msgSend(v3, "setObject:forKey:", accessCaption, CFSTR("accessCaption"));
  ctaButton = self->_ctaButton;
  if (ctaButton)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPBButton dictionaryRepresentation](ctaButton, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ctaButton"));

  }
  actionURL = self->_actionURL;
  if (actionURL)
    objc_msgSend(v3, "setObject:forKey:", actionURL, CFSTR("actionURL"));
  style = self->_style;
  if (style)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPBStyle dictionaryRepresentation](style, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("style"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBAsset *asset;
  NSString *caption;
  NSString *accessCaption;
  APPBButton *ctaButton;
  NSString *actionURL;
  APPBStyle *style;
  id v11;

  v4 = a3;
  v11 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_elementID, 1);
    v4 = v11;
  }
  asset = self->_asset;
  if (asset)
  {
    PBDataWriterWriteSubmessage(v11, asset, 2);
    v4 = v11;
  }
  caption = self->_caption;
  if (caption)
  {
    PBDataWriterWriteStringField(v11, caption, 3);
    v4 = v11;
  }
  accessCaption = self->_accessCaption;
  if (accessCaption)
  {
    PBDataWriterWriteStringField(v11, accessCaption, 4);
    v4 = v11;
  }
  ctaButton = self->_ctaButton;
  if (ctaButton)
  {
    PBDataWriterWriteSubmessage(v11, ctaButton, 5);
    v4 = v11;
  }
  actionURL = self->_actionURL;
  if (actionURL)
  {
    PBDataWriterWriteStringField(v11, actionURL, 6);
    v4 = v11;
  }
  style = self->_style;
  if (style)
  {
    PBDataWriterWriteSubmessage(v11, style, 7);
    v4 = v11;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_elementID;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v5 = v4;
  if (self->_asset)
  {
    objc_msgSend(v4, "setAsset:");
    v4 = v5;
  }
  if (self->_caption)
  {
    objc_msgSend(v5, "setCaption:");
    v4 = v5;
  }
  if (self->_accessCaption)
  {
    objc_msgSend(v5, "setAccessCaption:");
    v4 = v5;
  }
  if (self->_ctaButton)
  {
    objc_msgSend(v5, "setCtaButton:");
    v4 = v5;
  }
  if (self->_actionURL)
  {
    objc_msgSend(v5, "setActionURL:");
    v4 = v5;
  }
  if (self->_style)
  {
    objc_msgSend(v5, "setStyle:");
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_elementID;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  v7 = -[APPBAsset copyWithZone:](self->_asset, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_caption, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  v11 = -[NSString copyWithZone:](self->_accessCaption, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[APPBButton copyWithZone:](self->_ctaButton, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  v15 = -[NSString copyWithZone:](self->_actionURL, "copyWithZone:", a3);
  v16 = (void *)v6[2];
  v6[2] = v15;

  v17 = -[APPBStyle copyWithZone:](self->_style, "copyWithZone:", a3);
  v18 = (void *)v6[7];
  v6[7] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBAsset *asset;
  NSString *caption;
  NSString *accessCaption;
  APPBButton *ctaButton;
  NSString *actionURL;
  APPBStyle *style;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_elementID != *((_DWORD *)v4 + 12))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  asset = self->_asset;
  if ((unint64_t)asset | *((_QWORD *)v4 + 3) && !-[APPBAsset isEqual:](asset, "isEqual:"))
    goto LABEL_19;
  caption = self->_caption;
  if ((unint64_t)caption | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](caption, "isEqual:"))
      goto LABEL_19;
  }
  accessCaption = self->_accessCaption;
  if ((unint64_t)accessCaption | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accessCaption, "isEqual:"))
      goto LABEL_19;
  }
  ctaButton = self->_ctaButton;
  if ((unint64_t)ctaButton | *((_QWORD *)v4 + 5))
  {
    if (!-[APPBButton isEqual:](ctaButton, "isEqual:"))
      goto LABEL_19;
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:"))
      goto LABEL_19;
  }
  style = self->_style;
  if ((unint64_t)style | *((_QWORD *)v4 + 7))
    v11 = -[APPBStyle isEqual:](style, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_elementID;
  else
    v3 = 0;
  v4 = -[APPBAsset hash](self->_asset, "hash") ^ v3;
  v5 = -[NSString hash](self->_caption, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_accessCaption, "hash");
  v7 = -[APPBButton hash](self->_ctaButton, "hash");
  v8 = v7 ^ -[NSString hash](self->_actionURL, "hash");
  return v6 ^ v8 ^ -[APPBStyle hash](self->_style, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  APPBAsset *asset;
  uint64_t v7;
  APPBButton *ctaButton;
  uint64_t v9;
  APPBStyle *style;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_elementID = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  asset = self->_asset;
  v7 = v5[3];
  v12 = v5;
  if (asset)
  {
    if (!v7)
      goto LABEL_9;
    -[APPBAsset mergeFrom:](asset, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[APPBElement setAsset:](self, "setAsset:");
  }
  v5 = v12;
LABEL_9:
  if (v5[4])
  {
    -[APPBElement setCaption:](self, "setCaption:");
    v5 = v12;
  }
  if (v5[1])
  {
    -[APPBElement setAccessCaption:](self, "setAccessCaption:");
    v5 = v12;
  }
  ctaButton = self->_ctaButton;
  v9 = v5[5];
  if (ctaButton)
  {
    if (!v9)
      goto LABEL_19;
    -[APPBButton mergeFrom:](ctaButton, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[APPBElement setCtaButton:](self, "setCtaButton:");
  }
  v5 = v12;
LABEL_19:
  if (v5[2])
  {
    -[APPBElement setActionURL:](self, "setActionURL:");
    v5 = v12;
  }
  style = self->_style;
  v11 = v5[7];
  if (style)
  {
    if (v11)
    {
      -[APPBStyle mergeFrom:](style, "mergeFrom:");
LABEL_26:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[APPBElement setStyle:](self, "setStyle:");
    goto LABEL_26;
  }

}

- (int)elementID
{
  return self->_elementID;
}

- (APPBAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_storeStrong((id *)&self->_caption, a3);
}

- (NSString)accessCaption
{
  return self->_accessCaption;
}

- (void)setAccessCaption:(id)a3
{
  objc_storeStrong((id *)&self->_accessCaption, a3);
}

- (APPBButton)ctaButton
{
  return self->_ctaButton;
}

- (void)setCtaButton:(id)a3
{
  objc_storeStrong((id *)&self->_ctaButton, a3);
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (APPBStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_ctaButton, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_accessCaption, 0);
}

@end
