@implementation _SFPBDrillDownMetadata

- (_SFPBDrillDownMetadata)initWithFacade:(id)a3
{
  id v4;
  _SFPBDrillDownMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _SFPBCardMetadata *v27;
  void *v28;
  _SFPBCardMetadata *v29;
  void *v30;
  _SFPBEntitySearchMetadata *v31;
  void *v32;
  _SFPBEntitySearchMetadata *v33;
  void *v34;
  _SFPBCardSearchMetadata *v35;
  void *v36;
  _SFPBCardSearchMetadata *v37;
  void *v38;
  _SFPBEntitySearchMetadata *v39;
  void *v40;
  _SFPBEntitySearchMetadata *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _SFPBDrillDownMetadata *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBDrillDownMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "cardIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "cardIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDrillDownMetadata setCardIdentifier:](v5, "setCardIdentifier:", v7);

    }
    objc_msgSend(v4, "cardIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "cardIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(v10);
          if (*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i))
            objc_msgSend(v9, "addObject:");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v12);
    }

    -[_SFPBDrillDownMetadata setCardIdentifiers:](v5, "setCardIdentifiers:", v9);
    objc_msgSend(v4, "cardDomains");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v16 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "cardDomains", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v17);
          if (*(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j))
            objc_msgSend(v16, "addObject:");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v19);
    }

    -[_SFPBDrillDownMetadata setCardDomains:](v5, "setCardDomains:", v16);
    objc_msgSend(v4, "qtype");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "qtype");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDrillDownMetadata setQtype:](v5, "setQtype:", v23);

    }
    objc_msgSend(v4, "viewConfigName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "viewConfigName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDrillDownMetadata setViewConfigName:](v5, "setViewConfigName:", v25);

    }
    if (objc_msgSend(v4, "hasCardOnlyMetadata"))
    {
      objc_msgSend(v4, "cardOnlyMetadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = [_SFPBCardMetadata alloc];
        objc_msgSend(v4, "cardOnlyMetadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[_SFPBCardMetadata initWithFacade:](v27, "initWithFacade:", v28);
        -[_SFPBDrillDownMetadata setCardOnlyMetadata:](v5, "setCardOnlyMetadata:", v29);

      }
    }
    if (objc_msgSend(v4, "hasEntitySearchOnlyMetadata"))
    {
      objc_msgSend(v4, "entitySearchOnlyMetadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = [_SFPBEntitySearchMetadata alloc];
        objc_msgSend(v4, "entitySearchOnlyMetadata");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[_SFPBEntitySearchMetadata initWithFacade:](v31, "initWithFacade:", v32);
        -[_SFPBDrillDownMetadata setEntitySearchOnlyMetadata:](v5, "setEntitySearchOnlyMetadata:", v33);

      }
    }
    if (objc_msgSend(v4, "hasCardSearchMetadata"))
    {
      objc_msgSend(v4, "cardSearchMetadata");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = [_SFPBCardSearchMetadata alloc];
        objc_msgSend(v4, "cardSearchMetadata");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[_SFPBCardSearchMetadata initWithFacade:](v35, "initWithFacade:", v36);
        -[_SFPBDrillDownMetadata setCardSearchMetadata:](v5, "setCardSearchMetadata:", v37);

      }
    }
    if (objc_msgSend(v4, "hasEntitySearchMetadata"))
    {
      objc_msgSend(v4, "entitySearchMetadata");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        v39 = [_SFPBEntitySearchMetadata alloc];
        objc_msgSend(v4, "entitySearchMetadata");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[_SFPBEntitySearchMetadata initWithFacade:](v39, "initWithFacade:", v40);
        -[_SFPBDrillDownMetadata setEntitySearchMetadata:](v5, "setEntitySearchMetadata:", v41);

      }
    }
    objc_msgSend(v4, "debugParams");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "debugParams");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDrillDownMetadata setDebugParams:](v5, "setDebugParams:", v43);

    }
    objc_msgSend(v4, "params");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "params");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDrillDownMetadata setParams:](v5, "setParams:", v45);

    }
    v46 = v5;

  }
  return v5;
}

- (void)setCardIdentifier:(id)a3
{
  NSString *v4;
  NSString *cardIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  cardIdentifier = self->_cardIdentifier;
  self->_cardIdentifier = v4;

}

- (void)setCardIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *cardIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cardIdentifiers = self->_cardIdentifiers;
  self->_cardIdentifiers = v4;

}

