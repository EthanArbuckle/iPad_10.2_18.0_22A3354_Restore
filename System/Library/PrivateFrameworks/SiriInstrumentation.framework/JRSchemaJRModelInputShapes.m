@implementation JRSchemaJRModelInputShapes

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearCandidateTuplesShapes
{
  -[NSArray removeAllObjects](self->_candidateTuplesShapes, "removeAllObjects");
}

- (void)addCandidateTuplesShapes:(unsigned int)a3
{
  uint64_t v3;
  NSArray *candidateTuplesShapes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  candidateTuplesShapes = self->_candidateTuplesShapes;
  if (!candidateTuplesShapes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_candidateTuplesShapes;
    self->_candidateTuplesShapes = v6;

    candidateTuplesShapes = self->_candidateTuplesShapes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](candidateTuplesShapes, "addObject:", v8);

}

- (unint64_t)candidateTuplesShapesCount
{
  return -[NSArray count](self->_candidateTuplesShapes, "count");
}

- (unsigned)candidateTuplesShapesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_candidateTuplesShapes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearDeviceContextShapes
{
  -[NSArray removeAllObjects](self->_deviceContextShapes, "removeAllObjects");
}

- (void)addDeviceContextShapes:(unsigned int)a3
{
  uint64_t v3;
  NSArray *deviceContextShapes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  deviceContextShapes = self->_deviceContextShapes;
  if (!deviceContextShapes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_deviceContextShapes;
    self->_deviceContextShapes = v6;

    deviceContextShapes = self->_deviceContextShapes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](deviceContextShapes, "addObject:", v8);

}

- (unint64_t)deviceContextShapesCount
{
  return -[NSArray count](self->_deviceContextShapes, "count");
}

- (unsigned)deviceContextShapesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_deviceContextShapes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearCandidateInteractionsShapes
{
  -[NSArray removeAllObjects](self->_candidateInteractionsShapes, "removeAllObjects");
}

- (void)addCandidateInteractionsShapes:(unsigned int)a3
{
  uint64_t v3;
  NSArray *candidateInteractionsShapes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  candidateInteractionsShapes = self->_candidateInteractionsShapes;
  if (!candidateInteractionsShapes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_candidateInteractionsShapes;
    self->_candidateInteractionsShapes = v6;

    candidateInteractionsShapes = self->_candidateInteractionsShapes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](candidateInteractionsShapes, "addObject:", v8);

}

- (unint64_t)candidateInteractionsShapesCount
{
  return -[NSArray count](self->_candidateInteractionsShapes, "count");
}

- (unsigned)candidateInteractionsShapesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_candidateInteractionsShapes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearTupleInteractionsCandidatesShapes
{
  -[NSArray removeAllObjects](self->_tupleInteractionsCandidatesShapes, "removeAllObjects");
}

- (void)addTupleInteractionsCandidatesShapes:(unsigned int)a3
{
  uint64_t v3;
  NSArray *tupleInteractionsCandidatesShapes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  tupleInteractionsCandidatesShapes = self->_tupleInteractionsCandidatesShapes;
  if (!tupleInteractionsCandidatesShapes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tupleInteractionsCandidatesShapes;
    self->_tupleInteractionsCandidatesShapes = v6;

    tupleInteractionsCandidatesShapes = self->_tupleInteractionsCandidatesShapes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](tupleInteractionsCandidatesShapes, "addObject:", v8);

}

- (unint64_t)tupleInteractionsCandidatesShapesCount
{
  return -[NSArray count](self->_tupleInteractionsCandidatesShapes, "count");
}

- (unsigned)tupleInteractionsCandidatesShapesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_tupleInteractionsCandidatesShapes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearTupleInteractionsAlignmentShapes
{
  -[NSArray removeAllObjects](self->_tupleInteractionsAlignmentShapes, "removeAllObjects");
}

- (void)addTupleInteractionsAlignmentShapes:(unsigned int)a3
{
  uint64_t v3;
  NSArray *tupleInteractionsAlignmentShapes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  tupleInteractionsAlignmentShapes = self->_tupleInteractionsAlignmentShapes;
  if (!tupleInteractionsAlignmentShapes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tupleInteractionsAlignmentShapes;
    self->_tupleInteractionsAlignmentShapes = v6;

    tupleInteractionsAlignmentShapes = self->_tupleInteractionsAlignmentShapes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](tupleInteractionsAlignmentShapes, "addObject:", v8);

}

- (unint64_t)tupleInteractionsAlignmentShapesCount
{
  return -[NSArray count](self->_tupleInteractionsAlignmentShapes, "count");
}

