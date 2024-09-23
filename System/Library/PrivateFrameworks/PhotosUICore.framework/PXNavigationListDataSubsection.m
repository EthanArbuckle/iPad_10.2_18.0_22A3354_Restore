@implementation PXNavigationListDataSubsection

- (PXNavigationListDataSubsection)initWithDataSection:(id)a3 indexDelta:(int64_t)a4 expandedIndex:(int64_t)a5 indentationLevel:(int64_t)a6 externalStartIndex:(int64_t)a7 skipAssetCountFetches:(BOOL)a8
{
  id v15;
  PXNavigationListDataSubsection *v16;
  PXNavigationListDataSubsection *v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *listItemsCache;
  objc_super v22;

  v15 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXNavigationListDataSubsection;
  v16 = -[PXNavigationListDataSubsection init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dataSection, a3);
    v17->_indentationLevel = a6;
    v17->_indexDelta = a4;
    v17->_expandedIndex = a5;
    v17->_externalStartIndex = a7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v15;
    else
      v18 = 0;
    objc_storeStrong((id *)&v17->_listDataSection, v18);
    v19 = objc_opt_new();
    listItemsCache = v17->_listItemsCache;
    v17->_listItemsCache = (NSMutableDictionary *)v19;

    v17->_skipAssetCountFetches = a8;
  }

  return v17;
}

- (id)listItemAtExternalIndex:(int64_t)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *listItemsCache;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  void *v21;

  v4 = -[PXNavigationListDataSubsection indexDelta](self, "indexDelta") + a3;
  v5 = v4 - -[PXNavigationListDataSubsection externalStartIndex](self, "externalStartIndex");
  -[PXNavigationListDataSubsection listDataSection](self, "listDataSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectAtIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    listItemsCache = self->_listItemsCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](listItemsCache, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PXNavigationListDataSubsection dataSection](self, "dataSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PXNavigationListDataSubsection expandedIndex](self, "expandedIndex");
      v14 = v11;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      objc_msgSend(v15, "objectAtIndex:", v5);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = 0;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      if (v15)
      {
        if (v16)
        {
          v18 = objc_msgSend(v15, "lockStateForCollection:", v16);
          if (!-[PXNavigationListDataSubsection skipAssetCountFetches](self, "skipAssetCountFetches"))
            v19 = objc_msgSend(v15, "countForCollection:", v17);
        }
      }
      PXNavigationListItemWithObject(v12, v19, -[PXNavigationListDataSubsection indentationLevel](self, "indentationLevel"), v5 == v13, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_listItemsCache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v8, v21);

    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; dataSection = %@, indexDelta = %ld, globalStartIndex = %ld>"),
               objc_opt_class(),
               self,
               self->_dataSection,
               self->_indexDelta,
               self->_externalStartIndex);
}

- (PXDataSection)dataSection
{
  return self->_dataSection;
}

- (PXNavigationListDataSection)listDataSection
{
  return self->_listDataSection;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (int64_t)indexDelta
{
  return self->_indexDelta;
}

- (int64_t)expandedIndex
{
  return self->_expandedIndex;
}

- (int64_t)externalStartIndex
{
  return self->_externalStartIndex;
}

- (BOOL)skipAssetCountFetches
{
  return self->_skipAssetCountFetches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listDataSection, 0);
  objc_storeStrong((id *)&self->_dataSection, 0);
  objc_storeStrong((id *)&self->_listItemsCache, 0);
}

@end