- (void)clearCardIdentifiers
{
  -[NSArray removeAllObjects](self->_cardIdentifiers, "removeAllObjects");
}

- (void)addCardIdentifiers:(id)a3
{
  id v4;
  NSArray *cardIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  cardIdentifiers = self->_cardIdentifiers;
  v8 = v4;
  if (!cardIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cardIdentifiers;
    self->_cardIdentifiers = v6;

    v4 = v8;
    cardIdentifiers = self->_cardIdentifiers;
  }
  -[NSArray addObject:](cardIdentifiers, "addObject:", v4);

}

- (unint64_t)cardIdentifiersCount
{
  return -[NSArray count](self->_cardIdentifiers, "count");
}

- (id)cardIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_cardIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setCardDomains:(id)a3
{
  NSArray *v4;
  NSArray *cardDomains;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cardDomains = self->_cardDomains;
  self->_cardDomains = v4;

}

- (void)clearCardDomains
{
  -[NSArray removeAllObjects](self->_cardDomains, "removeAllObjects");
}

- (void)addCardDomains:(id)a3
{
  id v4;
  NSArray *cardDomains;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  cardDomains = self->_cardDomains;
  v8 = v4;
  if (!cardDomains)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cardDomains;
    self->_cardDomains = v6;

    v4 = v8;
    cardDomains = self->_cardDomains;
  }
  -[NSArray addObject:](cardDomains, "addObject:", v4);

}

- (unint64_t)cardDomainsCount
{
  return -[NSArray count](self->_cardDomains, "count");
}

- (id)cardDomainsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_cardDomains, "objectAtIndexedSubscript:", a3);
}

- (void)setQtype:(id)a3
{
  NSString *v4;
  NSString *qtype;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  qtype = self->_qtype;
  self->_qtype = v4;

}

- (void)setViewConfigName:(id)a3
{
  NSString *v4;
  NSString *viewConfigName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  viewConfigName = self->_viewConfigName;
  self->_viewConfigName = v4;

}

- (void)setCardOnlyMetadata:(id)a3
{
  _SFPBCardMetadata *v4;
  _SFPBEntitySearchMetadata *entitySearchOnlyMetadata;
  _SFPBCardSearchMetadata *cardSearchMetadata;
  _SFPBEntitySearchMetadata *entitySearchMetadata;
  _SFPBCardMetadata *cardOnlyMetadata;

  v4 = (_SFPBCardMetadata *)a3;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

  self->_whichMetadata = v4 != 0;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = v4;

}

- (_SFPBCardMetadata)cardOnlyMetadata
{
  if (self->_whichMetadata == 1)
    return self->_cardOnlyMetadata;
  else
    return (_SFPBCardMetadata *)0;
}

- (void)setEntitySearchOnlyMetadata:(id)a3
{
  _SFPBEntitySearchMetadata *v4;
  _SFPBCardMetadata *cardOnlyMetadata;
  _SFPBCardSearchMetadata *cardSearchMetadata;
  _SFPBEntitySearchMetadata *entitySearchMetadata;
  _SFPBEntitySearchMetadata *entitySearchOnlyMetadata;

  v4 = (_SFPBEntitySearchMetadata *)a3;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

  self->_whichMetadata = 2 * (v4 != 0);
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = v4;

}

- (_SFPBEntitySearchMetadata)entitySearchOnlyMetadata
{
  if (self->_whichMetadata == 2)
    return self->_entitySearchOnlyMetadata;
  else
    return (_SFPBEntitySearchMetadata *)0;
}

- (void)setCardSearchMetadata:(id)a3
{
  _SFPBCardSearchMetadata *v4;
  _SFPBCardMetadata *cardOnlyMetadata;
  _SFPBEntitySearchMetadata *entitySearchOnlyMetadata;
  _SFPBEntitySearchMetadata *entitySearchMetadata;
  unint64_t v8;
  _SFPBCardSearchMetadata *cardSearchMetadata;

  v4 = (_SFPBCardSearchMetadata *)a3;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichMetadata = v8;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = v4;

}

- (_SFPBCardSearchMetadata)cardSearchMetadata
{
  if (self->_whichMetadata == 3)
    return self->_cardSearchMetadata;
  else
    return (_SFPBCardSearchMetadata *)0;
}

