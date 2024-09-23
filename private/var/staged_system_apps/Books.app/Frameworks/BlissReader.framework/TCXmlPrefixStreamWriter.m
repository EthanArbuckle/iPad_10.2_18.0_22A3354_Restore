@implementation TCXmlPrefixStreamWriter

- (TCXmlPrefixStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3
{
  uint64_t v3;
  TCXmlPrefixStreamWriter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCXmlPrefixStreamWriter;
  v4 = -[TCXmlStreamWriter initWithTextWriter:](&v6, "initWithTextWriter:", a3);
  if (v4)
  {
    v4->mStateStack = (NSMutableArray *)objc_opt_new(NSMutableArray, v3);
    -[TCXmlPrefixStreamWriter pushStateWithElementPrefix:attributePrefix:](v4, "pushStateWithElementPrefix:attributePrefix:", 0, 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TCXmlPrefixStreamWriter popState](self, "popState");

  v3.receiver = self;
  v3.super_class = (Class)TCXmlPrefixStreamWriter;
  -[TCXmlStreamWriter dealloc](&v3, "dealloc");
}

- (void)pushElementPrefix:(id)a3 attributePrefix:(id)a4
{
  -[NSMutableArray addObject:](self->mStateStack, "addObject:", +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:", a3, a4));
}

- (id)pushState
{
  TCXmlPrefixStreamWriterState *v3;

  v3 = objc_alloc_init(TCXmlPrefixStreamWriterState);
  -[NSMutableArray addObject:](self->mStateStack, "addObject:", v3);

  return v3;
}

- (id)pushStateWithElementPrefix:(id)a3 attributePrefix:(id)a4
{
  id v6;

  v6 = -[TCXmlPrefixStreamWriter pushState](self, "pushState");
  objc_msgSend(v6, "setElementPrefix:", a3);
  objc_msgSend(v6, "setAttributePrefix:", a4);
  return v6;
}

- (id)pushStateWithSharedPrefix:(id)a3
{
  return -[TCXmlPrefixStreamWriter pushStateWithElementPrefix:attributePrefix:](self, "pushStateWithElementPrefix:attributePrefix:", a3, a3);
}

- (void)popState
{
  -[NSMutableArray removeLastObject](self->mStateStack, "removeLastObject");
}

- (id)currentState
{
  return -[NSMutableArray lastObject](self->mStateStack, "lastObject");
}

- (id)currentElementPrefix
{
  return objc_msgSend(-[TCXmlPrefixStreamWriter currentState](self, "currentState"), "elementPrefix");
}

- (id)currentAttributePrefix
{
  return objc_msgSend(-[TCXmlPrefixStreamWriter currentState](self, "currentState"), "attributePrefix");
}

- (BOOL)startElement:(id)a3
{
  return -[TCXmlStreamWriter startElement:prefix:ns:](self, "startElement:prefix:ns:", a3, -[TCXmlPrefixStreamWriter currentElementPrefix](self, "currentElementPrefix"), 0);
}

- (BOOL)addElement:(id)a3
{
  _BOOL4 v4;

  v4 = -[TCXmlPrefixStreamWriter startElement:](self, "startElement:", a3);
  if (v4)
    LOBYTE(v4) = -[TCXmlStreamWriter endElement](self, "endElement");
  return v4;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4
{
  return -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, a4, -[TCXmlPrefixStreamWriter currentAttributePrefix](self, "currentAttributePrefix"), 0);
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  return -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", a3, TCXmlStringForBool(a4));
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4
{
  return -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", a3, TCXmlStringForInt(a4));
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  return -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", a3, TCXmlStringForEnum(*(uint64_t *)&a4, a5));
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4
{
  return -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", a3, TCXmlStringForDouble(a4));
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 content:(id)a5
{
  if (-[TCXmlPrefixStreamWriter startElement:](self, "startElement:", a3))
  {
    if (!a5 || -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", a4, a5))
      return -[TCXmlStreamWriter endElement](self, "endElement");
    -[TCXmlStreamWriter endElement](self, "endElement");
  }
  return 0;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 BOOLContent:(BOOL)a5
{
  const __CFString *v8;

  v8 = TCXmlStringForBool(a5);
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", a3, a4, v8);
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 intContent:(int64_t)a5
{
  NSString *v8;

  v8 = TCXmlStringForInt(a5);
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", a3, a4, v8);
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 enumContent:(int)a5 map:(id)a6
{
  id v9;

  v9 = TCXmlStringForEnum(*(uint64_t *)&a5, a6);
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", a3, a4, v9);
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 doubleContent:(double)a5
{
  NSString *v8;

  v8 = TCXmlStringForDouble(a5);
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", a3, a4, v8);
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 content:(id)a4
{
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", a3, CFSTR("val"), a4);
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 BOOLContent:(BOOL)a4
{
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:BOOLContent:](self, "writeOneAttributeElementWithName:attributeName:BOOLContent:", a3, CFSTR("val"), a4);
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 intContent:(int64_t)a4
{
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:intContent:](self, "writeOneAttributeElementWithName:attributeName:intContent:", a3, CFSTR("val"), a4);
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 enumContent:(int)a4 map:(id)a5
{
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:enumContent:map:](self, "writeOneAttributeElementWithName:attributeName:enumContent:map:", a3, CFSTR("val"), *(_QWORD *)&a4, a5);
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 doubleContent:(double)a4
{
  return -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:doubleContent:](self, "writeOneAttributeElementWithName:attributeName:doubleContent:", a3, CFSTR("val"), a4);
}

+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TCXmlPrefixStreamWriter;
  return (_xmlTextWriter *)objc_msgSendSuper2(&v6, "createXmlTextWriterAtEntry:inOutputStream:isCompressed:", a3, a4, a5);
}

+ (_xmlTextWriter)createNonXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TCXmlPrefixStreamWriter;
  return (_xmlTextWriter *)objc_msgSendSuper2(&v6, "createXmlTextWriterAtEntry:inOutputStream:isCompressed:", a3, a4, a5);
}

@end
