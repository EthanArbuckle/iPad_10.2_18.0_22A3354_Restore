@implementation THMacTOCNode

+ (id)nodeTreeWithDocumentRoot:(id)a3 navigator:(id)a4 hasPaginatedData:(BOOL)a5
{
  _BOOL4 v5;
  THMacTOCNode *v7;
  THMacTOCNode *v8;
  id v9;
  THMacTOCNode *v10;
  AVAsset *v11;
  Float64 Seconds;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSString *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  THMacTOCNode *v24;
  uint64_t v25;
  unint64_t v26;
  THMacTOCNode *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BYTE *v32;
  int64_t v33;
  THMacTOCNode *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  void *i;
  uint64_t v41;
  id v42;
  THMacTOCNode *v43;
  uint64_t v44;
  THMacTOCNode *v45;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v51;
  id v52;
  THMacTOCNode *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CMTime time;
  _BYTE v60[128];

  v5 = a5;
  v7 = objc_alloc_init(THMacTOCNode);
  -[THMacTOCNode setNodeType:](v7, "setNodeType:", 1);
  if (v5)
  {
    v8 = objc_alloc_init(THMacTOCNode);
    -[THMacTOCNode setNodeType:](v8, "setNodeType:", 8);
    -[THMacTOCNode setTitle:](v8, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Thumbnails"), &stru_43D7D8, 0));
    -[THMacTOCNode setAbsolutePageIndex:](v8, "setAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[THMacTOCNode setDisplayPageNumber:](v8, "setDisplayPageNumber:", &stru_43D7D8);
    -[THMacTOCNode addChild:](v7, "addChild:", v8);

  }
  v9 = objc_msgSend(a3, "properties");
  if (objc_msgSend(v9, "introMediaUrl"))
  {
    v10 = objc_alloc_init(THMacTOCNode);
    -[THMacTOCNode setNodeType:](v10, "setNodeType:", 2);
    -[THMacTOCNode setTitle:](v10, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Intro Image"), &stru_43D7D8, 0));
    -[THMacTOCNode setAbsolutePageIndex:](v10, "setAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[THMacTOCNode setDisplayPageNumber:](v10, "setDisplayPageNumber:", &stru_43D7D8);
    if (objc_msgSend(v9, "introMediaIsVideo"))
    {
      -[THMacTOCNode setTitle:](v10, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Intro Movie"), &stru_43D7D8, 0));
      v11 = +[AVAsset assetWithURL:](AVAsset, "assetWithURL:", objc_msgSend(v9, "introMediaUrl"));
      if (v11)
      {
        -[AVAsset duration](v11, "duration");
        Seconds = CMTimeGetSeconds(&time);
        v13 = floor(Seconds / 60.0);
        v14 = Seconds - v13 * 60.0;
        v15 = floor(v13 / 60.0);
        v16 = v13 - v15 * 60.0;
        v17 = (void *)THBundle();
        if (v15 <= 0.0)
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("%1$2d:%2$02d"), &stru_43D7D8, 0), (int)v16, (int)v14, v47);
        else
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("%1$2d:%2$02d:%3$02d"), &stru_43D7D8, 0), (int)v15, (int)v16, (int)v14);
        -[THMacTOCNode setDisplayPageNumber:](v10, "setDisplayPageNumber:", v18);
      }
    }
    -[THMacTOCNode addChild:](v7, "addChild:", v10);

  }
  v19 = objc_msgSend(a3, "tocModel");
  if (objc_msgSend(objc_msgSend(v19, "tiles"), "count"))
  {
    v20 = 0;
    v21 = 0;
    v54 = v7;
    v49 = v5;
    v52 = a4;
    v48 = v19;
    do
    {
      v51 = v20;
      v22 = objc_msgSend(objc_msgSend(v19, "tiles"), "objectAtIndex:", v20);
      v23 = objc_msgSend(v22, "browserPageNode");
      v24 = objc_alloc_init(THMacTOCNode);
      -[THMacTOCNode setNodeType:](v24, "setNodeType:", 16);
      -[THMacTOCNode setChapterTOCPageInfo:](v24, "setChapterTOCPageInfo:", objc_msgSend(v23, "pageAtRelativeIndex:forPresentationType:", 0, objc_msgSend(objc_msgSend(a3, "properties"), "chapterBrowserPagePresentationType")));
      -[THMacTOCNode setTitle:](v24, "setTitle:", objc_msgSend(objc_msgSend(v22, "frontTitleText"), "im_stringByCollapsingRunsOfWhitespaceAndNewlines"));
      -[THMacTOCNode setNavigator:](v24, "setNavigator:", a4);
      -[THMacTOCNode setLink:](v24, "setLink:", objc_msgSend(v22, "firstModelLink"));
      if (v5)
        v25 = v21;
      else
        v25 = 0x7FFFFFFFFFFFFFFFLL;
      -[THMacTOCNode setAbsolutePageIndex:](v24, "setAbsolutePageIndex:", v25);
      if (v5)
        -[THMacTOCNode setImageData:](v24, "setImageData:", objc_msgSend(objc_msgSend(v22, "largerThumbs"), "objectAtIndex:", 0));
      if (objc_msgSend(objc_msgSend(v22, "portraitEntries"), "count"))
      {
        v26 = 0;
        v27 = 0;
        do
        {
          v28 = objc_msgSend(objc_msgSend(v22, "portraitEntries"), "objectAtIndex:", v26);
          if (!objc_msgSend(v28, "indentLevel"))
          {
            if (v5)
            {
              -[THMacTOCNode setNodeNumberString:](v24, "setNodeNumberString:", objc_msgSend(v28, "sectionIdentifier"));
              -[THMacTOCNode setDisplayPageNumber:](v24, "setDisplayPageNumber:", objc_msgSend(v28, "displayPageNumber"));
              -[THMacTOCNode setDisplayPageNumberValue:](v24, "setDisplayPageNumberValue:", objc_msgSend(v28, "displayPageNumberValue"));
            }
            -[THMacTOCNode setDisplayPageNumberFormat:](v24, "setDisplayPageNumberFormat:", objc_msgSend(v28, "displayPageNumberFormat"));
            -[THMacTOCNode setLink:](v24, "setLink:", objc_msgSend(v28, "modelLink"));
          }
          if (objc_msgSend(v28, "indentLevel") == (char *)&dword_0 + 1
            && objc_msgSend(v28, "includeInTOC"))
          {
            v27 = objc_alloc_init(THMacTOCNode);
            if (objc_msgSend(v28, "pageIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
              v29 = 128;
            else
              v29 = 32;
            -[THMacTOCNode setNodeType:](v27, "setNodeType:", v29);
            -[THMacTOCNode setNavigator:](v27, "setNavigator:", a4);
            -[THMacTOCNode setTitle:](v27, "setTitle:", objc_msgSend(objc_msgSend(v28, "title"), "im_stringByCollapsingRunsOfWhitespaceAndNewlines"));
            if (v5)
            {
              -[THMacTOCNode setNodeNumberString:](v27, "setNodeNumberString:", objc_msgSend(v28, "sectionIdentifier"));
              -[THMacTOCNode setDisplayPageNumber:](v27, "setDisplayPageNumber:", objc_msgSend(v28, "displayPageNumber"));
              -[THMacTOCNode setDisplayPageNumberValue:](v27, "setDisplayPageNumberValue:", objc_msgSend(v28, "displayPageNumberValue"));
              -[THMacTOCNode setDisplayPageNumberFormat:](v27, "setDisplayPageNumberFormat:", objc_msgSend(v28, "displayPageNumberFormat"));
              v30 = (uint64_t)objc_msgSend(v28, "pageIndex");
            }
            else
            {
              -[THMacTOCNode setDisplayPageNumberFormat:](v27, "setDisplayPageNumberFormat:", objc_msgSend(v28, "displayPageNumberFormat"));
              v30 = 0x7FFFFFFFFFFFFFFFLL;
            }
            -[THMacTOCNode setAbsolutePageIndex:](v27, "setAbsolutePageIndex:", v30);
            -[THMacTOCNode setLink:](v27, "setLink:", objc_msgSend(v28, "modelLink"));
            if (objc_msgSend(v28, "pageIndex") != (id)0x7FFFFFFFFFFFFFFFLL && v5)
            {
              v31 = objc_msgSend(v22, "largerThumbs");
              v32 = objc_msgSend(v28, "pageIndex");
              v33 = v32 - (_BYTE *)-[THMacTOCNode absolutePageIndex](v24, "absolutePageIndex");
              a4 = v52;
              -[THMacTOCNode setImageData:](v27, "setImageData:", objc_msgSend(v31, "objectAtIndex:", v33));
            }
            -[THMacTOCNode addChild:](v24, "addChild:", v27);

          }
          if (objc_msgSend(v28, "indentLevel") == (char *)&dword_0 + 2
            && objc_msgSend(v28, "includeInTOC"))
          {
            v34 = objc_alloc_init(THMacTOCNode);
            -[THMacTOCNode setNodeType:](v34, "setNodeType:", 128);
            -[THMacTOCNode setNavigator:](v34, "setNavigator:", a4);
            -[THMacTOCNode setTitle:](v34, "setTitle:", objc_msgSend(objc_msgSend(v28, "title"), "im_stringByCollapsingRunsOfWhitespaceAndNewlines"));
            if (v5)
            {
              -[THMacTOCNode setNodeNumberString:](v34, "setNodeNumberString:", objc_msgSend(v28, "sectionIdentifier"));
              -[THMacTOCNode setDisplayPageNumber:](v34, "setDisplayPageNumber:", objc_msgSend(v28, "displayPageNumber"));
              -[THMacTOCNode setDisplayPageNumberValue:](v34, "setDisplayPageNumberValue:", objc_msgSend(v28, "displayPageNumberValue"));
            }
            -[THMacTOCNode setDisplayPageNumberFormat:](v34, "setDisplayPageNumberFormat:", objc_msgSend(v28, "displayPageNumberFormat"));
            -[THMacTOCNode setAbsolutePageIndex:](v34, "setAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
            -[THMacTOCNode setLink:](v34, "setLink:", objc_msgSend(v28, "modelLink"));
            -[THMacTOCNode addChild:](v27, "addChild:", v34);

          }
          ++v26;
        }
        while (v26 < (unint64_t)objc_msgSend(objc_msgSend(v22, "portraitEntries"), "count"));
      }
      -[THMacTOCNode addChild:](v7, "addChild:", v24);
      if (v5)
      {
        ++v21;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v35 = objc_msgSend(v22, "largerThumbs");
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v56;
          v39 = 1;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v38)
                objc_enumerationMutation(v35);
              if ((v39 & 1) == 0)
              {
                v41 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
                v42 = objc_msgSend(a1, "nodeForPageIndex:inNode:excludeHeadings:", v21, v54, 1);
                v43 = objc_alloc_init(THMacTOCNode);
                -[THMacTOCNode setNodeType:](v43, "setNodeType:", 64);
                -[THMacTOCNode setDisplayPageNumberValue:](v43, "setDisplayPageNumberValue:", (char *)objc_msgSend(v42, "displayPageNumberValue")+ v21- (_QWORD)objc_msgSend(v42, "absolutePageIndex"));
                -[THMacTOCNode setDisplayPageNumberFormat:](v43, "setDisplayPageNumberFormat:", objc_msgSend(v42, "displayPageNumberFormat"));
                -[THMacTOCNode setDisplayPageNumber:](v43, "setDisplayPageNumber:", +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", -[THMacTOCNode displayPageNumberValue](v43, "displayPageNumberValue"), -[THMacTOCNode displayPageNumberFormat](v43, "displayPageNumberFormat"), 0));
                -[THMacTOCNode setAbsolutePageIndex:](v43, "setAbsolutePageIndex:", v21);
                -[THMacTOCNode setImageData:](v43, "setImageData:", v41);
                -[THMacTOCNode addPage:](v24, "addPage:", v43);

                ++v21;
              }
              v39 = 0;
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
            v39 = 0;
          }
          while (v37);
        }
      }

      v20 = v51 + 1;
      v19 = v48;
      v7 = v54;
      v5 = v49;
      a4 = v52;
    }
    while (v51 + 1 < (unint64_t)objc_msgSend(objc_msgSend(v48, "tiles"), "count"));
  }
  else
  {
    v21 = 0;
  }
  if (v5)
    v44 = v21;
  else
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  -[THMacTOCNode setAbsolutePageIndex:](v7, "setAbsolutePageIndex:", v44);
  if (objc_msgSend(objc_msgSend(a3, "glossary"), "entryCount"))
  {
    v45 = objc_alloc_init(THMacTOCNode);
    -[THMacTOCNode setNodeType:](v45, "setNodeType:", 4);
    -[THMacTOCNode setTitle:](v45, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Glossary"), &stru_43D7D8, 0));
    -[THMacTOCNode setAbsolutePageIndex:](v45, "setAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[THMacTOCNode setDisplayPageNumber:](v45, "setDisplayPageNumber:", &stru_43D7D8);
    -[THMacTOCNode addChild:](v7, "addChild:", v45);

  }
  return v7;
}

+ (id)nodeForPageIndex:(int64_t)a3 inNode:(id)a4 excludeHeadings:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id result;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(a4, "children", 0);
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (result)
  {
    v10 = result;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      v13 = 0;
      do
      {
        v14 = v11;
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        if (v5 && objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), "nodeType") == 128
          || (v15 = objc_msgSend(v11, "absolutePageIndex"), v15 == (id)0x7FFFFFFFFFFFFFFFLL))
        {
          v11 = v14;
        }
        else if ((uint64_t)v15 >= a3)
        {
          if (v15 == (id)a3)
            result = v11;
          else
            result = 0;
          goto LABEL_17;
        }
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v10 = result;
      if (result)
        continue;
      break;
    }
    v14 = v11;
LABEL_17:
    if (result)
      v16 = 1;
    else
      v16 = v14 == 0;
    if (!v16)
    {
      if (objc_msgSend(v14, "absolutePageIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
        result = 0;
      else
        result = objc_msgSend(a1, "nodeForPageIndex:inNode:excludeHeadings:", a3, v14, v5);
      if (!result)
        return v14;
    }
  }
  return result;
}

+ (id)pageNodeForPageIndex:(int64_t)a3 inNode:(id)a4
{
  id v5;
  id result;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a4, "children", 0);
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!result)
    return result;
  v7 = result;
  v8 = 0;
  v9 = *(_QWORD *)v15;
LABEL_3:
  v10 = 0;
  while (1)
  {
    v11 = v8;
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(v5);
    v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    if (objc_msgSend(v8, "nodeType") != 128 && objc_msgSend(v8, "nodeType") != 32)
    {
      v12 = objc_msgSend(v8, "absolutePageIndex");
      if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
        break;
    }
    v8 = v11;
LABEL_10:
    if (v7 == (id)++v10)
    {
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = result;
      if (result)
        goto LABEL_3;
      v11 = v8;
      goto LABEL_20;
    }
  }
  if ((uint64_t)v12 < a3)
    goto LABEL_10;
  if (v12 == (id)a3)
    result = v8;
  else
    result = 0;
  if (!result)
  {
LABEL_20:
    if (v11)
    {
      v13 = ~(unint64_t)objc_msgSend(v11, "absolutePageIndex") + a3;
      if (v13 >= (unint64_t)objc_msgSend(objc_msgSend(v11, "pages"), "count"))
        return 0;
      else
        return objc_msgSend(objc_msgSend(v11, "pages"), "objectAtIndex:", v13);
    }
  }
  return result;
}

- (void)invalidatePaginationData
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[THMacTOCNode p_invaliatePaginationData](self, "p_invaliatePaginationData");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[THMacTOCNode children](self, "children", 0);
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "invalidatePaginationData");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)p_invaliatePaginationData
{
  if (-[THMacTOCNode nodeType](self, "nodeType") == 16
    || -[THMacTOCNode nodeType](self, "nodeType") == 128
    || -[THMacTOCNode nodeType](self, "nodeType") == 32)
  {
    self->_absolutePageIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_displayPageNumberValue = 0x7FFFFFFFFFFFFFFFLL;

    self->_displayPageNumber = 0;
  }
}

