@implementation PFAIDualBody

+ (Class)subreaderClass
{
  return (Class)objc_opt_class(PFAIBody, a2);
}

- (void)createBodiesWithContentState:(id)a3
{
  char v4;
  char *i;
  id v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  THModelBodyTextInfo *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  char *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char *v32;

  v29 = objc_msgSend(a3, "paginatedState");
  v28 = objc_msgSend(v29, "pageCache");
  v27 = (char *)objc_msgSend(v28, "pageCount");
  v4 = 0;
  if (v27)
  {
    for (i = 0; i != v27; ++i)
    {
      objc_msgSend(v29, "setCurrentPageIndex:", i);
      v6 = objc_msgSend(v28, "pageWithIndex:", i);
      v31 = objc_msgSend(v29, "pageAtRelativeIndex:", i);
      v7 = objc_msgSend(v6, "flows");
      if ((unint64_t)objc_msgSend(v7, "count") <= 1)
      {
        if (objc_msgSend(v7, "count"))
        {
          v8 = objc_msgSend(v7, "objectAtIndex:", 0);
          if (objc_msgSend(v8, "count"))
          {
            v32 = (char *)objc_msgSend(v8, "count") - 1;
            if ((uint64_t)v32 >= 1)
            {
              v9 = 0;
              v30 = v8;
              do
              {
                v10 = objc_msgSend(v8, "objectAtIndex:", v9);
                v11 = objc_msgSend(v6, "slotWithId:", v10);
                if (v11)
                {
                  v12 = v11;
                  +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", v11, a3);
                  v17 = v6;
                  v18 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v13, v14, v15, v16);
                  v19 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), v18);

                  v20 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithCapacity:", 3);
                  +[PFXBlock mapLayoutStyleFromPropertySet:toPropertyMap:readerState:](PFXBlock, "mapLayoutStyleFromPropertySet:toPropertyMap:readerState:", v12, v20, a3);
                  objc_msgSend(v20, "setObject:forProperty:", objc_msgSend(v20, "boxedObjectForProperty:", 146), 145);
                  objc_msgSend(v20, "removeValueForProperty:", 146);
                  v21 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Body %@ Column Style"), v10), v20, 0);
                  -[THModelBodyTextInfo setColumnStyle:](v19, "setColumnStyle:", v21);

                  -[THModelBodyTextInfo setLineHints:](v19, "setLineHints:", +[PFAIDrawablePlacement lineHintsForPropertySet:textStorage:contentState:](PFAIDrawablePlacement, "lineHintsForPropertySet:textStorage:contentState:", v12, objc_msgSend(objc_msgSend(a3, "paginatedState"), "bodyStorage"), a3));
                  -[THModelBodyTextInfo setExteriorTextWrap:](v19, "setExteriorTextWrap:", +[PFXDrawablePlacement exteriorTextWrapWithCssValue:readerState:](PFXDrawablePlacement, "exteriorTextWrapWithCssValue:readerState:", objc_msgSend(v12, "valueForProperty:", PFXPropNmApplePubBoxWrapExteriorPath[0]), a3));
                  objc_msgSend(v31, "addBodyBoxInfo:insertContext:", v19, 0);
                  +[PFAIDrawablePlacement cacheDrawable:forSlot:withContentState:](PFAIDrawablePlacement, "cacheDrawable:forSlot:withContentState:", v19, v12, a3);

                  v6 = v17;
                  v8 = v30;
                  v4 = 1;
                }
                ++v9;
              }
              while (v32 != v9);
            }
          }
        }
      }
    }
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "thDocumentRoot"), "bookDescription"), "orientationLock") == 3)
  {
    v22 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "flowState"), "contentNodeBody"), "pages");
    if (objc_msgSend(v22, "count") == (char *)&dword_0 + 1)
    {
      v23 = objc_opt_class(THModelFlowPageInfo);
      *(_QWORD *)&v24 = TSUDynamicCast(v23, objc_msgSend(v22, "objectAtIndex:", 0)).n128_u64[0];
      v26 = v25;
      if (!v25)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v24), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFAIDualBody createBodiesWithContentState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAIBody.mm"), 158, CFSTR("invalid nil value for '%s'"), "flowPageInfo");
      objc_msgSend(v26, "setHasBodyFlow:", v4 & 1, v24);
    }
  }
}

- (void)addDrawablesToPageZOrderWithContentState:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v18 = objc_msgSend(a3, "paginatedState");
  v17 = objc_msgSend(v18, "pageDrawableMaps");
  v16 = objc_msgSend(v17, "count");
  if ((uint64_t)v16 >= 1)
  {
    v3 = 0;
    do
    {
      v4 = objc_msgSend(objc_msgSend(v18, "pageAtRelativeIndex:", v3), "drawablesZOrder");
      v19 = v3;
      v5 = objc_msgSend(v17, "objectAtIndex:", v3);
      v6 = objc_msgSend(objc_msgSend(v5, "allKeys"), "sortedArrayUsingSelector:", "compare:");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v6);
            v11 = objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i));
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v21;
              do
              {
                for (j = 0; j != v13; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v21 != v14)
                    objc_enumerationMutation(v11);
                  objc_msgSend(v4, "addDrawable:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j));
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              }
              while (v13);
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v8);
      }
      v3 = v19 + 1;
    }
    while ((id)(v19 + 1) != v16);
  }
}

