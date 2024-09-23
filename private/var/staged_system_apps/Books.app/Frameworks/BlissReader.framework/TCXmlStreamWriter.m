@implementation TCXmlStreamWriter

- (TCXmlStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3
{
  TCXmlStreamWriter *v4;
  TCXmlStreamWriter *v5;

  v4 = -[TCXmlStreamWriter init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->mStreamAPI = a3;
    v4->mCurrentDepth = 0;
    v4->mContentAdded = 0;
    v4->mAddedIds = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCXmlStreamWriter;
  -[TCXmlStreamWriter dealloc](&v3, "dealloc");
}

+ (void)resetElementIds
{
  dword_543770 = 0;
}

- (_xmlTextWriter)textWriter
{
  return self->mStreamAPI;
}

- (BOOL)contentAdded
{
  return self->mContentAdded;
}

- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5
{
  _BOOL4 v6;

  v6 = +[TCXmlStreamWriter startElementInStream:name:prefix:ns:](TCXmlStreamWriter, "startElementInStream:name:prefix:ns:", self->mStreamAPI, a3, a4, a5);
  if (v6)
  {
    self->mContentAdded = 1;
    ++self->mCurrentDepth;
  }
  return v6;
}

- (BOOL)startPlainElement:(id)a3
{
  return -[TCXmlStreamWriter startElement:prefix:ns:](self, "startElement:prefix:ns:", a3, 0, 0);
}

- (BOOL)endElement
{
  _BOOL4 v3;

  if (self->mCurrentDepth)
  {
    v3 = +[TCXmlStreamWriter endElementInStream:](TCXmlStreamWriter, "endElementInStream:", self->mStreamAPI);
    if (v3)
    {
      --self->mCurrentDepth;
      LOBYTE(v3) = 1;
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
  char v5;

  if (self->mContentAdded)
  {
    v5 = 1;
  }
  else if (a3)
  {
    v5 = objc_msgSend(a3, "length") != 0;
  }
  else
  {
    v5 = 0;
  }
  self->mContentAdded = v5;
  return +[TCXmlStreamWriter writeStringToStream:text:](TCXmlStreamWriter, "writeStringToStream:text:", self->mStreamAPI, a3);
}

- (BOOL)endElementsToBase
{
  unsigned int mCurrentDepth;

  do
    mCurrentDepth = self->mCurrentDepth;
  while (mCurrentDepth && -[TCXmlStreamWriter endElement](self, "endElement"));
  return mCurrentDepth == 0;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  const __CFString *v8;

  if (!self->mCurrentDepth)
    return 0;
  if (a4)
    v8 = (const __CFString *)a4;
  else
    v8 = &stru_43D7D8;
  return +[TCXmlStreamWriter writeAttributeToStream:name:content:prefix:ns:](TCXmlStreamWriter, "writeAttributeToStream:name:content:prefix:ns:", self->mStreamAPI, a3, v8, a5, a6);
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4 prefix:(id)a5 ns:(const char *)a6
{
  NSString *v10;

  v10 = TCXmlStringForInt(a4);
  return -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, v10, a5, a6);
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4 prefix:(id)a5 ns:(const char *)a6
{
  const __CFString *v10;

  v10 = TCXmlStringForBool(a4);
  return -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, v10, a5, a6);
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  id v11;

  v11 = TCXmlStringForEnum(*(uint64_t *)&a4, a5);
  return -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, v11, a6, a7);
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4 prefix:(id)a5 ns:(const char *)a6
{
  NSString *v10;

  v10 = TCXmlStringForDouble(a4);
  return -[TCXmlStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, v10, a5, a6);
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
  NSString *v3;

  v3 = (NSString *)a3;
  if (!a3)
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("b%d"), ++dword_543770);
  return -[TCXmlStreamWriter writePlainAttribute:content:](self, "writePlainAttribute:content:", CFSTR("id"), v3);
}

- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4
{
  return +[TCXmlStreamWriter writeNamespaceToStream:prefix:uri:](TCXmlStreamWriter, "writeNamespaceToStream:prefix:uri:", self->mStreamAPI, a3, a4);
}

- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6
{
  return +[TCXmlStreamWriter writeDtdToStream:name:pubid:sysid:subset:](TCXmlStreamWriter, "writeDtdToStream:name:pubid:sysid:subset:", self->mStreamAPI, a3, a4, a5, a6);
}

- (BOOL)writeAnchorTarget:(id)a3
{
  return +[TCXmlStreamWriter writeAnchorTargetToStream:name:](TCXmlStreamWriter, "writeAnchorTargetToStream:name:", self->mStreamAPI, a3);
}

+ (BOOL)startPlainElementInStream:(_xmlTextWriter *)a3 name:(id)a4
{
  return +[TCXmlStreamWriter startElementInStream:name:prefix:ns:](TCXmlStreamWriter, "startElementInStream:name:prefix:ns:", a3, a4, 0, 0);
}

+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  return xmlTextWriterStartElementNS(a3, (const xmlChar *)objc_msgSend(a5, "UTF8String"), (const xmlChar *)objc_msgSend(a4, "UTF8String"), (const xmlChar *)a6) >= 0;
}

+ (BOOL)endElementInStream:(_xmlTextWriter *)a3
{
  return xmlTextWriterEndElement(a3) >= 0;
}

+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4
{
  return xmlTextWriterWriteString(a3, (const xmlChar *)objc_msgSend(a4, "UTF8String")) >= 0;
}

+ (BOOL)writePlainAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5
{
  return xmlTextWriterWriteAttribute(a3, (const xmlChar *)objc_msgSend(a4, "UTF8String"), (const xmlChar *)objc_msgSend(a5, "UTF8String")) >= 0;
}

+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  return xmlTextWriterWriteAttributeNS(a3, (const xmlChar *)objc_msgSend(a6, "UTF8String"), (const xmlChar *)objc_msgSend(a4, "UTF8String"), (const xmlChar *)a7, (const xmlChar *)objc_msgSend(a5, "UTF8String")) >= 0;
}

+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5
{
  __CFString *v7;
  int v8;

  if (a4)
    v7 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("xmlns:%@"), a4);
  else
    v7 = CFSTR("xmlns");
  v8 = xmlTextWriterWriteAttribute(a3, (const xmlChar *)-[__CFString UTF8String](v7, "UTF8String"), (const xmlChar *)a5);

  return v8 >= 0;
}