- (THMacTOCNode)init
{
  THMacTOCNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THMacTOCNode;
  result = -[THMacTOCNode init](&v3, "init");
  if (result)
    result->_displayPageNumberValue = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)THMacTOCNode;
  -[THMacTOCNode dealloc](&v3, "dealloc");
}

- (id)rootNodeFilteringOutFirstLevelNodesOfType:(int)a3
{
  THMacTOCNode *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = objc_alloc_init(THMacTOCNode);
  -[THMacTOCNode setNodeType:](v5, "setNodeType:", -[THMacTOCNode nodeType](self, "nodeType"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[THMacTOCNode children](self, "children", 0);
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = ~a3;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "nodeType") & v10) != 0)
          -[THMacTOCNode addChild:](v5, "addChild:", v12);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return v5;
}

- (void)addChild:(id)a3
{
  if (!-[THMacTOCNode children](self, "children"))
    -[THMacTOCNode setChildren:](self, "setChildren:", +[NSMutableArray array](NSMutableArray, "array"));
  -[NSMutableArray addObject:](-[THMacTOCNode children](self, "children"), "addObject:", a3);
}

- (void)addPage:(id)a3
{
  if (!-[THMacTOCNode pages](self, "pages"))
    -[THMacTOCNode setPages:](self, "setPages:", +[NSMutableArray array](NSMutableArray, "array"));
  -[NSMutableArray addObject:](-[THMacTOCNode pages](self, "pages"), "addObject:", a3);
}

