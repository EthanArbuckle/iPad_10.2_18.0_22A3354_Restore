@implementation PFSSlot

- (PFSSlot)initWithId:(id)a3
{
  PFSSlot *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFSSlot;
  v4 = -[PFSSlot init](&v6, "init");
  if (v4)
    v4->mSlotId = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *begin_node;
  PFSSlot *left;
  PFSSlot *v5;
  BOOL v6;
  objc_super v7;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)self->mProperties.__tree_.__begin_node_;
  if (begin_node != &self->mProperties.__tree_.__pair1_)
  {
    do
    {
      xmlFree(begin_node[4].__value_.__left_);

      left = (PFSSlot *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v5 = left;
          left = (PFSSlot *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v5 = (PFSSlot *)begin_node[2].__value_.__left_;
          v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v5;
    }
    while (v5 != (PFSSlot *)&self->mProperties.__tree_.__pair1_);
  }
  v7.receiver = self;
  v7.super_class = (Class)PFSSlot;
  -[PFSSlot dealloc](&v7, "dealloc");
}

- (id)valueForProperty:(const char *)a3
{
  PFSSlot *v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v4 = (PFSSlot *)sub_1C95FC((uint64_t)&self->mProperties, &v6);
  if (&self->mProperties.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v4)
    return 0;
  else
    return v4[1].super.isa;
}

- (void)addPropertyValue:(id)a3 forProperty:(const char *)a4
{
  uint64_t **p_mProperties;
  PFSSlot *v7;
  id v8;
  uint64_t *v9;
  xmlChar *v10;
  xmlChar *cur;
  xmlChar **p_cur;

  cur = (xmlChar *)a4;
  p_mProperties = (uint64_t **)&self->mProperties;
  v7 = (PFSSlot *)sub_1C95FC((uint64_t)&self->mProperties, (const xmlChar **)&cur);
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

- (NSString)slotId
{
  return self->mSlotId;
}

- (void).cxx_destruct
{
  sub_3D170((uint64_t)&self->mProperties, (_QWORD *)self->mProperties.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  return self;
}

@end
