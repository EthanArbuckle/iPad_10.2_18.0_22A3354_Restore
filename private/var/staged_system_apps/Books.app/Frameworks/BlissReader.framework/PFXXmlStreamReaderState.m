@implementation PFXXmlStreamReaderState

- (void)incrementTextReadBy:(int64_t)a3
{
  self->mTextRead += a3;
}

- (void)switchEntryTo:(id)a3
{
  unsigned __int8 v5;
  id v6;
  PFXArchive *v7;
  id v8;
  _xmlTextReader *v9;
  PFXArchive *v10;

  v10 = self->mArchive;
  -[PFXXmlStreamReaderState cleanupEntry](self, "cleanupEntry");
  v5 = objc_msgSend(a3, "hasPrefix:", CFSTR("/"));
  v6 = a3;
  if ((v5 & 1) == 0)
    v6 = objc_msgSend(CFSTR("/"), "stringByAppendingString:", a3);
  self->mEntryUri = (NSString *)v6;
  self->mEntryNSURL = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", self->mEntryUri, 0);
  v7 = v10;
  self->mArchive = v7;
  v8 = -[PFXArchive decryptEntryWithName:error:](v7, "decryptEntryWithName:error:", a3, 0);
  if (v8)
  {
    v9 = (_xmlTextReader *)objc_msgSend(v8, "xmlReader");
    self->mStreamAPI = v9;
    xmlTextReaderSetParserProp(v9, 4, 1);
    xmlTextReaderSetErrorHandler(self->mStreamAPI, (xmlTextReaderErrorFunc)PFXStreamingErrorCallback, 0);
  }

}

- (PFXXmlStreamReaderState)initWithEntry:(id)a3 inArchive:(id)a4
{
  PFXXmlStreamReaderState *v6;
  unsigned __int8 v7;
  id v8;
  PFXArchive *v9;
  id v10;
  xmlTextReader *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PFXXmlStreamReaderState;
  v6 = -[PFXXmlStreamReaderState init](&v13, "init");
  if (v6)
  {
    v7 = objc_msgSend(a3, "hasPrefix:", CFSTR("/"));
    v8 = a3;
    if ((v7 & 1) == 0)
      v8 = objc_msgSend(CFSTR("/"), "stringByAppendingString:", a3);
    v6->mEntryUri = (NSString *)v8;
    v6->mEntryNSURL = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v6->mEntryUri, 0);
    v9 = (PFXArchive *)a4;
    v6->mArchive = v9;
    v10 = -[PFXArchive decryptEntryWithName:error:](v9, "decryptEntryWithName:error:", a3, 0);
    if (v10)
    {
      v11 = (xmlTextReader *)objc_msgSend(v10, "xmlReader");
      v6->mStreamAPI = v11;
      xmlTextReaderSetParserProp(v11, 4, 1);
      xmlTextReaderSetErrorHandler(v6->mStreamAPI, (xmlTextReaderErrorFunc)PFXStreamingErrorCallback, 0);
    }
  }
  return v6;
}

