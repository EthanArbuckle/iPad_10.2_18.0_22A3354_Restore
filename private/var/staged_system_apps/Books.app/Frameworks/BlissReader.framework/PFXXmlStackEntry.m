@implementation PFXXmlStackEntry

- (void)setElementId:(const char *)a3
{
  self->mElementId = (char *)xmlStrdup((const xmlChar *)a3);
}

- (PFXXmlStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  PFXXmlStackEntry *v14;
  PFXXmlStackEntry *v15;
  NSString *v16;
  objc_super v18;

  if (!a5)
    return 0;
  v18.receiver = self;
  v18.super_class = (Class)PFXXmlStackEntry;
  v14 = -[PFXXmlStackEntry init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    v14->mReaderState = (PFXXmlStreamReaderState *)a8;
    v14->mReader = (PFXElementReader *)a4;
    v15->mParentEntry = (PFXXmlStackEntry *)a3;
    v16 = (NSString *)a7;
    v15->mElementId = 0;
    v15->mElementName = a5;
    v15->mElementNamespace = a6;
    v15->mCfiPath = v16;
  }
  return v15;
}

- (void)dealloc
{
  PFXXmlStackEntry *begin_node;
  PFXXmlStackEntry *mParentEntry;
  PFXXmlStackEntry *mReaderState;
  BOOL v6;
  void **i;
  char *mElementId;
  objc_super v9;

  begin_node = (PFXXmlStackEntry *)self->mXmlAttributes.__tree_.__begin_node_;
  if (begin_node != (PFXXmlStackEntry *)&self->mXmlAttributes.__tree_.__pair1_)
  {
    do
    {

      mParentEntry = begin_node->mParentEntry;
      if (mParentEntry)
      {
        do
        {
          mReaderState = mParentEntry;
          mParentEntry = (PFXXmlStackEntry *)mParentEntry->super.isa;
        }
        while (mParentEntry);
      }
      else
      {
        do
        {
          mReaderState = (PFXXmlStackEntry *)begin_node->mReaderState;
          v6 = mReaderState->super.isa == (Class)begin_node;
          begin_node = mReaderState;
        }
        while (!v6);
      }
      begin_node = mReaderState;
    }
    while (mReaderState != (PFXXmlStackEntry *)&self->mXmlAttributes.__tree_.__pair1_);
  }
  for (i = (void **)self->mChildResults.__begin_; i != self->mChildResults.__end_; i += 2)
  {
    xmlFree(*i);

  }
  mElementId = self->mElementId;
  if (mElementId)
    xmlFree(mElementId);
  v9.receiver = self;
  v9.super_class = (Class)PFXXmlStackEntry;
  -[PFXXmlStackEntry dealloc](&v9, "dealloc");
}

- (const)xmlElementName
{
  return self->mElementName;
}

- (const)xmlElementId
{
  return self->mElementId;
}

- (const)elementNamespace
{
  return self->mElementNamespace;
}

- (id)reader
{
  PFXElementReader *mReader;
  PFXElementReader *v3;

  mReader = self->mReader;
  do
  {
    v3 = mReader;
    if (!-[PFXElementReader conformsToProtocol:](mReader, "conformsToProtocol:", &OBJC_PROTOCOL___PFXElementReaderDelegate))break;
    mReader = (PFXElementReader *)-[PFXElementReader delegate](v3, "delegate");
  }
  while (mReader != v3);
  return v3;
}

- (id)nonDelegatedReader
{
  return self->mReader;
}

- (id)pfxStringForAttribute:(const char *)a3
{
  PFXXmlStackEntry *v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v4 = (PFXXmlStackEntry *)sub_1C95FC((uint64_t)&self->mXmlAttributes, &v6);
  if (&self->mXmlAttributes.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXString *>, void *>>> *)v4)
    return 0;
  else
    return v4->mChildResults.__begin_;
}

- (id)valueForAttribute:(const char *)a3
{
  id result;

  result = -[PFXXmlStackEntry pfxStringForAttribute:](self, "pfxStringForAttribute:", a3);
  if (result)
    return objc_msgSend(result, "nsString");
  return result;
}

- (const)xmlValueForAttribute:(const char *)a3
{
  const char *result;

  result = -[PFXXmlStackEntry pfxStringForAttribute:](self, "pfxStringForAttribute:", a3);
  if (result)
    return (const char *)objc_msgSend((id)result, "xmlString");
  return result;
}

