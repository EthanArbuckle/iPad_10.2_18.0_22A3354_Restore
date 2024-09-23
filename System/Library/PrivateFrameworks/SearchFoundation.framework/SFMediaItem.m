@implementation SFMediaItem

- (SFMediaItem)initWithProtobuf:(id)a3
{
  id v4;
  SFMediaItem *v5;
  void *v6;
  void *v7;
  void *v8;
  SFText *v9;
  void *v10;
  SFText *v11;
  void *v12;
  SFImage *v13;
  void *v14;
  SFImage *v15;
  void *v16;
  SFImage *v17;
  void *v18;
  SFImage *v19;
  void *v20;
  SFImage *v21;
  void *v22;
  SFImage *v23;
  void *v24;
  void *v25;
  void *v26;
  SFPunchout *v27;
  void *v28;
  SFPunchout *v29;
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
  SFMediaOffer *v44;
  void *v45;
  void *v46;
  void *v47;
  SFImage *v48;
  void *v49;
  SFImage *v50;
  SFMediaItem *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)SFMediaItem;
  v5 = -[SFMediaItem init](&v61, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaItem setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "subtitleText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFText alloc];
      objc_msgSend(v4, "subtitleText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFText initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[SFMediaItem setSubtitleText:](v5, "setSubtitleText:", v11);

    }
    objc_msgSend(v4, "thumbnail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [SFImage alloc];
      objc_msgSend(v4, "thumbnail");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SFImage initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[SFMediaItem setThumbnail:](v5, "setThumbnail:", v15);

    }
    objc_msgSend(v4, "reviewGlyph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [SFImage alloc];
      objc_msgSend(v4, "reviewGlyph");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SFImage initWithProtobuf:](v17, "initWithProtobuf:", v18);
      -[SFMediaItem setReviewGlyph:](v5, "setReviewGlyph:", v19);

    }
    objc_msgSend(v4, "overlayImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFImage alloc];
      objc_msgSend(v4, "overlayImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFImage initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFMediaItem setOverlayImage:](v5, "setOverlayImage:", v23);

    }
    objc_msgSend(v4, "reviewText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "reviewText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaItem setReviewText:](v5, "setReviewText:", v25);

    }
    objc_msgSend(v4, "punchout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [SFPunchout alloc];
      objc_msgSend(v4, "punchout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SFPunchout initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[SFMediaItem setPunchout:](v5, "setPunchout:", v29);

    }
    objc_msgSend(v4, "subtitleCustomLineBreakings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v4, "subtitleCustomLineBreakings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
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
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      }
      while (v34);
    }

    -[SFMediaItem setSubtitleCustomLineBreaking:](v5, "setSubtitleCustomLineBreaking:", v31);
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
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
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
          v44 = -[SFMediaOffer initWithProtobuf:]([SFMediaOffer alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
          if (v44)
            objc_msgSend(v38, "addObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v41);
    }

    -[SFMediaItem setBuyOptions:](v5, "setBuyOptions:", v38);
    objc_msgSend(v4, "contentAdvisory");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "contentAdvisory");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaItem setContentAdvisory:](v5, "setContentAdvisory:", v46);

    }
    objc_msgSend(v4, "contentAdvisoryImage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = [SFImage alloc];
      objc_msgSend(v4, "contentAdvisoryImage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[SFImage initWithProtobuf:](v48, "initWithProtobuf:", v49);
      -[SFMediaItem setContentAdvisoryImage:](v5, "setContentAdvisoryImage:", v50);

    }
    v51 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMediaItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaItem *v6;
  SFMediaItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMediaItem initWithData:]([_SFPBMediaItem alloc], "initWithData:", v5);
  v7 = -[SFMediaItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMediaItem *v6;

  v4 = a3;
  v6 = -[_SFPBMediaItem initWithFacade:]([_SFPBMediaItem alloc], "initWithFacade:", self);
  -[_SFPBMediaItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMediaItem *v2;
  void *v3;

  v2 = -[_SFPBMediaItem initWithFacade:]([_SFPBMediaItem alloc], "initWithFacade:", self);
  -[_SFPBMediaItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMediaItem *v2;
  void *v3;

  v2 = -[_SFPBMediaItem initWithFacade:]([_SFPBMediaItem alloc], "initWithFacade:", self);
  -[_SFPBMediaItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFMediaItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFMediaItem subtitleText](self, "subtitleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSubtitleText:", v8);

  -[SFMediaItem thumbnail](self, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setThumbnail:", v10);

  -[SFMediaItem reviewGlyph](self, "reviewGlyph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setReviewGlyph:", v12);

  -[SFMediaItem overlayImage](self, "overlayImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setOverlayImage:", v14);

  -[SFMediaItem reviewText](self, "reviewText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setReviewText:", v16);

  -[SFMediaItem punchout](self, "punchout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setPunchout:", v18);

  -[SFMediaItem subtitleCustomLineBreaking](self, "subtitleCustomLineBreaking");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setSubtitleCustomLineBreaking:", v20);

  -[SFMediaItem buyOptions](self, "buyOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setBuyOptions:", v22);

  -[SFMediaItem contentAdvisory](self, "contentAdvisory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setContentAdvisory:", v24);

  -[SFMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setContentAdvisoryImage:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFMediaItem *v4;
  SFMediaItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  void *v20;
  SFMediaItem *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  SFMediaItem *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  _QWORD v100[6];
  int v101;
  int v102;
  id v103;
  id v104;
  _QWORD v105[4];

  v4 = (SFMediaItem *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_78;
  }
  if (!-[SFMediaItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v18 = 0;
    goto LABEL_78;
  }
  v5 = v4;
  -[SFMediaItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaItem title](v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  v104 = v6;
  v101 = v7 != 0;
  v102 = v6 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    v99 = 0uLL;
    memset(v105, 0, sizeof(v105));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  -[SFMediaItem title](self, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v98 = (void *)v8;
  if (v8)
  {
    -[SFMediaItem title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem title](v5, "title");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      memset(v100, 0, 44);
      memset(v105, 0, sizeof(v105));
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      HIDWORD(v100[5]) = 1;
      goto LABEL_15;
    }
  }
  -[SFMediaItem subtitleText](self, "subtitleText");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaItem subtitleText](v5, "subtitleText");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v100[5]) = v9;
  if ((v97 == 0) == (v96 != 0))
  {
    v99 = 0uLL;
    memset(v100, 0, 36);
    memset(v105, 0, sizeof(v105));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)((char *)&v100[4] + 4) = 1;
    goto LABEL_15;
  }
  -[SFMediaItem subtitleText](self, "subtitleText");
  v19 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[3]) = v19 != 0;
  v93 = (void *)v19;
  if (v19)
  {
    -[SFMediaItem subtitleText](self, "subtitleText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem subtitleText](v5, "subtitleText");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v100, 0, 32);
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 28);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      HIDWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  -[SFMediaItem thumbnail](self, "thumbnail");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaItem thumbnail](v5, "thumbnail");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v92 == 0) == (v91 != 0))
  {
    memset(v100, 0, 24);
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 28);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 1;
    goto LABEL_15;
  }
  -[SFMediaItem thumbnail](self, "thumbnail");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v105[3]) = v88 != 0;
  if (v88)
  {
    -[SFMediaItem thumbnail](self, "thumbnail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem thumbnail](v5, "thumbnail");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      memset(v100, 0, 24);
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 24);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      LODWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  -[SFMediaItem reviewGlyph](self, "reviewGlyph");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaItem reviewGlyph](v5, "reviewGlyph");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v87 == 0) == (v86 != 0))
  {
    v100[0] = 0;
    v100[1] = 0;
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    memset(v105, 0, 24);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 1;
    goto LABEL_15;
  }
  -[SFMediaItem reviewGlyph](self, "reviewGlyph");
  v30 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[2]) = v30 != 0;
  v83 = (void *)v30;
  if (v30)
  {
    -[SFMediaItem reviewGlyph](self, "reviewGlyph");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem reviewGlyph](v5, "reviewGlyph");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v100[0] = 0;
      v100[1] = 0;
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 20);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      HIDWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  -[SFMediaItem overlayImage](self, "overlayImage");
  v32 = objc_claimAutoreleasedReturnValue();
  -[SFMediaItem overlayImage](v5, "overlayImage");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v32;
  if ((v32 == 0) == (v81 != 0))
  {
    v100[0] = 0;
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 20);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 1;
    goto LABEL_15;
  }
  -[SFMediaItem overlayImage](self, "overlayImage");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33 != 0;
  v78 = (void *)v33;
  if (v33)
  {
    -[SFMediaItem overlayImage](self, "overlayImage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem overlayImage](v5, "overlayImage");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v100[0] = 0;
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 20);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      LODWORD(v100[5]) = 1;
      goto LABEL_15;
    }
    LODWORD(v100[5]) = v34;
  }
  else
  {
    LODWORD(v100[5]) = 0;
  }
  -[SFMediaItem reviewText](self, "reviewText");
  v36 = objc_claimAutoreleasedReturnValue();
  -[SFMediaItem reviewText](v5, "reviewText");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v36;
  if ((v36 == 0) == (v76 != 0))
  {
    v100[0] = 0;
    *(_QWORD *)((char *)&v99 + 4) = 0;
    LODWORD(v99) = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 20);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    goto LABEL_15;
  }
  -[SFMediaItem reviewText](self, "reviewText");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v105[2]) = v73 != 0;
  if (v73)
  {
    -[SFMediaItem reviewText](self, "reviewText");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem reviewText](v5, "reviewText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(_QWORD *)((char *)&v99 + 4) = 0;
      v100[0] = 0x100000000;
      v105[0] = 0;
      v105[1] = 0;
      LODWORD(v99) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      HIDWORD(v99) = 1;
      LODWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  -[SFMediaItem punchout](self, "punchout");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaItem punchout](v5, "punchout");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v72 == 0) == (v71 != 0))
  {
    v100[0] = 0x100000000;
    v105[0] = 0;
    v105[1] = 0;
    *(_QWORD *)&v99 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    *((_QWORD *)&v99 + 1) = 0x100000001;
    goto LABEL_15;
  }
  -[SFMediaItem punchout](self, "punchout");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[1]) = v68 != 0;
  if (v68)
  {
    -[SFMediaItem punchout](self, "punchout");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem punchout](v5, "punchout");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(_QWORD *)&v99 = 0;
      v11 = 0;
      *(_QWORD *)((char *)v105 + 4) = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v105[0]) = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((_QWORD *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      HIDWORD(v105[1]) = 1;
      goto LABEL_15;
    }
  }
  -[SFMediaItem subtitleCustomLineBreaking](self, "subtitleCustomLineBreaking");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaItem subtitleCustomLineBreaking](v5, "subtitleCustomLineBreaking");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v67 == 0) == (v66 != 0))
  {
    v11 = 0;
    *(_QWORD *)((char *)v105 + 4) = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    LODWORD(v105[0]) = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(_QWORD *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    goto LABEL_15;
  }
  -[SFMediaItem subtitleCustomLineBreaking](self, "subtitleCustomLineBreaking");
  v39 = objc_claimAutoreleasedReturnValue();
  LODWORD(v105[1]) = v39 != 0;
  v63 = (void *)v39;
  v46 = v5;
  if (!v39
    || (-[SFMediaItem subtitleCustomLineBreaking](self, "subtitleCustomLineBreaking"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SFMediaItem subtitleCustomLineBreaking](v5, "subtitleCustomLineBreaking"),
        v59 = (void *)objc_claimAutoreleasedReturnValue(),
        v60 = v40,
        objc_msgSend(v40, "isEqual:")))
  {
    -[SFMediaItem buyOptions](self, "buyOptions");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMediaItem buyOptions](v5, "buyOptions");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v62 == 0) == (v61 != 0))
    {
      v12 = 0;
      v105[0] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((_QWORD *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      v11 = 1;
      *(_QWORD *)&v99 = 0x100000001;
    }
    else
    {
      -[SFMediaItem buyOptions](self, "buyOptions");
      v41 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v105[0]) = v41 != 0;
      v58 = (void *)v41;
      if (!v41
        || (-[SFMediaItem buyOptions](self, "buyOptions"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFMediaItem buyOptions](v46, "buyOptions"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        -[SFMediaItem contentAdvisory](self, "contentAdvisory");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaItem contentAdvisory](v46, "contentAdvisory");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v57 == 0) == (v56 != 0))
        {
          v14 = 0;
          LODWORD(v105[0]) = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v100[4] = 0x100000001;
          v100[3] = 0x100000001;
          v100[2] = 0x100000001;
          v100[1] = 0x100000001;
          *((_QWORD *)&v99 + 1) = 0x100000001;
          v100[0] = 0x100000001;
          *(_QWORD *)&v99 = 0x100000001;
          v11 = 1;
          v12 = 1;
          v13 = 1;
        }
        else
        {
          -[SFMediaItem contentAdvisory](self, "contentAdvisory");
          v43 = objc_claimAutoreleasedReturnValue();
          LODWORD(v105[0]) = v43 != 0;
          v53 = (void *)v43;
          if (!v43
            || (-[SFMediaItem contentAdvisory](self, "contentAdvisory"),
                v44 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFMediaItem contentAdvisory](v46, "contentAdvisory"),
                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                v50 = v44,
                objc_msgSend(v44, "isEqual:")))
          {
            -[SFMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFMediaItem contentAdvisoryImage](v46, "contentAdvisoryImage");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v52 == 0) == (v51 != 0))
            {
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((_QWORD *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99 = 0x100000001;
              v11 = 1;
              v12 = 1;
              v13 = 1;
              v14 = 1;
              v15 = 1;
            }
            else
            {
              -[SFMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                -[SFMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = v46;
                -[SFMediaItem contentAdvisoryImage](v46, "contentAdvisoryImage");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v45;
                v18 = objc_msgSend(v45, "isEqual:", v7);
                v17 = 1;
                v100[4] = 0x100000001;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                v100[1] = 0x100000001;
                *((_QWORD *)&v99 + 1) = 0x100000001;
                v100[0] = 0x100000001;
                *(_QWORD *)&v99 = 0x100000001;
                v11 = 1;
                v12 = 1;
                v13 = 1;
                v14 = 1;
                v15 = 1;
                v16 = 1;
                goto LABEL_15;
              }
              v48 = 0;
              v17 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((_QWORD *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99 = 0x100000001;
              v11 = 1;
              v12 = 1;
              v13 = 1;
              v14 = 1;
              v15 = 1;
              v16 = 1;
              v18 = 1;
            }
          }
          else
          {
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v100[4] = 0x100000001;
            v100[3] = 0x100000001;
            v100[2] = 0x100000001;
            v100[1] = 0x100000001;
            *((_QWORD *)&v99 + 1) = 0x100000001;
            v100[0] = 0x100000001;
            *(_QWORD *)&v99 = 0x100000001;
            v11 = 1;
            v12 = 1;
            v13 = 1;
            v14 = 1;
            LODWORD(v105[0]) = 1;
          }
        }
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v105[0] = 0x100000000;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v100[4] = 0x100000001;
        v100[3] = 0x100000001;
        v100[2] = 0x100000001;
        v100[1] = 0x100000001;
        *((_QWORD *)&v99 + 1) = 0x100000001;
        v100[0] = 0x100000001;
        *(_QWORD *)&v99 = 0x100000001;
        v11 = 1;
        v12 = 1;
      }
    }
  }
  else
  {
    v12 = 0;
    v105[0] = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(_QWORD *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    v11 = 1;
    LODWORD(v105[1]) = 1;
  }
  v5 = v46;
LABEL_15:
  if (v17)
  {
    v21 = v5;
    v22 = v11;
    v23 = v13;
    v24 = v12;
    v25 = v14;
    v26 = v15;
    v27 = v16;

    v16 = v27;
    v15 = v26;
    v14 = v25;
    v12 = v24;
    v13 = v23;
    v11 = v22;
    v5 = v21;
  }
  if (v16)

  if (v15)
  {

  }
  if (LODWORD(v105[0]))
  {

    if (!v14)
      goto LABEL_23;
LABEL_80:

    if (!v13)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v14)
    goto LABEL_80;
LABEL_23:
  if (v13)
  {
LABEL_24:

  }
LABEL_25:
  if (HIDWORD(v105[0]))
  {

  }
  if (v12)

  if (DWORD1(v99))
  {

  }
  if (LODWORD(v105[1]))
  {

  }
  if (v11)

  if ((_DWORD)v99)
  {

  }
  if (HIDWORD(v105[1]))
  {

  }
  if (LODWORD(v100[0]))

  if (DWORD2(v99))
  {

  }
  if (LODWORD(v105[2]))
  {

  }
  if (HIDWORD(v100[0]))

  if (HIDWORD(v99))
  {

  }
  if (LODWORD(v100[5]))
  {

  }
  if (HIDWORD(v100[1]))

  if (LODWORD(v100[1]))
  {

  }
  if (HIDWORD(v105[2]))
  {

  }
  if (HIDWORD(v100[2]))

  if (LODWORD(v100[2]))
  {

  }
  if (LODWORD(v105[3]))
  {

  }
  if (HIDWORD(v100[3]))

  if (LODWORD(v100[3]))
  {

  }
  if (HIDWORD(v105[3]))
  {

  }
  if (LODWORD(v100[4]))

  if (HIDWORD(v100[4]))
  {

  }
  if (HIDWORD(v100[5]))
  {

  }
  if (v102 != v101)

LABEL_78:
  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;

  -[SFMediaItem title](self, "title");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[SFMediaItem subtitleText](self, "subtitleText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") ^ v3;
  -[SFMediaItem thumbnail](self, "thumbnail");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v23, "hash");
  -[SFMediaItem reviewGlyph](self, "reviewGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[SFMediaItem overlayImage](self, "overlayImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFMediaItem reviewText](self, "reviewText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFMediaItem punchout](self, "punchout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[SFMediaItem subtitleCustomLineBreaking](self, "subtitleCustomLineBreaking");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFMediaItem buyOptions](self, "buyOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFMediaItem contentAdvisory](self, "contentAdvisory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[SFMediaItem contentAdvisoryImage](self, "contentAdvisoryImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13 ^ v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SFText)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (SFImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (void)setReviewGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_reviewGlyph, a3);
}

- (SFImage)overlayImage
{
  return self->_overlayImage;
}

- (void)setOverlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_overlayImage, a3);
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (void)setReviewText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (NSArray)subtitleCustomLineBreaking
{
  return self->_subtitleCustomLineBreaking;
}

- (void)setSubtitleCustomLineBreaking:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)buyOptions
{
  return self->_buyOptions;
}

- (void)setBuyOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (void)setContentAdvisory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SFImage)contentAdvisoryImage
{
  return self->_contentAdvisoryImage;
}

- (void)setContentAdvisoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_contentAdvisoryImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAdvisoryImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_buyOptions, 0);
  objc_storeStrong((id *)&self->_subtitleCustomLineBreaking, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
