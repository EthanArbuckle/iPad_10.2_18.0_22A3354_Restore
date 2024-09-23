@implementation CLNotifierServiceAdapter

- (void)forget:(id)a3
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *p_pair1;
  unint64_t v7;
  BOOL v8;
  char **v9;

  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_clients.__tree_.__pair1_;
    do
    {
      v7 = *((_QWORD *)left + 4);
      v8 = v7 >= (unint64_t)a3;
      if (v7 >= (unint64_t)a3)
        v9 = (char **)left;
      else
        v9 = (char **)(left + 8);
      if (v8)
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
      left = *v9;
    }
    while (*v9);
    if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
    {
      (*((void (**)(CLNotifierBase *, _QWORD))self->_notifier->var0 + 4))(self->_notifier, LODWORD(p_pair1[5].__value_.__left_));
      sub_10008A9F0((uint64_t **)&self->_clients, (uint64_t *)p_pair1);
      operator delete(p_pair1);
    }
  }
}

- (CLNotifierBase)notifier
{
  return self->_notifier;
}

- (void)unregister:(id)a3 forNotification:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  (*((void (**)(CLNotifierBase *, _QWORD, uint64_t))self->_notifier->var0 + 7))(self->_notifier, -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a3), v4);
}

- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5
{
  uint64_t v6;

  v6 = *(_QWORD *)&a4;
  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  (*((void (**)(CLNotifierBase *, _QWORD, uint64_t, id))self->_notifier->var0 + 5))(self->_notifier, -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a3), v6, a5);
}

- (int)notifierClientNumForCoparty:(id)a3
{
  CLNotifierBase *notifier;
  map<unsigned long, int, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, int>>> *p_clients;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *p_pair1;
  unint64_t v9;
  BOOL v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **v11;
  int v12;
  id v14;
  id *v15;

  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  notifier = self->_notifier;
  if (!notifier)
    sub_101952060();
  p_clients = &self->_clients;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)p_clients->__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_13;
  p_pair1 = &p_clients->__tree_.__pair1_;
  do
  {
    v9 = (unint64_t)left[4].__value_.__left_;
    v10 = v9 >= (unint64_t)a3;
    if (v9 >= (unint64_t)a3)
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)left;
    else
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)&left[1];
    if (v10)
      p_pair1 = left;
    left = *v11;
  }
  while (*v11);
  if (p_pair1 != &p_clients->__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
    return (int)p_pair1[5].__value_.__left_;
LABEL_13:
  v12 = (*((uint64_t (**)(CLNotifierBase *, id))notifier->var0 + 3))(notifier, a3);
  v14 = a3;
  v15 = &v14;
  *((_DWORD *)sub_1001CA334((uint64_t **)p_clients, (unint64_t *)&v14, (uint64_t)&unk_101B9EB60, &v15) + 10) = v12;
  return v12;
}

- (CLNotifierServiceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNotifierServiceAdapter;
  return -[CLNotifierServiceAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLNotifierServiceProtocol, &OBJC_PROTOCOL___CLNotifierServiceClientProtocol);
}

- (void)setAdaptedNotifier:(CLNotifierBase *)a3
{
  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  if (self->_notifier)
    sub_101951EF4();
  if (a3)
  {
    if ((-[CLNotifierServiceAdapter valid](self, "valid") & 1) == 0)
      sub_101951D88();
    self->_notifier = a3;
  }
}

- (void)invalidate
{
  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  -[CLNotifierServiceAdapter setValid:](self, "setValid:", 0);
  self->_notifier = 0;
}

- (NSString)debugDescription
{
  NSMutableString *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *begin_node;
  char v5;
  CLNotifierServiceAdapter *left;
  CLNotifierServiceAdapter *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLNotifierServiceAdapter;
  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@\nClientIntegerMap: (\n"), -[CLNotifierServiceAdapter debugDescription](&v10, "debugDescription"));
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)self->_clients.__tree_.__begin_node_;
  if (begin_node != &self->_clients.__tree_.__pair1_)
  {
    v5 = 0;
    do
    {
      if ((v5 & 1) != 0)
        -[NSMutableString appendString:](v3, "appendString:", CFSTR(",\n"));
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%p = %d"), begin_node[4].__value_.__left_, LODWORD(begin_node[5].__value_.__left_));
      left = (CLNotifierServiceAdapter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v7 = left;
          left = *(CLNotifierServiceAdapter **)left->CLIntersiloService_opaque;
        }
        while (left);
      }
      else
      {
        do
        {
          v7 = (CLNotifierServiceAdapter *)begin_node[2].__value_.__left_;
          v8 = *(_QWORD *)v7->CLIntersiloService_opaque == (_QWORD)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v7;
        }
        while (!v8);
      }
      v5 = 1;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v7;
    }
    while (v7 != (CLNotifierServiceAdapter *)&self->_clients.__tree_.__pair1_);
  }
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("\n)\n"));
  return &v3->super;
}

- (void).cxx_destruct
{
  sub_100008848((uint64_t)&self->_clients, (_QWORD *)self->_clients.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