- (void)cleanupEntry
{
  _xmlTextReader *mStreamAPI;
  __end_ **var0;
  void *v5;

  mStreamAPI = self->mStreamAPI;
  if (mStreamAPI)
    xmlFreeTextReader(mStreamAPI);

  if (self->mContextStack.var0 != self->mContextStack.__begin_)
  {
    -[PFXXmlStreamReaderState isCancelled](self, "isCancelled");
    while (1)
    {
      var0 = self->mContextStack.var0;
      if (var0 == self->mContextStack.__begin_)
        break;
      v5 = *(var0 - 1);
      self->mContextStack.var0 = var0 - 1;

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PFXXmlStreamReaderState cleanupEntry](self, "cleanupEntry");
  v3.receiver = self;
  v3.super_class = (Class)PFXXmlStreamReaderState;
  -[PFXXmlStreamReaderState dealloc](&v3, "dealloc");
}

- (BOOL)namespaceCheck
{
  return 1;
}

- (void)pushReader:(id)a3 elementInfo:(id)a4 cfiPath:(id)a5
{
  PFXXmlStackEntry *v6;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v9;
  __end_ **begin;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  __end_ **v16;
  id *v17;
  __end_cap_ **v18;
  __end_ **v19;
  __end_ *v20;

  v6 = (PFXXmlStackEntry *)objc_msgSend((id)objc_opt_class(self), "newStackEntryFromReader:elementInfo:parentEntry:cfiPath:readerState:", a3, a4, self->mCurrentEntry, a5, self);
  value = self->mContextStack.var1.__value_;
  var0 = self->mContextStack.var0;
  if (var0 >= (__end_cap_ **)value)
  {
    begin = self->mContextStack.__begin_;
    v11 = var0 - begin;
    if ((unint64_t)(v11 + 1) >> 61)
      sub_36C30();
    v12 = (char *)value - (char *)begin;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)sub_3CC38((uint64_t)&self->mContextStack.var1, v14);
    else
      v15 = 0;
    v16 = (__end_ **)&v15[8 * v11];
    v17 = (id *)&v15[8 * v14];
    *v16 = (__end_ *)v6;
    v9 = v16 + 1;
    v19 = self->mContextStack.__begin_;
    v18 = self->mContextStack.var0;
    if (v18 != v19)
    {
      do
      {
        v20 = *--v18;
        *--v16 = v20;
      }
      while (v18 != v19);
      v18 = self->mContextStack.__begin_;
    }
    self->mContextStack.__begin_ = v16;
    self->mContextStack.var0 = v9;
    self->mContextStack.var1.__value_ = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *var0 = (__end_cap_ *)v6;
    v9 = var0 + 1;
  }
  self->mContextStack.var0 = v9;
  self->mCurrentEntry = v6;
}

- (void)pushReader:(id)a3 elementInfo:(id)a4
{
  -[PFXXmlStreamReaderState pushReader:elementInfo:cfiPath:](self, "pushReader:elementInfo:cfiPath:", a3, a4, 0);
}

- (void)popReader
{
  __end_ **var0;

  if (self->mContextStack.var0 != self->mContextStack.__begin_)
  {
    -[PFXXmlStackEntry addResultFromChildEntry:](-[PFXXmlStackEntry parentEntry](self->mCurrentEntry, "parentEntry"), "addResultFromChildEntry:", self->mCurrentEntry);
    --self->mContextStack.var0;

    self->mCurrentEntry = 0;
    var0 = self->mContextStack.var0;
    if (var0 != self->mContextStack.__begin_)
      self->mCurrentEntry = (PFXXmlStackEntry *)*(var0 - 1);
  }
}

- (id)currentReader
{
  return -[PFXXmlStackEntry reader](self->mCurrentEntry, "reader");
}

- (id)ancestorEntryWithReaderClass:(Class)a3
{
  int64_t v3;
  uint64_t v6;
  __end_ *v7;

  v3 = (char *)self->mContextStack.var0 - (char *)self->mContextStack.__begin_;
  if ((unint64_t)v3 >= 9)
  {
    v6 = (v3 >> 3) - 2;
    while (v6 != -1)
    {
      v7 = self->mContextStack.__begin_[v6--];
      if ((objc_opt_isKindOfClass(-[__end_ reader](v7, "reader"), a3) & 1) != 0)
        return v7;
    }
  }
  return 0;
}

- (id)ancestorEntryWithElementName:(const char *)a3
{
  __end_cap_ **var0;
  __end_ **i;
  void *v7;
  void *v8;

  var0 = self->mContextStack.var0;
  if ((unint64_t)((char *)var0 - (char *)self->mContextStack.__begin_) >= 9)
  {
    for (i = var0 - 1; i != self->mContextStack.__begin_; --i)
    {
      v8 = *(i - 1);
      v7 = v8;
      if (xmlStrEqual((const xmlChar *)objc_msgSend(v8, "xmlElementName"), (const xmlChar *)a3))
        return v7;
    }
  }
  return 0;
}

