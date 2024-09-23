@implementation TCXmlStreamWriter

- (TCXmlStreamWriter)initWithTextWriterProvider:(id)a3
{
  id v5;
  TCXmlStreamWriter *v6;
  TCXmlStreamWriter *v7;
  NSMutableSet *v8;
  NSMutableSet *mAddedIds;

  v5 = a3;
  v6 = -[TCXmlStreamWriter init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTextWriterProvider, a3);
    v7->mCurrentDepth = 0;
    v7->mContentAddedToTopElement = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mAddedIds = v7->mAddedIds;
    v7->mAddedIds = v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TCXmlStreamWriter tearDown](self, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)TCXmlStreamWriter;
  -[TCXmlStreamWriter dealloc](&v3, sel_dealloc);
}

- (BOOL)isWriting
{
  return -[TCXmlStreamWriter textWriter](self, "textWriter") != 0;
}

- (BOOL)setUp
{
  void *v4;
  int v5;

  if (-[TCXmlStreamWriter isWriting](self, "isWriting"))
    return 1;
  -[TCXmlStreamWriter textWriterProvider](self, "textWriterProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "setUp");

  return v5 && xmlTextWriterStartDocument(-[TCXmlStreamWriter textWriter](self, "textWriter"), 0, "UTF-8", 0) >= 0;
}

- (BOOL)tearDown
{
  _BOOL4 v3;
  void *v4;

  v3 = -[TCXmlStreamWriter isWriting](self, "isWriting");
  if (v3)
  {
    -[TCXmlStreamWriter endElementsToDepth:](self, "endElementsToDepth:", 0);
    xmlTextWriterEndDocument(-[TCXmlStreamWriter textWriter](self, "textWriter"));
    xmlTextWriterFlush(-[TCXmlStreamWriter textWriter](self, "textWriter"));
    -[TCXmlStreamWriter textWriterProvider](self, "textWriterProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tearDown");

  }
  return v3;
}

+ (id)newXmlStreamWriterWithZipEntryName:(id)a3 outputStream:(id)a4 isCompressed:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  TCZipEntryTextWriterProvider *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = -[TCZipEntryTextWriterProvider initWithEntryName:outputStream:isCompressed:]([TCZipEntryTextWriterProvider alloc], "initWithEntryName:outputStream:isCompressed:", v7, v8, v5);
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTextWriterProvider:", v9);

  return v10;
}

+ (void)resetElementIds
{
  elementIdCount = 0;
}

- (id)textWriterProvider
{
  return self->mTextWriterProvider;
}

- (_xmlTextWriter)textWriter
{
  return -[TCXmlTextWriterProvider textWriter](self->mTextWriterProvider, "textWriter");
}

- (BOOL)contentAddedToTopElement
{
  return self->mContentAddedToTopElement;
}

- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5
{
  id v8;
  id v9;
  int v10;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend((id)objc_opt_class(), "startElementInStream:name:prefix:ns:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v8, v9, a5);
  if (v10)
  {
    self->mContentAddedToTopElement = 0;
    ++self->mCurrentDepth;
  }

  return v10;
}

- (BOOL)startPlainElement:(id)a3
{
  return -[TCXmlStreamWriter startElement:prefix:ns:](self, "startElement:prefix:ns:", a3, 0, 0);
}

- (BOOL)endElement
{
  int v3;

  if (self->mCurrentDepth)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "endElementInStream:", -[TCXmlStreamWriter textWriter](self, "textWriter"));
    if (v3)
    {
      --self->mCurrentDepth;
      LOBYTE(v3) = 1;
      self->mContentAddedToTopElement = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)writeString:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  char v7;

  v4 = a3;
  v5 = v4;
  v6 = self->mContentAddedToTopElement || objc_msgSend(v4, "length") != 0;
  self->mContentAddedToTopElement = v6;
  v7 = objc_msgSend((id)objc_opt_class(), "writeStringToStream:text:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v5);

  return v7;
}

- (unsigned)currentDepth
{
  return self->mCurrentDepth;
}

- (BOOL)endElementsToDepth:(unsigned int)a3
{
  unsigned int mCurrentDepth;

  do
    mCurrentDepth = self->mCurrentDepth;
  while (mCurrentDepth > a3 && -[TCXmlStreamWriter endElement](self, "endElement"));
  return mCurrentDepth <= a3;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  char v14;

  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  if (v11)
    v13 = v11;
  else
    v13 = &stru_24F3BFFF8;
  if (self->mCurrentDepth)
    v14 = objc_msgSend((id)objc_opt_class(), "writeAttributeToStream:name:content:prefix:ns:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v10, v13, v12, a6);
  else
    v14 = 0;

  return v14;
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a5;
  TCXmlStringForInt(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", v10, v12, v11, a6);

  return (char)a6;
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4 prefix:(id)a5 ns:(const char *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  TCXmlStringForBool(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", v10, v12, v11, a6);

  return (char)a6;
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a6;
  TCXmlStringForEnum(v10, (TCEnumerationMap *)a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", v12, v14, v13, a7);

  return (char)a7;
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a5;
  TCXmlStringForDouble(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", v10, v12, v11, a6);

  return (char)a6;
}

- (BOOL)writePlainAttribute:(id)a3 content:(id)a4
{
  return -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, a4, 0, 0);
}

- (BOOL)writePlainAttribute:(id)a3 intContent:(int64_t)a4
{
  return -[TCXmlStreamWriter writeAttribute:intContent:prefix:ns:](self, "writeAttribute:intContent:prefix:ns:", a3, a4, 0, 0);
}

- (BOOL)writePlainAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  return -[TCXmlStreamWriter writeAttribute:BOOLContent:prefix:ns:](self, "writeAttribute:BOOLContent:prefix:ns:", a3, a4, 0, 0);
}

- (BOOL)writePlainAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  return -[TCXmlStreamWriter writeAttribute:enumContent:map:prefix:ns:](self, "writeAttribute:enumContent:map:prefix:ns:", a3, *(_QWORD *)&a4, a5, 0, 0);
}

- (BOOL)writePlainAttribute:(id)a3 doubleContent:(double)a4
{
  return -[TCXmlStreamWriter writeAttribute:doubleContent:prefix:ns:](self, "writeAttribute:doubleContent:prefix:ns:", a3, 0, 0, a4);
}

- (BOOL)writeElementId:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("b%d"), ++elementIdCount);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[TCXmlStreamWriter writePlainAttribute:content:](self, "writePlainAttribute:content:", CFSTR("id"), v4);

  return v5;
}

- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "writeNamespaceToStream:prefix:uri:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v6, a4);

  return (char)a4;
}

- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "writeDtdToStream:name:pubid:sysid:subset:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v10, v11, v12, v13);

  return (char)self;
}

