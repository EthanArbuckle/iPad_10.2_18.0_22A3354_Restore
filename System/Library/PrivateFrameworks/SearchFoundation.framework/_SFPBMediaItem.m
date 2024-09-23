@implementation _SFPBMediaItem

- (_SFPBMediaItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBMediaItem *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBText *v9;
  void *v10;
  _SFPBText *v11;
  void *v12;
  _SFPBImage *v13;
  void *v14;
  _SFPBImage *v15;
  void *v16;
  _SFPBImage *v17;
  void *v18;
  _SFPBImage *v19;
  void *v20;
  _SFPBImage *v21;
  void *v22;
  _SFPBImage *v23;
  void *v24;
  void *v25;
  void *v26;
  _SFPBPunchout *v27;
  void *v28;
  _SFPBPunchout *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  _SFPBMediaOffer *v44;
  void *v45;
  void *v46;
  void *v47;
  _SFPBImage *v48;
  void *v49;
  _SFPBImage *v50;
  _SFPBMediaItem *v51;
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
  v4 = a3;
  v5 = -[_SFPBMediaItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaItem setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "subtitleText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBText alloc];
      objc_msgSend(v4, "subtitleText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBText initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBMediaItem setSubtitleText:](v5, "setSubtitleText:", v11);

    }
    objc_msgSend(v4, "thumbnail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBImage alloc];
      objc_msgSend(v4, "thumbnail");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBImage initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBMediaItem setThumbnail:](v5, "setThumbnail:", v15);

    }
    objc_msgSend(v4, "reviewGlyph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBImage alloc];
      objc_msgSend(v4, "reviewGlyph");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBImage initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBMediaItem setReviewGlyph:](v5, "setReviewGlyph:", v19);

    }
    objc_msgSend(v4, "overlayImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBImage alloc];
      objc_msgSend(v4, "overlayImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBImage initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBMediaItem setOverlayImage:](v5, "setOverlayImage:", v23);

    }
    objc_msgSend(v4, "reviewText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "reviewText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaItem setReviewText:](v5, "setReviewText:", v25);

    }
    objc_msgSend(v4, "punchout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "punchout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBPunchout initWithFacade:](v27, "initWithFacade:", v28);
      -[_SFPBMediaItem setPunchout:](v5, "setPunchout:", v29);

    }
    objc_msgSend(v4, "subtitleCustomLineBreaking");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v4, "subtitleCustomLineBreaking");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v58 != v35)
            objc_enumerationMutation(v32);
          if (*(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i))
            objc_msgSend(v31, "addObject:");
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v34);
    }

    -[_SFPBMediaItem setSubtitleCustomLineBreakings:](v5, "setSubtitleCustomLineBreakings:", v31);
    objc_msgSend(v4, "buyOptions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v38 = 0;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v4, "buyOptions", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v54 != v42)
            objc_enumerationMutation(v39);
          v44 = -[_SFPBMediaOffer initWithFacade:]([_SFPBMediaOffer alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
          if (v44)
            objc_msgSend(v38, "addObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v41);
    }

    -[_SFPBMediaItem setBuyOptions:](v5, "setBuyOptions:", v38);
    objc_msgSend(v4, "contentAdvisory");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "contentAdvisory");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaItem setContentAdvisory:](v5, "setContentAdvisory:", v46);

    }
    objc_msgSend(v4, "contentAdvisoryImage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = [_SFPBImage alloc];
      objc_msgSend(v4, "contentAdvisoryImage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[_SFPBImage initWithFacade:](v48, "initWithFacade:", v49);
      -[_SFPBMediaItem setContentAdvisoryImage:](v5, "setContentAdvisoryImage:", v50);

    }
    v51 = v5;

  }
  return v5;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setReviewGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_reviewGlyph, a3);
}

- (void)setOverlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_overlayImage, a3);
}

- (void)setReviewText:(id)a3
{
  NSString *v4;
  NSString *reviewText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reviewText = self->_reviewText;
  self->_reviewText = v4;

}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void)setSubtitleCustomLineBreaking:(id)a3
{
  NSArray *v4;
  NSArray *subtitleCustomLineBreakings;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  subtitleCustomLineBreakings = self->_subtitleCustomLineBreakings;
  self->_subtitleCustomLineBreakings = v4;

}

- (void)clearSubtitleCustomLineBreaking
{
  -[NSArray removeAllObjects](self->_subtitleCustomLineBreakings, "removeAllObjects");
}

- (void)addSubtitleCustomLineBreaking:(id)a3
{
  id v4;
  NSArray *subtitleCustomLineBreakings;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  subtitleCustomLineBreakings = self->_subtitleCustomLineBreakings;
  v8 = v4;
  if (!subtitleCustomLineBreakings)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_subtitleCustomLineBreakings;
    self->_subtitleCustomLineBreakings = v6;

    v4 = v8;
    subtitleCustomLineBreakings = self->_subtitleCustomLineBreakings;
  }
  -[NSArray addObject:](subtitleCustomLineBreakings, "addObject:", v4);

}

