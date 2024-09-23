@implementation PKDiscoveryInlineMediaShelf

- (PKDiscoveryInlineMediaShelf)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryInlineMediaShelf *v5;
  PKDiscoveryInlineMediaShelf *v6;
  void *v7;
  PKDiscoveryMedia *v8;
  PKDiscoveryMedia *media;
  uint64_t v10;
  NSString *captionKey;
  void *v12;
  uint64_t v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryInlineMediaShelf;
  v5 = -[PKDiscoveryInlineMediaShelf init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKDiscoveryShelf setType:](v5, "setType:", 2);
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("media"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKDiscoveryMedia initWithDictionary:]([PKDiscoveryMedia alloc], "initWithDictionary:", v7);
    media = v6->_media;
    v6->_media = v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("captionKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    captionKey = v6->_captionKey;
    v6->_captionKey = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("inlineDisplayType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("inline"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = objc_msgSend(CFSTR("fullWidth"), "isEqualToString:", v12);
      v13 = 2;
      if (!v14)
        v13 = 0;
    }
    v6->_displayType = v13;

  }
  return v6;
}

- (void)localizeWithBundle:(id)a3
{
  -[PKDiscoveryInlineMediaShelf localizeWithBundle:table:](self, "localizeWithBundle:table:", a3, CFSTR("localizable"));
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  NSString *captionKey;
  NSString *v6;
  NSString *localizedCaption;

  captionKey = self->_captionKey;
  if (captionKey)
  {
    objc_msgSend(a3, "localizedStringForKey:value:table:", captionKey, &stru_1E2ADF4C0, a4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedCaption = self->_localizedCaption;
    self->_localizedCaption = v6;

  }
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKDiscoveryMedia *media;
  PKDiscoveryMedia *v6;
  BOOL v7;
  NSString *captionKey;
  NSString *v9;
  BOOL v10;
  NSString *localizedCaption;
  NSString *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryInlineMediaShelf;
  if (!-[PKDiscoveryShelf isEqual:](&v15, sel_isEqual_, v4))
    goto LABEL_23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_23;
  media = self->_media;
  v6 = (PKDiscoveryMedia *)v4[4];
  if (media)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (media != v6)
      goto LABEL_23;
  }
  else if (!-[PKDiscoveryMedia isEqual:](media, "isEqual:"))
  {
    goto LABEL_23;
  }
  captionKey = self->_captionKey;
  v9 = (NSString *)v4[5];
  if (captionKey)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    if ((-[NSString isEqual:](captionKey, "isEqual:") & 1) != 0)
      goto LABEL_19;
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  if (captionKey != v9)
    goto LABEL_23;
LABEL_19:
  if (self->_displayType != v4[6])
    goto LABEL_23;
  localizedCaption = self->_localizedCaption;
  v12 = (NSString *)v4[7];
  if (localizedCaption && v12)
    v13 = -[NSString isEqual:](localizedCaption, "isEqual:");
  else
    v13 = localizedCaption == v12;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryInlineMediaShelf;
  v3 = -[PKDiscoveryShelf hash](&v8, sel_hash);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "safelyAddObject:", self->_media);
  objc_msgSend(v4, "safelyAddObject:", self->_captionKey);
  objc_msgSend(v4, "safelyAddObject:", self->_localizedCaption);
  v5 = PKCombinedHash((uint64_t)v3, v4);
  v6 = self->_displayType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("media"), self->_media);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("captionKey"), self->_captionKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("inlineDisplayType"), self->_displayType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedCaption"), self->_localizedCaption);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryInlineMediaShelf;
  v4 = a3;
  -[PKDiscoveryShelf encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_media, CFSTR("media"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_captionKey, CFSTR("captionKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_displayType, CFSTR("inlineDisplayType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedCaption, CFSTR("localizedCaption"));

}

- (PKDiscoveryInlineMediaShelf)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryInlineMediaShelf *v5;
  uint64_t v6;
  PKDiscoveryMedia *media;
  uint64_t v8;
  NSString *captionKey;
  uint64_t v10;
  NSString *localizedCaption;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryInlineMediaShelf;
  v5 = -[PKDiscoveryShelf initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("media"));
    v6 = objc_claimAutoreleasedReturnValue();
    media = v5->_media;
    v5->_media = (PKDiscoveryMedia *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captionKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    captionKey = v5->_captionKey;
    v5->_captionKey = (NSString *)v8;

    v5->_displayType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inlineDisplayType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedCaption"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedCaption = v5->_localizedCaption;
    v5->_localizedCaption = (NSString *)v10;

  }
  return v5;
}

- (PKDiscoveryMedia)media
{
  return self->_media;
}

- (NSString)captionKey
{
  return self->_captionKey;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (NSString)localizedCaption
{
  return self->_localizedCaption;
}

- (void)setLocalizedCaption:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCaption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCaption, 0);
  objc_storeStrong((id *)&self->_captionKey, 0);
  objc_storeStrong((id *)&self->_media, 0);
}

@end
