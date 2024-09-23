@implementation OCPPackagePart

- (OCPPackagePart)initWithLocation:(id)a3 relationshipsXml:(_xmlDoc *)a4 package:(id)a5
{
  id v9;
  id v10;
  OCPPackagePart *v11;
  OCPPackagePart *v12;
  OCPPackageRelationshipCollection *v13;
  OCPPackageRelationshipCollection *mRelationships;
  uint64_t v15;
  NSMutableDictionary *mAlternateContentMap;
  OCPPackagePart *v17;

  v9 = a3;
  v10 = a5;
  v11 = -[OCPPackagePart init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mLocation, a3);
    v13 = -[OCPPackageRelationshipCollection initWithRelationshipsXml:baseLocation:]([OCPPackageRelationshipCollection alloc], "initWithRelationshipsXml:baseLocation:", a4, v12->mLocation);
    mRelationships = v12->mRelationships;
    v12->mRelationships = v13;

    objc_storeWeak((id *)&v12->mPackage, v10);
    v15 = objc_opt_new();
    mAlternateContentMap = v12->mAlternateContentMap;
    v12->mAlternateContentMap = (NSMutableDictionary *)v15;

    v17 = v12;
  }

  return v12;
}

- (id)firstPartWithRelationshipOfType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;

  -[OCPPackagePart relationshipsByType:](self, "relationshipsByType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->mPackage);
    objc_msgSend(v6, "targetLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "partForLocation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)relationshipsByType:(id)a3
{
  -[OCPPackageRelationshipCollection relationshipsByType:](self->mRelationships, "relationshipsByType:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)relationshipForIdentifier:(id)a3
{
  -[OCPPackageRelationshipCollection relationshipForIdentifier:](self->mRelationships, "relationshipForIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OCPPackage)package
{
  return (OCPPackage *)objc_loadWeakRetained((id *)&self->mPackage);
}

- (id)location
{
  return self->mLocation;
}

- (void)dealloc
{
  _xmlDoc *mDocument;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  xmlNode *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  mDocument = self->mDocument;
  if (mDocument)
    xmlFreeDoc(mDocument);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->mAlternateContentMap, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (xmlNode *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "pointerValue");
        if (v8)
          xmlFreeNode(v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)OCPPackagePart;
  -[OCPPackagePart dealloc](&v9, sel_dealloc);
}

- (id)contentType
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->mPackage);
  objc_msgSend(WeakRetained, "contentTypeForPartLocation:", self->mLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)data
{
  return 0;
}

- (_xmlDoc)xmlDocument
{
  return 0;
}

- (_xmlTextReader)xmlReader
{
  return 0;
}

- (_xmlNode)fallbackNodeForChoiceNode:(_xmlNode *)a3
{
  NSMutableDictionary *mAlternateContentMap;
  void *v4;
  void *v5;
  _xmlNode *v6;

  mAlternateContentMap = self->mAlternateContentMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mAlternateContentMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_xmlNode *)objc_msgSend(v5, "pointerValue");

  return v6;
}

- (void)setFallbackNode:(_xmlNode *)a3 forChoiceNode:(_xmlNode *)a4
{
  NSMutableDictionary *mAlternateContentMap;
  void *v6;
  id v7;

  mAlternateContentMap = self->mAlternateContentMap;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mAlternateContentMap, "setObject:forKey:", v7, v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPackage);
  objc_storeStrong((id *)&self->mAlternateContentMap, 0);
  objc_storeStrong((id *)&self->mRelationships, 0);
  objc_storeStrong((id *)&self->mLocation, 0);
}

@end
