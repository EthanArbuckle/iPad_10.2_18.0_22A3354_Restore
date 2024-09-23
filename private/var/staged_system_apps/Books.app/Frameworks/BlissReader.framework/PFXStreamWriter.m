@implementation PFXStreamWriter

- (PFXStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3
{
  PFXStreamWriter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFXStreamWriter;
  result = -[PFXStreamWriter init](&v5, "init");
  if (result)
  {
    result->mStreamAPI = a3;
    result->mCurrentDepth = 0;
    result->mContentAdded = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PFXStreamWriter;
  -[PFXStreamWriter dealloc](&v2, "dealloc");
}

- (_xmlTextWriter)textWriter
{
  return self->mStreamAPI;
}

- (BOOL)contentAdded
{
  return self->mContentAdded;
}

- (BOOL)startElement:(id)a3
{
  return -[PFXStreamWriter startElement:prefix:ns:](self, "startElement:prefix:ns:", a3, 0, 0);
}

- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5
{
  _BOOL4 v6;

  v6 = +[PFXStreamWriter startElementInStream:name:prefix:ns:](PFXStreamWriter, "startElementInStream:name:prefix:ns:", self->mStreamAPI, a3, a4, a5);
  if (v6)
  {
    self->mContentAdded = 1;
    ++self->mCurrentDepth;
  }
  return v6;
}

- (BOOL)endElement
{
  _BOOL4 v3;

  if (self->mCurrentDepth)
  {
    v3 = +[PFXStreamWriter endElementInStream:](PFXStreamWriter, "endElementInStream:", self->mStreamAPI);
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
  return +[PFXStreamWriter writeStringToStream:text:](PFXStreamWriter, "writeStringToStream:text:", self->mStreamAPI, a3);
}

- (BOOL)endElementsToBase
{
  unint64_t mCurrentDepth;

  do
    mCurrentDepth = self->mCurrentDepth;
  while (mCurrentDepth && -[PFXStreamWriter endElement](self, "endElement"));
  return mCurrentDepth == 0;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4
{
  return -[PFXStreamWriter writeAttribute:content:prefix:ns:](self, "writeAttribute:content:prefix:ns:", a3, a4, 0, 0);
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  if (self->mCurrentDepth)
    return +[PFXStreamWriter writeAttributeToStream:name:content:prefix:ns:](PFXStreamWriter, "writeAttributeToStream:name:content:prefix:ns:", self->mStreamAPI, a3, a4, a5, a6);
  else
    return 0;
}

- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4
{
  return +[PFXStreamWriter writeNamespaceToStream:prefix:uri:](PFXStreamWriter, "writeNamespaceToStream:prefix:uri:", self->mStreamAPI, a3, a4);
}

- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6
{
  return +[PFXStreamWriter writeDtdToStream:name:pubid:sysid:subset:](PFXStreamWriter, "writeDtdToStream:name:pubid:sysid:subset:", self->mStreamAPI, a3, a4, a5, a6);
}

- (BOOL)writeAnchorTarget:(id)a3
{
  return +[PFXStreamWriter writeAnchorTargetToStream:name:](PFXStreamWriter, "writeAnchorTargetToStream:name:", self->mStreamAPI, a3);
}

+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4
{
  return +[PFXStreamWriter startElementInStream:name:prefix:ns:](PFXStreamWriter, "startElementInStream:name:prefix:ns:", a3, a4, 0, 0);
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

+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5
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
  int v12;

  xmlTextWriterSetIndent(a3, 1);
  v12 = xmlTextWriterWriteDTD(a3, (const xmlChar *)objc_msgSend(a4, "UTF8String"), (const xmlChar *)objc_msgSend(a5, "UTF8String"), (const xmlChar *)objc_msgSend(a6, "UTF8String"), (const xmlChar *)objc_msgSend(a7, "UTF8String"));
  if ((v12 & 0x80000000) == 0)
    xmlTextWriterSetIndent(a3, 0);
  return v12 >= 0;
}

+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4
{
  if (+[PFXStreamWriter startElementInStream:name:](PFXStreamWriter, "startElementInStream:name:", a3, CFSTR("span"))&& +[PFXStreamWriter writeAttributeToStream:name:content:](PFXStreamWriter, "writeAttributeToStream:name:content:", a3, CFSTR("id"), a4))
  {
    return +[PFXStreamWriter endElementInStream:](PFXStreamWriter, "endElementInStream:", a3);
  }
  else
  {
    return 0;
  }
}

+ (_xmlTextWriter)createXmlTextWriterWithContext:(id)a3
{
  xmlOutputBufferPtr IO;

  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, a3, 0);
  return +[PFXStreamWriter createXmlTextWriterWithBuffer:](PFXStreamWriter, "createXmlTextWriterWithBuffer:", IO);
}

+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  xmlOutputBufferPtr IO;

  objc_msgSend(a4, "beginUnknownSizeEntryWithName:isCompressed:", a3, a5);
  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)&SFUSimpleXmlOutputWriteCallback, (xmlOutputCloseCallback)&SFUSimpleXmlOutputCloseCallback, a4, 0);
  return +[PFXStreamWriter createXmlTextWriterWithBuffer:](PFXStreamWriter, "createXmlTextWriterWithBuffer:", IO);
}

+ (_xmlTextWriter)createXmlTextWriterWithBuffer:(_xmlOutputBuffer *)a3
{
  return xmlNewTextWriter(a3);
}

@end
