@implementation _SFPBRFFormattedText

- (_SFPBRFFormattedText)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFFormattedText *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBRFImageElement *v9;
  void *v10;
  _SFPBRFImageElement *v11;
  void *v12;
  _SFPBRFColor *v13;
  void *v14;
  _SFPBRFColor *v15;
  void *v16;
  _SFPBRFOptionalBool *v17;
  void *v18;
  _SFPBRFOptionalBool *v19;
  void *v20;
  _SFPBRFOptionalBool *v21;
  void *v22;
  _SFPBRFOptionalBool *v23;
  void *v24;
  _SFPBRFTextEncapsulation *v25;
  void *v26;
  _SFPBRFTextEncapsulation *v27;
  void *v28;
  _SFPBRFOptionalBool *v29;
  void *v30;
  _SFPBRFOptionalBool *v31;
  void *v32;
  _SFPBRFColor *v33;
  void *v34;
  _SFPBRFColor *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  _SFPBRFAttribution *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  _SFPBRFHighlightedSubstring *v51;
  void *v52;
  _SFPBRFFont *v53;
  void *v54;
  _SFPBRFFont *v55;
  void *v56;
  _SFPBRFOptionalBool *v57;
  void *v58;
  _SFPBRFOptionalBool *v59;
  void *v60;
  _SFPBRFEngageable *v61;
  void *v62;
  _SFPBRFEngageable *v63;
  _SFPBRFFormattedText *v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFFormattedText init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasText"))
    {
      objc_msgSend(v4, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFPBRFFormattedText setText:](v5, "setText:", v7);

      }
    }
    if (objc_msgSend(v4, "hasInline_image_element"))
    {
      objc_msgSend(v4, "inline_image_element");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = [_SFPBRFImageElement alloc];
        objc_msgSend(v4, "inline_image_element");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[_SFPBRFImageElement initWithFacade:](v9, "initWithFacade:", v10);
        -[_SFPBRFFormattedText setInline_image_element:](v5, "setInline_image_element:", v11);

      }
    }
    objc_msgSend(v4, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBRFColor initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBRFFormattedText setColor:](v5, "setColor:", v15);

    }
    objc_msgSend(v4, "is_italic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBRFOptionalBool alloc];
      objc_msgSend(v4, "is_italic");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBRFOptionalBool initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBRFFormattedText setIs_italic:](v5, "setIs_italic:", v19);

    }
    objc_msgSend(v4, "is_bold");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBRFOptionalBool alloc];
      objc_msgSend(v4, "is_bold");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBRFOptionalBool initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBRFFormattedText setIs_bold:](v5, "setIs_bold:", v23);

    }
    objc_msgSend(v4, "text_encapsulation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBRFTextEncapsulation alloc];
      objc_msgSend(v4, "text_encapsulation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBRFTextEncapsulation initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBRFFormattedText setText_encapsulation:](v5, "setText_encapsulation:", v27);

    }
    objc_msgSend(v4, "is_highlighted");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBRFOptionalBool alloc];
      objc_msgSend(v4, "is_highlighted");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBRFOptionalBool initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBRFFormattedText setIs_highlighted:](v5, "setIs_highlighted:", v31);

    }
    objc_msgSend(v4, "background_color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "background_color");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[_SFPBRFColor initWithFacade:](v33, "initWithFacade:", v34);
      -[_SFPBRFFormattedText setBackground_color:](v5, "setBackground_color:", v35);

    }
    objc_msgSend(v4, "attributions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v37 = 0;

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v4, "attributions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v71 != v41)
            objc_enumerationMutation(v38);
          v43 = -[_SFPBRFAttribution initWithFacade:]([_SFPBRFAttribution alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
          if (v43)
            objc_msgSend(v37, "addObject:", v43);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v40);
    }

    -[_SFPBRFFormattedText setAttributions:](v5, "setAttributions:", v37);
    objc_msgSend(v4, "highlighted_substrings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v45 = 0;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v4, "highlighted_substrings", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v67 != v49)
            objc_enumerationMutation(v46);
          v51 = -[_SFPBRFHighlightedSubstring initWithFacade:]([_SFPBRFHighlightedSubstring alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
          if (v51)
            objc_msgSend(v45, "addObject:", v51);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v48);
    }

    -[_SFPBRFFormattedText setHighlighted_substrings:](v5, "setHighlighted_substrings:", v45);
    objc_msgSend(v4, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [_SFPBRFFont alloc];
      objc_msgSend(v4, "font");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[_SFPBRFFont initWithFacade:](v53, "initWithFacade:", v54);
      -[_SFPBRFFormattedText setFont:](v5, "setFont:", v55);

    }
    objc_msgSend(v4, "is_underlined");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [_SFPBRFOptionalBool alloc];
      objc_msgSend(v4, "is_underlined");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[_SFPBRFOptionalBool initWithFacade:](v57, "initWithFacade:", v58);
      -[_SFPBRFFormattedText setIs_underlined:](v5, "setIs_underlined:", v59);

    }
    objc_msgSend(v4, "engageable");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = [_SFPBRFEngageable alloc];
      objc_msgSend(v4, "engageable");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[_SFPBRFEngageable initWithFacade:](v61, "initWithFacade:", v62);
      -[_SFPBRFFormattedText setEngageable:](v5, "setEngageable:", v63);

    }
    if (objc_msgSend(v4, "hasWeight"))
      -[_SFPBRFFormattedText setWeight:](v5, "setWeight:", objc_msgSend(v4, "weight"));
    if (objc_msgSend(v4, "hasDesign"))
      -[_SFPBRFFormattedText setDesign:](v5, "setDesign:", objc_msgSend(v4, "design"));
    v64 = v5;

  }
  return v5;
}

