@implementation ODCurareReportFillerReport

- (void)clearModelInformationLists
{
  -[NSMutableArray removeAllObjects](self->_modelInformationLists, "removeAllObjects");
}

- (void)addModelInformationList:(id)a3
{
  id v4;
  NSMutableArray *modelInformationLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  modelInformationLists = self->_modelInformationLists;
  v8 = v4;
  if (!modelInformationLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_modelInformationLists;
    self->_modelInformationLists = v6;

    v4 = v8;
    modelInformationLists = self->_modelInformationLists;
  }
  -[NSMutableArray addObject:](modelInformationLists, "addObject:", v4);

}

- (unint64_t)modelInformationListsCount
{
  return -[NSMutableArray count](self->_modelInformationLists, "count");
}

- (id)modelInformationListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_modelInformationLists, "objectAtIndex:", a3);
}

+ (Class)modelInformationListType
{
  return (Class)objc_opt_class();
}

- (void)clearMetadataLists
{
  -[NSMutableArray removeAllObjects](self->_metadataLists, "removeAllObjects");
}

- (void)addMetadataList:(id)a3
{
  id v4;
  NSMutableArray *metadataLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  metadataLists = self->_metadataLists;
  v8 = v4;
  if (!metadataLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_metadataLists;
    self->_metadataLists = v6;

    v4 = v8;
    metadataLists = self->_metadataLists;
  }
  -[NSMutableArray addObject:](metadataLists, "addObject:", v4);

}

- (unint64_t)metadataListsCount
{
  return -[NSMutableArray count](self->_metadataLists, "count");
}

- (id)metadataListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_metadataLists, "objectAtIndex:", a3);
}

+ (Class)metadataListType
{
  return (Class)objc_opt_class();
}

- (void)clearModelEvaluationSummaries
{
  -[NSMutableArray removeAllObjects](self->_modelEvaluationSummaries, "removeAllObjects");
}

- (void)addModelEvaluationSummaries:(id)a3
{
  id v4;
  NSMutableArray *modelEvaluationSummaries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  modelEvaluationSummaries = self->_modelEvaluationSummaries;
  v8 = v4;
  if (!modelEvaluationSummaries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_modelEvaluationSummaries;
    self->_modelEvaluationSummaries = v6;

    v4 = v8;
    modelEvaluationSummaries = self->_modelEvaluationSummaries;
  }
  -[NSMutableArray addObject:](modelEvaluationSummaries, "addObject:", v4);

}

- (unint64_t)modelEvaluationSummariesCount
{
  return -[NSMutableArray count](self->_modelEvaluationSummaries, "count");
}

- (id)modelEvaluationSummariesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_modelEvaluationSummaries, "objectAtIndex:", a3);
}

+ (Class)modelEvaluationSummariesType
{
  return (Class)objc_opt_class();
}

- (void)clearPersonalizationEvaluationSummaries
{
  -[NSMutableArray removeAllObjects](self->_personalizationEvaluationSummaries, "removeAllObjects");
}

- (void)addPersonalizationEvaluationSummaries:(id)a3
{
  id v4;
  NSMutableArray *personalizationEvaluationSummaries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  personalizationEvaluationSummaries = self->_personalizationEvaluationSummaries;
  v8 = v4;
  if (!personalizationEvaluationSummaries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_personalizationEvaluationSummaries;
    self->_personalizationEvaluationSummaries = v6;

    v4 = v8;
    personalizationEvaluationSummaries = self->_personalizationEvaluationSummaries;
  }
  -[NSMutableArray addObject:](personalizationEvaluationSummaries, "addObject:", v4);

}

- (unint64_t)personalizationEvaluationSummariesCount
{
  return -[NSMutableArray count](self->_personalizationEvaluationSummaries, "count");
}

- (id)personalizationEvaluationSummariesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_personalizationEvaluationSummaries, "objectAtIndex:", a3);
}

+ (Class)personalizationEvaluationSummariesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerReport;
  -[ODCurareReportFillerReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  NSString *bundleIdentifier;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_modelInformationLists, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_modelInformationLists, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v5 = self->_modelInformationLists;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("modelInformationList"));
  }
  if (-[NSMutableArray count](self->_metadataLists, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_metadataLists, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = self->_metadataLists;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("metadataList"));
  }
  if (-[NSMutableArray count](self->_modelEvaluationSummaries, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_modelEvaluationSummaries, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = self->_modelEvaluationSummaries;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("modelEvaluationSummaries"));
  }
  if (-[NSMutableArray count](self->_personalizationEvaluationSummaries, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_personalizationEvaluationSummaries, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = self->_personalizationEvaluationSummaries;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v35);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("personalizationEvaluationSummaries"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_frameworkFailure, (_QWORD)v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("frameworkFailure"));

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_modelInformationLists;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_metadataLists;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_modelEvaluationSummaries;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_personalizationEvaluationSummaries;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  PBDataWriterWriteBOOLField();
  if (!self->_bundleIdentifier)
    -[ODCurareReportFillerReport writeTo:].cold.1();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  _BYTE *v20;

  v20 = a3;
  if (-[ODCurareReportFillerReport modelInformationListsCount](self, "modelInformationListsCount"))
  {
    objc_msgSend(v20, "clearModelInformationLists");
    v4 = -[ODCurareReportFillerReport modelInformationListsCount](self, "modelInformationListsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ODCurareReportFillerReport modelInformationListAtIndex:](self, "modelInformationListAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addModelInformationList:", v7);

      }
    }
  }
  if (-[ODCurareReportFillerReport metadataListsCount](self, "metadataListsCount"))
  {
    objc_msgSend(v20, "clearMetadataLists");
    v8 = -[ODCurareReportFillerReport metadataListsCount](self, "metadataListsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ODCurareReportFillerReport metadataListAtIndex:](self, "metadataListAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addMetadataList:", v11);

      }
    }
  }
  if (-[ODCurareReportFillerReport modelEvaluationSummariesCount](self, "modelEvaluationSummariesCount"))
  {
    objc_msgSend(v20, "clearModelEvaluationSummaries");
    v12 = -[ODCurareReportFillerReport modelEvaluationSummariesCount](self, "modelEvaluationSummariesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[ODCurareReportFillerReport modelEvaluationSummariesAtIndex:](self, "modelEvaluationSummariesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addModelEvaluationSummaries:", v15);

      }
    }
  }
  if (-[ODCurareReportFillerReport personalizationEvaluationSummariesCount](self, "personalizationEvaluationSummariesCount"))
  {
    objc_msgSend(v20, "clearPersonalizationEvaluationSummaries");
    v16 = -[ODCurareReportFillerReport personalizationEvaluationSummariesCount](self, "personalizationEvaluationSummariesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[ODCurareReportFillerReport personalizationEvaluationSummariesAtIndex:](self, "personalizationEvaluationSummariesAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPersonalizationEvaluationSummaries:", v19);

      }
    }
  }
  v20[48] = self->_frameworkFailure;
  objc_msgSend(v20, "setBundleIdentifier:", self->_bundleIdentifier);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = self->_modelInformationLists;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addModelInformationList:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v8);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = self->_metadataLists;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMetadataList:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v14);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = self->_modelEvaluationSummaries;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addModelEvaluationSummaries:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v20);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = self->_personalizationEvaluationSummaries;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addPersonalizationEvaluationSummaries:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v26);
  }

  *(_BYTE *)(v5 + 48) = self->_frameworkFailure;
  v30 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *modelInformationLists;
  NSMutableArray *metadataLists;
  NSMutableArray *modelEvaluationSummaries;
  NSMutableArray *personalizationEvaluationSummaries;
  NSString *bundleIdentifier;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  modelInformationLists = self->_modelInformationLists;
  if ((unint64_t)modelInformationLists | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](modelInformationLists, "isEqual:"))
      goto LABEL_15;
  }
  metadataLists = self->_metadataLists;
  if ((unint64_t)metadataLists | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](metadataLists, "isEqual:"))
      goto LABEL_15;
  }
  modelEvaluationSummaries = self->_modelEvaluationSummaries;
  if ((unint64_t)modelEvaluationSummaries | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](modelEvaluationSummaries, "isEqual:"))
      goto LABEL_15;
  }
  personalizationEvaluationSummaries = self->_personalizationEvaluationSummaries;
  if ((unint64_t)personalizationEvaluationSummaries | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](personalizationEvaluationSummaries, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_frameworkFailure)
  {
    if (*((_BYTE *)v4 + 48))
      goto LABEL_12;
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if (*((_BYTE *)v4 + 48))
    goto LABEL_15;
LABEL_12:
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
    v10 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  else
    v10 = 1;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_modelInformationLists, "hash");
  v4 = -[NSMutableArray hash](self->_metadataLists, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_modelEvaluationSummaries, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_personalizationEvaluationSummaries, "hash");
  v7 = 2654435761 * self->_frameworkFailure;
  return v6 ^ -[NSString hash](self->_bundleIdentifier, "hash") ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        -[ODCurareReportFillerReport addModelInformationList:](self, "addModelInformationList:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        -[ODCurareReportFillerReport addMetadataList:](self, "addMetadataList:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = *((id *)v4 + 3);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        -[ODCurareReportFillerReport addModelEvaluationSummaries:](self, "addModelEvaluationSummaries:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = *((id *)v4 + 5);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[ODCurareReportFillerReport addPersonalizationEvaluationSummaries:](self, "addPersonalizationEvaluationSummaries:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * m), (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  self->_frameworkFailure = *((_BYTE *)v4 + 48);
  if (*((_QWORD *)v4 + 1))
    -[ODCurareReportFillerReport setBundleIdentifier:](self, "setBundleIdentifier:");

}

- (NSMutableArray)modelInformationLists
{
  return self->_modelInformationLists;
}

- (void)setModelInformationLists:(id)a3
{
  objc_storeStrong((id *)&self->_modelInformationLists, a3);
}

- (NSMutableArray)metadataLists
{
  return self->_metadataLists;
}

- (void)setMetadataLists:(id)a3
{
  objc_storeStrong((id *)&self->_metadataLists, a3);
}

- (NSMutableArray)modelEvaluationSummaries
{
  return self->_modelEvaluationSummaries;
}

- (void)setModelEvaluationSummaries:(id)a3
{
  objc_storeStrong((id *)&self->_modelEvaluationSummaries, a3);
}

- (NSMutableArray)personalizationEvaluationSummaries
{
  return self->_personalizationEvaluationSummaries;
}

- (void)setPersonalizationEvaluationSummaries:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationEvaluationSummaries, a3);
}

- (BOOL)frameworkFailure
{
  return self->_frameworkFailure;
}

- (void)setFrameworkFailure:(BOOL)a3
{
  self->_frameworkFailure = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationEvaluationSummaries, 0);
  objc_storeStrong((id *)&self->_modelInformationLists, 0);
  objc_storeStrong((id *)&self->_modelEvaluationSummaries, 0);
  objc_storeStrong((id *)&self->_metadataLists, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerReport writeTo:]", "ODCurareReportFillerReport.m", 323, "nil != self->_bundleIdentifier");
}

@end