- (unint64_t)subtitleCustomLineBreakingCount
{
  return -[NSArray count](self->_subtitleCustomLineBreakings, "count");
}

- (id)subtitleCustomLineBreakingAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_subtitleCustomLineBreakings, "objectAtIndexedSubscript:", a3);
}

- (void)setBuyOptions:(id)a3
{
  NSArray *v4;
  NSArray *buyOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  buyOptions = self->_buyOptions;
  self->_buyOptions = v4;

}

- (void)clearBuyOptions
{
  -[NSArray removeAllObjects](self->_buyOptions, "removeAllObjects");
}

- (void)addBuyOptions:(id)a3
{
  id v4;
  NSArray *buyOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  buyOptions = self->_buyOptions;
  v8 = v4;
  if (!buyOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_buyOptions;
    self->_buyOptions = v6;

    v4 = v8;
    buyOptions = self->_buyOptions;
  }
  -[NSArray addObject:](buyOptions, "addObject:", v4);

}

- (unint64_t)buyOptionsCount
{
  return -[NSArray count](self->_buyOptions, "count");
}

- (id)buyOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_buyOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setContentAdvisory:(id)a3
{
  NSString *v4;
  NSString *contentAdvisory;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentAdvisory = self->_contentAdvisory;
  self->_contentAdvisory = v4;

}

- (void)setContentAdvisoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_contentAdvisoryImage, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaItemReadFrom(self, (uint64_t)a3);
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
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
  -[_SFPBMediaItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBMediaItem subtitleText](self, "subtitleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaItem thumbnail](self, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaItem reviewGlyph](self, "reviewGlyph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaItem overlayImage](self, "overlayImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaItem reviewText](self, "reviewText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBMediaItem punchout](self, "punchout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteSubmessage();

  -[_SFPBMediaItem subtitleCustomLineBreakings](self, "subtitleCustomLineBreakings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v14);
  }

  -[_SFPBMediaItem buyOptions](self, "buyOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  -[_SFPBMediaItem contentAdvisory](self, "contentAdvisory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteStringField();

  -[_SFPBMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
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
  char v61;
  BOOL v62;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  -[_SFPBMediaItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMediaItem title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem subtitleText](self, "subtitleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem subtitleText](self, "subtitleText");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBMediaItem subtitleText](self, "subtitleText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem thumbnail](self, "thumbnail");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBMediaItem thumbnail](self, "thumbnail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem reviewGlyph](self, "reviewGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reviewGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem reviewGlyph](self, "reviewGlyph");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBMediaItem reviewGlyph](self, "reviewGlyph");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reviewGlyph");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem overlayImage](self, "overlayImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem overlayImage](self, "overlayImage");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBMediaItem overlayImage](self, "overlayImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overlayImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem reviewText](self, "reviewText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reviewText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem reviewText](self, "reviewText");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBMediaItem reviewText](self, "reviewText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reviewText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem punchout](self, "punchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem punchout](self, "punchout");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBMediaItem punchout](self, "punchout");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchout");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem subtitleCustomLineBreakings](self, "subtitleCustomLineBreakings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleCustomLineBreakings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem subtitleCustomLineBreakings](self, "subtitleCustomLineBreakings");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBMediaItem subtitleCustomLineBreakings](self, "subtitleCustomLineBreakings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleCustomLineBreakings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem buyOptions](self, "buyOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buyOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem buyOptions](self, "buyOptions");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBMediaItem buyOptions](self, "buyOptions");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buyOptions");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem contentAdvisory](self, "contentAdvisory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAdvisory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBMediaItem contentAdvisory](self, "contentAdvisory");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBMediaItem contentAdvisory](self, "contentAdvisory");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAdvisory");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAdvisoryImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
    {

LABEL_60:
      v62 = 1;
      goto LABEL_58;
    }
    v58 = (void *)v57;
    -[_SFPBMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAdvisoryImage");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if ((v61 & 1) != 0)
      goto LABEL_60;
  }
  else
  {
LABEL_56:

  }
LABEL_57:
  v62 = 0;
