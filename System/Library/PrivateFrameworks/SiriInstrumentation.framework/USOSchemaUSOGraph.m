@implementation USOSchemaUSOGraph

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
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
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)USOSchemaUSOGraph;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v23, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraph version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[USOSchemaUSOGraph deleteVersion](self, "deleteVersion");
  -[USOSchemaUSOGraph linkId](self, "linkId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[USOSchemaUSOGraph deleteLinkId](self, "deleteLinkId");
  -[USOSchemaUSOGraph nodes](self, "nodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraph setNodes:](self, "setNodes:", v13);

  -[USOSchemaUSOGraph edges](self, "edges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraph setEdges:](self, "setEdges:", v15);

  -[USOSchemaUSOGraph identifiers](self, "identifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v16, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraph setIdentifiers:](self, "setIdentifiers:", v17);

  -[USOSchemaUSOGraph alignments](self, "alignments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraph setAlignments:](self, "setAlignments:", v19);

  -[USOSchemaUSOGraph spans](self, "spans");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v20, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraph setSpans:](self, "setSpans:", v21);

  return v5;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)deleteVersion
{
  -[USOSchemaUSOGraph setVersion:](self, "setVersion:", 0);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[USOSchemaUSOGraph setLinkId:](self, "setLinkId:", 0);
}

- (void)clearNodes
{
  -[NSArray removeAllObjects](self->_nodes, "removeAllObjects");
}

- (void)addNodes:(id)a3
{
  id v4;
  NSArray *nodes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  nodes = self->_nodes;
  v8 = v4;
  if (!nodes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_nodes;
    self->_nodes = v6;

    v4 = v8;
    nodes = self->_nodes;
  }
  -[NSArray addObject:](nodes, "addObject:", v4);

}

- (unint64_t)nodesCount
{
  return -[NSArray count](self->_nodes, "count");
}

- (id)nodesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_nodes, "objectAtIndexedSubscript:", a3);
}

- (void)clearEdges
{
  -[NSArray removeAllObjects](self->_edges, "removeAllObjects");
}

- (void)addEdges:(id)a3
{
  id v4;
  NSArray *edges;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  edges = self->_edges;
  v8 = v4;
  if (!edges)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_edges;
    self->_edges = v6;

    v4 = v8;
    edges = self->_edges;
  }
  -[NSArray addObject:](edges, "addObject:", v4);

}

- (unint64_t)edgesCount
{
  return -[NSArray count](self->_edges, "count");
}

- (id)edgesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_edges, "objectAtIndexedSubscript:", a3);
}

- (void)clearIdentifiers
{
  -[NSArray removeAllObjects](self->_identifiers, "removeAllObjects");
}

- (void)addIdentifiers:(id)a3
{
  id v4;
  NSArray *identifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  identifiers = self->_identifiers;
  v8 = v4;
  if (!identifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_identifiers;
    self->_identifiers = v6;

    v4 = v8;
    identifiers = self->_identifiers;
  }
  -[NSArray addObject:](identifiers, "addObject:", v4);

}

- (unint64_t)identifiersCount
{
  return -[NSArray count](self->_identifiers, "count");
}

- (id)identifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", a3);
}

- (void)clearAlignments
{
  -[NSArray removeAllObjects](self->_alignments, "removeAllObjects");
}

- (void)addAlignments:(id)a3
{
  id v4;
  NSArray *alignments;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alignments = self->_alignments;
  v8 = v4;
  if (!alignments)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alignments;
    self->_alignments = v6;

    v4 = v8;
    alignments = self->_alignments;
  }
  -[NSArray addObject:](alignments, "addObject:", v4);

}

- (unint64_t)alignmentsCount
{
  return -[NSArray count](self->_alignments, "count");
}

- (id)alignmentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alignments, "objectAtIndexedSubscript:", a3);
}

- (void)clearSpans
{
  -[NSArray removeAllObjects](self->_spans, "removeAllObjects");
}

- (void)addSpans:(id)a3
{
  id v4;
  NSArray *spans;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  spans = self->_spans;
  v8 = v4;
  if (!spans)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_spans;
    self->_spans = v6;

    v4 = v8;
    spans = self->_spans;
  }
  -[NSArray addObject:](spans, "addObject:", v4);

}

- (unint64_t)spansCount
{
  return -[NSArray count](self->_spans, "count");
}

