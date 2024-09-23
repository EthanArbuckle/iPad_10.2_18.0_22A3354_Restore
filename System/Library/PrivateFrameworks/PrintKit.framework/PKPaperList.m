@implementation PKPaperList

+ (PKPaperList)paperListWithAttrs:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4
{
  id v5;
  PKPaperList *v6;

  v5 = a4;
  v6 = -[PKPaperList initWithParams:translations:]([PKPaperList alloc], "initWithParams:translations:", a3, v5);

  return v6;
}

- (PKPaperList)initWithParams:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  PKPaperList *v16;
  PKPaperList *v17;
  _BOOL4 v18;
  char **v19;
  void *v20;
  void *v21;
  void *v22;
  PKPaperList *v23;
  void *v25;
  void *v26;
  PKPaperList *v27;
  PKPaperList *v28;
  PKPaperList *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PKPaperList;
  v27 = -[PKPaperList init](&v34, sel_init);
  if (v27)
  {
    Printd_Parameters::_get_MediaColReady(&a3->var0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[PKPaperList setHasMediaReady:](v27, "setHasMediaReady:", 1);
    }
    else
    {
      Printd_Parameters::_get_MediaColDatabase(&a3->var0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList setHasMediaReady:](v27, "setHasMediaReady:", 0);
    }
    if (objc_msgSend(v25, "count", v25))
    {
      v28 = (PKPaperList *)objc_opt_new();
      v29 = (PKPaperList *)objc_opt_new();
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = v26;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v31;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v31 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10), "collection");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKPaperList mediaDictFromAttrs:translations:](PKPaperList, "mediaDictFromAttrs:translations:", v11, v6);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            +[PKPaper paperWithAttributes:](PKPaper, "paperWithAttributes:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              v15 = objc_msgSend(v13, "isRoll");
              v16 = v28;
              if (v15)
                v16 = v29;
              v17 = v16;
              -[PKPaperList addObject:](v17, "addObject:", v14);

            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v8);
      }

      v18 = -[PKPaperList hasMediaReady](v27, "hasMediaReady");
      v19 = &selRef_sizeMediaTypeAndImageableCompare_;
      if (!v18)
        v19 = &selRef_sizeAndImageableCompare_;
      -[PKPaperList sortedArrayUsingSelector:](v28, "sortedArrayUsingSelector:", *v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList setPapers:](v27, "setPapers:", v20);

      v21 = (void *)-[PKPaperList copy](v29, "copy");
      -[PKPaperList setRolls:](v27, "setRolls:", v21);

      -[PKPaperList papers](v27, "papers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList categorizePapers:](v27, "categorizePapers:", v22);

      v23 = v28;
    }
    else
    {
      v23 = v27;
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (PKPaperList)paperListWithPapers:(id)a3
{
  id v3;
  PKPaperList *v4;

  v3 = a3;
  v4 = -[PKPaperList initWithPapers:]([PKPaperList alloc], "initWithPapers:", v3);

  return v4;
}

- (PKPaperList)initWithPapers:(id)a3
{
  id v4;
  PKPaperList *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaperList;
  v5 = -[PKPaperList init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_sizeAndImageableCompare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList setPapers:](v5, "setPapers:", v6);

    -[PKPaperList papers](v5, "papers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList categorizePapers:](v5, "categorizePapers:", v7);

    -[PKPaperList setHasMediaReady:](v5, "setHasMediaReady:", 0);
    -[PKPaperList setRolls:](v5, "setRolls:", MEMORY[0x24BDBD1A8]);
  }

  return v5;
}

+ (PKPaperList)paperListWithTXTRecord:(id)a3
{
  id v3;
  PKPaperList *v4;

  v3 = a3;
  v4 = -[PKPaperList initWithTXTRecord:]([PKPaperList alloc], "initWithTXTRecord:", v3);

  return v4;
}

- (PKPaperList)initWithTXTRecord:(id)a3
{
  id v4;
  PKPaperList *v5;
  PKPaperList *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaperList;
  v5 = -[PKPaperList init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPaperList conjureMediaFromTXT:](v5, "conjureMediaFromTXT:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_sizeAndImageableCompare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList setPapers:](v6, "setPapers:", v8);

    -[PKPaperList papers](v6, "papers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList categorizePapers:](v6, "categorizePapers:", v9);

    -[PKPaperList setHasMediaReady:](v6, "setHasMediaReady:", 0);
    -[PKPaperList setRolls:](v6, "setRolls:", MEMORY[0x24BDBD1A8]);

  }
  return v6;
}

- (NSArray)rolls
{
  NSArray *v3;
  void *v4;
  void *v5;

  v3 = self->_rolls;
  if (!v3)
  {
    -[PKPaperList papers](self, "papers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    -[PKPaperList setRolls:](self, "setRolls:", v3);
  }
  return v3;
}

uint64_t __20__PKPaperList_rolls__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRoll");
}

+ (id)mediaDictFromAttrs:(id)a3 translations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227667A1C]();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __47__PKPaperList_mediaDictFromAttrs_translations___block_invoke;
  v18 = &unk_24E6CD820;
  v19 = &unk_24E6E9EC0;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v5, "enumerateAttributes:", &v15);

  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("media-type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("media-type.%@"), v11, v15, v16, v17, v18),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "objectForKeyedSubscript:", v13),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12))
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("_vendor_media-type"));
      }

    }
  }

  return v10;
}