- (CGImage)image
{
  CGImage *v3;

  if (!self->_image && -[THMacTOCNode imageData](self, "imageData"))
  {
    v3 = (CGImage *)+[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", -[THMacTOCNode imageData](self, "imageData"));
    self->_image = v3;
    CGImageRetain(v3);
    -[THMacTOCNode setImageData:](self, "setImageData:", 0);
  }
  return self->_image;
}

- (unint64_t)nodeLevel
{
  unsigned int v2;

  v2 = -[THMacTOCNode nodeType](self, "nodeType");
  if (v2 == 32)
    return 1;
  else
    return 2 * (v2 == 128);
}

- (id)nodeSubTitle
{
  return -[THMacTOCNode nodeNumberString](self, "nodeNumberString");
}

- (int64_t)absolutePageIndex
{
  if (self->_absolutePageIndex == 0x7FFFFFFFFFFFFFFFLL
    && -[THMacTOCNode navigator](self, "navigator")
    && -[THMacTOCNode link](self, "link"))
  {
    self->_absolutePageIndex = -[THDocumentNavigator absolutePageIndexForLink:](-[THMacTOCNode navigator](self, "navigator"), "absolutePageIndexForLink:", -[THMacTOCNode link](self, "link"));
  }
  return self->_absolutePageIndex;
}

- (NSString)displayPageNumber
{
  NSString *result;
  NSString *v4;

  result = self->_displayPageNumber;
  if (!result)
  {
    if (self->_displayPageNumberValue == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[THMacTOCNode navigator](self, "navigator") && -[THMacTOCNode link](self, "link"))
      {
        if (!-[THDocumentRoot reflowablePaginationController](-[THDocumentNavigator documentRoot](-[THMacTOCNode navigator](self, "navigator"), "documentRoot"), "reflowablePaginationController")|| -[THReflowablePaginationController paginationComplete](-[THDocumentRoot reflowablePaginationController](-[THDocumentNavigator documentRoot](-[THMacTOCNode navigator](self, "navigator"), "documentRoot"), "reflowablePaginationController"), "paginationComplete"))
        {
          v4 = -[THDocumentNavigator pageNumberStringForLink:](-[THMacTOCNode navigator](self, "navigator"), "pageNumberStringForLink:", -[THMacTOCNode link](self, "link"));
LABEL_12:
          result = v4;
          goto LABEL_13;
        }
      }
      else if (-[THMacTOCNode absolutePageIndex](self, "absolutePageIndex") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (char *)-[THMacTOCNode absolutePageIndex](self, "absolutePageIndex") + 1);
        goto LABEL_12;
      }
      result = (NSString *)objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0);
LABEL_13:
      self->_displayPageNumber = result;
      return result;
    }
    v4 = (NSString *)+[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", -[THMacTOCNode displayPageNumberValue](self, "displayPageNumberValue"), -[THMacTOCNode displayPageNumberFormat](self, "displayPageNumberFormat"), 0);
    goto LABEL_12;
  }
  return result;
}

- (NSObject)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  self->_observer = a3;
}

- (int)nodeType
{
  return self->_nodeType;
}

- (void)setNodeType:(int)a3
{
  self->_nodeType = a3;
}

- (THModelPageInfo)chapterTOCPageInfo
{
  return self->_chapterTOCPageInfo;
}

- (void)setChapterTOCPageInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)nodeNumberString
{
  return self->_nodeNumberString;
}

- (void)setNodeNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)displayPageNumberFormat
{
  return self->_displayPageNumberFormat;
}

- (void)setDisplayPageNumberFormat:(int)a3
{
  self->_displayPageNumberFormat = a3;
}

- (unint64_t)displayPageNumberValue
{
  return self->_displayPageNumberValue;
}

- (void)setDisplayPageNumberValue:(unint64_t)a3
{
  self->_displayPageNumberValue = a3;
}

- (void)setDisplayPageNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setAbsolutePageIndex:(int64_t)a3
{
  self->_absolutePageIndex = a3;
}

- (THModelLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)pages
{
  return self->_pages;
}

- (void)setPages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (THDocumentNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (TSPData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