- (id)spansAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_spans, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOGraphReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[USOSchemaUSOGraph version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[USOSchemaUSOGraph version](self, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[USOSchemaUSOGraph linkId](self, "linkId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[USOSchemaUSOGraph linkId](self, "linkId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = self->_nodes;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
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
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v11);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v14 = self->_edges;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v47;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v16);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = self->_identifiers;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v21);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = self->_alignments;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    }
    while (v26);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = self->_spans;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v31);
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
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[USOSchemaUSOGraph version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[USOSchemaUSOGraph version](self, "version");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[USOSchemaUSOGraph version](self, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[USOSchemaUSOGraph linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[USOSchemaUSOGraph linkId](self, "linkId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[USOSchemaUSOGraph linkId](self, "linkId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[USOSchemaUSOGraph nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[USOSchemaUSOGraph nodes](self, "nodes");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[USOSchemaUSOGraph nodes](self, "nodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[USOSchemaUSOGraph edges](self, "edges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "edges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[USOSchemaUSOGraph edges](self, "edges");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[USOSchemaUSOGraph edges](self, "edges");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "edges");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[USOSchemaUSOGraph identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[USOSchemaUSOGraph identifiers](self, "identifiers");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[USOSchemaUSOGraph identifiers](self, "identifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[USOSchemaUSOGraph alignments](self, "alignments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[USOSchemaUSOGraph alignments](self, "alignments");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[USOSchemaUSOGraph alignments](self, "alignments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignments");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[USOSchemaUSOGraph spans](self, "spans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[USOSchemaUSOGraph spans](self, "spans");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[USOSchemaUSOGraph spans](self, "spans");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spans");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[SISchemaVersion hash](self->_version, "hash");
  v4 = -[SISchemaUUID hash](self->_linkId, "hash") ^ v3;
  v5 = -[NSArray hash](self->_nodes, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_edges, "hash");
  v7 = -[NSArray hash](self->_identifiers, "hash");
  v8 = v7 ^ -[NSArray hash](self->_alignments, "hash");
  return v6 ^ v8 ^ -[NSArray hash](self->_spans, "hash");
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alignments, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v5 = self->_alignments;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v68 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alignments"));
  }
  if (-[NSArray count](self->_edges, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v13 = self->_edges;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("edges"));
  }
  if (-[NSArray count](self->_identifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v21 = self->_identifiers;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v60 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("identifiers"));
  }
  if (self->_linkId)
  {
    -[USOSchemaUSOGraph linkId](self, "linkId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_nodes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v32 = self->_nodes;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v56;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v56 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * m), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v31, "addObject:", v37);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v38);

          }
        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("nodes"));
  }
  if (-[NSArray count](self->_spans, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v40 = self->_spans;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v52;
      do
      {
        for (n = 0; n != v42; ++n)
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v51);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            objc_msgSend(v39, "addObject:", v45);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v46);

          }
        }
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("spans"));
  }
  if (self->_version)
  {
    -[USOSchemaUSOGraph version](self, "version");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("version"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("version"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v51);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOGraph dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOGraph)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOGraph *v5;
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
    self = -[USOSchemaUSOGraph initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOGraph)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOGraph *v5;
  uint64_t v6;
  SISchemaVersion *v7;
  uint64_t v8;
  SISchemaUUID *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  USOSchemaUSONode *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  USOSchemaUSOEdge *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  USOSchemaUSOEntityIdentifier *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  USOSchemaUSOUtteranceAlignment *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  uint64_t v49;
  USOSchemaUSOEntitySpan *v50;
  USOSchemaUSOGraph *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)USOSchemaUSOGraph;
  v5 = -[USOSchemaUSOGraph init](&v79, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v6);
      -[USOSchemaUSOGraph setVersion:](v5, "setVersion:", v7);

    }
    v55 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[USOSchemaUSOGraph setLinkId:](v5, "setLinkId:", v9);

    }
    v54 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nodes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v76 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[USOSchemaUSONode initWithDictionary:]([USOSchemaUSONode alloc], "initWithDictionary:", v16);
              -[USOSchemaUSOGraph addNodes:](v5, "addNodes:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        }
        while (v13);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("edges"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v72 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[USOSchemaUSOEdge initWithDictionary:]([USOSchemaUSOEdge alloc], "initWithDictionary:", v24);
              -[USOSchemaUSOGraph addEdges:](v5, "addEdges:", v25);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        }
        while (v21);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifiers"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v68;
        do
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v68 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v33 = -[USOSchemaUSOEntityIdentifier initWithDictionary:]([USOSchemaUSOEntityIdentifier alloc], "initWithDictionary:", v32);
              -[USOSchemaUSOGraph addIdentifiers:](v5, "addIdentifiers:", v33);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
        }
        while (v29);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignments"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v35 = v34;
      v36 = v34;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v64;
        do
        {
          for (m = 0; m != v38; ++m)
          {
            if (*(_QWORD *)v64 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v42 = -[USOSchemaUSOUtteranceAlignment initWithDictionary:]([USOSchemaUSOUtteranceAlignment alloc], "initWithDictionary:", v41);
              -[USOSchemaUSOGraph addAlignments:](v5, "addAlignments:", v42);

            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
        }
        while (v38);
      }

      v34 = v35;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spans"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = v34;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v44 = v43;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v60;
        do
        {
          for (n = 0; n != v46; ++n)
          {
            if (*(_QWORD *)v60 != v47)
              objc_enumerationMutation(v44);
            v49 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v50 = -[USOSchemaUSOEntitySpan initWithDictionary:]([USOSchemaUSOEntitySpan alloc], "initWithDictionary:", v49);
              -[USOSchemaUSOGraph addSpans:](v5, "addSpans:", v50);

            }
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
        }
        while (v46);
      }

      v34 = v53;
    }
    v51 = v5;

  }
  return v5;
}

- (SISchemaVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
