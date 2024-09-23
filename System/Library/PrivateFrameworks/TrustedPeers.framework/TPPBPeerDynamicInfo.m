@implementation TPPBPeerDynamicInfo

- (void)setClock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clock = a3;
}

- (void)setHasClock:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClock
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearIncludeds
{
  -[NSMutableArray removeAllObjects](self->_includeds, "removeAllObjects");
}

- (void)addIncluded:(id)a3
{
  id v4;
  NSMutableArray *includeds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  includeds = self->_includeds;
  v8 = v4;
  if (!includeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_includeds;
    self->_includeds = v6;

    v4 = v8;
    includeds = self->_includeds;
  }
  -[NSMutableArray addObject:](includeds, "addObject:", v4);

}

- (unint64_t)includedsCount
{
  return -[NSMutableArray count](self->_includeds, "count");
}

- (id)includedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_includeds, "objectAtIndex:", a3);
}

- (void)clearExcludeds
{
  -[NSMutableArray removeAllObjects](self->_excludeds, "removeAllObjects");
}

- (void)addExcluded:(id)a3
{
  id v4;
  NSMutableArray *excludeds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  excludeds = self->_excludeds;
  v8 = v4;
  if (!excludeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_excludeds;
    self->_excludeds = v6;

    v4 = v8;
    excludeds = self->_excludeds;
  }
  -[NSMutableArray addObject:](excludeds, "addObject:", v4);

}

- (unint64_t)excludedsCount
{
  return -[NSMutableArray count](self->_excludeds, "count");
}

- (id)excludedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_excludeds, "objectAtIndex:", a3);
}

- (void)clearDispositions
{
  -[NSMutableArray removeAllObjects](self->_dispositions, "removeAllObjects");
}

- (void)addDispositions:(id)a3
{
  id v4;
  NSMutableArray *dispositions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dispositions = self->_dispositions;
  v8 = v4;
  if (!dispositions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dispositions;
    self->_dispositions = v6;

    v4 = v8;
    dispositions = self->_dispositions;
  }
  -[NSMutableArray addObject:](dispositions, "addObject:", v4);

}

- (unint64_t)dispositionsCount
{
  return -[NSMutableArray count](self->_dispositions, "count");
}

- (id)dispositionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dispositions, "objectAtIndex:", a3);
}

- (void)clearPreapprovals
{
  -[NSMutableArray removeAllObjects](self->_preapprovals, "removeAllObjects");
}

- (void)addPreapprovals:(id)a3
{
  id v4;
  NSMutableArray *preapprovals;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preapprovals = self->_preapprovals;
  v8 = v4;
  if (!preapprovals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_preapprovals;
    self->_preapprovals = v6;

    v4 = v8;
    preapprovals = self->_preapprovals;
  }
  -[NSMutableArray addObject:](preapprovals, "addObject:", v4);

}

- (unint64_t)preapprovalsCount
{
  return -[NSMutableArray count](self->_preapprovals, "count");
}

