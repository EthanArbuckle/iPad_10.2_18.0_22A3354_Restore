@implementation WFPBShowDialogEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ShowDialogEvent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasDialogType
{
  return self->_dialogType != 0;
}

- (BOOL)hasPresentationStyle
{
  return self->_presentationStyle != 0;
}

- (BOOL)hasDismissalType
{
  return self->_dismissalType != 0;
}

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
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
  v8.super_class = (Class)WFPBShowDialogEvent;
  -[WFPBShowDialogEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBShowDialogEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSString *dialogType;
  NSString *presentationStyle;
  NSString *dismissalType;
  NSString *automationType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  dialogType = self->_dialogType;
  if (dialogType)
    objc_msgSend(v4, "setObject:forKey:", dialogType, CFSTR("dialogType"));
  presentationStyle = self->_presentationStyle;
  if (presentationStyle)
    objc_msgSend(v4, "setObject:forKey:", presentationStyle, CFSTR("presentationStyle"));
  dismissalType = self->_dismissalType;
  if (dismissalType)
    objc_msgSend(v4, "setObject:forKey:", dismissalType, CFSTR("dismissalType"));
  automationType = self->_automationType;
  if (automationType)
    objc_msgSend(v4, "setObject:forKey:", automationType, CFSTR("automationType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShowDialogEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_dialogType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_presentationStyle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_dismissalType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_automationType)
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
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_dialogType)
  {
    objc_msgSend(v5, "setDialogType:");
    v4 = v5;
  }
  if (self->_presentationStyle)
  {
    objc_msgSend(v5, "setPresentationStyle:");
    v4 = v5;
  }
  if (self->_dismissalType)
  {
    objc_msgSend(v5, "setDismissalType:");
    v4 = v5;
  }
  if (self->_automationType)
  {
    objc_msgSend(v5, "setAutomationType:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_dialogType, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_presentationStyle, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_dismissalType, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_automationType, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *dialogType;
  NSString *presentationStyle;
  NSString *dismissalType;
  NSString *automationType;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[4])) || -[NSString isEqual:](key, "isEqual:"))
    && ((dialogType = self->_dialogType, !((unint64_t)dialogType | v4[2]))
     || -[NSString isEqual:](dialogType, "isEqual:"))
    && ((presentationStyle = self->_presentationStyle, !((unint64_t)presentationStyle | v4[5]))
     || -[NSString isEqual:](presentationStyle, "isEqual:"))
    && ((dismissalType = self->_dismissalType, !((unint64_t)dismissalType | v4[3]))
     || -[NSString isEqual:](dismissalType, "isEqual:")))
  {
    automationType = self->_automationType;
    if ((unint64_t)automationType | v4[1])
      v10 = -[NSString isEqual:](automationType, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_dialogType, "hash") ^ v3;
  v5 = -[NSString hash](self->_presentationStyle, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_dismissalType, "hash");
  return v6 ^ -[NSString hash](self->_automationType, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[WFPBShowDialogEvent setKey:](self, "setKey:");
  if (v4[2])
    -[WFPBShowDialogEvent setDialogType:](self, "setDialogType:");
  if (v4[5])
    -[WFPBShowDialogEvent setPresentationStyle:](self, "setPresentationStyle:");
  if (v4[3])
    -[WFPBShowDialogEvent setDismissalType:](self, "setDismissalType:");
  if (v4[1])
    -[WFPBShowDialogEvent setAutomationType:](self, "setAutomationType:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)dialogType
{
  return self->_dialogType;
}

- (void)setDialogType:(id)a3
{
  objc_storeStrong((id *)&self->_dialogType, a3);
}

- (NSString)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_presentationStyle, a3);
}

- (NSString)dismissalType
{
  return self->_dismissalType;
}

- (void)setDismissalType:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalType, a3);
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_storeStrong((id *)&self->_automationType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationStyle, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_dismissalType, 0);
  objc_storeStrong((id *)&self->_dialogType, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
}

@end