- (void)finalizePageHintsForOrientation:(id)a3
{
  id v4;
  id v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  id v23;
  id v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  unint64_t v42;
  id v43;
  id v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  void *__p;
  char *v56;
  char *v57;
  void *v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE v61[128];

  v4 = objc_msgSend(a3, "contentNodeBody");
  v5 = objc_msgSend(a3, "bodyStorage");
  if (a3)
  {
    objc_msgSend(a3, "pageStartIndices");
    v7 = v58;
    v6 = v59;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
  }
  __p = 0;
  v56 = 0;
  v57 = 0;
  v8 = v6 - v7;
  v9 = v8 >> 3;
  if ((unint64_t)v8 >= 9)
  {
    v10 = 0;
    if (v9 <= 2)
      v11 = 2;
    else
      v11 = v8 >> 3;
    v12 = 1;
    do
    {
      v13 = *((_QWORD *)v58 + v12);
      if (v10 >= v57)
      {
        v15 = (char *)__p;
        v16 = (v10 - (_BYTE *)__p) >> 3;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 61)
          sub_36C30();
        v18 = v57 - (_BYTE *)__p;
        if ((v57 - (_BYTE *)__p) >> 2 > v17)
          v17 = v18 >> 2;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
          v19 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)sub_3CC38((uint64_t)&v57, v19);
          v15 = (char *)__p;
          v10 = v56;
        }
        else
        {
          v20 = 0;
        }
        v21 = &v20[8 * v16];
        *(_QWORD *)v21 = v13;
        v14 = v21 + 8;
        while (v10 != v15)
        {
          v22 = *((_QWORD *)v10 - 1);
          v10 -= 8;
          *((_QWORD *)v21 - 1) = v22;
          v21 -= 8;
        }
        __p = v21;
        v56 = v14;
        v57 = &v20[8 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *(_QWORD *)v10 = v13;
        v14 = v10 + 8;
      }
      v56 = v14;
      ++v12;
      v10 = v14;
    }
    while (v12 != v11);
  }
  v23 = objc_msgSend(v5, "length");
  v24 = v23;
  v25 = v56;
  if (v56 >= v57)
  {
    v27 = (char *)__p;
    v28 = (v56 - (_BYTE *)__p) >> 3;
    v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 61)
      sub_36C30();
    v30 = v57 - (_BYTE *)__p;
    if ((v57 - (_BYTE *)__p) >> 2 > v29)
      v29 = v30 >> 2;
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
      v31 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v31 = v29;
    if (v31)
    {
      v32 = (char *)sub_3CC38((uint64_t)&v57, v31);
      v27 = (char *)__p;
      v25 = v56;
    }
    else
    {
      v32 = 0;
    }
    v33 = &v32[8 * v28];
    v34 = &v32[8 * v31];
    *(_QWORD *)v33 = v24;
    v26 = v33 + 8;
    while (v25 != v27)
    {
      v35 = *((_QWORD *)v25 - 1);
      v25 -= 8;
      *((_QWORD *)v33 - 1) = v35;
      v33 -= 8;
    }
    __p = v33;
    v56 = v26;
    v57 = v34;
    if (v27)
      operator delete(v27);
  }
  else
  {
    *(_QWORD *)v56 = v23;
    v26 = v25 + 8;
  }
  v56 = v26;
  v36 = (char *)objc_msgSend(v5, "attachmentCount");
  if (v36)
  {
    v37 = 0;
    v38 = 0;
    do
    {
      v54 = 0;
      v39 = objc_opt_class(TSWPDrawableAttachment);
      *(_QWORD *)&v41 = TSUDynamicCast(v39, objc_msgSend(v5, "attachmentAtAttachmentIndex:outCharIndex:", v37, &v54)).n128_u64[0];
      if (v40)
      {
        do
          v42 = *((_QWORD *)__p + v38++);
        while (v54 >= v42);
        objc_msgSend(v4, "setRelativePageIndex:forInfo:", --v38, objc_msgSend(v40, "drawable", v41));
      }
      ++v37;
    }
    while (v37 != v36);
  }
  v43 = objc_msgSend(v4, "pages");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v44)
  {
    v45 = 0;
    v46 = *(_QWORD *)v51;
LABEL_50:
    v47 = 0;
    if (v9 >= v45)
      v48 = v9 - v45;
    else
      v48 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v46)
        objc_enumerationMutation(v43);
      if (v48 == v47)
        break;
      v49 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v47);
      objc_msgSend(v49, "setPageStartCharIndex:", *((_QWORD *)v58 + v45));
      objc_msgSend(v49, "setPageEndCharIndex:", *((_QWORD *)__p + v45++));
      if (v44 == (id)++v47)
      {
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        if (v44)
          goto LABEL_50;
        break;
      }
    }
  }
  if (__p)
  {
    v56 = (char *)__p;
    operator delete(__p);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFAIDualBody;
  -[PFAIDualReader mapEndElementWithState:](&v5, "mapEndElementWithState:");
  if (xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "xmlElementName")))
  {
    objc_msgSend(a3, "setPaginatedAsCurrent");
    -[PFAIDualBody createBodiesWithContentState:](self, "createBodiesWithContentState:", a3);
    -[PFAIDualBody addDrawablesToPageZOrderWithContentState:](self, "addDrawablesToPageZOrderWithContentState:", a3);
    -[PFAIDualBody finalizePageHintsForOrientation:](self, "finalizePageHintsForOrientation:", objc_msgSend(a3, "paginatedState"));
  }
}

@end
