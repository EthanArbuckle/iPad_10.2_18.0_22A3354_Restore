@implementation SIRINLUEXTERNALUsoGraph

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)clearNodes
{
  -[NSMutableArray removeAllObjects](self->_nodes, "removeAllObjects");
}

- (void)addNodes:(id)a3
{
  id v4;
  NSMutableArray *nodes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nodes = self->_nodes;
  v8 = v4;
  if (!nodes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nodes;
    self->_nodes = v6;

    v4 = v8;
    nodes = self->_nodes;
  }
  -[NSMutableArray addObject:](nodes, "addObject:", v4);

}

- (unint64_t)nodesCount
{
  return -[NSMutableArray count](self->_nodes, "count");
}

- (id)nodesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nodes, "objectAtIndex:", a3);
}

- (void)clearEdges
{
  -[NSMutableArray removeAllObjects](self->_edges, "removeAllObjects");
}

- (void)addEdges:(id)a3
{
  id v4;
  NSMutableArray *edges;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  edges = self->_edges;
  v8 = v4;
  if (!edges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_edges;
    self->_edges = v6;

    v4 = v8;
    edges = self->_edges;
  }
  -[NSMutableArray addObject:](edges, "addObject:", v4);

}

- (unint64_t)edgesCount
{
  return -[NSMutableArray count](self->_edges, "count");
}

- (id)edgesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_edges, "objectAtIndex:", a3);
}

- (void)clearIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_identifiers, "removeAllObjects");
}

- (void)addIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *identifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  identifiers = self->_identifiers;
  v8 = v4;
  if (!identifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_identifiers;
    self->_identifiers = v6;

    v4 = v8;
    identifiers = self->_identifiers;
  }
  -[NSMutableArray addObject:](identifiers, "addObject:", v4);

}

- (unint64_t)identifiersCount
{
  return -[NSMutableArray count](self->_identifiers, "count");
}

- (id)identifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_identifiers, "objectAtIndex:", a3);
}

- (void)clearAlignments
{
  -[NSMutableArray removeAllObjects](self->_alignments, "removeAllObjects");
}

- (void)addAlignments:(id)a3
{
  id v4;
  NSMutableArray *alignments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  alignments = self->_alignments;
  v8 = v4;
  if (!alignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_alignments;
    self->_alignments = v6;

    v4 = v8;
    alignments = self->_alignments;
  }
  -[NSMutableArray addObject:](alignments, "addObject:", v4);

}

- (unint64_t)alignmentsCount
{
  return -[NSMutableArray count](self->_alignments, "count");
}

- (id)alignmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_alignments, "objectAtIndex:", a3);
}

- (void)clearSpans
{
  -[NSMutableArray removeAllObjects](self->_spans, "removeAllObjects");
}

- (void)addSpans:(id)a3
{
  id v4;
  NSMutableArray *spans;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  spans = self->_spans;
  v8 = v4;
  if (!spans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_spans;
    self->_spans = v6;

    v4 = v8;
    spans = self->_spans;
  }
  -[NSMutableArray addObject:](spans, "addObject:", v4);

}

- (unint64_t)spansCount
{
  return -[NSMutableArray count](self->_spans, "count");
}

