@implementation PFEIAnchor

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  objc_super v11;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(objc_msgSend(v5, "parentEntry"), "reader");
  v7 = objc_opt_class(PFEIFigure);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0
    || (v8 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "parentEntry"), "parentEntry"), "reader"),
        v9 = objc_opt_class(PFEIWeb),
        (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    objc_msgSend(a3, "setCfiPathForCurrentStorage");
  }
  v11.receiver = self;
  v11.super_class = (Class)PFEIAnchor;
  return -[PFXAnchor mapStartElementWithState:](&v11, "mapStartElementWithState:", a3);
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  _BYTE *v7;
  _BYTE *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  _QWORD v19[5];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PFEIAnchor;
  -[PFXAnchor mapEndElementWithState:](&v20, "mapEndElementWithState:");
  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = objc_msgSend(v5, "originalStorage");
  v7 = objc_msgSend(v5, "startCharIndex");
  v8 = objc_msgSend(v6, "length");
  v9 = v8 - v7;
  if (v8 != v7)
  {
    v10 = objc_opt_class(TSWPHyperlinkField);
    TSUDynamicCast(v10, objc_msgSend(v6, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v7, 6, 0));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1F146C;
    v19[3] = &unk_427A00;
    v19[4] = v11;
    objc_msgSend(v6, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", objc_opt_class(TSWPDrawableAttachment), v7, v9, v19);
  }
  v12 = objc_msgSend(objc_msgSend(v4, "parentEntry"), "reader");
  v13 = objc_opt_class(PFEIFigure);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(v4, "parentEntry"), "parentEntry"), "reader");
    v15 = objc_opt_class(PFEIWeb);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = objc_opt_class(THImageInfo);
      *(_QWORD *)&v17 = TSUDynamicCast(v16, objc_msgSend(v5, "firstChildResultWithElementName:", CFSTR("img"))).n128_u64[0];
      objc_msgSend(v5, "setResult:", v18, v17);
    }
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
  +[PFEIReferenceAnchor startReferenceAnchorWithStackEntry:contentState:](PFEIReferenceAnchor, "startReferenceAnchorWithStackEntry:contentState:", a3, a4);
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
  +[PFEIReferenceAnchor endCurrentReferenceAnchorWithContentState:](PFEIReferenceAnchor, "endCurrentReferenceAnchorWithContentState:", a4);
}

@end
