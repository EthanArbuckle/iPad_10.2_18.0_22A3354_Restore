@implementation PLQueryChangeDetectionCriteria

- (PLQueryChangeDetectionCriteria)init
{
  PLQueryChangeDetectionCriteria *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attributeKeyPathsByEntityNameAffectingFetchResult;
  NSMutableDictionary *v5;
  NSMutableDictionary *relationshipKeyPathsByEntityNameAffectingFetchResult;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLQueryChangeDetectionCriteria;
  v2 = -[PLQueryChangeDetectionCriteria init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributeKeyPathsByEntityNameAffectingFetchResult = v2->_attributeKeyPathsByEntityNameAffectingFetchResult;
    v2->_attributeKeyPathsByEntityNameAffectingFetchResult = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationshipKeyPathsByEntityNameAffectingFetchResult = v2->_relationshipKeyPathsByEntityNameAffectingFetchResult;
    v2->_relationshipKeyPathsByEntityNameAffectingFetchResult = v5;

  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(attributes: %@ relationships: %@)"), objc_opt_class(), self->_attributeKeyPathsByEntityNameAffectingFetchResult, self->_relationshipKeyPathsByEntityNameAffectingFetchResult);
}

- (BOOL)isEmpty
{
  return !-[NSMutableDictionary count](self->_attributeKeyPathsByEntityNameAffectingFetchResult, "count")
      && -[NSMutableDictionary count](self->_relationshipKeyPathsByEntityNameAffectingFetchResult, "count") == 0;
}

- (void)addAttributeKeyPath:(id)a3 forEntityName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attributeKeyPathsByEntityNameAffectingFetchResult, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributeKeyPathsByEntityNameAffectingFetchResult, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)addRelationshipKeyPath:(id)a3 forEntityName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipKeyPathsByEntityNameAffectingFetchResult, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_relationshipKeyPathsByEntityNameAffectingFetchResult, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (void)enumerateEntitiesAndAttributesUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_attributeKeyPathsByEntityNameAffectingFetchResult, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void)enumerateEntitiesAndRelationshipsUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_relationshipKeyPathsByEntityNameAffectingFetchResult, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipKeyPathsByEntityNameAffectingFetchResult, 0);
  objc_storeStrong((id *)&self->_attributeKeyPathsByEntityNameAffectingFetchResult, 0);
}

@end