- (id)ancestorReaderWithClass:(Class)a3
{
  __end_cap_ **var0;
  __end_ **i;
  void *v7;
  void *v8;

  var0 = self->mContextStack.var0;
  if ((unint64_t)((char *)var0 - (char *)self->mContextStack.__begin_) >= 9)
  {
    for (i = var0 - 1; i != self->mContextStack.__begin_; --i)
    {
      v8 = *(i - 1);
      v7 = v8;
      if ((objc_opt_isKindOfClass(objc_msgSend(v8, "reader"), a3) & 1) != 0)
        return objc_msgSend(v7, "reader");
    }
  }
  return 0;
}

- (id)absoluteUrlForRelativeUri:(id)a3
{
  return +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", a3, self->mEntryNSURL);
}

- (id)absoluteEntryForRelativeUri:(id)a3
{
  return +[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", a3, self->mEntryUri);
}

- (id)documentRelativeEntryForRelativeUri:(id)a3
{
  NSURL *v3;
  NSArray *v4;
  id v5;
  char *v6;
  id v7;
  NSString *v8;

  v3 = +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", a3, +[NSURL URLWithString:](NSURL, "URLWithString:", self->mEntryUri));
  v4 = -[NSURL pathComponents](v3, "pathComponents");
  v5 = +[NSMutableString string](NSMutableString, "string");
  if (-[NSArray count](v4, "count"))
  {
    v6 = 0;
    do
    {
      v7 = -[NSArray objectAtIndex:](v4, "objectAtIndex:", v6);
      if (v6 || (objc_msgSend(v7, "isEqualToString:", CFSTR("/")) & 1) == 0)
      {
        objc_msgSend(v5, "appendString:", -[NSArray objectAtIndex:](v4, "objectAtIndex:", v6));
        if (v6 < (char *)-[NSArray count](v4, "count") - 1)
          objc_msgSend(v5, "appendString:", CFSTR("/"));
      }
      ++v6;
    }
    while (v6 < (char *)-[NSArray count](v4, "count"));
  }
  v8 = -[NSURL fragment](v3, "fragment");
  if (v8)
    objc_msgSend(v5, "appendFormat:", CFSTR("#%@"), v8);
  return v5;
}

- (BOOL)isRawAttribute:(const char *)a3
{
  return 0;
}

- (void)resetTotalTextRead
{
  self->mTextRead = 0;
}

- (unint64_t)totalTextRead
{
  return self->mTextRead;
}

- (BOOL)shouldCountText
{
  return 0;
}

- (id)currentXPath
{
  id v3;
  id *i;
  id v5;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_43D7D8);
  for (i = (id *)self->mContextStack.__begin_; i != (id *)self->mContextStack.var0; ++i)
  {
    v5 = *i;
    objc_msgSend(v3, "appendFormat:", CFSTR("/%s"), objc_msgSend(*i, "xmlElementName"));
    if (objc_msgSend(v5, "xmlElementId"))
      objc_msgSend(v3, "appendFormat:", CFSTR("[id='%s']"), objc_msgSend(v5, "xmlElementId"));
  }
  return v3;
}

- (_xmlTextReader)streamAPI
{
  return self->mStreamAPI;
}

- (PFXArchive)archive
{
  return self->mArchive;
}

- (NSString)entryURI
{
  return self->mEntryUri;
}

- (NSURL)entryNSURL
{
  return self->mEntryNSURL;
}

- (PFXXmlStackEntry)currentXmlStackEntry
{
  return self->mCurrentEntry;
}

- (void).cxx_destruct
{
  __end_ **begin;

  begin = self->mContextStack.__begin_;
  if (begin)
  {
    self->mContextStack.var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (BOOL)isCancelled
{
  return 0;
}

+ (Class)stackEntryClass
{
  return (Class)objc_opt_class(PFXXmlStackEntry, a2);
}

+ (id)newStackEntryFromReader:(id)a3 elementInfo:(id)a4 parentEntry:(id)a5 cfiPath:(id)a6 readerState:(id)a7
{
  return objc_msgSend(objc_msgSend(a1, "stackEntryClass"), "createFromReader:elementInfo:parentEntry:cfiPath:readerState:", a3, a4, a5, a6, a7);
}

@end
