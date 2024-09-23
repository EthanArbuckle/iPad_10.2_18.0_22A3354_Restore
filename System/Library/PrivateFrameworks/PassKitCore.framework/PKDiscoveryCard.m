@implementation PKDiscoveryCard

- (PKDiscoveryCard)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryCard *v5;
  uint64_t v6;
  NSString *headingKey;
  uint64_t v8;
  NSString *titleKey;
  uint64_t v10;
  NSString *inlineDescriptionKey;
  void *v12;
  PKDiscoveryMedia *v13;
  PKDiscoveryMedia *backgroundMedia;
  uint64_t v15;
  PKColor *backgroundColor;
  void *v17;
  void *v18;
  void *v19;
  PKDiscoveryCallToAction *v20;
  PKDiscoveryCallToAction *callToAction;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKDiscoveryCard;
  v5 = -[PKDiscoveryCard init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("headingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    headingKey = v5->_headingKey;
    v5->_headingKey = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("titleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("inlineDescriptionKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    inlineDescriptionKey = v5->_inlineDescriptionKey;
    v5->_inlineDescriptionKey = (NSString *)v10;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("backgroundMedia"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKDiscoveryMedia initWithDictionary:]([PKDiscoveryMedia alloc], "initWithDictionary:", v12);
    backgroundMedia = v5->_backgroundMedia;
    v5->_backgroundMedia = v13;

    objc_msgSend(v4, "PKColorForKey:", CFSTR("backgroundColor"));
    v15 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("foregroundContentMode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_foregroundContentMode = PKDiscoveryCardForegroundContentModeFromString(v17);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("largeCardTemplateType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_largeCardTemplateType = 0;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("callToAction"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = -[PKDiscoveryCallToAction initWithDictionary:]([PKDiscoveryCallToAction alloc], "initWithDictionary:", v19);
      callToAction = v5->_callToAction;
      v5->_callToAction = v20;

      -[PKDiscoveryCallToAction setForegroundContentMode:](v5->_callToAction, "setForegroundContentMode:", v5->_foregroundContentMode);
    }

  }
  return v5;
}

- (void)localizeWithBundle:(id)a3
{
  -[PKDiscoveryCard localizeWithBundle:table:](self, "localizeWithBundle:table:", a3, CFSTR("localizable"));
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  NSString *headingKey;
  id v7;
  NSString *v8;
  NSString *heading;
  NSString *v10;
  NSString *title;
  NSString *v12;
  NSString *inlineDescription;
  id v14;

  headingKey = self->_headingKey;
  v7 = a4;
  v14 = a3;
  objc_msgSend(v14, "localizedStringForKey:value:table:", headingKey, &stru_1E2ADF4C0, v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  heading = self->_heading;
  self->_heading = v8;

  objc_msgSend(v14, "localizedStringForKey:value:table:", self->_titleKey, &stru_1E2ADF4C0, v7);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v10;

  objc_msgSend(v14, "localizedStringForKey:value:table:", self->_inlineDescriptionKey, &stru_1E2ADF4C0, v7);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  inlineDescription = self->_inlineDescription;
  self->_inlineDescription = v12;

  -[PKDiscoveryCallToAction localizeWithBundle:table:](self->_callToAction, "localizeWithBundle:table:", v14, v7);
}

- (void)setItem:(id)a3
{
  PKDiscoveryItem **p_item;
  NSString *v5;
  NSString *itemIdentifier;
  id v7;

  p_item = &self->_item;
  v7 = a3;
  objc_storeWeak((id *)p_item, v7);
  objc_msgSend(v7, "identifier");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  itemIdentifier = self->_itemIdentifier;
  self->_itemIdentifier = v5;

  -[PKDiscoveryCallToAction setItem:](self->_callToAction, "setItem:", v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *headingKey;
  NSString *v6;
  NSString *titleKey;
  NSString *v8;
  NSString *inlineDescriptionKey;
  NSString *v10;
  PKDiscoveryMedia *backgroundMedia;
  PKDiscoveryMedia *v12;
  PKDiscoveryCallToAction *callToAction;
  PKDiscoveryCallToAction *v14;
  NSString *heading;
  NSString *v16;
  NSString *title;
  NSString *v18;
  NSString *inlineDescription;
  NSString *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_42;
  headingKey = self->_headingKey;
  v6 = (NSString *)*((_QWORD *)v4 + 2);
  if (headingKey && v6)
  {
    if ((-[NSString isEqual:](headingKey, "isEqual:") & 1) == 0)
      goto LABEL_42;
  }
  else if (headingKey != v6)
  {
    goto LABEL_42;
  }
  titleKey = self->_titleKey;
  v8 = (NSString *)*((_QWORD *)v4 + 3);
  if (titleKey && v8)
  {
    if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0)
      goto LABEL_42;
  }
  else if (titleKey != v8)
  {
    goto LABEL_42;
  }
  inlineDescriptionKey = self->_inlineDescriptionKey;
  v10 = (NSString *)*((_QWORD *)v4 + 4);
  if (inlineDescriptionKey && v10)
  {
    if ((-[NSString isEqual:](inlineDescriptionKey, "isEqual:") & 1) == 0)
      goto LABEL_42;
  }
  else if (inlineDescriptionKey != v10)
  {
    goto LABEL_42;
  }
  backgroundMedia = self->_backgroundMedia;
  v12 = (PKDiscoveryMedia *)*((_QWORD *)v4 + 5);
  if (backgroundMedia && v12)
  {
    if (!-[PKDiscoveryMedia isEqual:](backgroundMedia, "isEqual:"))
      goto LABEL_42;
  }
  else if (backgroundMedia != v12)
  {
    goto LABEL_42;
  }
  if (!CGColorEqualToColor(-[PKColor CGColor](self->_backgroundColor, "CGColor"), (CGColorRef)objc_msgSend(*((id *)v4 + 6), "CGColor")))goto LABEL_42;
  callToAction = self->_callToAction;
  v14 = (PKDiscoveryCallToAction *)*((_QWORD *)v4 + 7);
  if (callToAction && v14)
  {
    if (!-[PKDiscoveryCallToAction isEqual:](callToAction, "isEqual:"))
      goto LABEL_42;
  }
  else if (callToAction != v14)
  {
    goto LABEL_42;
  }
  if (self->_foregroundContentMode != *((_QWORD *)v4 + 8) || self->_largeCardTemplateType != *((_QWORD *)v4 + 9))
    goto LABEL_42;
  heading = self->_heading;
  v16 = (NSString *)*((_QWORD *)v4 + 10);
  if (heading && v16)
  {
    if ((-[NSString isEqual:](heading, "isEqual:") & 1) == 0)
      goto LABEL_42;
  }
  else if (heading != v16)
  {
    goto LABEL_42;
  }
  title = self->_title;
  v18 = (NSString *)*((_QWORD *)v4 + 11);
  if (!title || !v18)
  {
    if (title == v18)
      goto LABEL_38;
LABEL_42:
    v21 = 0;
    goto LABEL_43;
  }
  if ((-[NSString isEqual:](title, "isEqual:") & 1) == 0)
    goto LABEL_42;
LABEL_38:
  inlineDescription = self->_inlineDescription;
  v20 = (NSString *)*((_QWORD *)v4 + 12);
  if (inlineDescription && v20)
    v21 = -[NSString isEqual:](inlineDescription, "isEqual:");
  else
    v21 = inlineDescription == v20;
LABEL_43:

  return v21;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_headingKey);
  objc_msgSend(v3, "safelyAddObject:", self->_titleKey);
  objc_msgSend(v3, "safelyAddObject:", self->_inlineDescriptionKey);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundMedia);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundColor);
  objc_msgSend(v3, "safelyAddObject:", self->_callToAction);
  objc_msgSend(v3, "safelyAddObject:", self->_heading);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_inlineDescription);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_foregroundContentMode - v4 + 32 * v4;
  v6 = self->_largeCardTemplateType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("headingKey"), self->_headingKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("titleKey"), self->_titleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("inlineDescriptionKey"), self->_inlineDescriptionKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("backgroundMedia"), self->_backgroundMedia);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("backgroundColor"), self->_backgroundColor);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("callToAction"), self->_callToAction);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("foregroundContentMode"), self->_foregroundContentMode);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("largeCardTemplateType"), self->_largeCardTemplateType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("heading"), self->_heading);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("title"), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("inlineDescription"), self->_inlineDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("itemIdentifier"), self->_itemIdentifier);
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
  NSString *headingKey;
  id v5;

  headingKey = self->_headingKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", headingKey, CFSTR("headingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleKey, CFSTR("titleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlineDescriptionKey, CFSTR("inlineDescriptionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundMedia, CFSTR("backgroundMedia"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callToAction, CFSTR("callToAction"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_foregroundContentMode, CFSTR("foregroundContentMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_largeCardTemplateType, CFSTR("largeCardTemplateType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heading, CFSTR("heading"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlineDescription, CFSTR("inlineDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("itemIdentifier"));

}

- (PKDiscoveryCard)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryCard *v5;
  uint64_t v6;
  NSString *headingKey;
  uint64_t v8;
  NSString *titleKey;
  uint64_t v10;
  NSString *inlineDescriptionKey;
  uint64_t v12;
  PKDiscoveryMedia *backgroundMedia;
  uint64_t v14;
  PKColor *backgroundColor;
  uint64_t v16;
  PKDiscoveryCallToAction *callToAction;
  uint64_t v18;
  NSString *heading;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *inlineDescription;
  uint64_t v24;
  NSString *itemIdentifier;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDiscoveryCard;
  v5 = -[PKDiscoveryCard init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    headingKey = v5->_headingKey;
    v5->_headingKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inlineDescriptionKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    inlineDescriptionKey = v5->_inlineDescriptionKey;
    v5->_inlineDescriptionKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundMedia"));
    v12 = objc_claimAutoreleasedReturnValue();
    backgroundMedia = v5->_backgroundMedia;
    v5->_backgroundMedia = (PKDiscoveryMedia *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callToAction"));
    v16 = objc_claimAutoreleasedReturnValue();
    callToAction = v5->_callToAction;
    v5->_callToAction = (PKDiscoveryCallToAction *)v16;

    v5->_foregroundContentMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("foregroundContentMode"));
    v5->_largeCardTemplateType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("largeCardTemplateType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heading"));
    v18 = objc_claimAutoreleasedReturnValue();
    heading = v5->_heading;
    v5->_heading = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v20 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inlineDescription"));
    v22 = objc_claimAutoreleasedReturnValue();
    inlineDescription = v5->_inlineDescription;
    v5->_inlineDescription = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v24;

  }
  return v5;
}

- (NSString)headingKey
{
  return self->_headingKey;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (NSString)inlineDescriptionKey
{
  return self->_inlineDescriptionKey;
}

- (PKDiscoveryMedia)backgroundMedia
{
  return self->_backgroundMedia;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PKDiscoveryCallToAction)callToAction
{
  return self->_callToAction;
}

- (int64_t)foregroundContentMode
{
  return self->_foregroundContentMode;
}

- (int64_t)largeCardTemplateType
{
  return self->_largeCardTemplateType;
}

- (NSString)heading
{
  return self->_heading;
}

- (void)setHeading:(id)a3
{
  objc_storeStrong((id *)&self->_heading, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)inlineDescription
{
  return self->_inlineDescription;
}

- (PKDiscoveryItem)item
{
  return (PKDiscoveryItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_inlineDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_callToAction, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundMedia, 0);
  objc_storeStrong((id *)&self->_inlineDescriptionKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_headingKey, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
