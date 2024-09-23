@implementation PFXElementReaderDictionary

- (PFXElementReaderDictionary)init
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXElementReaderDictionary init]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXElementReaderDictionary.mm"), 127, CFSTR("Don't use this init."));
  return 0;
}

- (PFXElementReaderDictionary)initWithFallThroughAllowed:(BOOL)a3
{
  PFXElementReaderDictionary *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFXElementReaderDictionary;
  result = -[PFXElementReaderDictionary init](&v5, "init");
  if (result)
    result->mAllowFallThrough = a3;
  return result;
}

- (void)dealloc
{
  PFXElementReaderDictionary *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXElementReaderInfoGroup *>, void *>>> *p_pair1;
  uint64_t isa;
  PFXElementReaderDictionary *v6;
  PFXElementReaderDictionary *left;
  BOOL v8;
  objc_super v9;

  begin_node = (PFXElementReaderDictionary *)self->mMap.__tree_.__begin_node_;
  p_pair1 = &self->mMap.__tree_.__pair1_;
  if (begin_node != (PFXElementReaderDictionary *)&self->mMap.__tree_.__pair1_)
  {
    do
    {
      isa = (uint64_t)begin_node[1].super.isa;
      if (isa)
      {
        sub_1C9520(isa);
        operator delete();
      }
      v6 = (PFXElementReaderDictionary *)begin_node->mMap.__tree_.__begin_node_;
      if (v6)
      {
        do
        {
          left = v6;
          v6 = (PFXElementReaderDictionary *)v6->super.isa;
        }
        while (v6);
      }
      else
      {
        do
        {
          left = (PFXElementReaderDictionary *)begin_node->mMap.__tree_.__pair1_.__value_.__left_;
          v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (PFXElementReaderDictionary *)p_pair1);
  }
  v9.receiver = self;
  v9.super_class = (Class)PFXElementReaderDictionary;
  -[PFXElementReaderDictionary dealloc](&v9, "dealloc");
}

- (void)addEntryWithElementName:(const char *)a3 mappingClass:(Class)a4
{
  -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](self, "addEntryWithElementName:elementNamespace:mappingClass:", a3, 0, a4);
}

- (void)addEntryWithElementName:(const char *)a3 elementNamespace:(const char *)a4 mappingClass:(Class)a5
{
  PFXElementReaderInfo *v7;
  PFXElementReaderDictionary *v8;
  PFXElementReaderDictionary *v9;
  Class isa;
  uint64_t v11;
  uint64_t v12;
  const xmlChar *v13;

  v13 = (const xmlChar *)a3;
  if (a5)
  {
    v7 = -[PFXElementReaderInfo initWithElementName:elementNamespace:mappingClass:]([PFXElementReaderInfo alloc], "initWithElementName:elementNamespace:mappingClass:", a3, a4, a5);
    v8 = (PFXElementReaderDictionary *)sub_1C95FC((uint64_t)&self->mMap, &v13);
    if (&self->mMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXElementReaderInfoGroup *>, void *>>> *)v8)
      operator new();
    v9 = v8;
    isa = v8[1].super.isa;
    v11 = *((_QWORD *)isa + 1);
    if (v11)
    {
      v12 = *((_QWORD *)isa + 1);
      while (1)
      {
        v12 = *(_QWORD *)(v12 + 8);
        if (v12 == v11)
          break;
        if (xmlStrEqual((const xmlChar *)a4, (const xmlChar *)objc_msgSend(*(id *)(v12 + 16), "elementNamespace")))
          goto LABEL_10;
      }
    }
    sub_1C9214((_QWORD *)v9[1].super.isa, v7);
LABEL_10:

  }
}

- (id)p_elementInfoForElementName:(const char *)a3 elementNamespace:(const char *)a4
{
  PFXElementReaderDictionary *v6;
  Class isa;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const xmlChar *v12;

  v12 = (const xmlChar *)a3;
  v6 = (PFXElementReaderDictionary *)sub_1C95FC((uint64_t)&self->mMap, &v12);
  if (&self->mMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXElementReaderInfoGroup *>, void *>>> *)v6)
    return 0;
  isa = v6[1].super.isa;
  v8 = *(id *)isa;
  if (!*(_QWORD *)isa
    || !xmlStrEqual((const xmlChar *)a4, (const xmlChar *)objc_msgSend(*(id *)isa, "elementNamespace")))
  {
    v9 = *((_QWORD *)isa + 1);
    if (v9)
    {
      v10 = v9;
      while (1)
      {
        v10 = *(_QWORD *)(v10 + 8);
        if (v10 == v9)
          break;
        v8 = *(id *)(v10 + 16);
        if (xmlStrEqual((const xmlChar *)a4, (const xmlChar *)objc_msgSend(v8, "elementNamespace")))
          return v8;
      }
    }
    return 0;
  }
  return v8;
}

- (id)elementInfoForElementName:(const char *)a3 elementNamespace:(const char *)a4
{
  id v7;

  objc_sync_enter(self);
  v7 = -[PFXElementReaderDictionary p_elementInfoForElementName:elementNamespace:](self, "p_elementInfoForElementName:elementNamespace:", a3, a4);
  if (!v7)
  {
    if (self->mAllowFallThrough)
    {
      -[PFXElementReaderDictionary addEntryWithElementName:elementNamespace:mappingClass:](self, "addEntryWithElementName:elementNamespace:mappingClass:", a3, a4, objc_opt_class(PFXFallthroughReader));
      v7 = -[PFXElementReaderDictionary p_elementInfoForElementName:elementNamespace:](self, "p_elementInfoForElementName:elementNamespace:", a3, a4);
    }
    else
    {
      v7 = 0;
    }
  }
  objc_sync_exit(self);
  return v7;
}

- (void).cxx_destruct
{
  sub_3D170((uint64_t)&self->mMap, (_QWORD *)self->mMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
