@implementation BKPdfTocEntry

- (CGPDFDocument)document
{
  return self->_document;
}

- (CGPDFDictionary)dictionary
{
  return self->_dictionary;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)numberOfChildren
{
  return (unint64_t)-[NSMutableArray count](self->_children, "count");
}

- (id)title
{
  return self->_title;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (id)childAtIndex:(unint64_t)a3
{
  void *v5;

  if ((unint64_t)-[NSMutableArray count](self->_children, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", a3));
  return v5;
}

- (BOOL)childDictionaryReferencesParent:(CGPDFDictionary *)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  CGPDFDictionary *v9;
  BKPdfTocEntry *v10;
  CGPDFDictionary *v11;
  BOOL v12;
  uint64_t v13;

  v5 = -[BKPdfTocEntry numberOfChildren](self, "numberOfChildren");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfTocEntry childAtIndex:](self, "childAtIndex:", v7));
      v9 = (CGPDFDictionary *)objc_msgSend(v8, "dictionary");

      if (v9 == a3)
        return 1;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v10 = self;
    do
    {
      v11 = -[BKPdfTocEntry dictionary](v10, "dictionary");
      v12 = v11 == a3;
      if (v11 == a3)
        break;
      v13 = objc_claimAutoreleasedReturnValue(-[BKPdfTocEntry parent](v10, "parent"));

      v10 = (BKPdfTocEntry *)v13;
    }
    while (v13);

  }
  return v12;
}

- (unint64_t)_pageDictionaryToPageNumber:(CGPDFDictionary *)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  CGPDFDictionary *v9;

  v9 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPdfTocParser pageDictionaryToPageNumber](self->_tocParser, "pageDictionaryToPageNumber"));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSValue), "initWithBytes:objCType:", &v9, "^v");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));
    v6 = v5;
    if (v5)
      v7 = (unint64_t)objc_msgSend(v5, "integerValue");
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)_getDestination
{
  CGPDFDictionary *dictionary;
  CGPDFObject *Destination;
  int64_t result;
  _BOOL4 Integer;
  size_t NumberOfPages;
  char *__s1;
  CGPDFDictionaryRef value;
  CGPDFArrayRef array;
  CGPDFObjectRef object;
  CGPDFInteger v12;

  v12 = 0x7FFFFFFFFFFFFFFFLL;
  array = 0;
  object = 0;
  value = 0;
  if (CGPDFDictionaryGetDictionary(self->_dictionary, "A", &value))
  {
    __s1 = 0;
    CGPDFDictionaryGetName(value, "S", (const char **)&__s1);
    if (!strcmp(__s1, "GoTo"))
    {
      dictionary = value;
LABEL_6:
      CGPDFDictionaryGetObject(dictionary, "D", &object);
    }
  }
  else if (!CGPDFDictionaryGetObject(self->_dictionary, "Dest", &object))
  {
    dictionary = self->_dictionary;
    goto LABEL_6;
  }
  if (!object)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (CGPDFObjectGetValue(object, kCGPDFObjectTypeString, 0)
    || CGPDFObjectGetValue(object, kCGPDFObjectTypeName, 0))
  {
    Destination = (CGPDFObject *)CGPDFDocumentGetDestination(self->_document, object);
    object = Destination;
    if (Destination)
    {
      __s1 = 0;
      if (CGPDFObjectGetValue(Destination, kCGPDFObjectTypeDictionary, &__s1))
        CGPDFDictionaryGetObject((CGPDFDictionaryRef)__s1, "D", &object);
    }
  }
  if (!CGPDFObjectGetValue(object, kCGPDFObjectTypeArray, &array) || !CGPDFArrayGetCount(array))
    return 0x7FFFFFFFFFFFFFFFLL;
  __s1 = 0;
  if (CGPDFArrayGetDictionary(array, 0, (CGPDFDictionaryRef *)&__s1))
    return -[BKPdfTocEntry _pageDictionaryToPageNumber:](self, "_pageDictionaryToPageNumber:", __s1);
  Integer = CGPDFArrayGetInteger(array, 0, &v12);
  result = v12;
  if (Integer)
  {
    ++v12;
    NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_document);
    if (v12 <= NumberOfPages)
      return v12;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (BKPdfTocEntry)initWithTocParser:(id)a3 pdfDictionary:(CGPDFDictionary *)a4 forDocument:(CGPDFDocument *)a5 parent:(id)a6
{
  id v11;
  id v12;
  BKPdfTocEntry *v13;
  BKPdfTocEntry *v14;
  CFStringRef v15;
  NSString *title;
  NSMutableArray *v17;
  NSMutableArray *children;
  BKPdfTocEntry *v19;
  BKPdfTocEntry *v20;
  BKPdfTocEntry *v21;
  BKPdfTocEntry *v22;
  CGPDFDictionaryRef dict;
  CGPDFStringRef value;

  v11 = a3;
  v12 = a6;
  value = 0;
  v13 = -[BKPdfTocEntry init](self, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tocParser, a3);
    v14->_document = a5;
    v14->_dictionary = a4;
    objc_storeStrong((id *)&v14->_parent, a6);
    v14->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
    if (v12)
    {
      if (CGPDFDictionaryGetString(v14->_dictionary, "Title", &value))
      {
        v15 = CGPDFStringCopyTextString(value);
        title = v14->_title;
        v14->_title = &v15->isa;

      }
      v14->_pageNumber = -[BKPdfTocEntry _getDestination](v14, "_getDestination");
    }
    dict = 0;
    if (CGPDFDictionaryGetDictionary(v14->_dictionary, "First", &dict))
    {
      v17 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
      children = v14->_children;
      v14->_children = v17;

      if (!v14->_children)
      {
LABEL_13:
        v22 = 0;
        goto LABEL_12;
      }
      do
      {
        if (-[BKPdfTocEntry childDictionaryReferencesParent:](v14, "childDictionaryReferencesParent:", dict))
          break;
        v19 = [BKPdfTocEntry alloc];
        v20 = -[BKPdfTocEntry initWithTocParser:pdfDictionary:forDocument:parent:](v19, "initWithTocParser:pdfDictionary:forDocument:parent:", v14->_tocParser, dict, v14->_document, v14);
        if (!v20)
          goto LABEL_13;
        v21 = v20;
        -[NSMutableArray addObject:](v14->_children, "addObject:", v20);

      }
      while (CGPDFDictionaryGetDictionary(dict, "Next", &dict));
    }
  }
  v22 = v14;
LABEL_12:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_tocParser, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end
