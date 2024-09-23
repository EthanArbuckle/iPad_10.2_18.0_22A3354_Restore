@implementation _SFPBAudioPlaybackCardSection

- (_SFPBAudioPlaybackCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBAudioPlaybackCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBPunchout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _SFPBColor *v21;
  void *v22;
  _SFPBColor *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  _SFPBAbstractCommand *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  _SFPBAbstractCommand *v39;
  void *v40;
  _SFPBRichText *v41;
  void *v42;
  _SFPBRichText *v43;
  void *v44;
  _SFPBRichText *v45;
  void *v46;
  _SFPBRichText *v47;
  void *v48;
  _SFPBRichText *v49;
  void *v50;
  _SFPBRichText *v51;
  void *v52;
  _SFPBImage *v53;
  void *v54;
  _SFPBImage *v55;
  _SFPBAudioPlaybackCardSection *v56;
  _SFPBAudioPlaybackCardSection *v58;
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
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBAudioPlaybackCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v68 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v10);
    }

    -[_SFPBAudioPlaybackCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioPlaybackCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioPlaybackCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBAudioPlaybackCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBAudioPlaybackCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBAudioPlaybackCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAudioPlaybackCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBAudioPlaybackCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBAudioPlaybackCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    if (objc_msgSend(v4, "hasState"))
      -[_SFPBAudioPlaybackCardSection setState:](v5, "setState:", objc_msgSend(v4, "state"));
    objc_msgSend(v4, "playCommands");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v4, "playCommands");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v64 != v29)
            objc_enumerationMutation(v26);
          v31 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v28);
    }

    -[_SFPBAudioPlaybackCardSection setPlayCommands:](v5, "setPlayCommands:", v25);
    objc_msgSend(v4, "stopCommands");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v5;
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v4, "stopCommands");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v60 != v37)
            objc_enumerationMutation(v34);
          v39 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v36);
    }

    v5 = v58;
    -[_SFPBAudioPlaybackCardSection setStopCommands:](v58, "setStopCommands:", v33);
    objc_msgSend(v4, "detailText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = [_SFPBRichText alloc];
      objc_msgSend(v4, "detailText");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[_SFPBRichText initWithFacade:](v41, "initWithFacade:", v42);
      -[_SFPBAudioPlaybackCardSection setDetailText:](v58, "setDetailText:", v43);

    }
    objc_msgSend(v4, "title");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = [_SFPBRichText alloc];
      objc_msgSend(v4, "title");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[_SFPBRichText initWithFacade:](v45, "initWithFacade:", v46);
      -[_SFPBAudioPlaybackCardSection setTitle:](v58, "setTitle:", v47);

    }
    objc_msgSend(v4, "subtitle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = [_SFPBRichText alloc];
      objc_msgSend(v4, "subtitle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[_SFPBRichText initWithFacade:](v49, "initWithFacade:", v50);
      -[_SFPBAudioPlaybackCardSection setSubtitle:](v58, "setSubtitle:", v51);

    }
    objc_msgSend(v4, "thumbnail");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [_SFPBImage alloc];
      objc_msgSend(v4, "thumbnail");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[_SFPBImage initWithFacade:](v53, "initWithFacade:", v54);
      -[_SFPBAudioPlaybackCardSection setThumbnail:](v58, "setThumbnail:", v55);

    }
    v56 = v58;

  }
  return v5;
}

- (void)setPunchoutOptions:(id)a3
{
  NSArray *v4;
  NSArray *punchoutOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  punchoutOptions = self->_punchoutOptions;
  self->_punchoutOptions = v4;

}

- (void)clearPunchoutOptions
{
  -[NSArray removeAllObjects](self->_punchoutOptions, "removeAllObjects");
}

