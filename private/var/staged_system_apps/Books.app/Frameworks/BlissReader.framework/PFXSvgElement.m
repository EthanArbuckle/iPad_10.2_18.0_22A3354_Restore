@implementation PFXSvgElement

- (PFXSvgElement)initWithDocument:(id)a3 name:(id)a4
{
  PFXSvgElement *v6;
  PFXSvgElement *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFXSvgElement;
  v6 = -[PFXSvgElement init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->mDocument = (PFXSvgDefsDocument *)a3;
    v6->mParent = (PFXSvgElement *)objc_msgSend(a3, "innermostElement");
    v7->mName = (NSString *)a4;
  }
  return v7;
}

- (void)dealloc
{
  PFXSvgElement *begin_node;
  PFXSvgElement *mName;
  PFXSvgElement *v5;
  BOOL v6;
  objc_super v7;

  begin_node = (PFXSvgElement *)self->mAttributeCache.__tree_.__begin_node_;
  if (begin_node != (PFXSvgElement *)&self->mAttributeCache.__tree_.__pair1_)
  {
    do
    {

      mName = (PFXSvgElement *)begin_node->mName;
      if (mName)
      {
        do
        {
          v5 = mName;
          mName = (PFXSvgElement *)mName->super.isa;
        }
        while (mName);
      }
      else
      {
        do
        {
          v5 = (PFXSvgElement *)begin_node->mAttributeCache.__tree_.__begin_node_;
          v6 = v5->super.isa == (Class)begin_node;
          begin_node = v5;
        }
        while (!v6);
      }
      begin_node = v5;
    }
    while (v5 != (PFXSvgElement *)&self->mAttributeCache.__tree_.__pair1_);
  }
  v7.receiver = self;
  v7.super_class = (Class)PFXSvgElement;
  -[PFXSvgElement dealloc](&v7, "dealloc");
}

- (void)cacheDefinition:(id)a3
{
  id v5;

  v5 = -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "id");
  if (v5)
    objc_msgSend(-[PFXSvgDefsDocument definitionMap](self->mDocument, "definitionMap"), "setObject:forKey:", a3, v5);
}

- (id)valueForAttributeName:(const char *)a3
{
  PFXSvgElement *v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v4 = (PFXSvgElement *)sub_1C95FC((uint64_t)&self->mAttributeCache, &v6);
  if (&self->mAttributeCache.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXString *>, void *>>> *)v4)
    return 0;
  else
    return -[PFXSvgElement nsString](v4->mParent, "nsString");
}

- (const)xmlValueForAttributeName:(const char *)a3
{
  PFXSvgElement *v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v4 = (PFXSvgElement *)sub_1C95FC((uint64_t)&self->mAttributeCache, &v6);
  if (&self->mAttributeCache.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXString *>, void *>>> *)v4)
    return 0;
  else
    return (const char *)-[PFXSvgElement xmlString](v4->mParent, "xmlString");
}

- (void).cxx_destruct
{
  sub_3D170((uint64_t)&self->mAttributeCache, (_QWORD *)self->mAttributeCache.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  return self;
}

- (void)setAttribute:(const char *)a3 withValue:(id)a4
{
  id v5;
  const xmlChar *v6;
  const xmlChar **v7;

  v6 = (const xmlChar *)a3;
  v5 = a4;
  v7 = &v6;
  sub_1C6CDC((uint64_t **)&self->mAttributeCache, &v6, (uint64_t)&std::piecewise_construct, (uint64_t **)&v7)[5] = (uint64_t)v5;
}

@end