- (void)setText:(id)a3
{
  _SFPBRFImageElement *inline_image_element;
  NSString *v5;
  NSString *text;
  id v7;

  inline_image_element = self->_inline_image_element;
  self->_inline_image_element = 0;
  v7 = a3;

  self->_whichValue = v7 != 0;
  v5 = (NSString *)objc_msgSend(v7, "copy");
  text = self->_text;
  self->_text = v5;

}

- (NSString)text
{
  if (self->_whichValue == 1)
    return self->_text;
  else
    return (NSString *)0;
}

- (void)setInline_image_element:(id)a3
{
  _SFPBRFImageElement *v4;
  NSString *text;
  _SFPBRFImageElement *inline_image_element;

  v4 = (_SFPBRFImageElement *)a3;
  text = self->_text;
  self->_text = 0;

  self->_whichValue = 2 * (v4 != 0);
  inline_image_element = self->_inline_image_element;
  self->_inline_image_element = v4;

}

- (_SFPBRFImageElement)inline_image_element
{
  if (self->_whichValue == 2)
    return self->_inline_image_element;
  else
    return (_SFPBRFImageElement *)0;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void)setIs_italic:(id)a3
{
  objc_storeStrong((id *)&self->_is_italic, a3);
}

- (void)setIs_bold:(id)a3
{
  objc_storeStrong((id *)&self->_is_bold, a3);
}

- (void)setText_encapsulation:(id)a3
{
  objc_storeStrong((id *)&self->_text_encapsulation, a3);
}

- (void)setIs_highlighted:(id)a3
{
  objc_storeStrong((id *)&self->_is_highlighted, a3);
}

- (void)setBackground_color:(id)a3
{
  objc_storeStrong((id *)&self->_background_color, a3);
}

- (void)setAttributions:(id)a3
{
  NSArray *v4;
  NSArray *attributions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  attributions = self->_attributions;
  self->_attributions = v4;

}

- (void)clearAttributions
{
  -[NSArray removeAllObjects](self->_attributions, "removeAllObjects");
}

- (void)addAttributions:(id)a3
{
  id v4;
  NSArray *attributions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  attributions = self->_attributions;
  v8 = v4;
  if (!attributions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attributions;
    self->_attributions = v6;

    v4 = v8;
    attributions = self->_attributions;
  }
  -[NSArray addObject:](attributions, "addObject:", v4);

}

- (unint64_t)attributionsCount
{
  return -[NSArray count](self->_attributions, "count");
}

- (id)attributionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_attributions, "objectAtIndexedSubscript:", a3);
}

- (void)setHighlighted_substrings:(id)a3
{
  NSArray *v4;
  NSArray *highlighted_substrings;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  highlighted_substrings = self->_highlighted_substrings;
  self->_highlighted_substrings = v4;

}

- (void)clearHighlighted_substrings
{
  -[NSArray removeAllObjects](self->_highlighted_substrings, "removeAllObjects");
}

