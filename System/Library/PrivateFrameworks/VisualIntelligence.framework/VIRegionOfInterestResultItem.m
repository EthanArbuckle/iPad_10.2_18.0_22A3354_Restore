@implementation VIRegionOfInterestResultItem

- (VIRegionOfInterestResultItem)initWithDomain:(id)a3 thirdPartyObject:(id)a4 ontologyNode:(id)a5 objectKnowledge:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VIRegionOfInterestResultItem *v15;
  VIRegionOfInterestResultItem *v16;
  uint64_t v17;
  VIThirdPartyObject *thirdPartyObject;
  uint64_t v19;
  VIOntologyNode *ontologyNode;
  uint64_t v21;
  VIObjectKnowledge *objectKnowledge;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VIRegionOfInterestResultItem;
  v15 = -[VIRegionOfInterestResultItem init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_domain, a3);
    v17 = objc_msgSend(v12, "copy");
    thirdPartyObject = v16->_thirdPartyObject;
    v16->_thirdPartyObject = (VIThirdPartyObject *)v17;

    v19 = objc_msgSend(v13, "copy");
    ontologyNode = v16->_ontologyNode;
    v16->_ontologyNode = (VIOntologyNode *)v19;

    v21 = objc_msgSend(v14, "copy");
    objectKnowledge = v16->_objectKnowledge;
    v16->_objectKnowledge = (VIObjectKnowledge *)v21;

  }
  return v16;
}

- (VIObjectCategory)objectCategory
{
  VIObjectCategory *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  VIObjectCategory *v10;

  v3 = [VIObjectCategory alloc];
  -[VIOntologyNode knowledgeGraphID](self->_ontologyNode, "knowledgeGraphID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E980D400;
  -[VIOntologyNode labelDebugDescription](self->_ontologyNode, "labelDebugDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1E980D400;
  v10 = -[VIObjectCategory initWithKnowledgeGraphID:labelDebugDescription:](v3, "initWithKnowledgeGraphID:labelDebugDescription:", v6, v9);

  return v10;
}

- (signed)csuSearchableKnowledgeObjectIdType
{
  int v2;

  v2 = -[VIObjectKnowledge csuIdType](self->_objectKnowledge, "csuIdType");
  if ((v2 - 1) >= 4)
    return 0;
  else
    return v2;
}

- (CSUSearchableKnowledgeObject)searchableKnowledgeObject
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v19;

  v3 = objc_alloc(MEMORY[0x1E0D188E8]);
  v4 = -[VIObjectKnowledge csuQid](self->_objectKnowledge, "csuQid");
  v5 = -[VIRegionOfInterestResultItem csuSearchableKnowledgeObjectIdType](self, "csuSearchableKnowledgeObjectIdType");
  -[VIObjectKnowledge csuLocalizedLabelDictionary](self->_objectKnowledge, "csuLocalizedLabelDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIObjectKnowledge csuConfidence](self->_objectKnowledge, "csuConfidence");
  v8 = v7;
  v9 = -[VIObjectKnowledge csuSensitiveLocation](self->_objectKnowledge, "csuSensitiveLocation");
  -[VIObjectKnowledge csuCategory](self->_objectKnowledge, "csuCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIObjectKnowledge csuVertical](self->_objectKnowledge, "csuVertical");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIObjectKnowledge csuLocalizedSynonymsDictionary](self->_objectKnowledge, "csuLocalizedSynonymsDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIObjectKnowledge csuLongitute](self->_objectKnowledge, "csuLongitute");
  v14 = v13;
  -[VIObjectKnowledge csuLatitute](self->_objectKnowledge, "csuLatitute");
  v16 = v15;
  LODWORD(v19) = -[VIObjectKnowledge csuVersion](self->_objectKnowledge, "csuVersion");
  v17 = (void *)objc_msgSend(v3, "initWithQID:idType:localizedLabelDictionary:confidence:sensitiveLocation:category:vertical:localizedSynonymsDictionary:longitude:latitude:version:", v4, v5, v6, v9, v10, v11, v8, v14, v16, v12, v19);

  return (CSUSearchableKnowledgeObject *)v17;
}

- (BOOL)isEqual:(id)a3
{
  VIRegionOfInterestResultItem *v4;
  VIRegionOfInterestResultItem *v5;
  VIRegionOfInterestResultItem *v6;
  NSString *domain;
  void *v8;
  VIThirdPartyObject *thirdPartyObject;
  void *v10;
  VIOntologyNode *ontologyNode;
  void *v12;
  VIObjectKnowledge *objectKnowledge;
  void *v14;
  char IsEqual;

  v4 = (VIRegionOfInterestResultItem *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    domain = self->_domain;
    -[VIRegionOfInterestResultItem domain](v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)domain, (uint64_t)v8))
    {
      thirdPartyObject = self->_thirdPartyObject;
      -[VIRegionOfInterestResultItem thirdPartyObject](v6, "thirdPartyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)thirdPartyObject, (uint64_t)v10))
      {
        ontologyNode = self->_ontologyNode;
        -[VIRegionOfInterestResultItem ontologyNode](v6, "ontologyNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (VIObjectIsEqual((unint64_t)ontologyNode, (uint64_t)v12))
        {
          objectKnowledge = self->_objectKnowledge;
          -[VIRegionOfInterestResultItem objectKnowledge](v6, "objectKnowledge");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          IsEqual = VIObjectIsEqual((unint64_t)objectKnowledge, (uint64_t)v14);

        }
        else
        {
          IsEqual = 0;
        }

      }
      else
      {
        IsEqual = 0;
      }

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[VIThirdPartyObject hash](self->_thirdPartyObject, "hash") ^ v3;
  v5 = -[VIOntologyNode hash](self->_ontologyNode, "hash");
  return v4 ^ v5 ^ -[VIObjectKnowledge hash](self->_objectKnowledge, "hash");
}

- (NSString)domain
{
  return self->_domain;
}

- (VIOntologyNode)ontologyNode
{
  return self->_ontologyNode;
}

- (VIObjectKnowledge)objectKnowledge
{
  return self->_objectKnowledge;
}

- (VIThirdPartyObject)thirdPartyObject
{
  return self->_thirdPartyObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyObject, 0);
  objc_storeStrong((id *)&self->_objectKnowledge, 0);
  objc_storeStrong((id *)&self->_ontologyNode, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
