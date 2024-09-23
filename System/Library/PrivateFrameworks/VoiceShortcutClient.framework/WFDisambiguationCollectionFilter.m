@implementation WFDisambiguationCollectionFilter

- (WFDisambiguationCollectionFilter)initWithSystemEntityCollectionIdentifier:(id)a3
{
  return -[WFDisambiguationCollectionFilter initWithSystemEntityCollectionIdentifier:namedQueryReference:](self, "initWithSystemEntityCollectionIdentifier:namedQueryReference:", a3, 0);
}

- (WFDisambiguationCollectionFilter)initWithNamedQueryReference:(id)a3
{
  return -[WFDisambiguationCollectionFilter initWithSystemEntityCollectionIdentifier:namedQueryReference:](self, "initWithSystemEntityCollectionIdentifier:namedQueryReference:", 0, a3);
}

- (WFDisambiguationCollectionFilter)initWithSystemEntityCollectionIdentifier:(id)a3 namedQueryReference:(id)a4
{
  id v6;
  id v7;
  WFDisambiguationCollectionFilter *v8;
  uint64_t v9;
  NSString *systemEntityCollectionIdentifier;
  uint64_t v11;
  LNAppShortcutDynamicOptionsProviderReference *namedQueryReference;
  WFDisambiguationCollectionFilter *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFDisambiguationCollectionFilter;
  v8 = -[WFDisambiguationCollectionFilter init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    systemEntityCollectionIdentifier = v8->_systemEntityCollectionIdentifier;
    v8->_systemEntityCollectionIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    namedQueryReference = v8->_namedQueryReference;
    v8->_namedQueryReference = (LNAppShortcutDynamicOptionsProviderReference *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFDisambiguationCollectionFilter)initWithSerializedRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFDisambiguationCollectionFilter *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "valueForKey:", CFSTR("systemEntityCollectionIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("namedQueryReference"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44108]), "initWithSerializedRepresentation:", v7);
    else
      v8 = 0;
    self = -[WFDisambiguationCollectionFilter initWithSystemEntityCollectionIdentifier:namedQueryReference:](self, "initWithSystemEntityCollectionIdentifier:namedQueryReference:", v6, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializableRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WFDisambiguationCollectionFilter systemEntityCollectionIdentifier](self, "systemEntityCollectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDisambiguationCollectionFilter systemEntityCollectionIdentifier](self, "systemEntityCollectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("systemEntityCollectionIdentifier"));

  }
  -[WFDisambiguationCollectionFilter namedQueryReference](self, "namedQueryReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFDisambiguationCollectionFilter namedQueryReference](self, "namedQueryReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serializableRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("namedQueryReference"));

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFDisambiguationCollectionFilter systemEntityCollectionIdentifier](self, "systemEntityCollectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDisambiguationCollectionFilter namedQueryReference](self, "namedQueryReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSystemEntityCollectionIdentifier:namedQueryReference:", v5, v6);

  return v7;
}

- (WFDisambiguationCollectionFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFDisambiguationCollectionFilter *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemEntityCollectionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namedQueryReference"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFDisambiguationCollectionFilter initWithSystemEntityCollectionIdentifier:namedQueryReference:](self, "initWithSystemEntityCollectionIdentifier:namedQueryReference:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *systemEntityCollectionIdentifier;
  id v5;

  systemEntityCollectionIdentifier = self->_systemEntityCollectionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", systemEntityCollectionIdentifier, CFSTR("systemEntityCollectionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_namedQueryReference, CFSTR("namedQueryReference"));

}

- (NSString)systemEntityCollectionIdentifier
{
  return self->_systemEntityCollectionIdentifier;
}

- (void)setSystemEntityCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_systemEntityCollectionIdentifier, a3);
}

- (LNAppShortcutDynamicOptionsProviderReference)namedQueryReference
{
  return self->_namedQueryReference;
}

- (void)setNamedQueryReference:(id)a3
{
  objc_storeStrong((id *)&self->_namedQueryReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedQueryReference, 0);
  objc_storeStrong((id *)&self->_systemEntityCollectionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