- (BOOL)writeAnchorTarget:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "writeAnchorTargetToStream:name:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v4);

  return (char)self;
}

+ (BOOL)startPlainElementInStream:(_xmlTextWriter *)a3 name:(id)a4
{
  id v5;

  v5 = a4;
  LOBYTE(a3) = objc_msgSend((id)objc_opt_class(), "startElementInStream:name:prefix:ns:", a3, v5, 0, 0);

  return (char)a3;
}

+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v9;
  id v10;
  const xmlChar *v11;
  id v12;

  v9 = a4;
  v10 = objc_retainAutorelease(a5);
  v11 = (const xmlChar *)objc_msgSend(v10, "UTF8String");
  v12 = objc_retainAutorelease(v9);
  LODWORD(a6) = xmlTextWriterStartElementNS(a3, v11, (const xmlChar *)objc_msgSend(v12, "UTF8String"), (const xmlChar *)a6);

  return (int)a6 >= 0;
}

+ (BOOL)endElementInStream:(_xmlTextWriter *)a3
{
  return xmlTextWriterEndElement(a3) >= 0;
}

+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "tc_stringByRemovingInvalidXmlChars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  LODWORD(a3) = xmlTextWriterWriteString(a3, (const xmlChar *)objc_msgSend(v7, "UTF8String"));

  return (int)a3 >= 0;
}

+ (BOOL)writePlainAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const xmlChar *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "tc_stringByRemovingInvalidXmlChars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v7);
  v11 = (const xmlChar *)objc_msgSend(v10, "UTF8String");
  v12 = objc_retainAutorelease(v9);
  LODWORD(a3) = xmlTextWriterWriteAttribute(a3, v11, (const xmlChar *)objc_msgSend(v12, "UTF8String"));

  return (int)a3 >= 0;
}

+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  const xmlChar *v16;
  id v17;
  const xmlChar *v18;
  id v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "tc_stringByRemovingInvalidXmlChars");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_retainAutorelease(v13);
  v16 = (const xmlChar *)objc_msgSend(v15, "UTF8String");
  v17 = objc_retainAutorelease(v11);
  v18 = (const xmlChar *)objc_msgSend(v17, "UTF8String");
  v19 = objc_retainAutorelease(v14);
  LODWORD(a7) = xmlTextWriterWriteAttributeNS(a3, v16, v18, (const xmlChar *)a7, (const xmlChar *)objc_msgSend(v19, "UTF8String"));

  return (int)a7 >= 0;
}

+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  int v10;

  v7 = a4;
  if (v7)
    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("xmlns:%@"), v7);
  else
    v8 = CFSTR("xmlns");
  v9 = objc_retainAutorelease(v8);
  v10 = xmlTextWriterWriteAttribute(a3, (const xmlChar *)-[__CFString UTF8String](v9, "UTF8String"), (const xmlChar *)a5);

  return v10 >= 0;
}

+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  const xmlChar *v15;
  id v16;
  const xmlChar *v17;
  id v18;
  const xmlChar *v19;
  id v20;
  id v22;
  id v23;

  v11 = a4;
  v23 = a5;
  v12 = a6;
  v13 = a7;
  v22 = v11;
  xmlTextWriterSetIndent(a3, 1);
  v14 = objc_retainAutorelease(v11);
  v15 = (const xmlChar *)objc_msgSend(v14, "UTF8String", v22);
  v16 = objc_retainAutorelease(v23);
  v17 = (const xmlChar *)objc_msgSend(v16, "UTF8String");
  v18 = objc_retainAutorelease(v12);
  v19 = (const xmlChar *)objc_msgSend(v18, "UTF8String");
  v20 = objc_retainAutorelease(v13);
  LODWORD(v17) = xmlTextWriterWriteDTD(a3, v15, v17, v19, (const xmlChar *)objc_msgSend(v20, "UTF8String"));
  xmlTextWriterSetIndent(a3, 0);

  return (int)v17 >= 0;
}

+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "startPlainElementInStream:name:", a3, CFSTR("span"))
    && objc_msgSend((id)objc_opt_class(), "writePlainAttributeToStream:name:content:", a3, CFSTR("id"), v5)&& (objc_msgSend((id)objc_opt_class(), "endElementInStream:", a3) & 1) != 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAddedIds, 0);
  objc_storeStrong((id *)&self->mTextWriterProvider, 0);
}

@end
