@implementation _SFPBMapCardSection

- (_SFPBMapCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBMapCardSection *v5;
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
  _SFPBLatLng *v25;
  void *v26;
  _SFPBLatLng *v27;
  void *v28;
  _SFPBColor *v29;
  void *v30;
  _SFPBColor *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _SFPBMapRegion *v37;
  void *v38;
  _SFPBMapRegion *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  _SFPBPin *v47;
  _SFPBMapCardSection *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBMapCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v10);
    }

    -[_SFPBMapCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMapCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMapCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBMapCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBMapCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBMapCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMapCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBMapCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBMapCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "location");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBLatLng initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBMapCardSection setLocation:](v5, "setLocation:", v27);

    }
    objc_msgSend(v4, "pinColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBColor alloc];
      objc_msgSend(v4, "pinColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBColor initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBMapCardSection setPinColor:](v5, "setPinColor:", v31);

    }
    objc_msgSend(v4, "footnoteLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "footnoteLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMapCardSection setFootnoteLabel:](v5, "setFootnoteLabel:", v33);

    }
    objc_msgSend(v4, "footnote");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "footnote");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMapCardSection setFootnote:](v5, "setFootnote:", v35);

    }
    if (objc_msgSend(v4, "hasInteractive"))
      -[_SFPBMapCardSection setInteractive:](v5, "setInteractive:", objc_msgSend(v4, "interactive"));
    if (objc_msgSend(v4, "hasSizeFormat"))
      -[_SFPBMapCardSection setSizeFormat:](v5, "setSizeFormat:", objc_msgSend(v4, "sizeFormat"));
    objc_msgSend(v4, "boundingMapRegion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [_SFPBMapRegion alloc];
      objc_msgSend(v4, "boundingMapRegion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[_SFPBMapRegion initWithFacade:](v37, "initWithFacade:", v38);
      -[_SFPBMapCardSection setBoundingMapRegion:](v5, "setBoundingMapRegion:", v39);

    }
    if (objc_msgSend(v4, "hasPinBehavior"))
      -[_SFPBMapCardSection setPinBehavior:](v5, "setPinBehavior:", objc_msgSend(v4, "pinBehavior"));
    objc_msgSend(v4, "pins");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v41 = 0;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "pins", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v51 != v45)
            objc_enumerationMutation(v42);
          v47 = -[_SFPBPin initWithFacade:]([_SFPBPin alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v44);
    }

    -[_SFPBMapCardSection setPins:](v5, "setPins:", v41);
    v48 = v5;

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

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setPinColor:(id)a3
{
  objc_storeStrong((id *)&self->_pinColor, a3);
}

- (void)setFootnoteLabel:(id)a3
{
  NSString *v4;
  NSString *footnoteLabel;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footnoteLabel = self->_footnoteLabel;
  self->_footnoteLabel = v4;

}

- (void)setFootnote:(id)a3
{
  NSString *v4;
  NSString *footnote;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footnote = self->_footnote;
  self->_footnote = v4;

}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (void)setSizeFormat:(int)a3
{
  self->_sizeFormat = a3;
}

- (void)setBoundingMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_boundingMapRegion, a3);
}

- (void)setPinBehavior:(int)a3
{
  self->_pinBehavior = a3;
}

- (void)setPins:(id)a3
{
  NSArray *v4;
  NSArray *pins;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  pins = self->_pins;
  self->_pins = v4;

}

- (void)clearPins
{
  -[NSArray removeAllObjects](self->_pins, "removeAllObjects");
}

- (void)addPins:(id)a3
{
  id v4;
  NSArray *pins;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  pins = self->_pins;
  v8 = v4;
  if (!pins)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pins;
    self->_pins = v6;

    v4 = v8;
    pins = self->_pins;
  }
  -[NSArray addObject:](pins, "addObject:", v4);

}

- (unint64_t)pinsCount
{
  return -[NSArray count](self->_pins, "count");
}

