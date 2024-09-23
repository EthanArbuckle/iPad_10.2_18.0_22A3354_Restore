@implementation PFSPropertySet

- (void)removeUninheritedProperties
{
  uint64_t **p_mProperties;
  PFSPropertySet *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *p_pair1;
  PFSPropertySet *isa;
  PFSPropertySet *left;
  BOOL v7;

  p_mProperties = (uint64_t **)&self->mProperties;
  p_pair1 = &self->mProperties.__tree_.__pair1_;
  begin_node = (PFSPropertySet *)self->mProperties.__tree_.__begin_node_;
  if (begin_node != (PFSPropertySet *)&self->mProperties.__tree_.__pair1_)
  {
    do
    {
      if (!+[PFXHtmlStylePropertyInfo propertyIsInherited:](PFXHtmlStylePropertyInfo, "propertyIsInherited:", begin_node[1].super.isa))
      {

        sub_3CD7C(p_mProperties, (uint64_t *)begin_node);
        operator delete(begin_node);
        begin_node = (PFSPropertySet *)*p_mProperties;
      }
      isa = (PFSPropertySet *)begin_node->mProperties.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PFSPropertySet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PFSPropertySet *)begin_node->mProperties.__tree_.__pair1_.__value_.__left_;
          v7 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v7);
      }
      begin_node = left;
    }
    while (left != (PFSPropertySet *)p_pair1);
  }
}

- (PFSPropertySet)initWithPropertySet:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  xmlChar *v13;
  objc_super v14;
  xmlChar **v15;

  v14.receiver = self;
  v14.super_class = (Class)PFSPropertySet;
  v4 = -[PFSPropertySet init](&v14, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "peekAtProperties");
    v6 = v5 + 1;
    v7 = (_QWORD *)*v5;
    if ((_QWORD *)*v5 != v5 + 1)
    {
      do
      {
        v8 = (id)v7[5];
        v13 = xmlStrdup((const xmlChar *)v7[4]);
        v15 = &v13;
        sub_1C6CDC((uint64_t **)v4 + 1, (const xmlChar **)&v13, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)v8;
        v9 = (_QWORD *)v7[1];
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = (_QWORD *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (_QWORD *)v7[2];
            v11 = *v10 == (_QWORD)v7;
            v7 = v10;
          }
          while (!v11);
        }
        v7 = v10;
      }
      while (v10 != v6);
    }
  }
  return (PFSPropertySet *)v4;
}

- (void)dealloc
{
  PFSPropertySet *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *p_pair1;
  PFSPropertySet *isa;
  PFSPropertySet *left;
  BOOL v7;
  objc_super v8;

  begin_node = (PFSPropertySet *)self->mProperties.__tree_.__begin_node_;
  p_pair1 = &self->mProperties.__tree_.__pair1_;
  if (begin_node != (PFSPropertySet *)&self->mProperties.__tree_.__pair1_)
  {
    do
    {
      xmlFree(begin_node[1].super.isa);

      isa = (PFSPropertySet *)begin_node->mProperties.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PFSPropertySet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PFSPropertySet *)begin_node->mProperties.__tree_.__pair1_.__value_.__left_;
          v7 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v7);
      }
      begin_node = left;
    }
    while (left != (PFSPropertySet *)p_pair1);
  }
  v8.receiver = self;
  v8.super_class = (Class)PFSPropertySet;
  -[PFSPropertySet dealloc](&v8, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  return objc_msgSend(v4, "initWithPropertySet:", self);
}

- (id)valueForProperty:(const char *)a3
{
  PFSPropertySet *v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v4 = (PFSPropertySet *)sub_1C95FC((uint64_t)&self->mProperties, &v6);
  if (&self->mProperties.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v4)
    return 0;
  else
    return v4[1].mProperties.__tree_.__begin_node_;
}

- (id)firstValueFromCandidatePropertyNames:(void *)a3 selectedIndex:(unint64_t *)a4
{
  unint64_t v5;
  unint64_t v8;
  id result;

  v5 = *((_QWORD *)a3 + 5);
  if (!v5)
  {
    result = 0;
    v8 = 0;
    if (!a4)
      return result;
    goto LABEL_7;
  }
  v8 = 0;
  while (1)
  {
    result = -[PFSPropertySet valueForProperty:](self, "valueForProperty:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 1) + (((v8 + *((_QWORD *)a3 + 4)) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * ((v8 + *((_QWORD *)a3 + 4)) & 0x1FF)));
    if (result)
      break;
    if (v5 == ++v8)
    {
      result = 0;
      v8 = v5;
      break;
    }
  }
  if (a4)
LABEL_7:
    *a4 = v8;
  return result;
}

- (void)addPropertyValue:(id)a3 forProperty:(const char *)a4
{
  uint64_t **p_mProperties;
  PFSPropertySet *v7;
  id v8;
  uint64_t *v9;
  xmlChar *v10;
  xmlChar *cur;
  xmlChar **p_cur;

  cur = (xmlChar *)a4;
  p_mProperties = (uint64_t **)&self->mProperties;
  v7 = (PFSPropertySet *)sub_1C95FC((uint64_t)&self->mProperties, (const xmlChar **)&cur);
  if (&self->mProperties.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v7)
  {
    v8 = a3;
    v10 = xmlStrdup(cur);
    p_cur = &v10;
    v9 = sub_1C6CDC(p_mProperties, (const xmlChar **)&v10, (uint64_t)&std::piecewise_construct, (uint64_t **)&p_cur);
  }
  else
  {

    v8 = a3;
    p_cur = &cur;
    v9 = sub_1C6CDC(p_mProperties, (const xmlChar **)&cur, (uint64_t)&std::piecewise_construct, (uint64_t **)&p_cur);
  }
  v9[5] = (uint64_t)v8;
}

- (void)removeValueForProperty:(const char *)a3
{
  uint64_t **p_mProperties;
  PFSPropertySet *v5;
  PFSPropertySet *v6;
  const xmlChar *v7;

  v7 = (const xmlChar *)a3;
  p_mProperties = (uint64_t **)&self->mProperties;
  v5 = (PFSPropertySet *)sub_1C95FC((uint64_t)&self->mProperties, &v7);
  if (&self->mProperties.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v5)
  {
    v6 = v5;
    xmlFree(v5[1].super.isa);

    sub_3CD7C(p_mProperties, (uint64_t *)v6);
    operator delete(v6);
  }
}

- (void)setPropertiesFromPropertySet:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = objc_msgSend(a3, "peekAtProperties");
  v5 = v4 + 1;
  v6 = (_QWORD *)*v4;
  if ((_QWORD *)*v4 != v4 + 1)
  {
    do
    {
      -[PFSPropertySet addPropertyValue:forProperty:](self, "addPropertyValue:forProperty:", v6[5], v6[4]);
      v7 = (_QWORD *)v6[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v6[2];
          v9 = *v8 == (_QWORD)v6;
          v6 = v8;
        }
        while (!v9);
      }
      v6 = v8;
    }
    while (v8 != v5);
  }
}

- (void).cxx_destruct
{
  sub_3D170((uint64_t)&self->mProperties, (_QWORD *)self->mProperties.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

- (const)peekAtProperties
{
  return &self->mProperties;
}

@end
