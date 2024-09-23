@implementation _SFPBShowPhotosOneUpViewCommand

- (_SFPBShowPhotosOneUpViewCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBShowPhotosOneUpViewCommand *v5;
  void *v6;
  _SFPBPhotosLibraryImage *v7;
  void *v8;
  _SFPBPhotosLibraryImage *v9;
  void *v10;
  _SFPBPerson *v11;
  void *v12;
  _SFPBPerson *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _SFPBScene *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  _SFPBPerson *v29;
  void *v30;
  _SFPBPunchout *v31;
  void *v32;
  _SFPBPunchout *v33;
  _SFPBShowPhotosOneUpViewCommand *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBShowPhotosOneUpViewCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "photosLibraryImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBPhotosLibraryImage alloc];
      objc_msgSend(v4, "photosLibraryImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBPhotosLibraryImage initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBShowPhotosOneUpViewCommand setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v9);

    }
    objc_msgSend(v4, "matchedPerson");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBPerson alloc];
      objc_msgSend(v4, "matchedPerson");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBPerson initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBShowPhotosOneUpViewCommand setMatchedPerson:](v5, "setMatchedPerson:", v13);

    }
    objc_msgSend(v4, "matchedScenes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "matchedScenes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBScene initWithFacade:]([_SFPBScene alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v18);
    }

    -[_SFPBShowPhotosOneUpViewCommand setMatchedScenes:](v5, "setMatchedScenes:", v15);
    objc_msgSend(v4, "matchedPeople");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "matchedPeople", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          v29 = -[_SFPBPerson initWithFacade:]([_SFPBPerson alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v26);
    }

    -[_SFPBShowPhotosOneUpViewCommand setMatchedPeoples:](v5, "setMatchedPeoples:", v23);
    objc_msgSend(v4, "photoFilePunchout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "photoFilePunchout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBPunchout initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBShowPhotosOneUpViewCommand setPhotoFilePunchout:](v5, "setPhotoFilePunchout:", v33);

    }
    v34 = v5;

  }
  return v5;
}

- (void)setPhotosLibraryImage:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibraryImage, a3);
}

- (void)setMatchedPerson:(id)a3
{
  objc_storeStrong((id *)&self->_matchedPerson, a3);
}

- (void)setMatchedScenes:(id)a3
{
  NSArray *v4;
  NSArray *matchedScenes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  matchedScenes = self->_matchedScenes;
  self->_matchedScenes = v4;

}

- (void)clearMatchedScenes
{
  -[NSArray removeAllObjects](self->_matchedScenes, "removeAllObjects");
}

- (void)addMatchedScenes:(id)a3
{
  id v4;
  NSArray *matchedScenes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matchedScenes = self->_matchedScenes;
  v8 = v4;
  if (!matchedScenes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchedScenes;
    self->_matchedScenes = v6;

    v4 = v8;
    matchedScenes = self->_matchedScenes;
  }
  -[NSArray addObject:](matchedScenes, "addObject:", v4);

}

- (unint64_t)matchedScenesCount
{
  return -[NSArray count](self->_matchedScenes, "count");
}

- (id)matchedScenesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matchedScenes, "objectAtIndexedSubscript:", a3);
}

- (void)setMatchedPeople:(id)a3
{
  NSArray *v4;
  NSArray *matchedPeoples;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  matchedPeoples = self->_matchedPeoples;
  self->_matchedPeoples = v4;

}

- (void)clearMatchedPeople
{
  -[NSArray removeAllObjects](self->_matchedPeoples, "removeAllObjects");
}

- (void)addMatchedPeople:(id)a3
{
  id v4;
  NSArray *matchedPeoples;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matchedPeoples = self->_matchedPeoples;
  v8 = v4;
  if (!matchedPeoples)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchedPeoples;
    self->_matchedPeoples = v6;

    v4 = v8;
    matchedPeoples = self->_matchedPeoples;
  }
  -[NSArray addObject:](matchedPeoples, "addObject:", v4);

}

- (unint64_t)matchedPeopleCount
{
  return -[NSArray count](self->_matchedPeoples, "count");
}

- (id)matchedPeopleAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matchedPeoples, "objectAtIndexedSubscript:", a3);
}