- (id)pinsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_pins, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMapCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  -[_SFPBMapCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  -[_SFPBMapCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBMapCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBMapCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMapCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMapCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBMapCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBMapCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMapCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBMapCardSection location](self, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBMapCardSection pinColor](self, "pinColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBMapCardSection footnoteLabel](self, "footnoteLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBMapCardSection footnote](self, "footnote");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

  if (-[_SFPBMapCardSection interactive](self, "interactive"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMapCardSection sizeFormat](self, "sizeFormat"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMapCardSection boundingMapRegion](self, "boundingMapRegion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBMapCardSection pinBehavior](self, "pinBehavior"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMapCardSection pins](self, "pins");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int interactive;
  int sizeFormat;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int pinBehavior;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  BOOL v69;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_64;
  -[_SFPBMapCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMapCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBMapCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBMapCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBMapCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBMapCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_64;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_64;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_64;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_64;
  -[_SFPBMapCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBMapCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_64;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_64;
  -[_SFPBMapCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBMapCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBMapCardSection location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection location](self, "location");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBMapCardSection location](self, "location");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBMapCardSection pinColor](self, "pinColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection pinColor](self, "pinColor");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBMapCardSection pinColor](self, "pinColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pinColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBMapCardSection footnoteLabel](self, "footnoteLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnoteLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection footnoteLabel](self, "footnoteLabel");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBMapCardSection footnoteLabel](self, "footnoteLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footnoteLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBMapCardSection footnote](self, "footnote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection footnote](self, "footnote");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_SFPBMapCardSection footnote](self, "footnote");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footnote");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_64;
  }
  else
  {

  }
  interactive = self->_interactive;
  if (interactive != objc_msgSend(v4, "interactive"))
    goto LABEL_64;
  sizeFormat = self->_sizeFormat;
  if (sizeFormat != objc_msgSend(v4, "sizeFormat"))
    goto LABEL_64;
  -[_SFPBMapCardSection boundingMapRegion](self, "boundingMapRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingMapRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBMapCardSection boundingMapRegion](self, "boundingMapRegion");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[_SFPBMapCardSection boundingMapRegion](self, "boundingMapRegion");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingMapRegion");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_64;
  }
  else
  {

  }
  pinBehavior = self->_pinBehavior;
  if (pinBehavior != objc_msgSend(v4, "pinBehavior"))
    goto LABEL_64;
  -[_SFPBMapCardSection pins](self, "pins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_63:

    goto LABEL_64;
  }
  -[_SFPBMapCardSection pins](self, "pins");
  v64 = objc_claimAutoreleasedReturnValue();
  if (!v64)
  {

LABEL_67:
    v69 = 1;
    goto LABEL_65;
  }
  v65 = (void *)v64;
  -[_SFPBMapCardSection pins](self, "pins");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pins");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v66, "isEqual:", v67);

  if ((v68 & 1) != 0)
    goto LABEL_67;
LABEL_64:
  v69 = 0;
LABEL_65:

  return v69;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;

  v23 = -[NSArray hash](self->_punchoutOptions, "hash");
  v22 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v20 = v4;
  v21 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v18 = v6;
  v19 = v5;
  v17 = -[NSString hash](self->_type, "hash");
  v7 = 2654435761 * self->_separatorStyle;
  v8 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v9 = -[_SFPBLatLng hash](self->_location, "hash");
  v10 = -[_SFPBColor hash](self->_pinColor, "hash");
  v11 = -[NSString hash](self->_footnoteLabel, "hash");
  v12 = -[NSString hash](self->_footnote, "hash");
  if (self->_interactive)
    v13 = 2654435761;
  else
    v13 = 0;
  v14 = 2654435761 * self->_sizeFormat;
  v15 = v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[_SFPBMapRegion hash](self->_boundingMapRegion, "hash") ^ (2654435761 * self->_pinBehavior);
  return v15 ^ -[NSArray hash](self->_pins, "hash");
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBMapCardSection backgroundColor](self, "backgroundColor");
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
  if (self->_boundingMapRegion)
  {
    -[_SFPBMapCardSection boundingMapRegion](self, "boundingMapRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("boundingMapRegion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("boundingMapRegion"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMapCardSection canBeHidden](self, "canBeHidden"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("canBeHidden"));

  }
  if (self->_footnote)
  {
    -[_SFPBMapCardSection footnote](self, "footnote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("footnote"));

  }
  if (self->_footnoteLabel)
  {
    -[_SFPBMapCardSection footnoteLabel](self, "footnoteLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("footnoteLabel"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMapCardSection hasBottomPadding](self, "hasBottomPadding"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMapCardSection hasTopPadding](self, "hasTopPadding"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasTopPadding"));

  }
  if (self->_interactive)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMapCardSection interactive](self, "interactive"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("interactive"));

  }
  if (self->_location)
  {
    -[_SFPBMapCardSection location](self, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("location"));

    }
  }
  if (self->_pinBehavior)
  {
    v21 = -[_SFPBMapCardSection pinBehavior](self, "pinBehavior");
    if (v21 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E4042178 + v21);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("pinBehavior"));

  }
  if (self->_pinColor)
  {
    -[_SFPBMapCardSection pinColor](self, "pinColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("pinColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("pinColor"));

    }
  }
  if (-[NSArray count](self->_pins, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v27 = self->_pins;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v58 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            objc_msgSend(v26, "addObject:", v32);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v33);

          }
        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("pins"));
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v35 = self->_punchoutOptions;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v34, "addObject:", v40);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v41);

          }
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v37);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBMapCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBMapCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v46 = -[_SFPBMapCardSection separatorStyle](self, "separatorStyle");
    if (v46 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = *(&off_1E40421B0 + v46);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("separatorStyle"));

  }
  if (self->_sizeFormat)
  {
    v48 = -[_SFPBMapCardSection sizeFormat](self, "sizeFormat");
    if ((_DWORD)v48)
    {
      if ((_DWORD)v48 == 1)
      {
        v49 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v48);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v49 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("sizeFormat"));

  }
  if (self->_type)
  {
    -[_SFPBMapCardSection type](self, "type");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMapCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMapCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMapCardSection *v5;
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
    self = -[_SFPBMapCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMapCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMapCardSection *v5;
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
  uint64_t v24;
  _SFPBColor *v25;
  uint64_t v26;
  _SFPBLatLng *v27;
  uint64_t v28;
  _SFPBColor *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _SFPBMapRegion *v37;
  void *v38;
  void *v39;
  _SFPBMapRegion *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  _SFPBPin *v49;
  _SFPBMapCardSection *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)_SFPBMapCardSection;
  v5 = -[_SFPBMapCardSection init](&v76, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v73 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBMapCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBMapCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBMapCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBMapCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBMapCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v26);
      -[_SFPBMapCardSection setLocation:](v5, "setLocation:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinColor"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v28);
      -[_SFPBMapCardSection setPinColor:](v5, "setPinColor:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footnoteLabel"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[_SFPBMapCardSection setFootnoteLabel:](v5, "setFootnoteLabel:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footnote"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(v32, "copy");
      -[_SFPBMapCardSection setFootnote:](v5, "setFootnote:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactive"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setInteractive:](v5, "setInteractive:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sizeFormat"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setSizeFormat:](v5, "setSizeFormat:", objc_msgSend(v35, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boundingMapRegion"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBMapRegion initWithDictionary:]([_SFPBMapRegion alloc], "initWithDictionary:", v36);
      v38 = v36;
      v39 = v34;
      v40 = v37;
      -[_SFPBMapCardSection setBoundingMapRegion:](v5, "setBoundingMapRegion:", v37);

      v34 = v39;
      v36 = v38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinBehavior"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMapCardSection setPinBehavior:](v5, "setPinBehavior:", objc_msgSend(v41, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pins"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v36;
      v53 = v34;
      v54 = v32;
      v55 = v30;
      v56 = v6;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v43 = v42;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v69 != v46)
              objc_enumerationMutation(v43);
            v48 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v49 = -[_SFPBPin initWithDictionary:]([_SFPBPin alloc], "initWithDictionary:", v48);
              -[_SFPBMapCardSection addPins:](v5, "addPins:", v49);

            }
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        }
        while (v45);
      }

      v30 = v55;
      v6 = v56;
      v34 = v53;
      v32 = v54;
      v36 = v52;
    }
    v50 = v5;

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

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBColor)pinColor
{
  return self->_pinColor;
}

- (NSString)footnoteLabel
{
  return self->_footnoteLabel;
}

- (NSString)footnote
{
  return self->_footnote;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (_SFPBMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (NSArray)pins
{
  return self->_pins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pins, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