- (void)addHighlighted_substrings:(id)a3
{
  id v4;
  NSArray *highlighted_substrings;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  highlighted_substrings = self->_highlighted_substrings;
  v8 = v4;
  if (!highlighted_substrings)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_highlighted_substrings;
    self->_highlighted_substrings = v6;

    v4 = v8;
    highlighted_substrings = self->_highlighted_substrings;
  }
  -[NSArray addObject:](highlighted_substrings, "addObject:", v4);

}

- (unint64_t)highlighted_substringsCount
{
  return -[NSArray count](self->_highlighted_substrings, "count");
}

- (id)highlighted_substringsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_highlighted_substrings, "objectAtIndexedSubscript:", a3);
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void)setIs_underlined:(id)a3
{
  objc_storeStrong((id *)&self->_is_underlined, a3);
}

- (void)setEngageable:(id)a3
{
  objc_storeStrong((id *)&self->_engageable, a3);
}

- (void)setWeight:(int)a3
{
  self->_weight = a3;
}

- (void)setDesign:(int)a3
{
  self->_design = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFormattedTextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFFormattedText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBRFFormattedText inline_image_element](self, "inline_image_element");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText is_italic](self, "is_italic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText is_bold](self, "is_bold");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText text_encapsulation](self, "text_encapsulation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText is_highlighted](self, "is_highlighted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText background_color](self, "background_color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText attributions](self, "attributions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v15);
  }

  -[_SFPBRFFormattedText highlighted_substrings](self, "highlighted_substrings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  -[_SFPBRFFormattedText font](self, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText is_underlined](self, "is_underlined");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFFormattedText engageable](self, "engageable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFFormattedText weight](self, "weight"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFFormattedText design](self, "design"))
    PBDataWriterWriteInt32Field();

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
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  BOOL v72;
  int weight;
  int design;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  -[_SFPBRFFormattedText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFFormattedText text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText inline_image_element](self, "inline_image_element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inline_image_element");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText inline_image_element](self, "inline_image_element");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFFormattedText inline_image_element](self, "inline_image_element");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inline_image_element");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText color](self, "color");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFFormattedText color](self, "color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText is_italic](self, "is_italic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "is_italic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText is_italic](self, "is_italic");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFFormattedText is_italic](self, "is_italic");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "is_italic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText is_bold](self, "is_bold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "is_bold");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText is_bold](self, "is_bold");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFFormattedText is_bold](self, "is_bold");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "is_bold");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText text_encapsulation](self, "text_encapsulation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text_encapsulation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText text_encapsulation](self, "text_encapsulation");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFFormattedText text_encapsulation](self, "text_encapsulation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_encapsulation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText is_highlighted](self, "is_highlighted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "is_highlighted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText is_highlighted](self, "is_highlighted");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBRFFormattedText is_highlighted](self, "is_highlighted");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "is_highlighted");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText background_color](self, "background_color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "background_color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText background_color](self, "background_color");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBRFFormattedText background_color](self, "background_color");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background_color");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText attributions](self, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText attributions](self, "attributions");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBRFFormattedText attributions](self, "attributions");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributions");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText highlighted_substrings](self, "highlighted_substrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlighted_substrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText highlighted_substrings](self, "highlighted_substrings");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBRFFormattedText highlighted_substrings](self, "highlighted_substrings");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "highlighted_substrings");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText font](self, "font");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBRFFormattedText font](self, "font");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "font");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText is_underlined](self, "is_underlined");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "is_underlined");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_66;
  -[_SFPBRFFormattedText is_underlined](self, "is_underlined");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[_SFPBRFFormattedText is_underlined](self, "is_underlined");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "is_underlined");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_67;
  }
  else
  {

  }
  -[_SFPBRFFormattedText engageable](self, "engageable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engageable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_66:

    goto LABEL_67;
  }
  -[_SFPBRFFormattedText engageable](self, "engageable");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    -[_SFPBRFFormattedText engageable](self, "engageable");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "engageable");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_67;
  }
  else
  {

  }
  weight = self->_weight;
  if (weight == objc_msgSend(v4, "weight"))
  {
    design = self->_design;
    v72 = design == objc_msgSend(v4, "design");
    goto LABEL_68;
  }
LABEL_67:
  v72 = 0;