- (void)addPunchoutOptions:(id)a3
{
  id v4;
  NSArray *punchoutOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  v8 = v4;
  if (!punchoutOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  -[NSArray addObject:](punchoutOptions, "addObject:", v4);

}

- (unint64_t)punchoutOptionsCount
{
  return -[NSArray count](self->_punchoutOptions, "count");
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_punchoutOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setPunchoutPickerTitle:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerTitle = self->_punchoutPickerTitle;
  self->_punchoutPickerTitle = v4;

}

- (void)setPunchoutPickerDismissText:(id)a3
{
  NSString *v4;
  NSString *punchoutPickerDismissText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  punchoutPickerDismissText = self->_punchoutPickerDismissText;
  self->_punchoutPickerDismissText = v4;

}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_canBeHidden = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_hasTopPadding = a3;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_hasBottomPadding = a3;
}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  type = self->_type;
  self->_type = v4;

}

- (void)setSeparatorStyle:(int)a3
{
  self->_separatorStyle = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void)setPlayCommands:(id)a3
{
  NSArray *v4;
  NSArray *playCommands;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  playCommands = self->_playCommands;
  self->_playCommands = v4;

}

- (void)clearPlayCommands
{
  -[NSArray removeAllObjects](self->_playCommands, "removeAllObjects");
}

- (void)addPlayCommands:(id)a3
{
  id v4;
  NSArray *playCommands;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  playCommands = self->_playCommands;
  v8 = v4;
  if (!playCommands)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_playCommands;
    self->_playCommands = v6;

    v4 = v8;
    playCommands = self->_playCommands;
  }
  -[NSArray addObject:](playCommands, "addObject:", v4);

}

- (unint64_t)playCommandsCount
{
  return -[NSArray count](self->_playCommands, "count");
}

- (id)playCommandsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_playCommands, "objectAtIndexedSubscript:", a3);
}

- (void)setStopCommands:(id)a3
{
  NSArray *v4;
  NSArray *stopCommands;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  stopCommands = self->_stopCommands;
  self->_stopCommands = v4;

}

- (void)clearStopCommands
{
  -[NSArray removeAllObjects](self->_stopCommands, "removeAllObjects");
}

- (void)addStopCommands:(id)a3
{
  id v4;
  NSArray *stopCommands;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  stopCommands = self->_stopCommands;
  v8 = v4;
  if (!stopCommands)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_stopCommands;
    self->_stopCommands = v6;

    v4 = v8;
    stopCommands = self->_stopCommands;
  }
  -[NSArray addObject:](stopCommands, "addObject:", v4);

}

- (unint64_t)stopCommandsCount
{
  return -[NSArray count](self->_stopCommands, "count");
}