void __47__PKPaperList_mediaDictFromAttrs_translations___block_invoke(uint64_t a1, void *a2)
{
  PK_ipp_attribute_t *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[PK_ipp_attribute_t name](v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PK_ipp_attribute_t value_tag](v3, "value_tag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (!v9)
    {
LABEL_17:

      goto LABEL_18;
    }
    v10 = -[PK_ipp_attribute_t value_tag](v3, "value_tag");
    v11 = 0;
    if (v10 > 53)
    {
      if (v10 != 54 && v10 != 66 && v10 != 68)
        goto LABEL_16;
      ippGetIXString(v3, 0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10 != 33)
      {
        if (v10 != 51)
        {
          if (v10 == 52)
          {
            ippGetIXCollection(v3, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKPaperList mediaDictFromAttrs:translations:](PKPaperList, "mediaDictFromAttrs:translations:", v12, *(_QWORD *)(a1 + 40));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
LABEL_16:

          goto LABEL_17;
        }
        v16 = 0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ippGetIXRange(v3, 0, &v16));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v14;
        v17[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        if (v11)
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v6);
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ippGetIXInteger(v3, 0));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v13;
    goto LABEL_14;
  }
LABEL_18:

}

- (id)adjustMargins:(id)a3 forDuplex:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "paperWithMarginsAdjustedForDuplexMode:", v6, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v7, "copy");
  return v13;
}

