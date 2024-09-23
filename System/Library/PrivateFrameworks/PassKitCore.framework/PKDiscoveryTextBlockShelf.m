@implementation PKDiscoveryTextBlockShelf

- (PKDiscoveryTextBlockShelf)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryTextBlockShelf *v5;
  PKDiscoveryTextBlockShelf *v6;
  uint64_t v7;
  NSString *bodyKey;
  uint64_t v9;
  NSString *ledeKey;
  uint64_t v11;
  NSString *sectionHeaderLineKey;
  void *v13;
  int64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryTextBlockShelf;
  v5 = -[PKDiscoveryTextBlockShelf init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKDiscoveryShelf setType:](v5, "setType:", 1);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("bodyKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    bodyKey = v6->_bodyKey;
    v6->_bodyKey = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("ledeKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    ledeKey = v6->_ledeKey;
    v6->_ledeKey = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("sectionHeadlineKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    sectionHeaderLineKey = v6->_sectionHeaderLineKey;
    v6->_sectionHeaderLineKey = (NSString *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("style"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("standard"), "isEqualToString:", v13) & 1) != 0)
      v14 = 0;
    else
      v14 = objc_msgSend(CFSTR("legal"), "isEqualToString:", v13);
    v6->_style = v14;

  }
  return v6;
}

