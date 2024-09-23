@implementation PGGraphPersonActivityMeaningNode

- (PGGraphPersonActivityMeaningNode)initWithPersonLocalIdentifier:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  PGGraphPersonActivityMeaningNode *v9;
  PGGraphPersonActivityMeaningNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPersonActivityMeaningNode;
  v9 = -[PGGraphNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v10->_label, a4);
  }

  return v10;
}

- (PGGraphPersonActivityMeaningNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  void *v8;
  PGGraphPersonActivityMeaningNode *v9;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGGraphPersonActivityMeaningNode initWithPersonLocalIdentifier:activity:](self, "initWithPersonLocalIdentifier:activity:", v8, v7);

  return v9;
}

- (unsigned)domain
{
  return 701;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  BOOL v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "count")
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id")),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "stringValue");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != self->_personLocalIdentifier;

    v10 = !v9;
  }
  else
  {
    v10 = 1;
  }

  return v10 & 1;
}

- (id)propertyDictionary
{
  NSString *personLocalIdentifier;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  personLocalIdentifier = self->_personLocalIdentifier;
  v4 = CFSTR("identifier");
  v5[0] = personLocalIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PGGraphPersonActivityMeaningNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPersonActivityMeaningNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 36;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonActivityMeaningNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonActivityMeaningNode personLocalIdentifier](self, "personLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 701);
}

+ (MARelation)momentOfPersonActivity
{
  void *v2;
  void *v3;

  +[PGGraphPersonActivityMeaningEdge filter](PGGraphPersonActivityMeaningEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)personOfPersonActivity
{
  void *v2;
  void *v3;

  +[PGGraphPracticesActivityEdge filter](PGGraphPracticesActivityEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)filterWithPersonLocalIdentifiers:(id)a3 label:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D42A50];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v12 = CFSTR("identifier");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithLabel:domain:properties:", v6, 701, v9);
  return v10;
}

+ (id)filterWithActivityLabels:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithLabels:domain:properties:", v4, 701, MEMORY[0x1E0C9AA70]);

  return v6;
}

@end
