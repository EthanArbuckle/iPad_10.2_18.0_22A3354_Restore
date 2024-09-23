@implementation TSWPCTTypesetterCache

- (void).cxx_destruct
{
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::destroy((uint64_t)&self->_typesetters, (_QWORD *)self->_typesetters.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPCTTypesetterCache clearCache](self, "clearCache");
  v3.receiver = self;
  v3.super_class = (Class)TSWPCTTypesetterCache;
  -[TSWPCTTypesetterCache dealloc](&v3, sel_dealloc);
}

- (void)clearCache
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *p_pair1;

  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::destroy((uint64_t)&self->_typesetters, (_QWORD *)self->_typesetters.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

- (void)removeTypesetterForParagraphIndex:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *p_pair1;
  _QWORD *left;
  uint64_t **p_typesetters;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;

  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  left = self->_typesetters.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_typesetters = (uint64_t **)&self->_typesetters;
    v6 = (uint64_t *)p_pair1;
    do
    {
      v7 = left[4];
      v8 = v7 >= a3;
      if (v7 >= a3)
        v9 = left;
      else
        v9 = left + 1;
      if (v8)
        v6 = left;
      left = (_QWORD *)*v9;
    }
    while (*v9);
    if (v6 != (uint64_t *)p_pair1 && v6[4] <= a3)
    {
      std::__tree<std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,EQKit::Config::Operator::Form>>>::__remove_node_pointer(p_typesetters, v6);
      std::shared_ptr<EQKit::StemStretch::Glyph>::~shared_ptr[abi:nn180100]((uint64_t)(v6 + 5));
      operator delete(v6);
    }
  }
}

- (shared_ptr<TSWPParagraphTypesetter>)cachedTypesetterForParagraphIdentifier:(unint64_t)a3
{
  _QWORD *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *v7;
  unint64_t v8;
  BOOL v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> **v10;
  shared_ptr<TSWPParagraphTypesetter> result;

  *v3 = 0;
  v3[1] = 0;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  v5 = left;
  if (left)
  {
    v7 = p_pair1;
    do
    {
      v8 = (unint64_t)v5[4].__value_.__left_;
      v9 = v8 >= a3;
      if (v8 >= a3)
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> **)v5;
      else
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> **)&v5[1];
      if (v9)
        v7 = v5;
      v5 = *v10;
    }
    while (*v10);
    if (v7 != p_pair1 && v7[4].__value_.__left_ <= (void *)a3)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *)std::shared_ptr<EQKit::StemStretch::Glyph>::operator=[abi:nn180100](v3, (uint64_t *)&v7[5]);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (TSWPParagraphTypesetter *)p_pair1;
  return result;
}

- (void)addTypesetterForParagraphIdentifier:(unint64_t)a3 typesetter:(shared_ptr<TSWPParagraphTypesetter>)a4
{
  uint64_t *var0;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v10;

  v9 = a3;
  if (*(_QWORD *)a4.var0)
  {
    var0 = (uint64_t *)a4.var0;
    v10 = &v9;
    v6 = std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->_typesetters, &v9, (uint64_t)&std::piecewise_construct, (uint64_t **)&v10);
    std::shared_ptr<EQKit::StemStretch::Glyph>::operator=[abi:nn180100](v6 + 5, var0);
    -[TSWPCTTypesetterCache p_limitCacheSize:](self, "p_limitCacheSize:", v9);
    if (self->_typesetters.__tree_.__pair3_.__value_ >= 2)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPCTTypesetterCache addTypesetterForParagraphIdentifier:typesetter:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPCTTypesetterCache.mm"), 57, CFSTR("too many entries in our typesetter cache"));
    }
  }
}

- (void)p_limitCacheSize:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *p_pair1;
  uint64_t *left;
  uint64_t *v5;
  BOOL v6;
  uint64_t **p_typesetters;

  if (self->_typesetters.__tree_.__pair3_.__value_ >= 2)
  {
    p_pair1 = &self->_typesetters.__tree_.__pair1_;
    left = (uint64_t *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      do
      {
        v5 = left;
        left = (uint64_t *)left[1];
      }
      while (left);
    }
    else
    {
      do
      {
        v5 = (uint64_t *)p_pair1[2].__value_.__left_;
        v6 = *v5 == (_QWORD)p_pair1;
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *)v5;
      }
      while (v6);
    }
    p_typesetters = (uint64_t **)&self->_typesetters;
    if (v5[4] == a3)
      v5 = *p_typesetters;
    std::__tree<std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,EQKit::Config::Operator::Form>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,EQKit::Config::Operator::Form>>>::__remove_node_pointer(p_typesetters, v5);
    std::shared_ptr<EQKit::StemStretch::Glyph>::~shared_ptr[abi:nn180100]((uint64_t)(v5 + 5));
    operator delete(v5);
  }
}

@end