- (void)setEntitySearchMetadata:(id)a3
{
  _SFPBEntitySearchMetadata *v4;
  _SFPBCardMetadata *cardOnlyMetadata;
  _SFPBEntitySearchMetadata *entitySearchOnlyMetadata;
  _SFPBCardSearchMetadata *cardSearchMetadata;
  _SFPBEntitySearchMetadata *entitySearchMetadata;

  v4 = (_SFPBEntitySearchMetadata *)a3;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  self->_whichMetadata = 4 * (v4 != 0);
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = v4;

}

- (_SFPBEntitySearchMetadata)entitySearchMetadata
{
  if (self->_whichMetadata == 4)
    return self->_entitySearchMetadata;
  else
    return (_SFPBEntitySearchMetadata *)0;
}

- (void)setDebugParams:(id)a3
{
  NSString *v4;
  NSString *debugParams;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  debugParams = self->_debugParams;
  self->_debugParams = v4;

}

- (void)setParams:(id)a3
{
  NSString *v4;
  NSString *params;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  params = self->_params;
  self->_params = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDrillDownMetadataReadFrom(self, (uint64_t)a3);
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  -[_SFPBDrillDownMetadata cardDomains](self, "cardDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }

  -[_SFPBDrillDownMetadata qtype](self, "qtype");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBDrillDownMetadata viewConfigName](self, "viewConfigName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

  -[_SFPBDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBDrillDownMetadata debugParams](self, "debugParams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteStringField();

  -[_SFPBDrillDownMetadata params](self, "params");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteStringField();

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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  BOOL v62;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  -[_SFPBDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBDrillDownMetadata cardIdentifier](self, "cardIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata cardDomains](self, "cardDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata cardDomains](self, "cardDomains");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBDrillDownMetadata cardDomains](self, "cardDomains");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardDomains");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata qtype](self, "qtype");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "qtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata qtype](self, "qtype");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBDrillDownMetadata qtype](self, "qtype");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "qtype");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata viewConfigName](self, "viewConfigName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewConfigName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata viewConfigName](self, "viewConfigName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBDrillDownMetadata viewConfigName](self, "viewConfigName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewConfigName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardOnlyMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardOnlyMetadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySearchOnlyMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySearchOnlyMetadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSearchMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSearchMetadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySearchMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySearchMetadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata debugParams](self, "debugParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBDrillDownMetadata debugParams](self, "debugParams");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBDrillDownMetadata debugParams](self, "debugParams");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugParams");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBDrillDownMetadata params](self, "params");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "params");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBDrillDownMetadata params](self, "params");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
    {

LABEL_60:
      v62 = 1;
      goto LABEL_58;
    }
    v58 = (void *)v57;
    -[_SFPBDrillDownMetadata params](self, "params");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "params");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if ((v61 & 1) != 0)
      goto LABEL_60;
  }
  else
  {
LABEL_56:

  }
LABEL_57:
  v62 = 0;
