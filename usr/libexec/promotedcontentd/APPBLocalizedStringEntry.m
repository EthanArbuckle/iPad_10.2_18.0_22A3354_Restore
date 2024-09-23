@implementation APPBLocalizedStringEntry

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLocalizedStringEntry;
  v3 = -[APPBLocalizedStringEntry description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLocalizedStringEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *languageIdentifier;
  NSString *value;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  languageIdentifier = self->_languageIdentifier;
  if (languageIdentifier)
    objc_msgSend(v3, "setObject:forKey:", languageIdentifier, CFSTR("languageIdentifier"));
  value = self->_value;
  if (value)
    objc_msgSend(v4, "setObject:forKey:", value, CFSTR("value"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLocalizedStringEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *languageIdentifier;
  NSString *value;
  id v7;

  v4 = a3;
  languageIdentifier = self->_languageIdentifier;
  if (!languageIdentifier)
    sub_10017BBCC();
  v7 = v4;
  PBDataWriterWriteStringField(v4, languageIdentifier, 1);
  value = self->_value;
  if (!value)
    sub_10017BBF4();
  PBDataWriterWriteStringField(v7, value, 2);

}

- (void)copyTo:(id)a3
{
  NSString *languageIdentifier;
  id v5;

  languageIdentifier = self->_languageIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setLanguageIdentifier:", languageIdentifier);
  objc_msgSend(v5, "setValue:", self->_value);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_languageIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *languageIdentifier;
  NSString *value;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((languageIdentifier = self->_languageIdentifier, !((unint64_t)languageIdentifier | v4[1]))
     || -[NSString isEqual:](languageIdentifier, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2])
      v7 = -[NSString isEqual:](value, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_languageIdentifier, "hash");
  return -[NSString hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[APPBLocalizedStringEntry setLanguageIdentifier:](self, "setLanguageIdentifier:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[APPBLocalizedStringEntry setValue:](self, "setValue:");
    v4 = v5;
  }

}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageIdentifier, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end
