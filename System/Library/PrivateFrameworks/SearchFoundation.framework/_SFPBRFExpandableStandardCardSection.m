@implementation _SFPBRFExpandableStandardCardSection

- (_SFPBRFExpandableStandardCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFExpandableStandardCardSection *v5;
  void *v6;
  _SFPBRFSummaryItemStandardCardSection *v7;
  void *v8;
  _SFPBRFSummaryItemStandardCardSection *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _SFPBRFExpandingComponentContent *v17;
  _SFPBRFExpandableStandardCardSection *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFExpandableStandardCardSection init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasSummary_item_standard_card_section"))
    {
      objc_msgSend(v4, "summary_item_standard_card_section");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFSummaryItemStandardCardSection alloc];
        objc_msgSend(v4, "summary_item_standard_card_section");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFSummaryItemStandardCardSection initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFExpandableStandardCardSection setSummary_item_standard_card_section:](v5, "setSummary_item_standard_card_section:", v9);

      }
    }
    objc_msgSend(v4, "expanding_component_content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v11 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "expanding_component_content", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = -[_SFPBRFExpandingComponentContent initWithFacade:]([_SFPBRFExpandingComponentContent alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    -[_SFPBRFExpandableStandardCardSection setExpanding_component_contents:](v5, "setExpanding_component_contents:", v11);
    v18 = v5;

  }
  return v5;
}

- (void)setSummary_item_standard_card_section:(id)a3
{
  self->_whichPrimary_Component = a3 != 0;
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, a3);
}

- (_SFPBRFSummaryItemStandardCardSection)summary_item_standard_card_section
{
  if (self->_whichPrimary_Component == 1)
    return self->_summary_item_standard_card_section;
  else
    return (_SFPBRFSummaryItemStandardCardSection *)0;
}

- (void)setExpanding_component_content:(id)a3
{
  NSArray *v4;
  NSArray *expanding_component_contents;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  expanding_component_contents = self->_expanding_component_contents;
  self->_expanding_component_contents = v4;

}

- (void)clearExpanding_component_content
{
  -[NSArray removeAllObjects](self->_expanding_component_contents, "removeAllObjects");
}

- (void)addExpanding_component_content:(id)a3
{
  id v4;
  NSArray *expanding_component_contents;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  expanding_component_contents = self->_expanding_component_contents;
  v8 = v4;
  if (!expanding_component_contents)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_expanding_component_contents;
    self->_expanding_component_contents = v6;

    v4 = v8;
    expanding_component_contents = self->_expanding_component_contents;
  }
  -[NSArray addObject:](expanding_component_contents, "addObject:", v4);

}

- (unint64_t)expanding_component_contentCount
{
  return -[NSArray count](self->_expanding_component_contents, "count");
}

- (id)expanding_component_contentAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_expanding_component_contents, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFExpandableStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFExpandableStandardCardSection expanding_component_contents](self, "expanding_component_contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBRFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary_item_standard_card_section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary_item_standard_card_section");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFExpandableStandardCardSection expanding_component_contents](self, "expanding_component_contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expanding_component_contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFExpandableStandardCardSection expanding_component_contents](self, "expanding_component_contents");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFExpandableStandardCardSection expanding_component_contents](self, "expanding_component_contents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expanding_component_contents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_SFPBRFSummaryItemStandardCardSection hash](self->_summary_item_standard_card_section, "hash");
  return -[NSArray hash](self->_expanding_component_contents, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_expanding_component_contents, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_expanding_component_contents;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("expandingComponentContent"));
  }
  if (self->_summary_item_standard_card_section)
  {
    -[_SFPBRFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("summaryItemStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("summaryItemStandardCardSection"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFExpandableStandardCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBRFExpandableStandardCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFExpandableStandardCardSection *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBRFExpandableStandardCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFExpandableStandardCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFExpandableStandardCardSection *v5;
  void *v6;
  _SFPBRFSummaryItemStandardCardSection *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFPBRFExpandingComponentContent *v15;
  _SFPBRFExpandableStandardCardSection *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBRFExpandableStandardCardSection;
  v5 = -[_SFPBRFExpandableStandardCardSection init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("summaryItemStandardCardSection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFSummaryItemStandardCardSection initWithDictionary:]([_SFPBRFSummaryItemStandardCardSection alloc], "initWithDictionary:", v6);
      -[_SFPBRFExpandableStandardCardSection setSummary_item_standard_card_section:](v5, "setSummary_item_standard_card_section:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expandingComponentContent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBRFExpandingComponentContent initWithDictionary:]([_SFPBRFExpandingComponentContent alloc], "initWithDictionary:", v14);
              -[_SFPBRFExpandableStandardCardSection addExpanding_component_content:](v5, "addExpanding_component_content:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;

  }
  return v5;
}

- (NSArray)expanding_component_contents
{
  return self->_expanding_component_contents;
}

- (void)setExpanding_component_contents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)whichPrimary_Component
{
  return self->_whichPrimary_Component;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanding_component_contents, 0);
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, 0);
}

@end