LABEL_58:

  return v62;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_cardIdentifier, "hash");
  v4 = -[NSArray hash](self->_cardIdentifiers, "hash") ^ v3;
  v5 = -[NSArray hash](self->_cardDomains, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_qtype, "hash");
  v7 = -[NSString hash](self->_viewConfigName, "hash");
  v8 = v7 ^ -[_SFPBCardMetadata hash](self->_cardOnlyMetadata, "hash");
  v9 = v6 ^ v8 ^ -[_SFPBEntitySearchMetadata hash](self->_entitySearchOnlyMetadata, "hash");
  v10 = -[_SFPBCardSearchMetadata hash](self->_cardSearchMetadata, "hash");
  v11 = v10 ^ -[_SFPBEntitySearchMetadata hash](self->_entitySearchMetadata, "hash");
  v12 = v11 ^ -[NSString hash](self->_debugParams, "hash");
  return v9 ^ v12 ^ -[NSString hash](self->_params, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cardDomains)
  {
    -[_SFPBDrillDownMetadata cardDomains](self, "cardDomains");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cardDomains"));

  }
  if (self->_cardIdentifier)
  {
    -[_SFPBDrillDownMetadata cardIdentifier](self, "cardIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cardIdentifier"));

  }
  if (self->_cardIdentifiers)
  {
    -[_SFPBDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cardIdentifiers"));

  }
  if (self->_cardOnlyMetadata)
  {
    -[_SFPBDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cardOnlyMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cardOnlyMetadata"));

    }
  }
  if (self->_cardSearchMetadata)
  {
    -[_SFPBDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cardSearchMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cardSearchMetadata"));

    }
  }
  if (self->_debugParams)
  {
    -[_SFPBDrillDownMetadata debugParams](self, "debugParams");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("debugParams"));

  }
  if (self->_entitySearchMetadata)
  {
    -[_SFPBDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("entitySearchMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("entitySearchMetadata"));

    }
  }
  if (self->_entitySearchOnlyMetadata)
  {
    -[_SFPBDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("entitySearchOnlyMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("entitySearchOnlyMetadata"));

    }
  }
  if (self->_params)
  {
    -[_SFPBDrillDownMetadata params](self, "params");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("params"));

  }
  if (self->_qtype)
  {
    -[_SFPBDrillDownMetadata qtype](self, "qtype");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("qtype"));

  }
  if (self->_viewConfigName)
  {
    -[_SFPBDrillDownMetadata viewConfigName](self, "viewConfigName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("viewConfigName"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDrillDownMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDrillDownMetadata)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDrillDownMetadata *v5;
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
    self = -[_SFPBDrillDownMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDrillDownMetadata)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDrillDownMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _SFPBCardMetadata *v29;
  void *v30;
  _SFPBEntitySearchMetadata *v31;
  void *v32;
  _SFPBCardSearchMetadata *v33;
  void *v34;
  _SFPBEntitySearchMetadata *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _SFPBDrillDownMetadata *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_SFPBDrillDownMetadata;
  v5 = -[_SFPBDrillDownMetadata init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBDrillDownMetadata setCardIdentifier:](v5, "setCardIdentifier:", v7);

    }
    v45 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardIdentifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v51;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v51 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy");
              -[_SFPBDrillDownMetadata addCardIdentifiers:](v5, "addCardIdentifiers:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardDomains"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v47;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v47 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = (void *)objc_msgSend(v22, "copy");
              -[_SFPBDrillDownMetadata addCardDomains:](v5, "addCardDomains:", v23);

            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        }
        while (v19);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qtype"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBDrillDownMetadata setQtype:](v5, "setQtype:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewConfigName"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBDrillDownMetadata setViewConfigName:](v5, "setViewConfigName:", v27);

    }
    v43 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardOnlyMetadata"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBCardMetadata initWithDictionary:]([_SFPBCardMetadata alloc], "initWithDictionary:", v28);
      -[_SFPBDrillDownMetadata setCardOnlyMetadata:](v5, "setCardOnlyMetadata:", v29);

    }
    v44 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySearchOnlyMetadata"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBEntitySearchMetadata initWithDictionary:]([_SFPBEntitySearchMetadata alloc], "initWithDictionary:", v30);
      -[_SFPBDrillDownMetadata setEntitySearchOnlyMetadata:](v5, "setEntitySearchOnlyMetadata:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardSearchMetadata"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBCardSearchMetadata initWithDictionary:]([_SFPBCardSearchMetadata alloc], "initWithDictionary:", v32);
      -[_SFPBDrillDownMetadata setCardSearchMetadata:](v5, "setCardSearchMetadata:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySearchMetadata"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBEntitySearchMetadata initWithDictionary:]([_SFPBEntitySearchMetadata alloc], "initWithDictionary:", v34);
      -[_SFPBDrillDownMetadata setEntitySearchMetadata:](v5, "setEntitySearchMetadata:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugParams"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = (void *)objc_msgSend(v36, "copy");
      -[_SFPBDrillDownMetadata setDebugParams:](v5, "setDebugParams:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("params"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = (void *)objc_msgSend(v38, "copy");
      -[_SFPBDrillDownMetadata setParams:](v5, "setParams:", v39);

    }
    v40 = v5;

  }
  return v5;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (NSArray)cardIdentifiers
{
  return self->_cardIdentifiers;
}

- (NSArray)cardDomains
{
  return self->_cardDomains;
}

- (NSString)qtype
{
  return self->_qtype;
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (NSString)debugParams
{
  return self->_debugParams;
}

- (NSString)params
{
  return self->_params;
}

- (unint64_t)whichMetadata
{
  return self->_whichMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_debugParams, 0);
  objc_storeStrong((id *)&self->_entitySearchMetadata, 0);
  objc_storeStrong((id *)&self->_cardSearchMetadata, 0);
  objc_storeStrong((id *)&self->_entitySearchOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_cardOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_qtype, 0);
  objc_storeStrong((id *)&self->_cardDomains, 0);
  objc_storeStrong((id *)&self->_cardIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

@end
