@implementation PGGraphHomeWorkNode

- (PGGraphHomeWorkNode)initWithLabel:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphHomeWorkNode;
  v8 = -[PGGraphNode init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = v9;

    objc_storeStrong((id *)v8 + 4, a4);
    *(_OWORD *)(v8 + 40) = *MEMORY[0x1E0C9E500];
  }

  return (PGGraphHomeWorkNode *)v8;
}

- (PGGraphHomeWorkNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  void *v8;
  PGGraphHomeWorkNode *v9;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGGraphHomeWorkNode initWithLabel:uuid:](self, "initWithLabel:uuid:", v7, v8);

  return v9;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "isEqual:", self->_uuid);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  NSString *uuid;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  uuid = self->_uuid;
  v4 = CFSTR("id");
  v5[0] = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphHomeWorkNode (%@) (%@)"), self->_label, self->_uuid);
}

- (unsigned)domain
{
  return 202;
}

- (NSString)localizedName
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;

  -[PGGraphHomeWorkNode label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Home"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("PGHomeSearchableText");
  }
  else
  {
    -[PGGraphHomeWorkNode label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Work"));

    if (!v9)
    {
      v10 = 0;
      return (NSString *)v10;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("PGWorkSearchableText");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isHome
{
  return -[NSString isEqualToString:](self->_label, "isEqualToString:", CFSTR("Home"));
}

- (PGGraphHomeWorkNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphHomeWorkNodeCollection alloc], "initWithNode:", self);
}

- (CLLocationCoordinate2D)coordinate
{
  CLLocationCoordinate2D *p_centroidCoordinate;
  void *v4;
  void *v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  p_centroidCoordinate = &self->_centroidCoordinate;
  if (!CLLocationCoordinate2DIsValid(self->_centroidCoordinate))
  {
    -[PGGraphHomeWorkNode collection](self, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centroidCoordinate");
    p_centroidCoordinate->latitude = v6;
    p_centroidCoordinate->longitude = v7;

  }
  latitude = p_centroidCoordinate->latitude;
  longitude = p_centroidCoordinate->longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (unint64_t)featureType
{
  if (-[PGGraphHomeWorkNode isHome](self, "isHome"))
    return 30;
  else
    return 31;
}

- (NSString)featureIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHomeWorkNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __40__PGGraphHomeWorkNode_featureIdentifier__block_invoke;
  v17 = &unk_1E8434020;
  v18 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", &v14);

  objc_msgSend(v6, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHomeWorkNode label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@|%@|%@"), v9, v10, v11, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __40__PGGraphHomeWorkNode_featureIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "featureIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 202);
}

+ (MANodeFilter)homeFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Home"), 202);
}

+ (MANodeFilter)workFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Work"), 202);
}

+ (MARelation)ownerOfHomeWork
{
  void *v2;
  void *v3;

  +[PGGraphIsOwnedByEdge filter](PGGraphIsOwnedByEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)addressOfHomeWork
{
  void *v2;
  void *v3;

  +[PGGraphIsHomeWorkEdge filter](PGGraphIsHomeWorkEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
