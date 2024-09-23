@implementation SIRINLUEXTERNALUsoOntologyVocabulary

- (BOOL)hasUsoVersion
{
  return self->_usoVersion != 0;
}

- (void)clearElementNames
{
  -[NSMutableArray removeAllObjects](self->_elementNames, "removeAllObjects");
}

- (void)addElementNames:(id)a3
{
  id v4;
  NSMutableArray *elementNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  elementNames = self->_elementNames;
  v8 = v4;
  if (!elementNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_elementNames;
    self->_elementNames = v6;

    v4 = v8;
    elementNames = self->_elementNames;
  }
  -[NSMutableArray addObject:](elementNames, "addObject:", v4);

}

- (unint64_t)elementNamesCount
{
  return -[NSMutableArray count](self->_elementNames, "count");
}

- (id)elementNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_elementNames, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUEXTERNALUsoOntologyVocabulary;
  -[SIRINLUEXTERNALUsoOntologyVocabulary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoOntologyVocabulary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALSemVer *usoVersion;
  void *v5;
  NSMutableArray *elementNames;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  usoVersion = self->_usoVersion;
  if (usoVersion)
  {
    -[SIRINLUEXTERNALSemVer dictionaryRepresentation](usoVersion, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("uso_version"));

  }
  elementNames = self->_elementNames;
  if (elementNames)
    objc_msgSend(v3, "setObject:forKey:", elementNames, CFSTR("element_names"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoOntologyVocabularyReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_usoVersion)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_elementNames;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_usoVersion)
    objc_msgSend(v8, "setUsoVersion:");
  if (-[SIRINLUEXTERNALUsoOntologyVocabulary elementNamesCount](self, "elementNamesCount"))
  {
    objc_msgSend(v8, "clearElementNames");
    v4 = -[SIRINLUEXTERNALUsoOntologyVocabulary elementNamesCount](self, "elementNamesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALUsoOntologyVocabulary elementNamesAtIndex:](self, "elementNamesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addElementNames:", v7);

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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALSemVer copyWithZone:](self->_usoVersion, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_elementNames;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addElementNames:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALSemVer *usoVersion;
  NSMutableArray *elementNames;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((usoVersion = self->_usoVersion, !((unint64_t)usoVersion | v4[2]))
     || -[SIRINLUEXTERNALSemVer isEqual:](usoVersion, "isEqual:")))
  {
    elementNames = self->_elementNames;
    if ((unint64_t)elementNames | v4[1])
      v7 = -[NSMutableArray isEqual:](elementNames, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SIRINLUEXTERNALSemVer hash](self->_usoVersion, "hash");
  return -[NSMutableArray hash](self->_elementNames, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALSemVer *usoVersion;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  usoVersion = self->_usoVersion;
  v6 = *((_QWORD *)v4 + 2);
  if (usoVersion)
  {
    if (v6)
      -[SIRINLUEXTERNALSemVer mergeFrom:](usoVersion, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUsoOntologyVocabulary setUsoVersion:](self, "setUsoVersion:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[SIRINLUEXTERNALUsoOntologyVocabulary addElementNames:](self, "addElementNames:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (SIRINLUEXTERNALSemVer)usoVersion
{
  return self->_usoVersion;
}

- (void)setUsoVersion:(id)a3
{
  objc_storeStrong((id *)&self->_usoVersion, a3);
}

- (NSMutableArray)elementNames
{
  return self->_elementNames;
}

- (void)setElementNames:(id)a3
{
  objc_storeStrong((id *)&self->_elementNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoVersion, 0);
  objc_storeStrong((id *)&self->_elementNames, 0);
}

+ (Class)elementNamesType
{
  return (Class)objc_opt_class();
}

@end
