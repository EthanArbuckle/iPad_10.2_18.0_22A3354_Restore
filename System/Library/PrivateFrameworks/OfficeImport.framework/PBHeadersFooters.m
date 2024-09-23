@implementation PBHeadersFooters

+ (id)headersFootersContainerWithSlideContainer:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  uint64_t DocumentRef;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "firstChildOfType:", 4057);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)objc_msgSend(v5, "reader"));
    objc_msgSend(v5, "documentRoot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pbReferenceWithID:", DocumentRef);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstChildOfType:", 4057);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (PptHeadersFootersAtom)headersFootersAtomWithHeadersFootersContainer:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  PptHeadersFootersAtom *v7;

  v3 = a3;
  if ((v4 & 1) == 0
  {
    PptHeadersFootersAtom::PptHeadersFootersAtom(&+[PBHeadersFooters headersFootersAtomWithHeadersFootersContainer:]::srcDefaultHFAtom);
  }
  objc_msgSend(v3, "firstChildOfType:", 4058);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "eshObject");

  if (v6)
    v7 = (PptHeadersFootersAtom *)v6;
  else
    v7 = &+[PBHeadersFooters headersFootersAtomWithHeadersFootersContainer:]::srcDefaultHFAtom;

  return v7;
}

+ (void)readHeaderFooterTextFromHeadersFootersContainer:(id)a3 toPlaceholderShape:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend(a1, "headersFootersAtomWithHeadersFootersContainer:", v15);
    objc_msgSend(v6, "clientData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 == 4)
    {
      if (*(_BYTE *)(v7 + 52))
      {
        objc_msgSend(v6, "textBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "findFirstTextRunOfClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setFormat:", 0xFFFFFFFFLL);
        if (*(_BYTE *)(v7 + 53))
          objc_msgSend(v11, "setFormat:", (*(_DWORD *)(v7 + 48) + 1));
        +[PBUtils readStringWithInstance:fromContainer:](PBUtils, "readStringWithInstance:fromContainer:", 0, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v11, "setText:", v13);
        goto LABEL_12;
      }
    }
    else if (v10 == 6 && *(_BYTE *)(v7 + 57))
    {
      +[PBUtils readStringWithInstance:fromContainer:](PBUtils, "readStringWithInstance:fromContainer:", 2, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v6, "textBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "findFirstTextRunOfClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setText:", v11);
LABEL_12:

      goto LABEL_13;
    }
  }
LABEL_14:

}

+ (void)readHeadersFootersToSlideLayout:(id)a3 drawables:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "headersFootersContainerWithSlideContainer:state:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addCopyOfHeaderFooterPlaceholderOfType:toDrawables:slideBase:headersFootersContainer:state:", 4, v8, v11, v10, v9);
  objc_msgSend(a1, "addCopyOfHeaderFooterPlaceholderOfType:toDrawables:slideBase:headersFootersContainer:state:", 6, v8, v11, v10, v9);

}

+ (void)addCopyOfHeaderFooterPlaceholderOfType:(int)a3 toDrawables:(id)a4 slideBase:(id)a5 headersFootersContainer:(id)a6 state:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  OADShape *v17;
  PDOfficeArtClient *v18;
  PDPlaceholder *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  OADTextBody *v25;
  id v26;
  id v27;
  id v28;

  v10 = *(_QWORD *)&a3;
  v28 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "parentSlideBase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v10, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v26 = a1;
    v27 = v13;
    v17 = objc_alloc_init(OADShape);
    v18 = objc_alloc_init(PDOfficeArtClient);
    -[OADDrawable setClientData:](v17, "setClientData:", v18);
    v19 = objc_alloc_init(PDPlaceholder);
    -[PDOfficeArtClient setPlaceholder:](v18, "setPlaceholder:", v19);
    objc_msgSend(v16, "clientData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "placeholder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "index");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = 0;
    else
      v23 = 8;
    -[PDPlaceholder setIndex:](v19, "setIndex:", (v23 + v22));
    -[PDPlaceholder setType:](v19, "setType:", objc_msgSend(v21, "type"));
    -[PDPlaceholder setSize:](v19, "setSize:", objc_msgSend(v21, "size"));
    objc_msgSend(v14, "sourceTextBoxContainerHolderForTargetShape:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v14, "setSourceTextBoxContainerHolder:forTargetShape:", v24, v17);
      v25 = objc_alloc_init(OADTextBody);
      +[PBTextBlock readClientTextBox:textBody:state:](PBTextBlock, "readClientTextBox:textBody:state:", v24, v25, v14);
      -[OADShape setTextBody:](v17, "setTextBody:", v25);

    }
    objc_msgSend(v26, "readHeaderFooterTextFromHeadersFootersContainer:toPlaceholderShape:", v27, v17);
    objc_msgSend(v28, "addObject:", v17);

    v13 = v27;
  }

}

+ (void)readHeadersFootersFromSlideContainer:(id)a3 toSlide:(id)a4 drawables:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _BYTE *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "headersFootersContainerWithSlideContainer:state:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_BYTE *)objc_msgSend(a1, "headersFootersAtomWithHeadersFootersContainer:", v12);
  if (v13[52])
    objc_msgSend(a1, "addCopyOfHeaderFooterPlaceholderOfType:toDrawables:slideBase:headersFootersContainer:state:", 4, v10, v14, v12, v11);
  if (v13[57])
    objc_msgSend(a1, "addCopyOfHeaderFooterPlaceholderOfType:toDrawables:slideBase:headersFootersContainer:state:", 6, v10, v14, v12, v11);
  if (v13[55])
    objc_msgSend(v11, "setHasSlideNumberPlaceholder:", 1);

}

+ (void)readHeadersFootersFromSlideContainer:(id)a3 toMasterSlide:(id)a4 drawables:(id)a5 state:(id)a6
{
  id v10;
  unsigned __int8 *v11;
  void *v12;
  void *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v23 = a3;
  v24 = a4;
  v10 = a5;
  v22 = a6;
  objc_msgSend(a1, "headersFootersContainerWithSlideContainer:state:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (unsigned __int8 *)objc_msgSend(a1, "headersFootersAtomWithHeadersFootersContainer:", v25);
  objc_msgSend(v24, "setHeaderPlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 10));
  objc_msgSend(v24, "setFooterPlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 9));
  objc_msgSend(v24, "setDateTimePlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 7));
  objc_msgSend(v24, "setSlideNumberPlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 8));
  +[PBProgTag binaryTagDataWithName:inProgTagsParent:](PBProgTag, "binaryTagDataWithName:inProgTagsParent:", L"___PPT12", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (unsigned __int8 *)ESDAtomAccess<PptRoundTripHeaderFooterDefaultsAtom>::first(v12, 0);
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v24, "setHeaderPlaceholderIsVisible:", v14[47]);
      objc_msgSend(v24, "setFooterPlaceholderIsVisible:", v15[46]);
      objc_msgSend(v24, "setDateTimePlaceholderIsVisible:", v15[45]);
      objc_msgSend(v24, "setSlideNumberPlaceholderIsVisible:", v15[48]);
    }
  }
  for (i = 0; i < objc_msgSend(v10, "count"); ++i)
  {
    objc_msgSend(v10, "objectAtIndex:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      objc_msgSend(v18, "clientData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "placeholder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "type");

      if ((v21 & 0xFFFFFFFD) == 4)
        objc_msgSend(a1, "readHeaderFooterTextFromHeadersFootersContainer:toPlaceholderShape:", v25, v18);

    }
  }

}

@end
