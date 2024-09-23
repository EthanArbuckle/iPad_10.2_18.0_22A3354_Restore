@implementation PFXCharacterRun

+ (void)readTextFromStream:(_xmlTextReader *)a3 childIndex:(unint64_t)a4 readerState:(id)a5
{
  NSString *v9;

  if (objc_msgSend(a5, "inBody"))
    objc_msgSend(a5, "setCfiPathForTextRun:", a4);
  v9 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", xmlTextReaderConstValue(a3));
  if (-[NSString length](v9, "length"))
    objc_msgSend(a1, "readTextToCurrentOrientation:readerState:", v9, a5);
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  float v12;
  id v14;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v8 = objc_msgSend(v6, "storage");
  objc_msgSend(v6, "setCurrentBreakStateSameAsParent");
  objc_msgSend((id)objc_opt_class(self), "startReferenceAnchorWithStackEntry:readerState:", v5, a3);
  if (objc_msgSend(v7, "hasHints"))
  {
    if ((objc_msgSend(a3, "inTable") & 1) == 0)
    {
      v9 = objc_msgSend(a3, "totalTextRead");
      if (v9 == objc_msgSend(v7, "nextHintLocation") && !objc_msgSend(v7, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", v8), "addLineBreakHintWithPresentationId:", CFSTR("p"));
        objc_msgSend(v7, "popHint");
      }
    }
  }
  v14 = 0;
  v10 = +[PFXCharacterStyle map:stackEntry:](PFXCharacterStyle, "map:stackEntry:", &v14, v5);
  if (v10)
  {
    objc_msgSend(v6, "setCharacterStyle:", v14);
    if (objc_msgSend(v14, "definesProperty:", 17))
      v11 = v14;
    else
      v11 = objc_msgSend(v8, "paragraphStyleAtCharIndex:effectiveRange:", objc_msgSend(v8, "length"), 0);
    objc_msgSend(v11, "floatValueForProperty:", 17);
    objc_msgSend(v6, "setFontSize:", v12);
  }
  else if (v14)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v14), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXCharacterRun mapStartElementWithState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXCharacterRun.mm"), 86, CFSTR("Programming error. Superfluous character style."));
  }
  return v10;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;

  v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  objc_msgSend((id)objc_opt_class(self), "endCurrentReferenceAnchorForEntryOrientation:readerState:", v5, a3);
  objc_msgSend(v5, "setParentBreakStateSameAsCurrent");
}

+ (void)addCharacter:(unsigned __int16)a3 toStorage:(id)a4
{
  CFStringRef v5;
  CFStringRef v6;
  UniChar chars;

  chars = a3;
  if (a3)
  {
    v5 = CFStringCreateWithCharactersNoCopy(0, &chars, 1, kCFAllocatorNull);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(a4, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", objc_msgSend(a4, "length"), 0, v5, 0, 0);
      CFRelease(v6);
    }
  }
}

+ (BOOL)addColumnBreak:(id)a3
{
  objc_msgSend(a1, "addCharacter:toStorage:", 12, objc_msgSend(a3, "storage"));
  return 1;
}

+ (BOOL)addLineBreak:(id)a3
{
  objc_msgSend(a1, "addCharacter:toStorage:", 8232, objc_msgSend(a3, "storage"));
  return 1;
}

+ (BOOL)addParagraphBreak:(id)a3
{
  objc_msgSend(a1, "addCharacter:toStorage:", 10, objc_msgSend(a3, "storage"));
  return 1;
}

+ (BOOL)isCharForcesLineBreak:(unsigned __int16)a3
{
  BOOL result;

  result = 1;
  if (a3 > 0xAu || ((1 << a3) & 0x430) == 0)
    return a3 == 8232;
  return result;
}

+ (void)readTextToCurrentOrientation:(id)a3 readerState:(id)a4
{
  id v7;
  id v8;
  id v9;
  _BYTE *v10;
  id v11;
  _BYTE *v12;
  id v13;

  v7 = objc_msgSend(a4, "currentHtmlStackEntry");
  v8 = objc_msgSend(v7, "currentEntryMediaState");
  v9 = objc_msgSend(v8, "storage");
  v10 = objc_msgSend(v9, "length");
  if (objc_msgSend(v9, "length"))
    v11 = objc_msgSend(v9, "characterAtIndex:", v10 - 1);
  else
    v11 = 0;
  objc_msgSend(v9, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", v10, 0, objc_msgSend(a1, "trimWhitespaceInText:previousCharacter:elementName:forMediaState:", a3, v11, objc_msgSend(v7, "xmlElementName"), v8), 0, 0);
  v12 = objc_msgSend(v9, "length");
  if (((unint64_t)objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "listLevel") & 0x8000000000000000) != 0)
    v13 = 0;
  else
    v13 = objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "listLevel");
  objc_msgSend(v9, "setParagraphLevel:forCharRange:undoTransaction:", v13, v10, v12 - v10, 0);
  objc_msgSend(v9, "setCharacterStyle:range:undoTransaction:", objc_msgSend(v8, "characterStyle"), v10, v12 - v10, 0);
}

+ (id)trimWhitespaceInText:(id)a3 previousCharacter:(unsigned __int16)a4 elementName:(const char *)a5 forMediaState:(id)a6
{
  uint64_t v7;
  unsigned int v10;
  BOOL v11;
  NSCharacterSet *v14;
  char v15;

  v7 = a4;
  v10 = objc_msgSend(a6, "whitespace");
  if (xmlStrEqual((const xmlChar *)"pre", (const xmlChar *)a5))
    return a3;
  v11 = xmlStrEqual((const xmlChar *)"code", (const xmlChar *)a5) || v10 == 1;
  if (v11 || v10 == 3)
    return a3;
  if (v10 == 4)
  {
    v14 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
    v15 = 0;
  }
  else
  {
    v14 = +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet");
    v15 = 1;
  }
  a3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", v14), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF != ''"))), "componentsJoinedByString:", CFSTR(" "));
  if (objc_msgSend(a1, "isCharForcesLineBreak:", v7)
    && objc_msgSend(a3, "length")
    && objc_msgSend(a3, "characterAtIndex:", 0) == 32)
  {
    a3 = objc_msgSend(a3, "substringFromIndex:", 1);
  }
  if ((v15 & 1) != 0 || !objc_msgSend(a3, "length"))
    return a3;
  else
    return objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n "), CFSTR("\n"));
}

@end
