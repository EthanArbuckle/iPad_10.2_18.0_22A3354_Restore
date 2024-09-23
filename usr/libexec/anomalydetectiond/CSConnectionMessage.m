@implementation CSConnectionMessage

- (CSConnectionMessage)initWithConnectionMessage:(shared_ptr<CLConnectionMessage>)a3
{
  uint64_t *ptr;
  CSConnectionMessage *v4;
  CSConnectionMessage *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)CSConnectionMessage;
  v4 = -[CSConnectionMessage init](&v7, "init", a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    sub_10000A6A0(&v4->_message.__ptr_, ptr);
  return v5;
}

- (NSString)name
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  unint64_t *v8;
  unint64_t v9;
  CLConnectionMessage *v11;
  std::__shared_weak_count *v12;

  -[CSConnectionMessage message](self, "message");
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
      if (v11)
        goto LABEL_6;
LABEL_15:
      v7 = 0;
      return (NSString *)v7;
    }
  }
  if (!v11)
    goto LABEL_15;
LABEL_6:
  -[CSConnectionMessage message](self, "message");
  v5 = (uint64_t *)CLConnectionMessage::name(v11);
  if (*((char *)v5 + 23) >= 0)
    v6 = v5;
  else
    v6 = (uint64_t *)*v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return (NSString *)v7;
}

- (BOOL)isReply
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  char isReply;
  unint64_t *v6;
  unint64_t v7;
  CLConnectionMessage *v9;
  std::__shared_weak_count *v10;

  -[CSConnectionMessage message](self, "message");
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
        goto LABEL_6;
      return 0;
    }
  }
  if (!v9)
    return 0;
LABEL_6:
  -[CSConnectionMessage message](self, "message");
  isReply = CLConnectionMessage::isReply(v9);
  if (v10)
  {
    v6 = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return isReply;
}

- (NSSecureCoding)payloadObject
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t Dictionary;
  void *v6;
  unint64_t *v7;
  unint64_t v8;
  CLConnectionMessage *v10;
  std::__shared_weak_count *v11;

  -[CSConnectionMessage message](self, "message");
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
      if (v10)
        goto LABEL_6;
LABEL_12:
      v6 = 0;
      return (NSSecureCoding *)v6;
    }
  }
  if (!v10)
    goto LABEL_12;
LABEL_6:
  -[CSConnectionMessage message](self, "message");
  Dictionary = CLConnectionMessage::getDictionary(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(Dictionary);
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return (NSSecureCoding *)v6;
}

- (void)sendReply:(id)a3
{
  id v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v4 = a3;
  -[CSConnectionMessage message](self, "message");
  if (!v10)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)())v10->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v10);
    if (!v9)
      goto LABEL_12;
  }
  else
  {
LABEL_5:
    if (!v9)
      goto LABEL_12;
  }
  -[CSConnectionMessage message](self, "message");
  CLConnectionMessage::sendReply(v9);
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
LABEL_12:

}

- (shared_ptr<CLConnectionMessage>)message
{
  CLConnectionMessage **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<CLConnectionMessage> result;

  cntrl = self->_message.__cntrl_;
  *v2 = self->_message.__ptr_;
  v2[1] = (CLConnectionMessage *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLConnectionMessage *)self;
  return result;
}

- (void).cxx_destruct
{
  sub_10000A718((uint64_t)&self->_message);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