- (void)setPhotoFilePunchout:(id)a3
{
  objc_storeStrong((id *)&self->_photoFilePunchout, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShowPhotosOneUpViewCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  -[_SFPBShowPhotosOneUpViewCommand matchedPeoples](self, "matchedPeoples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  -[_SFPBShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

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
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_SFPBShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosLibraryImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosLibraryImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchedPerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedPerson");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchedScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBShowPhotosOneUpViewCommand matchedScenes](self, "matchedScenes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedScenes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBShowPhotosOneUpViewCommand matchedPeoples](self, "matchedPeoples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchedPeoples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBShowPhotosOneUpViewCommand matchedPeoples](self, "matchedPeoples");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBShowPhotosOneUpViewCommand matchedPeoples](self, "matchedPeoples");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedPeoples");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoFilePunchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_SFPBShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoFilePunchout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[_SFPBPhotosLibraryImage hash](self->_photosLibraryImage, "hash");
  v4 = -[_SFPBPerson hash](self->_matchedPerson, "hash") ^ v3;
  v5 = -[NSArray hash](self->_matchedScenes, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_matchedPeoples, "hash");
  return v6 ^ -[_SFPBPunchout hash](self->_photoFilePunchout, "hash");
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
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_matchedPeoples, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = self->_matchedPeoples;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("matchedPeople"));
  }
  if (self->_matchedPerson)
  {
    -[_SFPBShowPhotosOneUpViewCommand matchedPerson](self, "matchedPerson");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("matchedPerson"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("matchedPerson"));

    }
  }
  if (-[NSArray count](self->_matchedScenes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = self->_matchedScenes;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("matchedScenes"));
  }
  if (self->_photoFilePunchout)
  {
    -[_SFPBShowPhotosOneUpViewCommand photoFilePunchout](self, "photoFilePunchout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("photoFilePunchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("photoFilePunchout"));

    }
  }
  if (self->_photosLibraryImage)
  {
    -[_SFPBShowPhotosOneUpViewCommand photosLibraryImage](self, "photosLibraryImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("photosLibraryImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("photosLibraryImage"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBShowPhotosOneUpViewCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBShowPhotosOneUpViewCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBShowPhotosOneUpViewCommand *v5;
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
    self = -[_SFPBShowPhotosOneUpViewCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBShowPhotosOneUpViewCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBShowPhotosOneUpViewCommand *v5;
  void *v6;
  _SFPBPhotosLibraryImage *v7;
  void *v8;
  _SFPBPerson *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  _SFPBScene *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  _SFPBPerson *v26;
  void *v27;
  _SFPBPunchout *v28;
  _SFPBShowPhotosOneUpViewCommand *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_SFPBShowPhotosOneUpViewCommand;
  v5 = -[_SFPBShowPhotosOneUpViewCommand init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosLibraryImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBPhotosLibraryImage initWithDictionary:]([_SFPBPhotosLibraryImage alloc], "initWithDictionary:", v6);
      -[_SFPBShowPhotosOneUpViewCommand setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedPerson"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBPerson initWithDictionary:]([_SFPBPerson alloc], "initWithDictionary:", v8);
      -[_SFPBShowPhotosOneUpViewCommand setMatchedPerson:](v5, "setMatchedPerson:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedScenes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = v10;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[_SFPBScene initWithDictionary:]([_SFPBScene alloc], "initWithDictionary:", v17);
              -[_SFPBShowPhotosOneUpViewCommand addMatchedScenes:](v5, "addMatchedScenes:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v14);
      }

      v6 = v32;
      v10 = v11;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedPeople"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v10;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = -[_SFPBPerson initWithDictionary:]([_SFPBPerson alloc], "initWithDictionary:", v25);
              -[_SFPBShowPhotosOneUpViewCommand addMatchedPeople:](v5, "addMatchedPeople:", v26);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v22);
      }

      v6 = v32;
      v10 = v31;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photoFilePunchout"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v27);
      -[_SFPBShowPhotosOneUpViewCommand setPhotoFilePunchout:](v5, "setPhotoFilePunchout:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (_SFPBPerson)matchedPerson
{
  return self->_matchedPerson;
}

- (NSArray)matchedScenes
{
  return self->_matchedScenes;
}

- (NSArray)matchedPeoples
{
  return self->_matchedPeoples;
}

- (void)setMatchedPeoples:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_SFPBPunchout)photoFilePunchout
{
  return self->_photoFilePunchout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoFilePunchout, 0);
  objc_storeStrong((id *)&self->_matchedPeoples, 0);
  objc_storeStrong((id *)&self->_matchedScenes, 0);
  objc_storeStrong((id *)&self->_matchedPerson, 0);
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
}

@end