- (const)xmlAttributes
{
  return &self->mXmlAttributes;
}

- (unint64_t)childResultCount
{
  return ((char *)self->mChildResults.__end_ - (char *)self->mChildResults.__begin_) >> 4;
}

- (const)childPairAtIndex:(unint64_t)a3
{
  char *begin;
  uint64_t v4;
  char *v5;

  begin = (char *)self->mChildResults.__begin_;
  v4 = (char *)self->mChildResults.__end_ - (char *)begin;
  v5 = &begin[16 * a3];
  if (a3 >= v4 >> 4)
    return 0;
  else
    return v5;
}

- (const)childElementNameAtIndex:(unint64_t)a3
{
  const char *result;

  result = -[PFXXmlStackEntry childPairAtIndex:](self, "childPairAtIndex:", a3);
  if (result)
    return *(const char **)result;
  return result;
}

- (id)childResultAtIndex:(unint64_t)a3
{
  id result;

  result = -[PFXXmlStackEntry childPairAtIndex:](self, "childPairAtIndex:", a3);
  if (result)
    return (id)*((_QWORD *)result + 1);
  return result;
}

- (id)firstChildResultWithElementName:(const char *)a3
{
  id *begin;

  begin = (id *)self->mChildResults.__begin_;
  if (begin == self->mChildResults.__end_)
    return 0;
  while (!xmlStrEqual((const xmlChar *)*begin, (const xmlChar *)a3))
  {
    begin += 2;
    if (begin == self->mChildResults.__end_)
      return 0;
  }
  return begin[1];
}

- (void)addResultFromChildEntry:(id)a3
{
  xmlChar *v5;
  xmlChar *v6;
  char *value;
  char *end;
  void *v9;
  _BYTE *begin;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  xmlChar **v16;
  char *v17;
  char *v18;
  char *v19;

  if (objc_msgSend(a3, "xmlElementName") && objc_msgSend(a3, "result"))
  {
    v5 = xmlStrdup((const xmlChar *)objc_msgSend(a3, "xmlElementName"));
    v6 = (xmlChar *)objc_msgSend(a3, "result");
    value = (char *)self->mChildResults.__end_cap_.__value_;
    end = (char *)self->mChildResults.__end_;
    if (end >= value)
    {
      begin = self->mChildResults.__begin_;
      v11 = (end - begin) >> 4;
      v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 60)
        sub_36C30();
      v13 = value - begin;
      if (v13 >> 3 > v12)
        v12 = v13 >> 3;
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v12;
      if (v14)
        v15 = (char *)sub_36CB8((uint64_t)&self->mChildResults.__end_cap_, v14);
      else
        v15 = 0;
      v16 = (xmlChar **)&v15[16 * v11];
      v17 = &v15[16 * v14];
      *v16 = v5;
      v16[1] = v6;
      v9 = v16 + 2;
      v19 = (char *)self->mChildResults.__begin_;
      v18 = (char *)self->mChildResults.__end_;
      if (v18 != v19)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
          v16 -= 2;
          v18 -= 16;
        }
        while (v18 != v19);
        v18 = (char *)self->mChildResults.__begin_;
      }
      self->mChildResults.__begin_ = v16;
      self->mChildResults.__end_ = v9;
      self->mChildResults.__end_cap_.__value_ = v17;
      if (v18)
        operator delete(v18);
    }
    else
    {
      *(_QWORD *)end = v5;
      *((_QWORD *)end + 1) = v6;
      v9 = end + 16;
    }
    self->mChildResults.__end_ = v9;
  }
}

- (PFXXmlStackEntry)parentEntry
{
  return self->mParentEntry;
}

- (PFXXmlStreamReaderState)readerState
{
  return self->mReaderState;
}

- (id)result
{
  return self->mResult;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)cfiPath
{
  return self->mCfiPath;
}