- (id)stopCommandsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_stopCommands, "objectAtIndexedSubscript:", a3);
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAudioPlaybackCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBAudioPlaybackCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }

  -[_SFPBAudioPlaybackCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBAudioPlaybackCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBAudioPlaybackCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBAudioPlaybackCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBAudioPlaybackCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBAudioPlaybackCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBAudioPlaybackCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBAudioPlaybackCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBAudioPlaybackCardSection state](self, "state"))
    PBDataWriterWriteInt32Field();
  -[_SFPBAudioPlaybackCardSection playCommands](self, "playCommands");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v16);
  }

  -[_SFPBAudioPlaybackCardSection stopCommands](self, "stopCommands");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v21);
  }

  -[_SFPBAudioPlaybackCardSection detailText](self, "detailText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteSubmessage();

  -[_SFPBAudioPlaybackCardSection title](self, "title");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteSubmessage();

  -[_SFPBAudioPlaybackCardSection subtitle](self, "subtitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteSubmessage();

  -[_SFPBAudioPlaybackCardSection thumbnail](self, "thumbnail");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
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
  int canBeHidden;
  int hasTopPadding;
  int hasBottomPadding;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int separatorStyle;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int state;
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
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  BOOL v67;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  -[_SFPBAudioPlaybackCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBAudioPlaybackCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBAudioPlaybackCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBAudioPlaybackCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_62;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_62;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_62;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_62;
  -[_SFPBAudioPlaybackCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBAudioPlaybackCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_62;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_62;
  -[_SFPBAudioPlaybackCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBAudioPlaybackCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_62;
  }
  else
  {

  }
  state = self->_state;
  if (state != objc_msgSend(v4, "state"))
    goto LABEL_62;
  -[_SFPBAudioPlaybackCardSection playCommands](self, "playCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection playCommands](self, "playCommands");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBAudioPlaybackCardSection playCommands](self, "playCommands");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playCommands");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection stopCommands](self, "stopCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection stopCommands](self, "stopCommands");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBAudioPlaybackCardSection stopCommands](self, "stopCommands");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopCommands");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection detailText](self, "detailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection detailText](self, "detailText");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBAudioPlaybackCardSection detailText](self, "detailText");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailText");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection title](self, "title");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBAudioPlaybackCardSection title](self, "title");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_61;
  -[_SFPBAudioPlaybackCardSection subtitle](self, "subtitle");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBAudioPlaybackCardSection subtitle](self, "subtitle");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_62;
  }
  else
  {

  }
  -[_SFPBAudioPlaybackCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_61:

    goto LABEL_62;
  }
  -[_SFPBAudioPlaybackCardSection thumbnail](self, "thumbnail");
  v62 = objc_claimAutoreleasedReturnValue();
  if (!v62)
  {

LABEL_65:
    v67 = 1;
    goto LABEL_63;
  }
  v63 = (void *)v62;
  -[_SFPBAudioPlaybackCardSection thumbnail](self, "thumbnail");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v64, "isEqual:", v65);

  if ((v66 & 1) != 0)
    goto LABEL_65;
LABEL_62:
  v67 = 0;
