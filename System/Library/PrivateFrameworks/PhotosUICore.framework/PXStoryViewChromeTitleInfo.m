@implementation PXStoryViewChromeTitleInfo

- (PXStoryViewChromeTitleInfo)init
{
  return -[PXStoryViewChromeTitleInfo initWithCollectionTitle:collectionSubtitle:locationName:dateName:songName:artistName:title:subtitle:subtitleSymbolName:](self, "initWithCollectionTitle:collectionSubtitle:locationName:dateName:songName:artistName:title:subtitle:subtitleSymbolName:", 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (PXStoryViewChromeTitleInfo)initWithCollectionTitle:(id)a3 collectionSubtitle:(id)a4 locationName:(id)a5 dateName:(id)a6 songName:(id)a7 artistName:(id)a8 title:(id)a9 subtitle:(id)a10 subtitleSymbolName:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  PXStoryViewChromeTitleInfo *v26;
  uint64_t v27;
  NSString *collectionTitle;
  uint64_t v29;
  NSString *collectionSubtitle;
  uint64_t v31;
  NSString *locationName;
  uint64_t v33;
  NSString *dateName;
  uint64_t v35;
  NSString *songName;
  uint64_t v37;
  NSString *artistName;
  uint64_t v39;
  NSString *title;
  uint64_t v41;
  NSString *subtitle;
  uint64_t v43;
  NSString *subtitleSymbolName;
  objc_super v46;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryViewChromeTitleInfo;
  v26 = -[PXStoryViewChromeTitleInfo init](&v46, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v17, "copy");
    collectionTitle = v26->_collectionTitle;
    v26->_collectionTitle = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    collectionSubtitle = v26->_collectionSubtitle;
    v26->_collectionSubtitle = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    locationName = v26->_locationName;
    v26->_locationName = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    dateName = v26->_dateName;
    v26->_dateName = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    songName = v26->_songName;
    v26->_songName = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    artistName = v26->_artistName;
    v26->_artistName = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    title = v26->_title;
    v26->_title = (NSString *)v39;

    v41 = objc_msgSend(v24, "copy");
    subtitle = v26->_subtitle;
    v26->_subtitle = (NSString *)v41;

    v43 = objc_msgSend(v25, "copy");
    subtitleSymbolName = v26->_subtitleSymbolName;
    v26->_subtitleSymbolName = (NSString *)v43;

  }
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
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

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXStoryViewChromeTitleInfo collectionTitle](self, "collectionTitle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionTitle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    -[PXStoryViewChromeTitleInfo collectionSubtitle](self, "collectionSubtitle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionSubtitle");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v12)
      {
        v9 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    -[PXStoryViewChromeTitleInfo locationName](self, "locationName");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationName");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v55 = v13;
    if (v13 == v14)
    {

    }
    else
    {
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v15)
      {
        v9 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    -[PXStoryViewChromeTitleInfo dateName](self, "dateName");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateName");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v53 = v16;
    v54 = v17;
    if (v16 == v17)
    {

    }
    else
    {
      v18 = v17;
      v19 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v19)
      {
        v9 = 0;
        v20 = v53;
LABEL_43:

        goto LABEL_44;
      }
    }
    -[PXStoryViewChromeTitleInfo songName](self, "songName");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "songName");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v50 = v22;
    v51 = v21;
    if (v21 == v22)
    {

    }
    else
    {
      v23 = v22;
      v24 = objc_msgSend(v21, "isEqualToString:", v22);

      if (!v24)
      {
        v9 = 0;
        v20 = v53;
LABEL_42:

        goto LABEL_43;
      }
    }
    -[PXStoryViewChromeTitleInfo artistName](self, "artistName");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artistName");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v52 = v25;
    v49 = v26;
    if (v25 == v26)
    {

    }
    else
    {
      v27 = v26;
      v28 = objc_msgSend(v52, "isEqualToString:", v26);

      if (!v28)
      {
        v9 = 0;
        v20 = v53;
LABEL_41:

        goto LABEL_42;
      }
    }
    -[PXStoryViewChromeTitleInfo title](self, "title");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v47 = v30;
    v48 = v29;
    if (v29 == v30)
    {

    }
    else
    {
      v31 = v30;
      v32 = objc_msgSend(v29, "isEqualToString:", v30);

      if (!v32)
      {
        v9 = 0;
        v20 = v53;
LABEL_40:

        goto LABEL_41;
      }
    }
    -[PXStoryViewChromeTitleInfo subtitle](self, "subtitle");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitle");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v46 = v34;
    if (v33 == v34)
    {

    }
    else
    {
      v35 = v34;
      v36 = v33;
      v44 = v33;
      v37 = v35;
      v38 = objc_msgSend(v36, "isEqualToString:", v35);

      v33 = v44;
      if (!v38)
      {
        v9 = 0;
        v20 = v53;
LABEL_39:

        goto LABEL_40;
      }
    }
    -[PXStoryViewChromeTitleInfo subtitleSymbolName](self, "subtitleSymbolName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitleSymbolName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v39;
    if (v39 == v40)
    {
      v9 = 1;
    }
    else
    {
      v41 = v40;
      v42 = objc_msgSend(v39, "isEqualToString:", v40);
      v40 = v41;
      v9 = v42;
    }
    v20 = v53;

    goto LABEL_39;
  }
  v9 = 0;
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PXStoryViewChromeTitleInfo collectionTitle](self, "collectionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXStoryViewChromeTitleInfo locationName](self, "locationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));
  -[PXStoryViewChromeTitleInfo subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ (4 * objc_msgSend(v7, "hash"));

  return v8;
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (NSString)collectionSubtitle
{
  return self->_collectionSubtitle;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (NSString)dateName
{
  return self->_dateName;
}

- (NSString)songName
{
  return self->_songName;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)subtitleSymbolName
{
  return self->_subtitleSymbolName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSymbolName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_songName, 0);
  objc_storeStrong((id *)&self->_dateName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_collectionSubtitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
}

@end