- (BOOL)isPaperReady:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[PKPaperList hasMediaReady](self, "hasMediaReady"))
  {
    if (-[PKPaperList hasMatchingLoadedRoll:](self, "hasMatchingLoadedRoll:", v4))
    {
      v5 = 1;
    }
    else
    {
      -[PKPaperList simplexPapers](self, "simplexPapers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList matchPaper:inList:](self, "matchPaper:inList:", v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)paperListForDuplexMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToString:", CFSTR("one-sided")))
  {
    -[PKPaperList duplexPapers](self, "duplexPapers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList adjustMargins:forDuplex:](self, "adjustMargins:forDuplex:", v7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaperList simplexPapers](self, "simplexPapers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)papersForPhotoWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  uint64_t v12;

  height = a3.height;
  width = a3.width;
  -[PKPaperList photoPapers](self, "photoPapers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaperList rolls](self, "rolls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
      -[PKPaperList availableRollPapersPreferBorderless:](self, "availableRollPapersPreferBorderless:", 1);
    else
      -[PKPaperList rollReadyPaperListForPhotoWithContentSize:](self, "rollReadyPaperListForPhotoWithContentSize:", width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      -[PKPaperList photoPapers](self, "photoPapers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v12;
    }

  }
  return v6;
}

- (id)papersForDocumentWithSize:(CGSize)a3 scaleUpOnRoll:(BOOL)a4 andDuplex:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  void *v9;
  void *v11;
  void *v12;

  v5 = a4;
  height = a3.height;
  width = a3.width;
  if (a5)
    -[PKPaperList duplexPapers](self, "duplexPapers");
  else
    -[PKPaperList simplexPapers](self, "simplexPapers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    -[PKPaperList availableRollPapersPreferBorderless:](self, "availableRollPapersPreferBorderless:", 0);
  else
    -[PKPaperList rollReadyPaperListForDocumentWithContentSize:scaleUp:](self, "rollReadyPaperListForDocumentWithContentSize:scaleUp:", v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)matchedPaper:(id)a3 preferBorderless:(BOOL)a4 withDuplexMode:(id)a5 didMatch:(BOOL *)a6
{
  _BOOL4 v8;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v8 = a4;
  v10 = a3;
  v11 = objc_msgSend(a5, "isEqualToString:", CFSTR("one-sided"));
  if (-[PKPaperList hasMatchingLoadedRoll:](self, "hasMatchingLoadedRoll:", v10))
  {
    v12 = v10;
    if (v12)
      goto LABEL_7;
  }
  else
  {
    v12 = 0;
  }
  if (v8)
  {
    -[PKPaperList photoPapers](self, "photoPapers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList matchPaper:inList:](self, "matchPaper:inList:", v10, v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:
  if (!v12)
  {
    if (v11)
      -[PKPaperList simplexPapers](self, "simplexPapers");
    else
      -[PKPaperList duplexPapers](self, "duplexPapers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList matchPaper:inList:](self, "matchPaper:inList:", v10, v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_16;
  }
  if (!v8)
  {
LABEL_16:
    if (v12)
    {
      v15 = 0;
      if (!a6)
        goto LABEL_15;
    }
    else
    {
      +[PKPaper genericLetterPaper](PKPaper, "genericLetterPaper");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList simplexPapers](self, "simplexPapers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList matchPaper:inList:](self, "matchPaper:inList:", v18, v19);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_21;
      +[PKPaper genericA4Paper](PKPaper, "genericA4Paper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList simplexPapers](self, "simplexPapers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaperList matchPaper:inList:](self, "matchPaper:inList:", v20, v21);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_21:
        v15 = 3;
        if (!a6)
          goto LABEL_15;
      }
      else
      {
        +[PKPaper genericLetterPaper](PKPaper, "genericLetterPaper");
        v22 = objc_claimAutoreleasedReturnValue();
        v15 = 3;
        v12 = (id)v22;
        if (!a6)
          goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  v15 = objc_msgSend(v12, "isBorderless") ^ 1;
  if (a6)
LABEL_14:
    *a6 = v15 < 2;
LABEL_15:
  -[PKPaperList tersePaperFrom:withRequest:](self, "tersePaperFrom:withRequest:", v12, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)addPaperSet:(id *)a3 withCount:(int)a4 toArrays:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((a4 - 1) <= 2)
  {
    v14 = v7;
    v15 = v6;
    v16 = v5;
    v13 = (int *)((char *)&-[PKPaperList addPaperSet:withCount:toArrays:]::paperMap + 12 * (a4 - 1));
    if (a4 == 2 && !objc_msgSend(a3[1], "isBorderless"))
      v13 = (int *)&-[PKPaperList addPaperSet:withCount:toArrays:]::paperMapAlt;
    objc_msgSend(*a5, "addObject:", a3[*v13], v8, v14, v15, v16, v9, v10);
    objc_msgSend(a5[1], "addObject:", a3[v13[1]]);
    objc_msgSend(a5[2], "addObject:", a3[v13[2]]);
  }
}

- (void)categorizePapers:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t i;
  uint64_t j;
  void *context;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48[3];
  CGRect v49;
  CGRect v50;

  v48[1] = *(id *)MEMORY[0x24BDAC8D0];
  v46 = 0;
  v47 = 0;
  v48[0] = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v44 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v43 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v45 = objc_claimAutoreleasedReturnValue();

  v4 = -[PKPaperList hasMediaReady](self, "hasMediaReady");
  v5 = v4;
  if (v4)
    v6 = &unk_24E6EB468;
  else
    v6 = &unk_24E6EB480;
  if (v4)
    v7 = &__block_literal_global_66;
  else
    v7 = &__block_literal_global_69;
  context = (void *)MEMORY[0x227667A1C]();
  v8 = v46;
  v46 = 0;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PKPaperList papers](self, "papers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v39;
    if (v5)
      v12 = __32__PKPaperList_categorizePapers___block_invoke;
    else
      v12 = __32__PKPaperList_categorizePapers___block_invoke_2;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
        if (!((unsigned int (*)(void *, void *, void *))v12)(v7, v14, v46))
        {
          -[PKPaperList addPaperSet:withCount:toArrays:](self, "addPaperSet:withCount:toArrays:", &v46, v9, &v43);
          -[PKPaperList tersePaperFrom:withMediaInfo:](self, "tersePaperFrom:withMediaInfo:", v14, v6);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            -[PKPaperList tersePaperFrom:withMediaInfo:](self, "tersePaperFrom:withMediaInfo:", v14, v6);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v46;
            v46 = (void *)v28;

            v30 = v48[0];
            v48[0] = 0;

            v31 = v48[0];
            v32 = v47;
            v47 = v31;
            v9 = 1;
          }
          else
          {
            v9 = 0;
            v32 = v46;
            v46 = 0;
          }

          goto LABEL_24;
        }
        if ((int)v9 >= 1)
        {
          objc_msgSend(v14, "imageableAreaRect");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(*(&v46 + (v9 - 1)), "imageableAreaRect");
          v50.origin.x = v23;
          v50.origin.y = v24;
          v50.size.width = v25;
          v50.size.height = v26;
          v49.origin.x = v16;
          v49.origin.y = v18;
          v49.size.width = v20;
          v49.size.height = v22;
          if (!CGRectEqualToRect(v49, v50))
          {
            -[PKPaperList tersePaperFrom:withMediaInfo:](self, "tersePaperFrom:withMediaInfo:", v14, v6);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              if (v9 > 2)
              {
                objc_storeStrong(v48, v27);
              }
              else
              {
                objc_storeStrong(&v46 + v9, v27);
                v9 = (v9 + 1);
              }
            }
LABEL_24:

          }
        }
        ++v13;
      }
      while (v10 != v13);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v10 = v33;
    }
    while (v33);
  }

  -[PKPaperList addPaperSet:withCount:toArrays:](self, "addPaperSet:withCount:toArrays:", &v46, v9, &v43);
  -[PKPaperList setSimplexPapers:](self, "setSimplexPapers:", v44);
  -[PKPaperList setDuplexPapers:](self, "setDuplexPapers:", v43);
  -[PKPaperList setPhotoPapers:](self, "setPhotoPapers:", v45);
  objc_autoreleasePoolPop(context);
  for (i = 16; i != -8; i -= 8)

  for (j = 16; j != -8; j -= 8)
}

uint64_t __32__PKPaperList_categorizePapers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualSizeAndMediaType:");
}

uint64_t __32__PKPaperList_categorizePapers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualSize:");
}