LABEL_68:

  return v72;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;

  v15 = -[NSString hash](self->_text, "hash");
  v14 = -[_SFPBRFImageElement hash](self->_inline_image_element, "hash");
  v13 = -[_SFPBRFColor hash](self->_color, "hash");
  v3 = -[_SFPBRFOptionalBool hash](self->_is_italic, "hash");
  v4 = -[_SFPBRFOptionalBool hash](self->_is_bold, "hash");
  v5 = -[_SFPBRFTextEncapsulation hash](self->_text_encapsulation, "hash");
  v6 = -[_SFPBRFOptionalBool hash](self->_is_highlighted, "hash");
  v7 = -[_SFPBRFColor hash](self->_background_color, "hash");
  v8 = -[NSArray hash](self->_attributions, "hash");
  v9 = -[NSArray hash](self->_highlighted_substrings, "hash");
  v10 = -[_SFPBRFFont hash](self->_font, "hash");
  v11 = -[_SFPBRFOptionalBool hash](self->_is_underlined, "hash");
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_SFPBRFEngageable hash](self->_engageable, "hash") ^ (2654435761 * self->_weight) ^ (2654435761 * self->_design);
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  uint64_t v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_attributions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v5 = self->_attributions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v62 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("attributions"));
  }
  if (self->_background_color)
  {
    -[_SFPBRFFormattedText background_color](self, "background_color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("backgroundColor"));

    }
  }
  if (self->_color)
  {
    -[_SFPBRFFormattedText color](self, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("color"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("color"));

    }
  }
  if (self->_design)
  {
    v18 = -[_SFPBRFFormattedText design](self, "design");
    if (v18 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = *(&off_1E4042190 + v18);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("design"));

  }
  if (self->_engageable)
  {
    -[_SFPBRFFormattedText engageable](self, "engageable");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("engageable"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("engageable"));

    }
  }
  if (self->_font)
  {
    -[_SFPBRFFormattedText font](self, "font");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("font"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("font"));

    }
  }
  if (-[NSArray count](self->_highlighted_substrings, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v27 = self->_highlighted_substrings;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v58 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "dictionaryRepresentation");
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
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("highlightedSubstrings"));
  }
  if (self->_inline_image_element)
  {
    -[_SFPBRFFormattedText inline_image_element](self, "inline_image_element");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("inlineImageElement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("inlineImageElement"));

    }
  }
  if (self->_is_bold)
  {
    -[_SFPBRFFormattedText is_bold](self, "is_bold");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isBold"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("isBold"));

    }
  }
  if (self->_is_highlighted)
  {
    -[_SFPBRFFormattedText is_highlighted](self, "is_highlighted");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isHighlighted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isHighlighted"));

    }
  }
  if (self->_is_italic)
  {
    -[_SFPBRFFormattedText is_italic](self, "is_italic");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isItalic"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("isItalic"));

    }
  }
  if (self->_is_underlined)
  {
    -[_SFPBRFFormattedText is_underlined](self, "is_underlined");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("isUnderlined"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("isUnderlined"));

    }
  }
  if (self->_text)
  {
    -[_SFPBRFFormattedText text](self, "text");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("text"));

  }
  if (self->_text_encapsulation)
  {
    -[_SFPBRFFormattedText text_encapsulation](self, "text_encapsulation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("textEncapsulation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("textEncapsulation"));

    }
  }
  if (self->_weight)
  {
    v54 = -[_SFPBRFFormattedText weight](self, "weight");
    if (v54 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = *(&off_1E4041E50 + v54);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("weight"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFFormattedText dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFFormattedText)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFFormattedText *v5;
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
    self = -[_SFPBRFFormattedText initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFFormattedText)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFFormattedText *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _SFPBRFImageElement *v9;
  uint64_t v10;
  _SFPBRFColor *v11;
  uint64_t v12;
  __objc2_class **v13;
  _SFPBRFOptionalBool *v14;
  uint64_t v15;
  _SFPBRFOptionalBool *v16;
  void *v17;
  _SFPBRFTextEncapsulation *v18;
  uint64_t v19;
  _SFPBRFOptionalBool *v20;
  uint64_t v21;
  _SFPBRFColor *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  _SFPBRFAttribution *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  _SFPBRFHighlightedSubstring *v38;
  void *v39;
  _SFPBRFFont *v40;
  void *v41;
  void *v42;
  void *v43;
  _SFPBRFEngageable *v44;
  void *v45;
  void *v46;
  _SFPBRFFormattedText *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)_SFPBRFFormattedText;
  v5 = -[_SFPBRFFormattedText init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRFFormattedText setText:](v5, "setText:", v7);

    }
    v54 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inlineImageElement"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFImageElement initWithDictionary:]([_SFPBRFImageElement alloc], "initWithDictionary:", v8);
      -[_SFPBRFFormattedText setInline_image_element:](v5, "setInline_image_element:", v9);

    }
    v53 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v10);
      -[_SFPBRFFormattedText setColor:](v5, "setColor:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isItalic"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = off_1E4040000;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBRFOptionalBool initWithDictionary:]([_SFPBRFOptionalBool alloc], "initWithDictionary:", v12);
      -[_SFPBRFFormattedText setIs_italic:](v5, "setIs_italic:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBold"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBRFOptionalBool initWithDictionary:]([_SFPBRFOptionalBool alloc], "initWithDictionary:", v15);
      -[_SFPBRFFormattedText setIs_bold:](v5, "setIs_bold:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textEncapsulation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBRFTextEncapsulation initWithDictionary:]([_SFPBRFTextEncapsulation alloc], "initWithDictionary:", v17);
      -[_SFPBRFFormattedText setText_encapsulation:](v5, "setText_encapsulation:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHighlighted"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBRFOptionalBool initWithDictionary:]([_SFPBRFOptionalBool alloc], "initWithDictionary:", v19);
      -[_SFPBRFFormattedText setIs_highlighted:](v5, "setIs_highlighted:", v20);

    }
    v50 = (void *)v15;
    v51 = (void *)v12;
    v52 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v21);
      -[_SFPBRFFormattedText setBackground_color:](v5, "setBackground_color:", v22);

    }
    v49 = (void *)v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v62 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = -[_SFPBRFAttribution initWithDictionary:]([_SFPBRFAttribution alloc], "initWithDictionary:", v29);
              -[_SFPBRFFormattedText addAttributions:](v5, "addAttributions:", v30);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        }
        while (v26);
      }

      v13 = off_1E4040000;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("highlightedSubstrings"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v58 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = -[_SFPBRFHighlightedSubstring initWithDictionary:]([_SFPBRFHighlightedSubstring alloc], "initWithDictionary:", v37);
              -[_SFPBRFFormattedText addHighlighted_substrings:](v5, "addHighlighted_substrings:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        }
        while (v34);
      }

      v13 = off_1E4040000;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("font"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = -[_SFPBRFFont initWithDictionary:]([_SFPBRFFont alloc], "initWithDictionary:", v39);
      -[_SFPBRFFormattedText setFont:](v5, "setFont:", v40);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUnderlined"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = (void *)objc_msgSend(objc_alloc(v13[482]), "initWithDictionary:", v41);
      -[_SFPBRFFormattedText setIs_underlined:](v5, "setIs_underlined:", v42);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engageable"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = -[_SFPBRFEngageable initWithDictionary:]([_SFPBRFEngageable alloc], "initWithDictionary:", v43);
      -[_SFPBRFFormattedText setEngageable:](v5, "setEngageable:", v44);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weight"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFFormattedText setWeight:](v5, "setWeight:", objc_msgSend(v45, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("design"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFFormattedText setDesign:](v5, "setDesign:", objc_msgSend(v46, "intValue"));
    v47 = v5;

  }
  return v5;
}