- (void).cxx_destruct
{
  void *begin;

  sub_3D170((uint64_t)&self->mXmlAttributes, (_QWORD *)self->mXmlAttributes.__tree_.__pair1_.__value_.__left_);
  begin = self->mChildResults.__begin_;
  if (begin)
  {
    self->mChildResults.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = (char *)self + 72;
  return self;
}

- (void)addAttributeName:(const char *)a3 withValue:(id)a4
{
  id v6;
  const xmlChar *v7;
  const xmlChar **v8;

  v7 = (const xmlChar *)a3;
  if (xmlStrEqual((const xmlChar *)"id", (const xmlChar *)a3))
  {
    self->mElementId = (char *)xmlStrdup((const xmlChar *)objc_msgSend(a4, "xmlString"));
  }
  else
  {
    v6 = a4;
    v8 = &v7;
    sub_1C6CDC((uint64_t **)&self->mXmlAttributes, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = (uint64_t)v6;
  }
}

+ (id)createFromReader:(id)a3 elementInfo:(id)a4 parentEntry:(id)a5 cfiPath:(id)a6 readerState:(id)a7
{
  xmlTextReader *v13;
  xmlTextReader *v14;
  const xmlChar *v15;
  const xmlChar *v16;
  id v17;
  const xmlChar *v18;
  const xmlChar *v19;
  PFXString *v20;
  int v21;
  _BYTE *v22;
  __darwin_ct_rune_t v23;
  _BYTE *v24;
  __darwin_ct_rune_t v25;
  __darwin_ct_rune_t v26;
  uint64_t v27;
  __uint32_t v28;

  v13 = (xmlTextReader *)objc_msgSend(a7, "streamAPI");
  v14 = v13;
  if (a4)
  {
    v15 = (const xmlChar *)objc_msgSend(a4, "elementName");
    v16 = (const xmlChar *)objc_msgSend(a4, "elementNamespace");
  }
  else
  {
    v15 = xmlTextReaderConstLocalName(v13);
    v16 = xmlTextReaderConstNamespaceUri(v14);
  }
  v17 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithParentEntry:reader:elementName:elementNamespace:cfiPath:readerState:", a5, a3, v15, v16, a6, a7);
  if (xmlTextReaderMoveToFirstAttribute(v14) == 1)
  {
    while (1)
    {
      v18 = xmlTextReaderConstLocalName(v14);
      v19 = xmlTextReaderConstValue(v14);
      if (!objc_msgSend(a7, "isRawAttribute:", v18))
        break;
      v20 = -[PFXString initWithXmlString:]([PFXString alloc], "initWithXmlString:", v19);
LABEL_28:
      objc_msgSend(v17, "addAttributeName:withValue:", v18, v20);

      if (xmlTextReaderMoveToNextAttribute(v14) != 1)
        goto LABEL_29;
    }
    v21 = xmlStrlen(v19);
    v22 = malloc_type_malloc(v21 + 1, 0xBEA6A94DuLL);
    v23 = *v19;
    v24 = v22;
    if (!*v19)
    {
LABEL_27:
      *v24 = 0;
      v20 = -[PFXString initWithXmlString:]([PFXString alloc], "initWithXmlString:", v22);
      free(v22);
      goto LABEL_28;
    }
    v24 = v22;
    while (1)
    {
      while ((v23 & 0x80) != 0)
      {
        if (__maskrune(v23, 0x4000uLL))
          goto LABEL_11;
LABEL_14:
        v26 = *v19;
        if (!*v19)
          goto LABEL_27;
        if (v24 == v22)
        {
          v24 = v22;
        }
        else
        {
          *v24++ = 32;
          v26 = *v19;
          if (!*v19)
            goto LABEL_27;
        }
        v27 = 0;
        while (1)
        {
          v28 = (v26 & 0x80) != 0 ? __maskrune(v26, 0x4000uLL) : _DefaultRuneLocale.__runetype[v26] & 0x4000;
          v23 = v19[v27];
          if (v28)
            break;
          v24[v27] = v23;
          v26 = v19[++v27];
          if (!v26)
          {
            v24 += v27;
            goto LABEL_27;
          }
        }
        v24 += v27;
        v19 += v27;
        if (!v23)
          goto LABEL_27;
      }
      if ((_DefaultRuneLocale.__runetype[v23] & 0x4000) == 0)
        goto LABEL_14;
LABEL_11:
      v25 = *++v19;
      v23 = v25;
      if (!v25)
        goto LABEL_27;
    }
  }
LABEL_29:
  xmlTextReaderMoveToElement(v14);
  return v17;
}

@end