- (id)tersePaperFrom:(id)a3 withRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", &unk_24E6EB498);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("media-type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v19, "addObject:", CFSTR("media-type"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v19;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    +[PKPaper paperWithAttributes:](PKPaper, "paperWithAttributes:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isRoll"))
    {
      objc_msgSend(v16, "cutToPWGLength:", objc_msgSend(v6, "height"));
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)tersePaperFrom:(id)a3 withMediaInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v9, "containsObject:", CFSTR("media-type")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_vendor_media-type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("_vendor_media-type"));

  }
  +[PKPaper paperWithAttributes:](PKPaper, "paperWithAttributes:", v7, (_QWORD)v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)rollReadyPaperListWithContentSize:(CGSize)a3 forPhoto:(BOOL)a4
{
  if (a4)
    -[PKPaperList rollReadyPaperListForPhotoWithContentSize:](self, "rollReadyPaperListForPhotoWithContentSize:", a3.width, a3.height);
  else
    -[PKPaperList rollReadyPaperListForDocumentWithContentSize:scaleUp:](self, "rollReadyPaperListForDocumentWithContentSize:scaleUp:", a3.width, a3.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rollReadyPaperListForDocumentWithContentSize:(CGSize)a3 scaleUp:(BOOL)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  int v13;
  int v14;
  uint64_t i;
  void *v16;
  double v17;
  int v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaperList availableRollPapersPreferBorderless:](self, "availableRollPapersPreferBorderless:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v9)
      goto LABEL_22;
    v10 = *(_QWORD *)v22;
    if (width >= height)
      v11 = height;
    else
      v11 = width;
    if (width >= height)
      v12 = width;
    else
      v12 = height;
    v13 = (int)v12;
    v14 = (int)v11;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "paperSize", (_QWORD)v21);
        v18 = v14;
        if (v17 < (double)v13)
        {
          v18 = v13;
          if (v17 < (double)v14)
          {
            if (width <= 0.0)
              continue;
            v18 = vcvtpd_s64_f64(height * (v17 / width));
          }
        }
        if (v18 >= 1)
        {
          objc_msgSend(v16, "cutToLength:", (double)v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v19);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v9)
      {
LABEL_22:

        return v7;
      }
    }
  }
  -[PKPaperList rollReadyPaperListForPhotoWithContentSize:](self, "rollReadyPaperListForPhotoWithContentSize:", a3.width, a3.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)rollReadyPaperListForPhotoWithContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  height = a3.height;
  width = a3.width;
  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaperList availableRollPapersPreferBorderless:](self, "availableRollPapersPreferBorderless:", 1);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    v10 = width / height;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "width", (_QWORD)v20);
        v14 = objc_msgSend(v12, "leftMargin");
        v15 = (double)(int)(v13 - (v14 + objc_msgSend(v12, "rightMargin")));
        objc_msgSend(v12, "cutToPWGLength:", objc_msgSend(v12, "topMargin")+ objc_msgSend(v12, "bottomMargin")+ vcvtmd_s64_f64(v15 / v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);
        objc_msgSend(v12, "cutToPWGLength:", objc_msgSend(v12, "topMargin")+ objc_msgSend(v12, "bottomMargin")+ vcvtmd_s64_f64(v10 * v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "height");
        if (v18 != objc_msgSend(v16, "height"))
          objc_msgSend(v6, "addObject:", v17);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)availableRollPapersPreferBorderless:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaperList rolls](self, "rolls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (!objc_msgSend(v7, "count"))
    goto LABEL_21;
  v8 = (id)objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_75);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v10)
  {

    v11 = 0;
    goto LABEL_20;
  }
  v11 = 0;
  v12 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if (v11)
      {
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "width", (_QWORD)v19);
        if (v15 == objc_msgSend(v11, "width")
          && (v16 = objc_msgSend(v14, "height"), v16 == objc_msgSend(v11, "height")))
        {
          if (objc_msgSend(v14, "isBorderless") != v3)
            continue;
          v17 = v14;

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
          v17 = v14;

        }
        v11 = v17;
      }
      else
      {
        v11 = v14;
      }
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v10);

  if (v11)
    objc_msgSend(v5, "addObject:", v11);
