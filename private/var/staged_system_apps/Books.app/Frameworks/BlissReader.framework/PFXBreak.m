@implementation PFXBreak

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;
  PFSPropertySet *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  v6 = (PFSPropertySet *)objc_msgSend(v5, "propertySet");
  if (PFXHtmlStyleDisplayValue(v6))
  {
    v7 = +[PFXBreak breakCharacterFromPropertySet:](PFXBreak, "breakCharacterFromPropertySet:", v6);
    if (v7)
    {
      v8 = v7;
      if (-[PFXBreak canAddColumnBreak](self, "canAddColumnBreak"))
        v9 = v8;
      else
        v9 = 10;
      objc_msgSend(v5, "setCurrentBreakState:", v9);
      objc_msgSend(v5, "setParentBreakStateSameAsCurrent");
    }
    else
    {
      +[PFXBreak addLineBreakForEntry:](PFXBreak, "addLineBreakForEntry:", v4);
    }
  }
  return 0;
}

+ (void)addLineBreakForEntry:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a3, "htmlReaderState");
  v5 = objc_msgSend(v4, "currentHtmlDocMediaState");
  v6 = objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "storage");
  +[PFXCharacterRun addCharacter:toStorage:](PFXCharacterRun, "addCharacter:toStorage:", 8232, v6);
  if (objc_msgSend(v5, "hasHints"))
  {
    if ((objc_msgSend(v4, "inTable") & 1) == 0)
    {
      objc_msgSend(objc_msgSend(v4, "hintCollectorForStorage:", v6), "addLineBreakHintWithPresentationId:", CFSTR("p"));
      objc_msgSend(v5, "popHint");
    }
  }
}

+ (unsigned)breakCharacterFromPropertySet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v4 = objc_msgSend(a3, "valueForProperty:", breakAfter);
  if (!v4 || (v5 = objc_msgSend(v4, "lastObject")) == 0 || (v6 = v5, objc_msgSend(v5, "type") != &stru_108))
  {
LABEL_7:
    v8 = objc_msgSend(a3, "valueForProperty:", "clear");
    if (!v8)
      return (unsigned __int16)v8;
    v9 = objc_msgSend(v8, "lastObject");
    if (!v9
      || (v10 = v9, objc_msgSend(v9, "type") != &stru_108)
      || (objc_msgSend(objc_msgSend(v10, "value"), "isEqualToString:", CFSTR("both")) & 1) == 0)
    {
      LOWORD(v8) = 0;
      return (unsigned __int16)v8;
    }
LABEL_11:
    LOWORD(v8) = 5;
    return (unsigned __int16)v8;
  }
  v7 = objc_msgSend(v6, "value");
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("column")) & 1) == 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("page")) & 1) != 0)
      goto LABEL_11;
    goto LABEL_7;
  }
  LOWORD(v8) = 12;
  return (unsigned __int16)v8;
}

- (BOOL)canAddColumnBreak
{
  return 0;
}

@end
