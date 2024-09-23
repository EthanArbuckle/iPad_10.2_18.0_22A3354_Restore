@implementation PGGraphLocationCountryNode

- (PGGraphLocationCountryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationCountryNode;
  return -[PGGraphNamedLocationNode initWithLabel:domain:properties:](&v6, sel_initWithLabel_domain_properties_, a3, a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Country");
  return CFSTR("Country");
}

- (PGGraphLocationCountryNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphLocationCountryNodeCollection alloc], "initWithNode:", self);
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphNamedLocationNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

- (unint64_t)featureType
{
  return 6;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Country"), 200);
}

+ (id)addressOfCountry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphAddressNode filter](PGGraphAddressNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (MARelation)momentInCountry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (id)languageOfCountry
{
  void *v2;
  void *v3;

  +[PGGraphLanguageEdge filter](PGGraphLanguageEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