LABEL_20:

LABEL_21:
  return v5;
}

uint64_t __51__PKPaperList_availableRollPapersPreferBorderless___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  LODWORD(v5) = objc_msgSend(v6, "width");
  if ((int)v5 > (int)objc_msgSend(v7, "width"))
    goto LABEL_2;
  v9 = objc_msgSend(v6, "width");
  if (v9 < (int)objc_msgSend(v7, "width"))
  {
    v8 = -1;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v6, "height");
  if (v10 > (int)objc_msgSend(v7, "height"))
  {
LABEL_2:
    v8 = 1;
  }
  else
  {
    v11 = objc_msgSend(v6, "height");
    if (v11 >= (int)objc_msgSend(v7, "height"))
      v8 = 0;
    else
      v8 = -1;
  }
LABEL_9:

  return v8;
}

- (id)matchPaper:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__PKPaperList_matchPaper___block_invoke;
  v8[3] = &unk_24E6CD8E8;
  v9 = v4;
  v5 = v4;
  -[PKPaperList filterUsingBlock:](self, "filterUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __26__PKPaperList_matchPaper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "width");
  if (v4 == objc_msgSend(v3, "width")
    && (v5 = objc_msgSend(*(id *)(a1 + 32), "height"), v5 == objc_msgSend(v3, "height")))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", &stru_24E6CFEB0) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mediaType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToString:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)matchPaper:(id)a3 inList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __33__PKPaperList_matchPaper_inList___block_invoke;
  v11[3] = &unk_24E6CD8E8;
  v7 = v6;
  v12 = v7;
  -[PKPaperList filterPapers:usingBlock:](self, "filterPapers:usingBlock:", a4, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __33__PKPaperList_matchPaper_inList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "width");
  if (v4 == objc_msgSend(v3, "width")
    && (v5 = objc_msgSend(*(id *)(a1 + 32), "height"), v5 == objc_msgSend(v3, "height")))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", &stru_24E6CFEB0) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mediaType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToString:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasMatchingLoadedRoll:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "isRoll"))
  {
    -[PKPaperList rolls](self, "rolls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37__PKPaperList_hasMatchingLoadedRoll___block_invoke;
    v9[3] = &unk_24E6CD910;
    v10 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

    v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __37__PKPaperList_hasMatchingLoadedRoll___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "width");
  v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "width");

  return v5;
}