- (id)spansAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_spans, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoGraph;
  -[SIRINLUEXTERNALUsoGraph description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoGraph dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALSemVer *version;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  if (version)
  {
    -[SIRINLUEXTERNALSemVer dictionaryRepresentation](version, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  }
  if (-[NSMutableArray count](self->_nodes, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_nodes, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v7 = self->_nodes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v59 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("nodes"));
  }
  if (-[NSMutableArray count](self->_edges, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_edges, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v14 = self->_edges;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v55 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("edges"));
  }
  if (-[NSMutableArray count](self->_identifiers, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_identifiers, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v21 = self->_identifiers;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v51 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("identifiers"));
  }
  if (-[NSMutableArray count](self->_alignments, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_alignments, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = self->_alignments;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * m), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("alignments"));
  }
  if (-[NSMutableArray count](self->_spans, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_spans, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = self->_spans;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v43;
      do
      {
        for (n = 0; n != v37; ++n)
        {
          if (*(_QWORD *)v43 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v42);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
      }
      while (v37);
    }

    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("spans"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoGraphReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_version)
    PBDataWriterWriteSubmessage();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = self->_nodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_edges;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_identifiers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_alignments;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_spans;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

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
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  id v24;

  v24 = a3;
  if (self->_version)
    objc_msgSend(v24, "setVersion:");
  if (-[SIRINLUEXTERNALUsoGraph nodesCount](self, "nodesCount"))
  {
    objc_msgSend(v24, "clearNodes");
    v4 = -[SIRINLUEXTERNALUsoGraph nodesCount](self, "nodesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALUsoGraph nodesAtIndex:](self, "nodesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addNodes:", v7);

      }
    }
  }
  if (-[SIRINLUEXTERNALUsoGraph edgesCount](self, "edgesCount"))
  {
    objc_msgSend(v24, "clearEdges");
    v8 = -[SIRINLUEXTERNALUsoGraph edgesCount](self, "edgesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[SIRINLUEXTERNALUsoGraph edgesAtIndex:](self, "edgesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addEdges:", v11);

      }
    }
  }
  if (-[SIRINLUEXTERNALUsoGraph identifiersCount](self, "identifiersCount"))
  {
    objc_msgSend(v24, "clearIdentifiers");
    v12 = -[SIRINLUEXTERNALUsoGraph identifiersCount](self, "identifiersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[SIRINLUEXTERNALUsoGraph identifiersAtIndex:](self, "identifiersAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addIdentifiers:", v15);

      }
    }
  }
  if (-[SIRINLUEXTERNALUsoGraph alignmentsCount](self, "alignmentsCount"))
  {
    objc_msgSend(v24, "clearAlignments");
    v16 = -[SIRINLUEXTERNALUsoGraph alignmentsCount](self, "alignmentsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[SIRINLUEXTERNALUsoGraph alignmentsAtIndex:](self, "alignmentsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addAlignments:", v19);

      }
    }
  }
  if (-[SIRINLUEXTERNALUsoGraph spansCount](self, "spansCount"))
  {
    objc_msgSend(v24, "clearSpans");
    v20 = -[SIRINLUEXTERNALUsoGraph spansCount](self, "spansCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[SIRINLUEXTERNALUsoGraph spansAtIndex:](self, "spansAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSpans:", v23);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALSemVer copyWithZone:](self->_version, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v8 = self->_nodes;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v56;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addNodes:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v10);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = self->_edges;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v52;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend(v5, "addEdges:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v16);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = self->_identifiers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v48;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend(v5, "addIdentifiers:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v22);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = self->_alignments;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v44;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v30), "copyWithZone:", a3);
        objc_msgSend(v5, "addAlignments:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v28);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = self->_spans;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v40;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v36), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend(v5, "addSpans:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v34);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALSemVer *version;
  NSMutableArray *nodes;
  NSMutableArray *edges;
  NSMutableArray *identifiers;
  NSMutableArray *alignments;
  NSMutableArray *spans;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((version = self->_version, !((unint64_t)version | v4[6]))
     || -[SIRINLUEXTERNALSemVer isEqual:](version, "isEqual:"))
    && ((nodes = self->_nodes, !((unint64_t)nodes | v4[4]))
     || -[NSMutableArray isEqual:](nodes, "isEqual:"))
    && ((edges = self->_edges, !((unint64_t)edges | v4[2]))
     || -[NSMutableArray isEqual:](edges, "isEqual:"))
    && ((identifiers = self->_identifiers, !((unint64_t)identifiers | v4[3]))
     || -[NSMutableArray isEqual:](identifiers, "isEqual:"))
    && ((alignments = self->_alignments, !((unint64_t)alignments | v4[1]))
     || -[NSMutableArray isEqual:](alignments, "isEqual:")))
  {
    spans = self->_spans;
    if ((unint64_t)spans | v4[5])
      v11 = -[NSMutableArray isEqual:](spans, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SIRINLUEXTERNALSemVer hash](self->_version, "hash");
  v4 = -[NSMutableArray hash](self->_nodes, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_edges, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_identifiers, "hash");
  v7 = -[NSMutableArray hash](self->_alignments, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_spans, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALSemVer *version;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  __int128 v32;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  version = self->_version;
  v6 = *((_QWORD *)v4 + 6);
  if (version)
  {
    if (v6)
      -[SIRINLUEXTERNALSemVer mergeFrom:](version, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUsoGraph setVersion:](self, "setVersion:");
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALUsoGraph addNodes:](self, "addNodes:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = *((id *)v4 + 2);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALUsoGraph addEdges:](self, "addEdges:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = *((id *)v4 + 3);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        -[SIRINLUEXTERNALUsoGraph addIdentifiers:](self, "addIdentifiers:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = *((id *)v4 + 1);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        -[SIRINLUEXTERNALUsoGraph addAlignments:](self, "addAlignments:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = *((id *)v4 + 5);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        -[SIRINLUEXTERNALUsoGraph addSpans:](self, "addSpans:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * n), (_QWORD)v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

}

- (SIRINLUEXTERNALSemVer)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
}

- (NSMutableArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSMutableArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_alignments, a3);
}

- (NSMutableArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
  objc_storeStrong((id *)&self->_spans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
}

+ (Class)nodesType
{
  return (Class)objc_opt_class();
}

+ (Class)edgesType
{
  return (Class)objc_opt_class();
}

+ (Class)identifiersType
{
  return (Class)objc_opt_class();
}

+ (Class)alignmentsType
{
  return (Class)objc_opt_class();
}

+ (Class)spansType
{
  return (Class)objc_opt_class();
}

@end
