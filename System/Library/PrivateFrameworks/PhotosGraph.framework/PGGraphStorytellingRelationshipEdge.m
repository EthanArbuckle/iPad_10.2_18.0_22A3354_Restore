@implementation PGGraphStorytellingRelationshipEdge

- (PGGraphStorytellingRelationshipEdge)initWithRelationship:(id)a3 fromMeNode:(id)a4 toPersonNode:(id)a5
{
  id v8;
  PGGraphStorytellingRelationshipEdge *v9;
  uint64_t v10;
  NSString *relationship;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphStorytellingRelationshipEdge;
  v9 = -[PGGraphEdge initWithSourceNode:targetNode:](&v13, sel_initWithSourceNode_targetNode_, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    relationship = v9->_relationship;
    v9->_relationship = (NSString *)v10;

  }
  return v9;
}

- (id)label
{
  return self->_relationship;
}

- (unsigned)domain
{
  return 306;
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
}

+ (id)filter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D42A00]);
  +[PGGraphRelationshipEdge supportedRelationshipLabels](PGGraphRelationshipEdge, "supportedRelationshipLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabels:domain:properties:", v3, 306, MEMORY[0x1E0C9AA70]);

  return v4;
}

+ (id)relationshipNameForLabel:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = relationshipNameForLabel__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&relationshipNameForLabel__onceToken, &__block_literal_global_57138);
  objc_msgSend((id)relationshipNameForLabel__multiWordRelationshipNameForLabel, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

void __64__PGGraphStorytellingRelationshipEdge_relationshipNameForLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("FAMILY_SOCIALGROUP");
  v2[1] = CFSTR("COWORKER_SOCIALGROUP");
  v3[0] = CFSTR("Family Social Group");
  v3[1] = CFSTR("Coworker Social Group");
  v2[2] = CFSTR("HOUSEHOLD_MEMBER");
  v3[2] = CFSTR("Household Member");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)relationshipNameForLabel__multiWordRelationshipNameForLabel;
  relationshipNameForLabel__multiWordRelationshipNameForLabel = v0;

}

@end