- (unsigned)tupleInteractionsAlignmentShapesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_tupleInteractionsAlignmentShapes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearSimilarityScoresShapes
{
  -[NSArray removeAllObjects](self->_similarityScoresShapes, "removeAllObjects");
}

- (void)addSimilarityScoresShapes:(unsigned int)a3
{
  uint64_t v3;
  NSArray *similarityScoresShapes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  similarityScoresShapes = self->_similarityScoresShapes;
  if (!similarityScoresShapes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_similarityScoresShapes;
    self->_similarityScoresShapes = v6;

    similarityScoresShapes = self->_similarityScoresShapes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](similarityScoresShapes, "addObject:", v8);

}

- (unint64_t)similarityScoresShapesCount
{
  return -[NSArray count](self->_similarityScoresShapes, "count");
}

- (unsigned)similarityScoresShapesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_similarityScoresShapes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRModelInputShapesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = self->_candidateTuplesShapes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v9), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v7);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = self->_deviceContextShapes;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v14), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v12);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = self->_candidateInteractionsShapes;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v19), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v17);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = self->_tupleInteractionsCandidatesShapes;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v24), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    }
    while (v22);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = self->_tupleInteractionsAlignmentShapes;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v29), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    }
    while (v27);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = self->_similarityScoresShapes;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v34), "unsignedIntValue", (_QWORD)v35);
        PBDataWriterWriteUint32Field();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v32);
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
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[JRSchemaJRModelInputShapes candidateTuplesShapes](self, "candidateTuplesShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateTuplesShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[JRSchemaJRModelInputShapes candidateTuplesShapes](self, "candidateTuplesShapes");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[JRSchemaJRModelInputShapes candidateTuplesShapes](self, "candidateTuplesShapes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateTuplesShapes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[JRSchemaJRModelInputShapes deviceContextShapes](self, "deviceContextShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceContextShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[JRSchemaJRModelInputShapes deviceContextShapes](self, "deviceContextShapes");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[JRSchemaJRModelInputShapes deviceContextShapes](self, "deviceContextShapes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceContextShapes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[JRSchemaJRModelInputShapes candidateInteractionsShapes](self, "candidateInteractionsShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateInteractionsShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[JRSchemaJRModelInputShapes candidateInteractionsShapes](self, "candidateInteractionsShapes");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[JRSchemaJRModelInputShapes candidateInteractionsShapes](self, "candidateInteractionsShapes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateInteractionsShapes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[JRSchemaJRModelInputShapes tupleInteractionsCandidatesShapes](self, "tupleInteractionsCandidatesShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tupleInteractionsCandidatesShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[JRSchemaJRModelInputShapes tupleInteractionsCandidatesShapes](self, "tupleInteractionsCandidatesShapes");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[JRSchemaJRModelInputShapes tupleInteractionsCandidatesShapes](self, "tupleInteractionsCandidatesShapes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tupleInteractionsCandidatesShapes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[JRSchemaJRModelInputShapes tupleInteractionsAlignmentShapes](self, "tupleInteractionsAlignmentShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tupleInteractionsAlignmentShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[JRSchemaJRModelInputShapes tupleInteractionsAlignmentShapes](self, "tupleInteractionsAlignmentShapes");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[JRSchemaJRModelInputShapes tupleInteractionsAlignmentShapes](self, "tupleInteractionsAlignmentShapes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tupleInteractionsAlignmentShapes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[JRSchemaJRModelInputShapes similarityScoresShapes](self, "similarityScoresShapes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "similarityScoresShapes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[JRSchemaJRModelInputShapes similarityScoresShapes](self, "similarityScoresShapes");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[JRSchemaJRModelInputShapes similarityScoresShapes](self, "similarityScoresShapes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "similarityScoresShapes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSArray hash](self->_candidateTuplesShapes, "hash");
  v4 = -[NSArray hash](self->_deviceContextShapes, "hash") ^ v3;
  v5 = -[NSArray hash](self->_candidateInteractionsShapes, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_tupleInteractionsCandidatesShapes, "hash");
  v7 = -[NSArray hash](self->_tupleInteractionsAlignmentShapes, "hash");
  return v6 ^ v7 ^ -[NSArray hash](self->_similarityScoresShapes, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_candidateInteractionsShapes, "count"))
  {
    -[JRSchemaJRModelInputShapes candidateInteractionsShapes](self, "candidateInteractionsShapes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("candidateInteractionsShapes"));

  }
  if (-[NSArray count](self->_candidateTuplesShapes, "count"))
  {
    -[JRSchemaJRModelInputShapes candidateTuplesShapes](self, "candidateTuplesShapes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("candidateTuplesShapes"));

  }
  if (-[NSArray count](self->_deviceContextShapes, "count"))
  {
    -[JRSchemaJRModelInputShapes deviceContextShapes](self, "deviceContextShapes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceContextShapes"));

  }
  if (-[NSArray count](self->_similarityScoresShapes, "count"))
  {
    -[JRSchemaJRModelInputShapes similarityScoresShapes](self, "similarityScoresShapes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("similarityScoresShapes"));

  }
  if (-[NSArray count](self->_tupleInteractionsAlignmentShapes, "count"))
  {
    -[JRSchemaJRModelInputShapes tupleInteractionsAlignmentShapes](self, "tupleInteractionsAlignmentShapes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("tupleInteractionsAlignmentShapes"));

  }
  if (-[NSArray count](self->_tupleInteractionsCandidatesShapes, "count"))
  {
    -[JRSchemaJRModelInputShapes tupleInteractionsCandidatesShapes](self, "tupleInteractionsCandidatesShapes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tupleInteractionsCandidatesShapes"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaJRModelInputShapes dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaJRModelInputShapes)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaJRModelInputShapes *v5;
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
    self = -[JRSchemaJRModelInputShapes initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaJRModelInputShapes)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaJRModelInputShapes *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  JRSchemaJRModelInputShapes *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  objc_super v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)JRSchemaJRModelInputShapes;
  v5 = -[JRSchemaJRModelInputShapes init](&v78, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateTuplesShapes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v75 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[JRSchemaJRModelInputShapes addCandidateTuplesShapes:](v5, "addCandidateTuplesShapes:", objc_msgSend(v12, "unsignedIntValue"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceContextShapes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v71 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[JRSchemaJRModelInputShapes addDeviceContextShapes:](v5, "addDeviceContextShapes:", objc_msgSend(v19, "unsignedIntValue"));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        }
        while (v16);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateInteractionsShapes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v67 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[JRSchemaJRModelInputShapes addCandidateInteractionsShapes:](v5, "addCandidateInteractionsShapes:", objc_msgSend(v26, "unsignedIntValue"));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v23);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tupleInteractionsCandidatesShapes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v63;
        do
        {
          for (m = 0; m != v30; ++m)
          {
            if (*(_QWORD *)v63 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[JRSchemaJRModelInputShapes addTupleInteractionsCandidatesShapes:](v5, "addTupleInteractionsCandidatesShapes:", objc_msgSend(v33, "unsignedIntValue"));
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
        }
        while (v30);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tupleInteractionsAlignmentShapes"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v35 = v34;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v59;
        do
        {
          for (n = 0; n != v37; ++n)
          {
            if (*(_QWORD *)v59 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[JRSchemaJRModelInputShapes addTupleInteractionsAlignmentShapes:](v5, "addTupleInteractionsAlignmentShapes:", objc_msgSend(v40, "unsignedIntValue"));
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
        }
        while (v37);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("similarityScoresShapes"), v27);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v42 = v41;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v79, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v55;
        do
        {
          for (ii = 0; ii != v44; ++ii)
          {
            if (*(_QWORD *)v55 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[JRSchemaJRModelInputShapes addSimilarityScoresShapes:](v5, "addSimilarityScoresShapes:", objc_msgSend(v47, "unsignedIntValue"));
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v79, 16);
        }
        while (v44);
      }

      v27 = v50;
    }
    v48 = v5;

  }
  return v5;
}

- (NSArray)candidateTuplesShapes
{
  return self->_candidateTuplesShapes;
}

- (void)setCandidateTuplesShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)deviceContextShapes
{
  return self->_deviceContextShapes;
}

- (void)setDeviceContextShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)candidateInteractionsShapes
{
  return self->_candidateInteractionsShapes;
}

- (void)setCandidateInteractionsShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)tupleInteractionsCandidatesShapes
{
  return self->_tupleInteractionsCandidatesShapes;
}

- (void)setTupleInteractionsCandidatesShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)tupleInteractionsAlignmentShapes
{
  return self->_tupleInteractionsAlignmentShapes;
}

- (void)setTupleInteractionsAlignmentShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)similarityScoresShapes
{
  return self->_similarityScoresShapes;
}

- (void)setSimilarityScoresShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarityScoresShapes, 0);
  objc_storeStrong((id *)&self->_tupleInteractionsAlignmentShapes, 0);
  objc_storeStrong((id *)&self->_tupleInteractionsCandidatesShapes, 0);
  objc_storeStrong((id *)&self->_candidateInteractionsShapes, 0);
  objc_storeStrong((id *)&self->_deviceContextShapes, 0);
  objc_storeStrong((id *)&self->_candidateTuplesShapes, 0);
}

@end
