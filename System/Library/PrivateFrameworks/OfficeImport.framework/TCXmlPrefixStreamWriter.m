@implementation TCXmlPrefixStreamWriter

- (TCXmlPrefixStreamWriter)initWithTextWriterProvider:(id)a3
{
  id v4;
  TCXmlPrefixStreamWriter *v5;
  uint64_t v6;
  NSMutableArray *mStateStack;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCXmlPrefixStreamWriter;
  v5 = -[TCXmlStreamWriter initWithTextWriterProvider:](&v10, sel_initWithTextWriterProvider_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    mStateStack = v5->mStateStack;
    v5->mStateStack = (NSMutableArray *)v6;

    v8 = -[TCXmlPrefixStreamWriter pushStateWithElementPrefix:attributePrefix:](v5, "pushStateWithElementPrefix:attributePrefix:", 0, 0);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TCXmlPrefixStreamWriter popState](self, "popState");
  v3.receiver = self;
  v3.super_class = (Class)TCXmlPrefixStreamWriter;
  -[TCXmlStreamWriter dealloc](&v3, sel_dealloc);
}

- (void)pushElementPrefix:(id)a3 attributePrefix:(id)a4
{
  NSMutableArray *mStateStack;
  id v5;

  mStateStack = self->mStateStack;
  +[OITSUPair pairWithFirst:second:](OITSUPair, "pairWithFirst:second:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mStateStack, "addObject:");

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
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[TCXmlPrefixStreamWriter pushState](self, "pushState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setElementPrefix:", v6);
  objc_msgSend(v8, "setAttributePrefix:", v7);

  return v8;
}

- (id)pushStateWithSharedPrefix:(id)a3
{
  -[TCXmlPrefixStreamWriter pushStateWithElementPrefix:attributePrefix:](self, "pushStateWithElementPrefix:attributePrefix:", a3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)popState
{
  -[NSMutableArray removeLastObject](self->mStateStack, "removeLastObject");
}

- (id)currentState
{
  return (id)-[NSMutableArray lastObject](self->mStateStack, "lastObject");
}

- (id)currentElementPrefix
{
  void *v2;
  void *v3;

  -[TCXmlPrefixStreamWriter currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentAttributePrefix
{
  void *v2;
  void *v3;

  -[TCXmlPrefixStreamWriter currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)startElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TCXmlPrefixStreamWriter currentElementPrefix](self, "currentElementPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlStreamWriter startElement:prefix:ns:](self, "startElement:prefix:ns:", v4, v5, 0);

  return (char)self;
}

- (BOOL)addElement:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[TCXmlPrefixStreamWriter startElement:](self, "startElement:", v4)
    && -[TCXmlStreamWriter endElement](self, "endElement");

  return v5;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[TCXmlPrefixStreamWriter currentAttributePrefix](self, "currentAttributePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", v6, v7, v8, 0);

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  TCXmlStringForBool(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  TCXmlStringForInt(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 unsignedLongContent:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  TCXmlStringForUnsignedLong(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  TCXmlStringForEnum(v6, (TCEnumerationMap *)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", v8, v9);

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  TCXmlStringForDouble(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 content:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[TCXmlPrefixStreamWriter startElement:](self, "startElement:", v8))
    goto LABEL_6;
  if (v10 && !-[TCXmlPrefixStreamWriter writeAttribute:content:](self, "writeAttribute:content:", v9, v10))
  {
    -[TCXmlStreamWriter endElement](self, "endElement");
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v11 = -[TCXmlStreamWriter endElement](self, "endElement");
LABEL_7:

  return v11;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 BOOLContent:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  TCXmlStringForBool(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", v8, v9, v10);

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 intContent:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  TCXmlStringForInt(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", v8, v9, v10);

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 enumContent:(int)a5 map:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  TCXmlStringForEnum(v7, (TCEnumerationMap *)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", v10, v11, v12);

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 doubleContent:(double)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  TCXmlStringForDouble(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOneAttributeElementWithName:attributeName:content:](self, "writeOneAttributeElementWithName:attributeName:content:", v8, v9, v10);

  return (char)self;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStateStack, 0);
}

- (void)pushOAState
{
  id v2;

  v2 = -[TCXmlPrefixStreamWriter pushStateWithElementPrefix:attributePrefix:](self, "pushStateWithElementPrefix:attributePrefix:", CFSTR("a"), 0);
}

- (BOOL)writeOAAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  TCXmlStringForBool(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOAAttribute:content:](self, "writeOAAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeOAAttribute:(id)a3 intContent:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  TCXmlStringForInt(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOAAttribute:content:](self, "writeOAAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeOAAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  TCXmlStringForEnum(v6, (TCEnumerationMap *)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOAAttribute:content:](self, "writeOAAttribute:content:", v8, v9);

  return (char)self;
}

- (BOOL)writeOAAttribute:(id)a3 doubleContent:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  TCXmlStringForDouble(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TCXmlPrefixStreamWriter writeOAAttribute:content:](self, "writeOAAttribute:content:", v6, v7);

  return (char)self;
}

- (BOOL)writeIndexAttribute:(id)a3 intContent:(unint64_t)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = a4 != 0xFFFFFFFF
    && -[TCXmlPrefixStreamWriter writeAttribute:intContent:](self, "writeAttribute:intContent:", v6, a4);

  return v7;
}

- (void)writeTextString:(id)a3 forElement:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[TCXmlPrefixStreamWriter startElement:](self, "startElement:", v6);
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v7, "hasSuffix:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v7, "hasPrefix:", CFSTR("\n")) & 1) != 0
    || (objc_msgSend(v7, "hasSuffix:", CFSTR("\n")) & 1) != 0
    || (objc_msgSend(v7, "hasPrefix:", CFSTR("\t")) & 1) != 0
    || objc_msgSend(v7, "hasSuffix:", CFSTR("\t")))
  {
    -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", CFSTR("space"), CFSTR("preserve"), CFSTR("xml"), 0);
  }
  -[TCXmlStreamWriter writeString:](self, "writeString:", v7);
  -[TCXmlStreamWriter endElement](self, "endElement");

}

@end