- (void)localizeWithBundle:(id)a3
{
  -[PKDiscoveryTextBlockShelf localizeWithBundle:table:](self, "localizeWithBundle:table:", a3, CFSTR("localizable"));
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  id v6;
  NSString *bodyKey;
  NSString *v8;
  NSString *localizedBody;
  NSString *ledeKey;
  NSString *v11;
  NSString *localizedLede;
  NSString *sectionHeaderLineKey;
  NSString *v14;
  NSString *localizedSectionHeaderLine;
  id v16;

  v16 = a3;
  v6 = a4;
  bodyKey = self->_bodyKey;
  if (bodyKey)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", bodyKey, &stru_1E2ADF4C0, v6);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedBody = self->_localizedBody;
    self->_localizedBody = v8;

  }
  ledeKey = self->_ledeKey;
  if (ledeKey)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", ledeKey, &stru_1E2ADF4C0, v6);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedLede = self->_localizedLede;
    self->_localizedLede = v11;

  }
  sectionHeaderLineKey = self->_sectionHeaderLineKey;
  if (sectionHeaderLineKey)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", sectionHeaderLineKey, &stru_1E2ADF4C0, v6);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedSectionHeaderLine = self->_localizedSectionHeaderLine;
    self->_localizedSectionHeaderLine = v14;

  }
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *bodyKey;
  NSString *v6;
  BOOL v7;
  NSString *ledeKey;
  NSString *v9;
  BOOL v10;
  NSString *sectionHeaderLineKey;
  NSString *v12;
  NSString *localizedBody;
  NSString *v14;
  NSString *localizedLede;
  NSString *v16;
  NSString *localizedSectionHeaderLine;
  NSString *v18;
  char v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKDiscoveryTextBlockShelf;
  if (!-[PKDiscoveryShelf isEqual:](&v21, sel_isEqual_, v4))
    goto LABEL_37;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_style != v4[4])
    goto LABEL_37;
  bodyKey = self->_bodyKey;
  v6 = (NSString *)v4[5];
  if (bodyKey)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (bodyKey != v6)
      goto LABEL_37;
  }
  else if ((-[NSString isEqual:](bodyKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_37;
  }
  ledeKey = self->_ledeKey;
  v9 = (NSString *)v4[6];
  if (ledeKey)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (ledeKey != v9)
      goto LABEL_37;
  }
  else if ((-[NSString isEqual:](ledeKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_37;
  }
  sectionHeaderLineKey = self->_sectionHeaderLineKey;
  v12 = (NSString *)v4[7];
  if (sectionHeaderLineKey && v12)
  {
    if ((-[NSString isEqual:](sectionHeaderLineKey, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (sectionHeaderLineKey != v12)
  {
    goto LABEL_37;
  }
  localizedBody = self->_localizedBody;
  v14 = (NSString *)v4[8];
  if (localizedBody && v14)
  {
    if ((-[NSString isEqual:](localizedBody, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (localizedBody != v14)
  {
    goto LABEL_37;
  }
  localizedLede = self->_localizedLede;
  v16 = (NSString *)v4[9];
  if (!localizedLede || !v16)
  {
    if (localizedLede == v16)
      goto LABEL_33;
LABEL_37:
    v19 = 0;
    goto LABEL_38;
  }
  if ((-[NSString isEqual:](localizedLede, "isEqual:") & 1) == 0)
    goto LABEL_37;
LABEL_33:
  localizedSectionHeaderLine = self->_localizedSectionHeaderLine;
  v18 = (NSString *)v4[10];
  if (localizedSectionHeaderLine && v18)
    v19 = -[NSString isEqual:](localizedSectionHeaderLine, "isEqual:");
  else
    v19 = localizedSectionHeaderLine == v18;
LABEL_38:

  return v19;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryTextBlockShelf;
  v3 = -[PKDiscoveryShelf hash](&v8, sel_hash);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "safelyAddObject:", self->_bodyKey);
  objc_msgSend(v4, "safelyAddObject:", self->_ledeKey);
  objc_msgSend(v4, "safelyAddObject:", self->_sectionHeaderLineKey);
  objc_msgSend(v4, "safelyAddObject:", self->_localizedBody);
  objc_msgSend(v4, "safelyAddObject:", self->_localizedLede);
  objc_msgSend(v4, "safelyAddObject:", self->_sectionHeaderLineKey);
  v5 = PKCombinedHash((uint64_t)v3, v4);
  v6 = self->_style - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t style;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  style = self->_style;
  v6 = CFSTR("legal");
  if (style != 1)
    v6 = 0;
  if (style)
    v7 = v6;
  else
    v7 = CFSTR("standard");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("style"), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("bodyKey"), self->_bodyKey);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("ledeKey"), self->_ledeKey);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("sectionHeadlineKey"), self->_sectionHeaderLineKey);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedBody"), self->_localizedBody);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedLede"), self->_localizedLede);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("localizedSectionHeadline"),
    self->_localizedSectionHeaderLine);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
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
  v5.super_class = (Class)PKDiscoveryTextBlockShelf;
  v4 = a3;
  -[PKDiscoveryShelf encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("style"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodyKey, CFSTR("bodyKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ledeKey, CFSTR("ledeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectionHeaderLineKey, CFSTR("sectionHeadlineKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedBody, CFSTR("localizedBody"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedLede, CFSTR("localizedLede"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedSectionHeaderLine, CFSTR("localizedSectionHeadline"));

}

- (PKDiscoveryTextBlockShelf)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryTextBlockShelf *v5;
  uint64_t v6;
  NSString *bodyKey;
  uint64_t v8;
  NSString *ledeKey;
  uint64_t v10;
  NSString *sectionHeaderLineKey;
  uint64_t v12;
  NSString *localizedBody;
  uint64_t v14;
  NSString *localizedLede;
  uint64_t v16;
  NSString *localizedSectionHeaderLine;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryTextBlockShelf;
  v5 = -[PKDiscoveryShelf initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    bodyKey = v5->_bodyKey;
    v5->_bodyKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ledeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    ledeKey = v5->_ledeKey;
    v5->_ledeKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionHeadlineKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionHeaderLineKey = v5->_sectionHeaderLineKey;
    v5->_sectionHeaderLineKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedBody"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedBody = v5->_localizedBody;
    v5->_localizedBody = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedLede"));
    v14 = objc_claimAutoreleasedReturnValue();
    localizedLede = v5->_localizedLede;
    v5->_localizedLede = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSectionHeadline"));
    v16 = objc_claimAutoreleasedReturnValue();
    localizedSectionHeaderLine = v5->_localizedSectionHeaderLine;
    v5->_localizedSectionHeaderLine = (NSString *)v16;

  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (NSString)ledeKey
{
  return self->_ledeKey;
}

- (NSString)sectionHeaderLineKey
{
  return self->_sectionHeaderLineKey;
}

- (NSString)localizedBody
{
  return self->_localizedBody;
}

- (void)setLocalizedBody:(id)a3
{
  objc_storeStrong((id *)&self->_localizedBody, a3);
}

- (NSString)localizedLede
{
  return self->_localizedLede;
}

- (void)setLocalizedLede:(id)a3
{
  objc_storeStrong((id *)&self->_localizedLede, a3);
}

- (NSString)localizedSectionHeaderLine
{
  return self->_localizedSectionHeaderLine;
}

- (void)setLocalizedSectionHeaderLine:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSectionHeaderLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSectionHeaderLine, 0);
  objc_storeStrong((id *)&self->_localizedLede, 0);
  objc_storeStrong((id *)&self->_localizedBody, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLineKey, 0);
  objc_storeStrong((id *)&self->_ledeKey, 0);
  objc_storeStrong((id *)&self->_bodyKey, 0);
}

@end