- (_SFPBRFColor)color
{
  return self->_color;
}

- (_SFPBRFOptionalBool)is_italic
{
  return self->_is_italic;
}

- (_SFPBRFOptionalBool)is_bold
{
  return self->_is_bold;
}

- (_SFPBRFTextEncapsulation)text_encapsulation
{
  return self->_text_encapsulation;
}

- (_SFPBRFOptionalBool)is_highlighted
{
  return self->_is_highlighted;
}

- (_SFPBRFColor)background_color
{
  return self->_background_color;
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (NSArray)highlighted_substrings
{
  return self->_highlighted_substrings;
}

- (_SFPBRFFont)font
{
  return self->_font;
}

- (_SFPBRFOptionalBool)is_underlined
{
  return self->_is_underlined;
}

- (_SFPBRFEngageable)engageable
{
  return self->_engageable;
}

- (int)weight
{
  return self->_weight;
}

- (int)design
{
  return self->_design;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engageable, 0);
  objc_storeStrong((id *)&self->_is_underlined, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_highlighted_substrings, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_is_highlighted, 0);
  objc_storeStrong((id *)&self->_text_encapsulation, 0);
  objc_storeStrong((id *)&self->_is_bold, 0);
  objc_storeStrong((id *)&self->_is_italic, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_inline_image_element, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
