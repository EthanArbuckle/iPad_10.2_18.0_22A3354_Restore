@implementation PGGraphPeopleDomainBuildingHelper

- (PGGraphPeopleDomainBuildingHelper)init
{
  PGGraphPeopleDomainBuildingHelper *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *insertedIdentifiedPersonByPersonLocalIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *authorNodeByLocalIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGGraphPeopleDomainBuildingHelper;
  v2 = -[PGGraphPeopleDomainBuildingHelper init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    insertedIdentifiedPersonByPersonLocalIdentifier = v2->_insertedIdentifiedPersonByPersonLocalIdentifier;
    v2->_insertedIdentifiedPersonByPersonLocalIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    authorNodeByLocalIdentifier = v2->_authorNodeByLocalIdentifier;
    v2->_authorNodeByLocalIdentifier = v5;

  }
  return v2;
}

- (id)insertedIdentifiedPersonForPersonLocalIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_insertedIdentifiedPersonByPersonLocalIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)insertIdentifiedPersonWithPersonNode:(id)a3 forPersonLocalIdentifier:(id)a4
{
  id v6;
  id v7;
  PGGraphBuilderInsertedIdentifiedPerson *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PGGraphBuilderInsertedIdentifiedPerson initWithPersonNode:]([PGGraphBuilderInsertedIdentifiedPerson alloc], "initWithPersonNode:", v7);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_insertedIdentifiedPersonByPersonLocalIdentifier, "setObject:forKeyedSubscript:", v8, v6);
  return v8;
}

- (void)cacheAuthorNode:(id)a3 forShareParticipant:(id)a4
{
  NSMutableDictionary *authorNodeByLocalIdentifier;
  id v6;
  id v7;

  authorNodeByLocalIdentifier = self->_authorNodeByLocalIdentifier;
  v6 = a3;
  objc_msgSend(a4, "localIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](authorNodeByLocalIdentifier, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)cachedAuthorNodeForShareParticipant:(id)a3
{
  NSMutableDictionary *authorNodeByLocalIdentifier;
  void *v4;
  void *v5;

  authorNodeByLocalIdentifier = self->_authorNodeByLocalIdentifier;
  objc_msgSend(a3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](authorNodeByLocalIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorNodeByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_insertedIdentifiedPersonByPersonLocalIdentifier, 0);
}

@end
