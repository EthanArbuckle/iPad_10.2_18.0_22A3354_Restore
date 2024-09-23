@implementation WDCitationTable

- (WDCitationTable)initWithDocument:(id)a3
{
  id v4;
  WDCitationTable *v5;
  WDCitationTable *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *mCitations;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDCitationTable;
  v5 = -[WDCitationTable init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mCitations = v6->mCitations;
    v6->mCitations = v7;

  }
  return v6;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->mCitations, "count");
}

- (id)citationFor:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mCitations, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addCitation:(id)a3 forID:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mCitations, "setObject:forKey:", a3, a4);
}

- (id)citationIDs
{
  return (id)-[NSMutableDictionary allKeys](self->mCitations, "allKeys");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDCitationTable;
  -[WDCitationTable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mCitations, 0);
}

@end