+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7
{
  xmlTextWriterSetIndent(a3, 1);
  LODWORD(a7) = xmlTextWriterWriteDTD(a3, (const xmlChar *)objc_msgSend(a4, "UTF8String"), (const xmlChar *)objc_msgSend(a5, "UTF8String"), (const xmlChar *)objc_msgSend(a6, "UTF8String"), (const xmlChar *)objc_msgSend(a7, "UTF8String"));
  xmlTextWriterSetIndent(a3, 0);
  return (int)a7 >= 0;
}

+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4
{
  return +[TCXmlStreamWriter startPlainElementInStream:name:](TCXmlStreamWriter, "startPlainElementInStream:name:", a3, CFSTR("span"))&& +[TCXmlStreamWriter writePlainAttributeToStream:name:content:](TCXmlStreamWriter, "writePlainAttributeToStream:name:content:", a3, CFSTR("id"), a4)&& +[TCXmlStreamWriter endElementInStream:](TCXmlStreamWriter, "endElementInStream:", a3);
}

+ (_xmlTextWriter)createXmlTextWriterWithContext:(id)a3
{
  xmlOutputBufferPtr IO;

  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, a3, 0);
  return +[TCXmlStreamWriter createXmlTextWriterWithBuffer:](TCXmlStreamWriter, "createXmlTextWriterWithBuffer:", IO);
}

+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  xmlOutputBufferPtr IO;

  objc_msgSend(a4, "beginUnknownSizeEntryWithName:isCompressed:", a3, a5);
  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)&SFUSimpleXmlOutputWriteCallback, (xmlOutputCloseCallback)&SFUSimpleXmlOutputCloseCallback, a4, 0);
  return +[TCXmlStreamWriter createXmlTextWriterWithBuffer:](TCXmlStreamWriter, "createXmlTextWriterWithBuffer:", IO);
}

+ (_xmlTextWriter)createXmlTextWriterWithBuffer:(_xmlOutputBuffer *)a3
{
  _xmlTextWriter *v3;

  v3 = xmlNewTextWriter(a3);
  if (v3)
    +[TCXmlStreamWriter writeStringToStream:text:](TCXmlStreamWriter, "writeStringToStream:text:", v3, CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>"));
  return v3;
}

+ (BOOL)cleanUpXmlTextWriter:(_xmlTextWriter *)a3
{
  int v4;
  int v5;

  v4 = xmlTextWriterEndDocument(a3);
  v5 = xmlTextWriterFlush(a3) | v4;
  xmlFreeTextWriter(a3);
  return v5 >= 0;
}

@end
