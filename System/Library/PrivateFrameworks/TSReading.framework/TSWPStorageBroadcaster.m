@implementation TSWPStorageBroadcaster

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->_observers.__tree_.__pair3_.__value_)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorageBroadcaster dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorageBroadcaster.mm"), 22, CFSTR("storage broadcaster has listeners that should have been removed"));
  }
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&self->_observers, (_QWORD *)self->_observers.__tree_.__pair1_.__value_.__left_);
  self->_observers.__tree_.__begin_node_ = &self->_observers.__tree_.__pair1_;
  self->_observers.__tree_.__pair3_.__value_ = 0;
  self->_observers.__tree_.__pair1_.__value_.__left_ = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSWPStorageBroadcaster;
  -[TSWPStorageBroadcaster dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (a3)
  {
    objc_sync_enter(self);
    std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)&self->_observers, (unint64_t *)&v4, (uint64_t *)&v4);
    objc_sync_exit(self);
  }
}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (a3)
  {
    objc_sync_enter(self);
    std::__tree<objc_object  {objcproto19TSWPStorageObserver}*>::__erase_unique<objc_object  {objcproto19TSWPStorageObserver}>((uint64_t)&self->_observers, (unint64_t *)&v4);
    objc_sync_exit(self);
  }
}

- (void)removeAllObservers
{
  objc_sync_enter(self);
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&self->_observers, (_QWORD *)self->_observers.__tree_.__pair1_.__value_.__left_);
  self->_observers.__tree_.__begin_node_ = &self->_observers.__tree_.__pair1_;
  self->_observers.__tree_.__pair3_.__value_ = 0;
  self->_observers.__tree_.__pair1_.__value_.__left_ = 0;
  objc_sync_exit(self);
}

- (void)broadcastStorage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  TSWPStorageBroadcaster *begin_node;
  TSWPStorageBroadcaster *isa;
  TSWPStorageBroadcaster *left;
  BOOL v15;

  v6 = *(_QWORD *)&a6;
  length = a4.length;
  location = a4.location;
  objc_sync_enter(self);
  begin_node = (TSWPStorageBroadcaster *)self->_observers.__tree_.__begin_node_;
  if (begin_node != (TSWPStorageBroadcaster *)&self->_observers.__tree_.__pair1_)
  {
    do
    {
      -[objc_class storage:didChangeRange:delta:broadcastKind:](begin_node[1].super.isa, "storage:didChangeRange:delta:broadcastKind:", a3, location, length, a5, v6);
      isa = (TSWPStorageBroadcaster *)begin_node->_observers.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (TSWPStorageBroadcaster *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (TSWPStorageBroadcaster *)begin_node->_observers.__tree_.__pair1_.__value_.__left_;
          v15 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v15);
      }
      begin_node = left;
    }
    while (left != (TSWPStorageBroadcaster *)&self->_observers.__tree_.__pair1_);
  }
  objc_sync_exit(self);
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&self->_observers, (_QWORD *)self->_observers.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