- (id)filterUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPaperList papers](self, "papers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaperList filterPapers:usingBlock:](self, "filterPapers:usingBlock:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)filterPapers:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__PKPaperList_filterPapers_usingBlock___block_invoke;
  v12[3] = &unk_24E6CD938;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __39__PKPaperList_filterPapers_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)jobTypesSupported:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kind"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("document")))
        {
          if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("envelope")))
          {
            if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("label")))
            {
              if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("photo")))
              {
                if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("receipt")))
                {
                  if (!objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("roll")))
                    v4 |= 0x20uLL;
                }
                else
                {
                  v4 |= 0x10uLL;
                }
              }
              else
              {
                v4 |= 8uLL;
              }
            }
            else
            {
              v4 |= 4uLL;
            }
          }
          else
          {
            v4 |= 2uLL;
          }
        }
        else
        {
          v4 |= 1uLL;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v4;
}

- (id)conjureMediaFromTXT:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;
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
  uint8_t buf[16];
  _QWORD v33[5];
  _QWORD v34[12];
  _QWORD v35[15];
  _QWORD v36[4];
  _QWORD v37[8];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  _PKLogCategory(PKLogCategoryFramework);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_220F9A000, v4, OS_LOG_TYPE_DEFAULT, "Defaulting to generic media size values.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericA4Paper](PKPaper, "genericA4Paper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericLetterPaper](PKPaper, "genericLetterPaper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper generic4x6Paper](PKPaper, "generic4x6Paper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("na_index-4x6_4x6in"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericA6Paper](PKPaper, "genericA6Paper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("iso_a6_105x148mm"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper generic3_5x5Paper](PKPaper, "generic3_5x5Paper");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("oe_photo-l_3.5x5in"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericBorderlessWithName:](PKPaper, "genericBorderlessWithName:", CFSTR("na_5x7_5x7in"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("na_5x7_5x7in"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("na_number-10_4.125x9.5in"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("iso_dl_110x220mm"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("jpn_chou3_120x235mm"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericWithName:](PKPaper, "genericWithName:", CFSTR("jpn_chou4_90x205mm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaper genericLegalPaper](PKPaper, "genericLegalPaper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("product"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPaperList jobTypesSupported:](self, "jobTypesSupported:", v18);
  v8 = v7;
  if (!v7)
  {
    if (v6)
    {
      if (objc_msgSend(v6, "rangeOfString:", CFSTR("Photosmart")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("Officejet")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("Deskjet")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("ENVY")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v35[0] = v31;
        v35[1] = v30;
        v35[2] = v28;
        v35[3] = v29;
        v35[4] = v26;
        v35[5] = v27;
        v35[6] = v24;
        v35[7] = v25;
        v35[8] = v22;
        v35[9] = v23;
        v35[10] = v21;
        v35[11] = v20;
        v35[12] = v19;
        v35[13] = v5;
        v35[14] = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v14);
        goto LABEL_24;
      }
      if (objc_msgSend(v6, "rangeOfString:", CFSTR("EPSON WF")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("EPSON WorkForce")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("EPSON Stylus")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("EPSON Artisan")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("EPSON XP")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34[0] = v31;
        v34[1] = v30;
        v34[2] = v28;
        v34[3] = v29;
        v34[4] = v26;
        v34[5] = v27;
        v34[6] = v24;
        v34[7] = v25;
        v34[8] = v22;
        v34[9] = v23;
        v34[10] = v21;
        v34[11] = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v14);
        goto LABEL_24;
      }
    }
    v33[0] = v30;
    v33[1] = v31;
    v33[2] = v29;
    v33[3] = v27;
    v33[4] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v14);
LABEL_24:

    goto LABEL_25;
  }
  if ((v7 & 1) != 0)
  {
    v38[0] = v31;
    v38[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v9);

  }
  if ((v8 & 8) != 0)
  {
    v37[0] = v28;
    v37[1] = v29;
    v37[2] = v26;
    v37[3] = v27;
    v37[4] = v24;
    v37[5] = v25;
    v37[6] = v22;
    v37[7] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v10);

  }
  if ((v8 & 2) != 0)
  {
    v36[0] = v21;
    v36[1] = v20;
    v36[2] = v19;
    v36[3] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v11);

  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("papermax"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("legal-A4")) == 0;

  if (!v13)
    objc_msgSend(v16, "addObject:", v17);