- (id)preapprovalsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preapprovals, "objectAtIndex:", a3);
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
  v8.super_class = (Class)TPPBPeerDynamicInfo;
  -[TPPBPeerDynamicInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerDynamicInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *includeds;
  NSMutableArray *excludeds;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *preapprovals;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_clock);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("clock"));

  }
  includeds = self->_includeds;
  if (includeds)
    objc_msgSend(v3, "setObject:forKey:", includeds, CFSTR("included"));
  excludeds = self->_excludeds;
  if (excludeds)
    objc_msgSend(v3, "setObject:forKey:", excludeds, CFSTR("excluded"));
  if (-[NSMutableArray count](self->_dispositions, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dispositions, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_dispositions;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dispositions"));
  }
  preapprovals = self->_preapprovals;
  if (preapprovals)
    objc_msgSend(v3, "setObject:forKey:", preapprovals, CFSTR("preapprovals"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerDynamicInfoReadFrom((uint64_t)self, (uint64_t)a3);
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

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_includeds;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_excludeds;
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
        PBDataWriterWriteStringField();
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
  v15 = self->_dispositions;
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
  v20 = self->_preapprovals;
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
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  id v21;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_clock;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v21 = v4;
  if (-[TPPBPeerDynamicInfo includedsCount](self, "includedsCount"))
  {
    objc_msgSend(v21, "clearIncludeds");
    v5 = -[TPPBPeerDynamicInfo includedsCount](self, "includedsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[TPPBPeerDynamicInfo includedAtIndex:](self, "includedAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addIncluded:", v8);

      }
    }
  }
  if (-[TPPBPeerDynamicInfo excludedsCount](self, "excludedsCount"))
  {
    objc_msgSend(v21, "clearExcludeds");
    v9 = -[TPPBPeerDynamicInfo excludedsCount](self, "excludedsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[TPPBPeerDynamicInfo excludedAtIndex:](self, "excludedAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addExcluded:", v12);

      }
    }
  }
  if (-[TPPBPeerDynamicInfo dispositionsCount](self, "dispositionsCount"))
  {
    objc_msgSend(v21, "clearDispositions");
    v13 = -[TPPBPeerDynamicInfo dispositionsCount](self, "dispositionsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[TPPBPeerDynamicInfo dispositionsAtIndex:](self, "dispositionsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addDispositions:", v16);

      }
    }
  }
  if (-[TPPBPeerDynamicInfo preapprovalsCount](self, "preapprovalsCount"))
  {
    objc_msgSend(v21, "clearPreapprovals");
    v17 = -[TPPBPeerDynamicInfo preapprovalsCount](self, "preapprovalsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[TPPBPeerDynamicInfo preapprovalsAtIndex:](self, "preapprovalsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addPreapprovals:", v20);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_clock;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = self->_includeds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addIncluded:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = self->_excludeds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addExcluded:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v15);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = self->_dispositions;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend(v6, "addDispositions:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v21);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self->_preapprovals;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v29), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend(v6, "addPreapprovals:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v27);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *includeds;
  NSMutableArray *excludeds;
  NSMutableArray *dispositions;
  NSMutableArray *preapprovals;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_clock != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  includeds = self->_includeds;
  if ((unint64_t)includeds | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](includeds, "isEqual:"))
  {
    goto LABEL_15;
  }
  excludeds = self->_excludeds;
  if ((unint64_t)excludeds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](excludeds, "isEqual:"))
      goto LABEL_15;
  }
  dispositions = self->_dispositions;
  if ((unint64_t)dispositions | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](dispositions, "isEqual:"))
      goto LABEL_15;
  }
  preapprovals = self->_preapprovals;
  if ((unint64_t)preapprovals | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](preapprovals, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_clock;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_includeds, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_excludeds, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_dispositions, "hash");
  return v6 ^ -[NSMutableArray hash](self->_preapprovals, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
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
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_clock = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        -[TPPBPeerDynamicInfo addIncluded:](self, "addIncluded:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v5[3];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        -[TPPBPeerDynamicInfo addExcluded:](self, "addExcluded:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v5[2];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        -[TPPBPeerDynamicInfo addDispositions:](self, "addDispositions:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v5[5];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[TPPBPeerDynamicInfo addPreapprovals:](self, "addPreapprovals:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v25++), (_QWORD)v26);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

}

- (unint64_t)clock
{
  return self->_clock;
}

- (NSMutableArray)includeds
{
  return self->_includeds;
}

- (void)setIncludeds:(id)a3
{
  objc_storeStrong((id *)&self->_includeds, a3);
}

- (NSMutableArray)excludeds
{
  return self->_excludeds;
}

- (void)setExcludeds:(id)a3
{
  objc_storeStrong((id *)&self->_excludeds, a3);
}

- (NSMutableArray)dispositions
{
  return self->_dispositions;
}

- (void)setDispositions:(id)a3
{
  objc_storeStrong((id *)&self->_dispositions, a3);
}

- (NSMutableArray)preapprovals
{
  return self->_preapprovals;
}

- (void)setPreapprovals:(id)a3
{
  objc_storeStrong((id *)&self->_preapprovals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preapprovals, 0);
  objc_storeStrong((id *)&self->_includeds, 0);
  objc_storeStrong((id *)&self->_excludeds, 0);
  objc_storeStrong((id *)&self->_dispositions, 0);
}

+ (Class)includedType
{
  return (Class)objc_opt_class();
}

+ (Class)excludedType
{
  return (Class)objc_opt_class();
}

+ (Class)dispositionsType
{
  return (Class)objc_opt_class();
}

+ (Class)preapprovalsType
{
  return (Class)objc_opt_class();
}

@end
