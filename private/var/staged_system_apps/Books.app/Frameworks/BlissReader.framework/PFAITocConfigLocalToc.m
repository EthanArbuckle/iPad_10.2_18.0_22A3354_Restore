@implementation PFAITocConfigLocalToc

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  id v8;
  char *v9;
  void *i;
  void *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  id v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  char *v37;
  uint64_t v38;
  id v39;
  double v40;
  double v41;
  THWViewportInfo *v42;
  id v43;
  id v44;
  double v45;
  double v46;
  double v47;
  id v48;
  double v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id obj;
  uint64_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];

  v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  if (objc_msgSend(v4, "childResultCount") == (char *)&dword_0 + 1)
  {
    v5 = objc_opt_class(TSWPShapeInfo);
    *(_QWORD *)&v7 = TSUDynamicCast(v5, objc_msgSend(v4, "childResultAtIndex:", 0)).n128_u64[0];
    if (v6)
    {
      v53 = v6;
      v54 = a3;
      v8 = objc_msgSend(v6, "containedStorage", v7);
      if ((objc_msgSend(v8, "hasSmartFields") & 1) == 0)
      {
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        obj = objc_msgSend(objc_msgSend(a3, "tocTile"), "landscapeEntries");
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        if (v57)
        {
          v9 = 0;
          v56 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v57; i = (char *)i + 1)
            {
              if (*(_QWORD *)v59 != v56)
                objc_enumerationMutation(obj);
              v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v11, "sectionIdentifier"))
              {
                v12 = (char *)objc_msgSend(v8, "rangeOfParagraphBreakingCharacter:backwards:range:", 10, 0, v9, (_BYTE *)objc_msgSend(v8, "length") - v9);
                v14 = v12 == (char *)0x7FFFFFFFFFFFFFFFLL ? (char *)objc_msgSend(v8, "length") : &v12[v13];
                v15 = (char *)objc_msgSend(v8, "rangeOfString:searchOptions:range:", objc_msgSend(v11, "sectionIdentifier"), 1, v9, v14 - v9);
                if (v15 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v17 = v15;
                  v18 = v16;
                  v9 = &v15[v16];
                  v19 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(v8, "context"), objc_msgSend(objc_msgSend(v11, "modelLink"), "url"));
                  objc_msgSend(v8, "addSmartField:toRange:dolcContext:undoTransaction:", v19, v17, v18, 0, 0);

                }
              }
              if (objc_msgSend(v11, "title"))
              {
                v20 = objc_msgSend(objc_msgSend(objc_msgSend(v11, "title"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u2028"), CFSTR("​\u2028")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), &stru_43D7D8);
                v21 = (char *)objc_msgSend(v8, "rangeOfParagraphBreakingCharacter:backwards:range:", 10, 0, v9, (_BYTE *)objc_msgSend(v8, "length") - v9);
                v23 = v21 == (char *)0x7FFFFFFFFFFFFFFFLL ? (char *)objc_msgSend(v8, "length") : &v21[v22];
                v24 = (char *)objc_msgSend(v8, "rangeOfString:searchOptions:range:", v20, 1, v9, v23 - v9);
                if (v24 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v26 = v24;
                  v27 = v25;
                  v9 = &v24[v25];
                  v28 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(v8, "context"), objc_msgSend(objc_msgSend(v11, "modelLink"), "url"));
                  objc_msgSend(v8, "addSmartField:toRange:dolcContext:undoTransaction:", v28, v26, v27, 0, 0);

                }
              }
              if (objc_msgSend(v11, "displayPageNumber"))
              {
                v29 = (char *)objc_msgSend(v8, "rangeOfParagraphBreakingCharacter:backwards:range:", 10, 0, v9, (_BYTE *)objc_msgSend(v8, "length") - v9);
                v31 = v29 == (char *)0x7FFFFFFFFFFFFFFFLL ? (char *)objc_msgSend(v8, "length") : &v29[v30];
                v32 = (char *)objc_msgSend(v8, "rangeOfString:searchOptions:range:", objc_msgSend(v11, "displayPageNumber"), 1, v9, v31 - v9);
                if (v32 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v34 = v32;
                  v35 = v33;
                  v9 = &v32[v33];
                  v36 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(v8, "context"), objc_msgSend(objc_msgSend(v11, "modelLink"), "url"));
                  objc_msgSend(v8, "addSmartField:toRange:dolcContext:undoTransaction:", v36, v34, v35, 0, 0);

                }
              }
              v37 = (char *)objc_msgSend(v8, "rangeOfParagraphBreakingCharacter:backwards:range:", 10, 0, v9, (_BYTE *)objc_msgSend(v8, "length") - v9);
              if (v37 >= v9)
                v9 = &v37[v38];
            }
            v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          }
          while (v57);
        }
      }
      v39 = objc_msgSend(v53, "geometry");
      objc_msgSend(objc_msgSend(v53, "geometry"), "size");
      v41 = v40 + 2.0;
      objc_msgSend(objc_msgSend(v53, "geometry"), "size");
      objc_msgSend(v39, "setSize:", v41);
      v42 = -[THWViewportInfo initWithContext:geometry:]([THWViewportInfo alloc], "initWithContext:geometry:", objc_msgSend(v54, "tspContext"), objc_msgSend(v53, "geometry"));
      v43 = objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:", objc_msgSend(v54, "tspContext"), objc_msgSend(v53, "geometry"), objc_msgSend(v53, "shapeStyle"));
      -[THWViewportInfo setBackgroundShape:](v42, "setBackgroundShape:", v43);

      -[THWViewportInfo setStroke:](v42, "setStroke:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"));
      v44 = objc_msgSend(objc_alloc((Class)TSWPStorageMeasurer), "initWithStorage:", v8);
      objc_msgSend(v44, "measuredSizeWithFlags:", 3);
      v46 = v45;

      objc_msgSend(objc_msgSend(v53, "geometry"), "size");
      -[THWViewportInfo setCanvasSize:](v42, "setCanvasSize:", v47 + -2.0, v46 + 10.0);
      -[THWViewportInfo setContentPadding:](v42, "setContentPadding:", 0.0);
      v48 = objc_alloc((Class)TSDInfoGeometry);
      objc_msgSend(objc_msgSend(v53, "geometry"), "size");
      v50 = objc_msgSend(v48, "initWithPosition:size:", 0.0, 10.0, v49 + -1.0, v46);
      v51 = objc_msgSend(objc_alloc((Class)TSWPShapeStyle), "initWithContext:", objc_msgSend(v54, "tspContext"));
      objc_msgSend(objc_msgSend(v54, "stylesheet"), "addStyle:", v51);
      v52 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(v54, "tspContext"), v50, v51, v8);
      objc_msgSend(v52, "setStroke:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"));

      -[THWViewportInfo setCanvasInfos:](v42, "setCanvasInfos:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v52));
      objc_msgSend(objc_msgSend(v54, "pageInfo"), "addFloatingDrawable:insertContext:", v42, 0);
      +[PFAITocConfigDrawablePlacement cacheDrawable:readerState:](PFAITocConfigDrawablePlacement, "cacheDrawable:readerState:", v42, v54);

    }
  }
}

@end
