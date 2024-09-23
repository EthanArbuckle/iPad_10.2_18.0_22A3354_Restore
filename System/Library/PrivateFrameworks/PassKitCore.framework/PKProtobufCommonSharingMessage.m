@implementation PKProtobufCommonSharingMessage

- (BOOL)hasPhoneInvitation
{
  return self->_phoneInvitation != 0;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_status;
  else
    return 5;
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
  if (a3 < 7)
    return off_1E2ADB630[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PENDING")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REVOKED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANCELLED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOTSUPPORTED")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataString
{
  return self->_dataString != 0;
}

- (BOOL)hasWatchInvitation
{
  return self->_watchInvitation != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasPassThumbnailImage
{
  return self->_passThumbnailImage != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasTopLeftTitle
{
  return self->_topLeftTitle != 0;
}

- (BOOL)hasTopRightTitle
{
  return self->_topRightTitle != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasThumbnailImage
{
  return self->_thumbnailImage != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasButtonTitle
{
  return self->_buttonTitle != 0;
}

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
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
  v8.super_class = (Class)PKProtobufCommonSharingMessage;
  -[PKProtobufCommonSharingMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCommonSharingMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *phoneInvitation;
  uint64_t status;
  __CFString *v7;
  NSString *dataString;
  NSString *watchInvitation;
  NSString *uniqueIdentifier;
  NSData *passThumbnailImage;
  NSString *title;
  NSString *topLeftTitle;
  NSString *topRightTitle;
  NSString *subtitle;
  NSData *thumbnailImage;
  NSString *actionURL;
  NSString *buttonTitle;
  NSString *messageType;
  NSData *messageData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  phoneInvitation = self->_phoneInvitation;
  if (phoneInvitation)
    objc_msgSend(v3, "setObject:forKey:", phoneInvitation, CFSTR("phoneInvitation"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2ADB630[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("status"));

  }
  dataString = self->_dataString;
  if (dataString)
    objc_msgSend(v3, "setObject:forKey:", dataString, CFSTR("dataString"));
  watchInvitation = self->_watchInvitation;
  if (watchInvitation)
    objc_msgSend(v3, "setObject:forKey:", watchInvitation, CFSTR("watchInvitation"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  passThumbnailImage = self->_passThumbnailImage;
  if (passThumbnailImage)
    objc_msgSend(v3, "setObject:forKey:", passThumbnailImage, CFSTR("passThumbnailImage"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  topLeftTitle = self->_topLeftTitle;
  if (topLeftTitle)
    objc_msgSend(v3, "setObject:forKey:", topLeftTitle, CFSTR("topLeftTitle"));
  topRightTitle = self->_topRightTitle;
  if (topRightTitle)
    objc_msgSend(v3, "setObject:forKey:", topRightTitle, CFSTR("topRightTitle"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
    objc_msgSend(v3, "setObject:forKey:", thumbnailImage, CFSTR("thumbnailImage"));
  actionURL = self->_actionURL;
  if (actionURL)
    objc_msgSend(v3, "setObject:forKey:", actionURL, CFSTR("actionURL"));
  buttonTitle = self->_buttonTitle;
  if (buttonTitle)
    objc_msgSend(v3, "setObject:forKey:", buttonTitle, CFSTR("buttonTitle"));
  messageType = self->_messageType;
  if (messageType)
    objc_msgSend(v3, "setObject:forKey:", messageType, CFSTR("messageType"));
  messageData = self->_messageData;
  if (messageData)
    objc_msgSend(v3, "setObject:forKey:", messageData, CFSTR("messageData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCommonSharingMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_phoneInvitation)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_dataString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_watchInvitation)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_passThumbnailImage)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_topLeftTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_topRightTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_thumbnailImage)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_actionURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_buttonTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_messageType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[30] = self->_version;
  v5 = v4;
  if (self->_phoneInvitation)
  {
    objc_msgSend(v4, "setPhoneInvitation:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_status;
    *((_BYTE *)v4 + 136) |= 1u;
  }
  if (self->_dataString)
  {
    objc_msgSend(v5, "setDataString:");
    v4 = v5;
  }
  if (self->_watchInvitation)
  {
    objc_msgSend(v5, "setWatchInvitation:");
    v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
    v4 = v5;
  }
  if (self->_passThumbnailImage)
  {
    objc_msgSend(v5, "setPassThumbnailImage:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_topLeftTitle)
  {
    objc_msgSend(v5, "setTopLeftTitle:");
    v4 = v5;
  }
  if (self->_topRightTitle)
  {
    objc_msgSend(v5, "setTopRightTitle:");
    v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
    v4 = v5;
  }
  if (self->_thumbnailImage)
  {
    objc_msgSend(v5, "setThumbnailImage:");
    v4 = v5;
  }
  if (self->_actionURL)
  {
    objc_msgSend(v5, "setActionURL:");
    v4 = v5;
  }
  if (self->_buttonTitle)
  {
    objc_msgSend(v5, "setButtonTitle:");
    v4 = v5;
  }
  if (self->_messageType)
  {
    objc_msgSend(v5, "setMessageType:");
    v4 = v5;
  }
  if (self->_messageData)
  {
    objc_msgSend(v5, "setMessageData:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 120) = self->_version;
  v6 = -[NSString copyWithZone:](self->_phoneInvitation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_status;
    *(_BYTE *)(v5 + 136) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_dataString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_watchInvitation, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v10;

  v12 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v12;

  v14 = -[NSData copyWithZone:](self->_passThumbnailImage, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  v18 = -[NSString copyWithZone:](self->_topLeftTitle, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v18;

  v20 = -[NSString copyWithZone:](self->_topRightTitle, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v20;

  v22 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  v24 = -[NSData copyWithZone:](self->_thumbnailImage, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v24;

  v26 = -[NSString copyWithZone:](self->_actionURL, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v26;

  v28 = -[NSString copyWithZone:](self->_buttonTitle, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v28;

  v30 = -[NSString copyWithZone:](self->_messageType, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v30;

  v32 = -[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v32;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *phoneInvitation;
  NSString *dataString;
  NSString *watchInvitation;
  NSString *uniqueIdentifier;
  NSData *passThumbnailImage;
  NSString *title;
  NSString *topLeftTitle;
  NSString *topRightTitle;
  NSString *subtitle;
  NSData *thumbnailImage;
  NSString *actionURL;
  NSString *buttonTitle;
  NSString *messageType;
  NSData *messageData;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if (self->_version != *((_DWORD *)v4 + 30))
    goto LABEL_36;
  phoneInvitation = self->_phoneInvitation;
  if ((unint64_t)phoneInvitation | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](phoneInvitation, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 136) & 1) == 0 || self->_status != *((_DWORD *)v4 + 16))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 136) & 1) != 0)
  {
LABEL_36:
    v19 = 0;
    goto LABEL_37;
  }
  dataString = self->_dataString;
  if ((unint64_t)dataString | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](dataString, "isEqual:"))
    goto LABEL_36;
  watchInvitation = self->_watchInvitation;
  if ((unint64_t)watchInvitation | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](watchInvitation, "isEqual:"))
      goto LABEL_36;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  passThumbnailImage = self->_passThumbnailImage;
  if ((unint64_t)passThumbnailImage | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](passThumbnailImage, "isEqual:"))
      goto LABEL_36;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_36;
  }
  topLeftTitle = self->_topLeftTitle;
  if ((unint64_t)topLeftTitle | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](topLeftTitle, "isEqual:"))
      goto LABEL_36;
  }
  topRightTitle = self->_topRightTitle;
  if ((unint64_t)topRightTitle | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](topRightTitle, "isEqual:"))
      goto LABEL_36;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_36;
  }
  thumbnailImage = self->_thumbnailImage;
  if ((unint64_t)thumbnailImage | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](thumbnailImage, "isEqual:"))
      goto LABEL_36;
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:"))
      goto LABEL_36;
  }
  buttonTitle = self->_buttonTitle;
  if ((unint64_t)buttonTitle | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](buttonTitle, "isEqual:"))
      goto LABEL_36;
  }
  messageType = self->_messageType;
  if ((unint64_t)messageType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](messageType, "isEqual:"))
      goto LABEL_36;
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((_QWORD *)v4 + 4))
    v19 = -[NSData isEqual:](messageData, "isEqual:");
  else
    v19 = 1;
LABEL_37:

  return v19;
}

- (unint64_t)hash
{
  unsigned int version;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;

  version = self->_version;
  v4 = -[NSString hash](self->_phoneInvitation, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_status;
  else
    v5 = 0;
  v6 = v4 ^ v5 ^ -[NSString hash](self->_dataString, "hash");
  v7 = v6 ^ -[NSString hash](self->_watchInvitation, "hash") ^ (2654435761 * version);
  v8 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v9 = v8 ^ -[NSData hash](self->_passThumbnailImage, "hash");
  v10 = v9 ^ -[NSString hash](self->_title, "hash");
  v11 = v10 ^ -[NSString hash](self->_topLeftTitle, "hash");
  v12 = v7 ^ v11 ^ -[NSString hash](self->_topRightTitle, "hash");
  v13 = -[NSString hash](self->_subtitle, "hash");
  v14 = v13 ^ -[NSData hash](self->_thumbnailImage, "hash");
  v15 = v14 ^ -[NSString hash](self->_actionURL, "hash");
  v16 = v15 ^ -[NSString hash](self->_buttonTitle, "hash");
  v17 = v16 ^ -[NSString hash](self->_messageType, "hash");
  return v12 ^ v17 ^ -[NSData hash](self->_messageData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  self->_version = v4[30];
  v5 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[PKProtobufCommonSharingMessage setPhoneInvitation:](self, "setPhoneInvitation:");
    v4 = v5;
  }
  if ((v4[34] & 1) != 0)
  {
    self->_status = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufCommonSharingMessage setDataString:](self, "setDataString:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[PKProtobufCommonSharingMessage setWatchInvitation:](self, "setWatchInvitation:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[PKProtobufCommonSharingMessage setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PKProtobufCommonSharingMessage setPassThumbnailImage:](self, "setPassThumbnailImage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[PKProtobufCommonSharingMessage setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[PKProtobufCommonSharingMessage setTopLeftTitle:](self, "setTopLeftTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[PKProtobufCommonSharingMessage setTopRightTitle:](self, "setTopRightTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[PKProtobufCommonSharingMessage setSubtitle:](self, "setSubtitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[PKProtobufCommonSharingMessage setThumbnailImage:](self, "setThumbnailImage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufCommonSharingMessage setActionURL:](self, "setActionURL:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufCommonSharingMessage setButtonTitle:](self, "setButtonTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PKProtobufCommonSharingMessage setMessageType:](self, "setMessageType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufCommonSharingMessage setMessageData:](self, "setMessageData:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)phoneInvitation
{
  return self->_phoneInvitation;
}

- (void)setPhoneInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_phoneInvitation, a3);
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void)setDataString:(id)a3
{
  objc_storeStrong((id *)&self->_dataString, a3);
}

- (NSString)watchInvitation
{
  return self->_watchInvitation;
}

- (void)setWatchInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_watchInvitation, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSData)passThumbnailImage
{
  return self->_passThumbnailImage;
}

- (void)setPassThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_passThumbnailImage, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)topLeftTitle
{
  return self->_topLeftTitle;
}

- (void)setTopLeftTitle:(id)a3
{
  objc_storeStrong((id *)&self->_topLeftTitle, a3);
}

- (NSString)topRightTitle
{
  return self->_topRightTitle;
}

- (void)setTopRightTitle:(id)a3
{
  objc_storeStrong((id *)&self->_topRightTitle, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSData)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitle, a3);
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
  objc_storeStrong((id *)&self->_messageType, a3);
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_messageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchInvitation, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_topRightTitle, 0);
  objc_storeStrong((id *)&self->_topLeftTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_phoneInvitation, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_dataString, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
