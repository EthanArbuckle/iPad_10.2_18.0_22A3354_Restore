@implementation THGlossaryEntryRep

- (void)dealloc
{
  objc_super v3;

  self->mTitleLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryRep;
  -[THGlossaryEntryRep dealloc](&v3, "dealloc");
}

- (void)drawInLayerContext:(CGContext *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryRep drawInLayerContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryRep.m"), 39, CFSTR("this method should never be called, and entry reps should never get a bitmap allocated"));
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (id)p_newTitleLayer
{
  id v3;
  id v4;

  v3 = objc_alloc_init((Class)CATextLayer);
  objc_msgSend(v3, "setContentsGravity:", kCAGravityTopLeft);
  objc_msgSend(v3, "setString:", objc_msgSend(objc_msgSend(-[THGlossaryEntryRep info](self, "info"), "entry"), "term"));
  objc_msgSend(v3, "setFont:", CFSTR("Baskerville"));
  objc_msgSend(v3, "setFontSize:", 38.0);
  v4 = objc_msgSend(objc_msgSend(-[THGlossaryEntryRep layout](self, "layout"), "layoutStyleProvider"), "glossaryEntryLayoutForegroundColor");
  if (!v4)
    v4 = +[TSUColor blackColor](TSUColor, "blackColor");
  objc_msgSend(v3, "setForegroundColor:", objc_msgSend(v4, "CGColor"));
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(objc_msgSend(objc_msgSend(-[THGlossaryEntryRep layout](self, "layout"), "layoutStyleProvider"), "glossaryEntryLayoutBackgroundColor"), "CGColor"));
  return v3;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if ((objc_msgSend(-[THGlossaryEntryRep info](self, "info"), "hasTitle") & 1) == 0)
  {
    if (!self->mTitleLayer)
      self->mTitleLayer = (CATextLayer *)-[THGlossaryEntryRep p_newTitleLayer](self, "p_newTitleLayer");
    objc_msgSend(-[THGlossaryEntryRep layout](self, "layout"), "columnFrame");
    -[CATextLayer setFrame:](self->mTitleLayer, "setFrame:");
    objc_msgSend(a3, "addObject:", self->mTitleLayer);
  }
}

- (void)didUpdateLayer:(id)a3
{
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(objc_msgSend(objc_msgSend(-[THGlossaryEntryRep layout](self, "layout"), "layoutStyleProvider"), "glossaryEntryLayoutBackgroundColor"), "CGColor"));
}

- (id)childRepsForHitTesting
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = -[THGlossaryEntryRep childReps](self, "childReps", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(TSWPRep, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          objc_msgSend(v3, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v3;
}

- (id)stringForLabelControl:(id)a3
{
  const __CFString *v4;

  if (!objc_msgSend(objc_msgSend(a3, "layout"), "tag"))
  {
    v4 = CFSTR("Related Glossary Terms");
    return objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", v4, &stru_43D7D8, 0);
  }
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag") == (char *)&dword_0 + 1)
  {
    v4 = CFSTR("Index");
    return objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", v4, &stru_43D7D8, 0);
  }
  return 0;
}

- (id)fontNameForLabelControl:(id)a3
{
  return objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", a3, 15.0), "fontName");
}

- (double)fontSizeForLabelControl:(id)a3
{
  return 15.0;
}

- (id)textColorForLabelControl:(id)a3
{
  return objc_msgSend(objc_msgSend(-[THGlossaryEntryRep layout](self, "layout", a3), "layoutStyleProvider"), "glossaryEntryLayoutForegroundColor");
}

- (int)horizontaAlignmentForLabelControl:(id)a3
{
  return 0;
}

- (int)verticalAlignmentForLabelControl:(id)a3
{
  return 0;
}

- (id)shadowForLabelControl:(id)a3
{
  return 0;
}

@end
