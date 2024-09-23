@implementation PFXBlock

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  id v14;
  id v15;
  float v16;
  id v18;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v18 = 0;
  v8 = +[PFXParagraphStyle map:stackEntry:](PFXParagraphStyle, "map:stackEntry:", &v18, v5);
  if (v8)
  {
    if (xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"li")
      && objc_msgSend(v7, "inList"))
    {
      objc_msgSend(v7, "setListStart:", (char *)objc_msgSend(v7, "listStart") + 1);
    }
    objc_msgSend(v6, "setCurrentBreakStateSameAsParent");
    v9 = objc_msgSend(v6, "storage");
    v10 = objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v6, "storage"));
    v11 = +[PFXBreak breakCharacterFromPropertySet:](PFXBreak, "breakCharacterFromPropertySet:", objc_msgSend(v6, "propertySet"));
    v12 = 10;
    if (v11)
    {
      v13 = v11;
      if (v11 != 10)
      {
        if (-[PFXBlock canAddColumnBreak:](self, "canAddColumnBreak:", a3, 10))
          v12 = v13;
        else
          v12 = 10;
      }
    }
    +[PFXBlock addBreakIfApplicableToEntry:newBreakState:hintCollector:](PFXBlock, "addBreakIfApplicableToEntry:newBreakState:hintCollector:", v5, v12, v10);
    v14 = objc_msgSend(v9, "length");
    objc_msgSend(v9, "stylesheet");
    objc_msgSend(v18, "stylesheet");
    objc_msgSend(v9, "setParagraphStyle:forCharRange:undoTransaction:", v18, v14, 0, 0);
    if (((unint64_t)objc_msgSend(v7, "listLevel") & 0x8000000000000000) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v7, "listLevel");
    objc_msgSend(v9, "setParagraphLevel:forCharRange:undoTransaction:", v15, v14, 0, 0);
    objc_msgSend(v6, "setStartCharIndex:", v14);
    objc_msgSend(v6, "setParagraphStyle:", v18);
    objc_msgSend(v18, "floatValueForProperty:", 17);
    objc_msgSend(v6, "setFontSize:", v16);
    if (!objc_msgSend(v6, "listStyle"))
    {
      if (objc_msgSend(v7, "inList"))
        +[PFXList mapBulletWithOrientationState:readerState:](PFXList, "mapBulletWithOrientationState:readerState:", v6, a3);
      else
        +[PFXList mapNonListStyleWithOrientationState:readerState:](PFXList, "mapNonListStyleWithOrientationState:readerState:", v6, a3);
    }
    if (objc_msgSend(v6, "listStyle"))
    {
      objc_msgSend(v9, "setListStyle:forCharRange:undoTransaction:", objc_msgSend(v6, "listStyle"), v14, 0, 0);
      if (objc_msgSend(v7, "inList"))
        objc_msgSend(v9, "setListStart:forCharRange:undoTransaction:", objc_msgSend(v7, "listStart"), v14, 0, 0);
    }
    else
    {
      objc_msgSend(v9, "setListStyle:forCharRange:undoTransaction:", objc_msgSend(objc_msgSend(v6, "stylesheet"), "defaultListStyle"), v14, 0, 0);
    }
  }
  return v8;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = objc_msgSend(a3, "drawableReaderForCurrentMediaStateWithStackEntry:", objc_msgSend(v4, "parentHtmlStackEntry"));
  v7 = objc_opt_class(PFXShapeWithText);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    +[PFXBlock mapLayoutStyleFromPropertySet:toPropertyMap:readerState:](PFXBlock, "mapLayoutStyleFromPropertySet:toPropertyMap:readerState:", objc_msgSend(v5, "propertySet"), objc_msgSend(v6, "textBlockPropertyMap"), a3);
  objc_msgSend(v5, "setParentBreakStateSameAsCurrent");
}

+ (BOOL)isEntryInline:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet"), "valueForProperty:", "display");
  if (v3 && (v4 = objc_msgSend(v3, "lastObject")) != 0 && (v5 = v4, objc_msgSend(v4, "type") == &stru_108))
    return objc_msgSend(objc_msgSend(v5, "value"), "isEqualToString:", CFSTR("inline"));
  else
    return 0;
}

+ (void)addBreakIfApplicableToEntry:(id)a3 newBreakState:(unsigned __int16)a4 hintCollector:(id)a5
{
  uint64_t v6;
  id v9;
  unsigned __int8 v10;
  id v11;

  v6 = a4;
  v9 = objc_msgSend(a3, "currentEntryMediaState");
  v10 = objc_msgSend(a1, "isEntryInline:", a3);
  v11 = objc_msgSend(v9, "currentBreakState");
  if ((_DWORD)v11)
  {
    if ((v10 & 1) == 0)
    {
      +[PFXCharacterRun addCharacter:toStorage:](PFXCharacterRun, "addCharacter:toStorage:", v11, objc_msgSend(v9, "storage"));
      if ((objc_msgSend(objc_msgSend(a3, "htmlReaderState"), "inTable") & 1) == 0)
        objc_msgSend(a5, "updateLastLineBreakHint");
    }
  }
  objc_msgSend(v9, "setCurrentBreakState:", v6);
}

+ (void)mapLayoutStyleFromPropertySet:(id)a3 toPropertyMap:(id)a4 readerState:(id)a5
{
  id v8;
  id v9;

  v8 = +[PFXColumnStyle createColumnsWithPropertySet:readerState:](PFXColumnStyle, "createColumnsWithPropertySet:readerState:", a3, a5);
  objc_msgSend(a4, "setObject:forProperty:", v8, 148);

  v9 = +[PFXColumnStyle createPaddingWithPropertySet:readerState:](PFXColumnStyle, "createPaddingWithPropertySet:readerState:", a3, a5);
  objc_msgSend(a4, "setObject:forProperty:", v9, 146);

  objc_msgSend(a4, "setIntValue:forProperty:", +[PFXColumnStyle mapVerticalAlignmentWithPropertySet:](PFXColumnStyle, "mapVerticalAlignmentWithPropertySet:", a3), 149);
}

- (BOOL)canAddColumnBreak:(id)a3
{
  return 0;
}

@end
