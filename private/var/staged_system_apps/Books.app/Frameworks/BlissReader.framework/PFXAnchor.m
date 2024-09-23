@implementation PFXAnchor

- (BOOL)mapStartElementWithState:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  int *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  NSString *v29;
  id v30;
  NSString *v31;
  THWPStorage *v32;
  id v34;
  id v35;
  PFXAnchor *v36;
  id v37;
  void *v38;
  int v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v3 = a3;
  v35 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v35, "currentEntryMediaState");
  v6 = objc_msgSend(v3, "currentHtmlDocMediaState");
  v7 = objc_msgSend(v5, "propertySet");
  v37 = objc_msgSend(v5, "storage");
  objc_msgSend(v5, "setOriginalStorage:");
  v38 = v3;
  if (objc_msgSend(v6, "hasHints"))
  {
    if ((objc_msgSend(v3, "inTable") & 1) == 0)
    {
      v8 = objc_msgSend(v3, "totalTextRead");
      v9 = v8 == objc_msgSend(v6, "nextHintLocation");
      v3 = v38;
      if (v9 && !objc_msgSend(v6, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(v38, "hintCollectorForStorage:", v37), "addLineBreakHintWithPresentationId:", CFSTR("p"));
        objc_msgSend(v6, "popHint");
      }
    }
  }
  v10 = objc_msgSend(v7, "valueForProperty:", PFXPropNmApplePubLayoutHint[0]);
  v11 = &OBJC_IVAR___THWScrollableCanvasController__delegate;
  if (v10)
  {
    v12 = v10;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v13)
    {
      v14 = v13;
      v34 = v5;
      v15 = 0;
      v16 = *(_QWORD *)v42;
      v36 = self;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v12);
          v18 = +[PFSUtilities identValueOrNilFromPair:](PFSUtilities, "identValueOrNilFromPair:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v17), v34);
          if (objc_msgSend(PFXPropNmApplePubShapeHint, "isEqualToString:", v18))
          {
            if (objc_msgSend(v6, "hasHints") && (objc_msgSend(v3, "inTable") & 1) == 0)
            {
              v39 = v15;
              v19 = v12;
              v20 = v11;
              v21 = objc_msgSend(v3, "hintCollectorForStorage:", v37);
              v22 = objc_msgSend(v3, "totalTextRead");
              v23 = objc_msgSend(v6, "nextHintLocation");
              if (v22 == v23 && !objc_msgSend(v6, "nextHintShapeRef"))
              {
                objc_msgSend(v21, "addLineBreakHintWithPresentationId:", CFSTR("p"));
                objc_msgSend(v6, "popHint");
              }
              v24 = objc_msgSend(v6, "nextHintShapeRef");
              if (objc_msgSend(v6, "hasHints"))
              {
                do
                {
                  if (v23 != v22)
                    break;
                  if (!v24)
                    break;
                  objc_msgSend(v21, "addStartHintWithIdref:presentationId:", v24, CFSTR("p"));
                  objc_msgSend(v6, "popHint");
                  v23 = objc_msgSend(v6, "nextHintLocation");
                  v24 = objc_msgSend(v6, "nextHintShapeRef");
                }
                while ((objc_msgSend(v6, "hasHints") & 1) != 0);
              }
              v3 = v38;
              v11 = v20;
              v12 = v19;
              self = v36;
              v15 = v39;
            }
            goto LABEL_29;
          }
          if ((objc_msgSend(v18, "isEqualToString:", PFXPropNmApplePubInlineHint) & 1) != 0)
          {
            v15 = 1;
LABEL_29:
            *((_BYTE *)&self->super.super.isa + v11[795]) = 1;
            goto LABEL_30;
          }
          if ((objc_msgSend(PFXPropNmApplePubPageHint, "isEqualToString:", v18) & 1) != 0
            || objc_msgSend(PFXPropNmApplePubPageShapeHint, "isEqualToString:", v18))
          {
            objc_msgSend(v6, "addPageStartIndex");
            goto LABEL_29;
          }
          if (objc_msgSend(PFXPropNmApplePubAnchorHint, "isEqualToString:", v18))
          {
            objc_msgSend(v6, "cacheCharacterPosition:forDrawableAnchorId:", objc_msgSend(objc_msgSend(v6, "bodyStorage"), "length"), +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v35, "xmlElementId")));
            goto LABEL_29;
          }
