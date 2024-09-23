@implementation PGGraphPOINode

- (NSString)pg_topic
{
  void *v2;
  id v3;

  -[PGGraphPOINode label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (isRecognizedPOITopic_onceToken != -1)
    dispatch_once(&isRecognizedPOITopic_onceToken, &__block_literal_global_95);
  if (objc_msgSend((id)isRecognizedPOITopic_recognizedPOITopics, "containsObject:", v2))
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (PGGraphPOINode)initWithLabel:(id)a3
{
  id v4;
  PGGraphPOINode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphPOINode;
  v5 = -[PGGraphNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (unsigned)domain
{
  return 501;
}

- (PGGraphPOINodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPOINodeCollection alloc], "initWithNode:", self);
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_localizationKeyForPOINode:", self);
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

  objc_msgSend((id)objc_opt_class(), "_localizationKeyForPOINode:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)featureType
{
  return 10;
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
  -[PGGraphPOINode label](self, "label");
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 501);
}

+ (id)validPOILabels
{
  void *v2;
  void *v3;
  _QWORD v5[17];

  v5[16] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("Restaurant");
  v5[1] = CFSTR("Nightlife");
  v5[2] = CFSTR("Shopping");
  v5[3] = CFSTR("Travel");
  v5[4] = CFSTR("Culture");
  v5[5] = CFSTR("Museum");
  v5[6] = CFSTR("Entertainment");
  v5[7] = CFSTR("AmusementPark");
  v5[8] = CFSTR("Park");
  v5[9] = CFSTR("Performance");
  v5[10] = CFSTR("Stadium");
  v5[11] = CFSTR("Activity");
  v5[12] = CFSTR("Diving");
  v5[13] = CFSTR("Hiking");
  v5[14] = CFSTR("Fitness");
  v5[15] = CFSTR("Hospital");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_localizationKeyForPOINode:(id)a3
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
  localizationKeyForPOILabel(v4);
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

+ (id)filterWithLabel:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLabel:domain:", v4, 501);

  return v5;
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
  v6 = (void *)objc_msgSend(v5, "initWithLabels:domain:properties:", v4, 501, MEMORY[0x1E0C9AA70]);

  return v6;
}

+ (id)momentOfPOI
{
  void *v2;
  void *v3;

  +[PGGraphPOIEdge filter](PGGraphPOIEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