LABEL_58:

  return v62;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[_SFPBText hash](self->_subtitleText, "hash") ^ v3;
  v5 = -[_SFPBImage hash](self->_thumbnail, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBImage hash](self->_reviewGlyph, "hash");
  v7 = -[_SFPBImage hash](self->_overlayImage, "hash");
  v8 = v7 ^ -[NSString hash](self->_reviewText, "hash");
  v9 = v6 ^ v8 ^ -[_SFPBPunchout hash](self->_punchout, "hash");
  v10 = -[NSArray hash](self->_subtitleCustomLineBreakings, "hash");
  v11 = v10 ^ -[NSArray hash](self->_buyOptions, "hash");
  v12 = v11 ^ -[NSString hash](self->_contentAdvisory, "hash");
  return v9 ^ v12 ^ -[_SFPBImage hash](self->_contentAdvisoryImage, "hash");
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_buyOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = self->_buyOptions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v39);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("buyOptions"));
  }
  if (self->_contentAdvisory)
  {
    -[_SFPBMediaItem contentAdvisory](self, "contentAdvisory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("contentAdvisory"));

  }
  if (self->_contentAdvisoryImage)
  {
    -[_SFPBMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("contentAdvisoryImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("contentAdvisoryImage"));

    }
  }
  if (self->_overlayImage)
  {
    -[_SFPBMediaItem overlayImage](self, "overlayImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("overlayImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("overlayImage"));

    }
  }
  if (self->_punchout)
  {
    -[_SFPBMediaItem punchout](self, "punchout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("punchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("punchout"));

    }
  }
  if (self->_reviewGlyph)
  {
    -[_SFPBMediaItem reviewGlyph](self, "reviewGlyph");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("reviewGlyph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("reviewGlyph"));

    }
  }
  if (self->_reviewText)
  {
    -[_SFPBMediaItem reviewText](self, "reviewText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("reviewText"));

  }
  if (self->_subtitleCustomLineBreakings)
  {
    -[_SFPBMediaItem subtitleCustomLineBreakings](self, "subtitleCustomLineBreakings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("subtitleCustomLineBreaking"));

  }
  if (self->_subtitleText)
  {
    -[_SFPBMediaItem subtitleText](self, "subtitleText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("subtitleText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("subtitleText"));

    }
  }
  if (self->_thumbnail)
  {
    -[_SFPBMediaItem thumbnail](self, "thumbnail");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("thumbnail"));

    }
  }
  if (self->_title)
  {
    -[_SFPBMediaItem title](self, "title");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMediaItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMediaItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMediaItem *v5;
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
    self = -[_SFPBMediaItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMediaItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMediaItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _SFPBText *v9;
  uint64_t v10;
  __objc2_class **v11;
  _SFPBImage *v12;
  void *v13;
  _SFPBImage *v14;
  uint64_t v15;
  _SFPBImage *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _SFPBPunchout *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  _SFPBMediaOffer *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _SFPBMediaItem *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)_SFPBMediaItem;
  v5 = -[_SFPBMediaItem init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBMediaItem setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitleText"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBText initWithDictionary:]([_SFPBText alloc], "initWithDictionary:", v8);
      -[_SFPBMediaItem setSubtitleText:](v5, "setSubtitleText:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = off_1E4040000;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v10);
      -[_SFPBMediaItem setThumbnail:](v5, "setThumbnail:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reviewGlyph"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v13);
      -[_SFPBMediaItem setReviewGlyph:](v5, "setReviewGlyph:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overlayImage"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = (void *)v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v15);
      -[_SFPBMediaItem setOverlayImage:](v5, "setOverlayImage:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reviewText"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBMediaItem setReviewText:](v5, "setReviewText:", v18);

    }
    v46 = (void *)v10;
    v47 = (void *)v8;
    v48 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchout"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v19);
      -[_SFPBMediaItem setPunchout:](v5, "setPunchout:", v20);

    }
    v44 = (void *)v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitleCustomLineBreaking"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v13;
    v43 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v57 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = (void *)objc_msgSend(v27, "copy");
              -[_SFPBMediaItem addSubtitleCustomLineBreaking:](v5, "addSubtitleCustomLineBreaking:", v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v24);
      }

      v13 = v45;
      v11 = off_1E4040000;
      v21 = v43;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyOptions"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v53 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = -[_SFPBMediaOffer initWithDictionary:]([_SFPBMediaOffer alloc], "initWithDictionary:", v35);
              -[_SFPBMediaItem addBuyOptions:](v5, "addBuyOptions:", v36);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v32);
      }

      v13 = v45;
      v11 = off_1E4040000;
      v21 = v43;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentAdvisory"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = (void *)objc_msgSend(v37, "copy");
      -[_SFPBMediaItem setContentAdvisory:](v5, "setContentAdvisory:", v38);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentAdvisoryImage"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = (void *)objc_msgSend(objc_alloc(v11[368]), "initWithDictionary:", v39);
      -[_SFPBMediaItem setContentAdvisoryImage:](v5, "setContentAdvisoryImage:", v40);

    }
    v41 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBText)subtitleText
{
  return self->_subtitleText;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (_SFPBImage)overlayImage
{
  return self->_overlayImage;
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (_SFPBPunchout)punchout
{
  return self->_punchout;
}

- (NSArray)subtitleCustomLineBreakings
{
  return self->_subtitleCustomLineBreakings;
}

- (void)setSubtitleCustomLineBreakings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)buyOptions
{
  return self->_buyOptions;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (_SFPBImage)contentAdvisoryImage
{
  return self->_contentAdvisoryImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAdvisoryImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_buyOptions, 0);
  objc_storeStrong((id *)&self->_subtitleCustomLineBreakings, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