LABEL_63:

  return v67;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v3 = -[NSArray hash](self->_punchoutOptions, "hash");
  v4 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v5 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v6 = 2654435761;
  else
    v6 = 0;
  if (self->_hasTopPadding)
    v7 = 2654435761;
  else
    v7 = 0;
  if (self->_hasBottomPadding)
    v8 = 2654435761;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_type, "hash");
  v10 = 2654435761 * self->_separatorStyle;
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[_SFPBColor hash](self->_backgroundColor, "hash") ^ (2654435761 * self->_state);
  v12 = -[NSArray hash](self->_playCommands, "hash");
  v13 = v12 ^ -[NSArray hash](self->_stopCommands, "hash");
  v14 = v13 ^ -[_SFPBRichText hash](self->_detailText, "hash");
  v15 = v14 ^ -[_SFPBRichText hash](self->_title, "hash");
  v16 = v15 ^ -[_SFPBRichText hash](self->_subtitle, "hash");
  return v11 ^ v16 ^ -[_SFPBImage hash](self->_thumbnail, "hash");
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
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBAudioPlaybackCardSection backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundColor"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBAudioPlaybackCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_detailText)
  {
    -[_SFPBAudioPlaybackCardSection detailText](self, "detailText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("detailText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("detailText"));

    }
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBAudioPlaybackCardSection hasBottomPadding](self, "hasBottomPadding"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBAudioPlaybackCardSection hasTopPadding](self, "hasTopPadding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasTopPadding"));

  }
  if (-[NSArray count](self->_playCommands, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v14 = self->_playCommands;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v66 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("playCommands"));
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v22 = self->_punchoutOptions;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v62 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v21, "addObject:", v27);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBAudioPlaybackCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBAudioPlaybackCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v33 = -[_SFPBAudioPlaybackCardSection separatorStyle](self, "separatorStyle");
    if (v33 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = *(&off_1E40421B0 + v33);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("separatorStyle"));

  }
  if (self->_state)
  {
    v35 = -[_SFPBAudioPlaybackCardSection state](self, "state");
    if (v35 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = *(&off_1E40421B0 + v35);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("state"));

  }
  if (-[NSArray count](self->_stopCommands, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v38 = self->_stopCommands;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v58 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            objc_msgSend(v37, "addObject:", v43);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v44);

          }
        }
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      }
      while (v40);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("stopCommands"));
  }
  if (self->_subtitle)
  {
    -[_SFPBAudioPlaybackCardSection subtitle](self, "subtitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("subtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("subtitle"));

    }
  }
  if (self->_thumbnail)
  {
    -[_SFPBAudioPlaybackCardSection thumbnail](self, "thumbnail");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("thumbnail"));

    }
  }
  if (self->_title)
  {
    -[_SFPBAudioPlaybackCardSection title](self, "title");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("title"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("title"));

    }
  }
  if (self->_type)
  {
    -[_SFPBAudioPlaybackCardSection type](self, "type");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAudioPlaybackCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBAudioPlaybackCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAudioPlaybackCardSection *v5;
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
    self = -[_SFPBAudioPlaybackCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAudioPlaybackCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAudioPlaybackCardSection *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _SFPBPunchout *v13;
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
  _SFPBColor *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  _SFPBAbstractCommand *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  _SFPBAbstractCommand *v45;
  void *v46;
  _SFPBRichText *v47;
  void *v48;
  _SFPBRichText *v49;
  void *v50;
  _SFPBRichText *v51;
  void *v52;
  _SFPBImage *v53;
  _SFPBAudioPlaybackCardSection *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
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
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)_SFPBAudioPlaybackCardSection;
  v5 = -[_SFPBAudioPlaybackCardSection init](&v79, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v76 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBAudioPlaybackCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBAudioPlaybackCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    v63 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBAudioPlaybackCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    v62 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioPlaybackCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioPlaybackCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioPlaybackCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBAudioPlaybackCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioPlaybackCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v6;
      v26 = v24;
      v27 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBAudioPlaybackCardSection setBackgroundColor:](v5, "setBackgroundColor:", v27);

      v24 = v26;
      v6 = v25;
    }
    v58 = v23;
    v59 = v20;
    v60 = v19;
    v61 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAudioPlaybackCardSection setState:](v5, "setState:", objc_msgSend(v28, "intValue"));
    v57 = v28;
    v64 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playCommands"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v72 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = -[_SFPBAbstractCommand initWithDictionary:]([_SFPBAbstractCommand alloc], "initWithDictionary:", v35);
              -[_SFPBAudioPlaybackCardSection addPlayCommands:](v5, "addPlayCommands:", v36);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
        }
        while (v32);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stopCommands"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = v29;
      v38 = v24;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v39 = v37;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v68;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v68 != v42)
              objc_enumerationMutation(v39);
            v44 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v45 = -[_SFPBAbstractCommand initWithDictionary:]([_SFPBAbstractCommand alloc], "initWithDictionary:", v44);
              -[_SFPBAudioPlaybackCardSection addStopCommands:](v5, "addStopCommands:", v45);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
        }
        while (v41);
      }

      v24 = v38;
      v29 = v56;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detailText"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v46);
      -[_SFPBAudioPlaybackCardSection setDetailText:](v5, "setDetailText:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v48);
      -[_SFPBAudioPlaybackCardSection setTitle:](v5, "setTitle:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v50);
      -[_SFPBAudioPlaybackCardSection setSubtitle:](v5, "setSubtitle:", v51);

      v4 = v66;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v52);
      -[_SFPBAudioPlaybackCardSection setThumbnail:](v5, "setThumbnail:", v53);

    }
    v54 = v5;

    v4 = v66;
  }

  return v5;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (NSString)type
{
  return self->_type;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int)state
{
  return self->_state;
}

- (NSArray)playCommands
{
  return self->_playCommands;
}

- (NSArray)stopCommands
{
  return self->_stopCommands;
}

- (_SFPBRichText)detailText
{
  return self->_detailText;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBRichText)subtitle
{
  return self->_subtitle;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_stopCommands, 0);
  objc_storeStrong((id *)&self->_playCommands, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
