@implementation PGGraphROINode

- (NSString)pg_topic
{
  void *v2;
  id v3;

  -[PGGraphROINode label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (isRecognizedROITopic_onceToken != -1)
    dispatch_once(&isRecognizedROITopic_onceToken, &__block_literal_global_9291);
  if (objc_msgSend((id)isRecognizedROITopic_recognizedROITopics, "containsObject:", v2))
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (PGGraphROINode)initWithROIType:(unint64_t)a3
{
  PGGraphROINode *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGGraphROINode;
  v4 = -[PGGraphNode init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_labelForROIType:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_storeStrong((id *)&v4->_label, v5);
    }
    else
    {

      v4 = 0;
    }

  }
  return v4;
}

- (PGGraphROINode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  uint64_t v7;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "_roiTypeForLabel:", v6);

  if (v7)
    return -[PGGraphROINode initWithROIType:](self, "initWithROIType:", v7);

  return 0;
}

- (unsigned)domain
{
  return 502;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_localizationKeyForROINode:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, v2, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)localizedSynonyms
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_localizationKeyForROINode:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (PGGraphROINodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphROINodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 9;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphROINode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 502);
}

+ (id)filterWithLabels:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithLabels:domain:properties:", v4, 502, MEMORY[0x1E0C9AA70]);

  return v6;
}

+ (id)filterForTypes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __33__PGGraphROINode_filterForTypes___block_invoke;
  v14 = &unk_1E842D688;
  v15 = v6;
  v16 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v11);

  v8 = objc_alloc(MEMORY[0x1E0D42A50]);
  v9 = (void *)objc_msgSend(v8, "initWithLabels:domain:properties:", v7, 502, MEMORY[0x1E0C9AA70], v11, v12, v13, v14);

  return v9;
}

+ (MANodeFilter)urbanFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Urban"), 502);
}

+ (MANodeFilter)beachFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Beach"), 502);
}

+ (MANodeFilter)mountainFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Mountain"), 502);
}

+ (MANodeFilter)natureFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Nature"), 502);
}

+ (MANodeFilter)waterFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Water"), 502);
}

+ (id)validROILabels
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("Urban");
  v5[1] = CFSTR("Beach");
  v5[2] = CFSTR("Mountain");
  v5[3] = CFSTR("Nature");
  v5[4] = CFSTR("Water");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_labelForROIType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return *off_1E842D6A8[a3 - 1];
}

+ (unint64_t)_roiTypeForLabel:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Urban")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Beach")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mountain")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Nature")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Water")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_localizationKeyForROINode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  localizationKeyForROILabel(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Trying to localize node with unsupported label/domain: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return v5;
}

+ (id)momentOfROI
{
  void *v2;
  void *v3;

  +[PGGraphROIEdge filter](PGGraphROIEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __33__PGGraphROINode_filterForTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "_labelForROIType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