LABEL_30:
          v17 = (char *)v17 + 1;
        }
        while (v17 != v14);
        v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        v14 = v25;
        if (!v25)
        {
          v26 = v15;
          v5 = v34;
          if ((v26 & 1) != 0)
          {
            v27 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(v3, "tspContext"), 0);
            objc_msgSend(v27, "setHOffsetType:", 0);
            objc_msgSend(v27, "setHOffset:", 0.0);
            objc_msgSend(v27, "setVOffsetType:", 0);
            objc_msgSend(v27, "setVOffset:", 0.0);
            v28 = objc_msgSend(v37, "length");
            objc_msgSend(v37, "insertAttachmentOrFootnote:range:", v27, v28, 0);
            v29 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v35, "xmlElementId"));
            v30 = objc_msgSend(objc_msgSend(v38, "currentHtmlDocMediaState"), "drawableAttachmentCache");
            v31 = v29;
            v3 = v38;
            objc_msgSend(v30, "setObject:forKey:", v27, v31);

            objc_msgSend(v37, "setCharacterStyle:range:undoTransaction:", objc_msgSend(objc_msgSend(objc_msgSend(v35, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle"), v28, 1, 0);
          }
          break;
        }
      }
    }
  }
  if (*((_BYTE *)&self->super.super.isa + v11[795]))
  {
    v32 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", +[THTemporaryObjectContext context](THTemporaryObjectContext, "context"), &stru_43D7D8, objc_msgSend(v6, "stylesheet"), 3);
    objc_msgSend(v5, "setOverriddenStorage:", v32);

    return 1;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)PFXAnchor;
    return -[PFXCharacterRun mapStartElementWithState:](&v40, "mapStartElementWithState:", v3);
  }
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  int64_t v17;
  id v18;
  objc_super v19;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v8 = objc_msgSend(v6, "originalStorage");
  if (!self->mIsLayoutHint)
  {
    v19.receiver = self;
    v19.super_class = (Class)PFXAnchor;
    -[PFXCharacterRun mapEndElementWithState:](&v19, "mapEndElementWithState:", a3);
    v11 = objc_msgSend(v5, "href");
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(CFSTR("noteref"), "isEqualToString:", objc_msgSend(v5, "valueForAttribute:", "type"))&& objc_msgSend(v6, "childResultCount") == (char *)&dword_0 + 1&& (v13 = TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, objc_msgSend(v6, "childResultAtIndex:", 0))) != 0)
      {
        v14 = v13;
        objc_msgSend(v6, "setResult:", v13);
        objc_msgSend(v7, "setSourceDrawableInfo:forIdentifier:", v14, objc_msgSend(v12, "fragment"));
      }
      else
      {
        v15 = objc_msgSend(v6, "startCharIndex");
        v16 = objc_msgSend(v8, "length");
        v17 = v16 - v15;
        if (v16 != v15)
        {
          v18 = objc_msgSend(objc_alloc((Class)TSWPHyperlinkField), "initWithContext:url:", objc_msgSend(a3, "tspContext"), v12);
          objc_msgSend(v8, "addSmartField:toRange:dolcContext:undoTransaction:", v18, v15, v17, 0, 0);

        }
      }
    }
  }
  if (objc_msgSend(v7, "hasHints"))
  {
    if ((objc_msgSend(a3, "inTable") & 1) == 0)
    {
      v9 = objc_msgSend(a3, "hintCollectorForStorage:", v8);
      v10 = objc_msgSend(a3, "totalTextRead");
      if (v10 == objc_msgSend(v7, "nextHintLocation") && !objc_msgSend(v7, "nextHintShapeRef"))
      {
        objc_msgSend(v9, "addLineBreakHintWithPresentationId:", CFSTR("p"));
        objc_msgSend(v7, "popHint");
      }
    }
  }
}

@end