LABEL_25:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaperList)initWithCoder:(id)a3
{
  id v4;
  PKPaperList *v5;
  PKPaperList *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaperList;
  v5 = -[PKPaperList init](&v8, sel_init);
  v6 = v5;
  if (v5)
    DecodeVisitor::visitProperties(v5, v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  EncodeVisitor::visitProperties(self, a3);
}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("hasMediaReady"), &self->_hasMediaReady);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 23))(a3, CFSTR("papers"), &self->_papers);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 23))(a3, CFSTR("simplexPapers"), &self->_simplexPapers);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 23))(a3, CFSTR("duplexPapers"), &self->_duplexPapers);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 23))(a3, CFSTR("photoPapers"), &self->_photoPapers);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 23))(a3, CFSTR("rolls"), &self->_rolls);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);
}

- (id)debugDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__PKPaperList_debugDescription__block_invoke;
  v4[3] = &unk_24E6CD710;
  v4[4] = self;
  v4[5] = &v5;
  DescVisitor::visitProperties(self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __31__PKPaperList_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 208))(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 200))(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ Encoded classes: %@, properties %@"), v10, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (BOOL)hasMediaReady
{
  return self->_hasMediaReady;
}

- (void)setHasMediaReady:(BOOL)a3
{
  self->_hasMediaReady = a3;
}

- (NSArray)papers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPapers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)simplexPapers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSimplexPapers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)duplexPapers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDuplexPapers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)photoPapers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhotoPapers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setRolls:(id)a3
{
  objc_storeStrong((id *)&self->_rolls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolls, 0);
  objc_storeStrong((id *)&self->_photoPapers, 0);
  objc_storeStrong((id *)&self->_duplexPapers, 0);
  objc_storeStrong((id *)&self->_simplexPapers, 0);
  objc_storeStrong((id *)&self->_papers, 0);
}

@end
