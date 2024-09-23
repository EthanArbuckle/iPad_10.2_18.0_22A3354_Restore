@implementation ChainedInputStream

- (ChainedInputStream)init
{
  ChainedInputStream *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ChainedInputStream;
  result = -[ChainedInputStream init](&v3, "init");
  if (result)
  {
    result->fCurrentStream = 0;
    result->fDone = 0;
  }
  return result;
}

- (unint64_t)length
{
  return self->fLength;
}

- (void)addStream:(pair<NSInputStream *)
{
  NSInputStream *first;
  vector<NSInputStream *, std::allocator<NSInputStream *>> *p_fStreams;
  id *var0;
  __end_cap_ **v7;

  first = a3.first;
  p_fStreams = &self->fStreams;
  var0 = (id *)self->fStreams.var0;
  if (var0 >= self->fStreams.var1.__value_)
  {
    v7 = (__end_cap_ **)sub_10031334C(&self->fStreams.__begin_, (id *)&a3.first->super.super.isa);
  }
  else
  {
    *var0 = a3.first->super.super.isa;
    v7 = (__end_cap_ **)(var0 + 1);
  }
  p_fStreams->var0 = v7;
  self->fLength += (unint64_t)first[1].super.super.isa;
}

- (void)open
{
  -[__end_ open](self->fStreams.__begin_[self->fCurrentStream], "open");
}

- (void)close
{
  __end_ **begin;
  __end_cap_ **i;
  __end_ *v4;

  begin = self->fStreams.__begin_;
  for (i = self->fStreams.var0; begin != i; ++begin)
  {
    v4 = *begin;
    -[__end_ close](v4, "close");

  }
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t fCurrentStream;
  vector<NSInputStream *, std::allocator<NSInputStream *>> *p_fStreams;
  __end_ **begin;
  unint64_t v11;
  __end_ *v12;
  uint64_t v13;

  fCurrentStream = self->fCurrentStream;
  p_fStreams = &self->fStreams;
  begin = self->fStreams.__begin_;
  if (fCurrentStream < self->fStreams.var0 - begin && a4 != 0)
  {
    v11 = 0;
    while (1)
    {
      v12 = begin[fCurrentStream];
      if (!-[__end_ streamStatus](v12, "streamStatus"))
        -[__end_ open](v12, "open");
      v13 = (uint64_t)-[__end_ read:maxLength:](v12, "read:maxLength:", &a3[v11], a4 - v11);
      if (v13 < 1)
      {
        if (v13)
        {
          NSLog(CFSTR("Error reading stream %zu"), self->fCurrentStream);

          return -1;
        }
        -[__end_ close](v12, "close");
        ++self->fCurrentStream;

        fCurrentStream = self->fCurrentStream;
        begin = p_fStreams->__begin_;
        if (fCurrentStream >= p_fStreams->var0 - p_fStreams->__begin_)
        {
LABEL_14:
          if (v11)
            return v11;
          break;
        }
      }
      else
      {
        v11 += v13;

        fCurrentStream = self->fCurrentStream;
        begin = p_fStreams->__begin_;
        if (fCurrentStream >= p_fStreams->var0 - p_fStreams->__begin_)
          goto LABEL_14;
      }
      if (v11 >= a4)
        goto LABEL_14;
    }
  }
  v11 = 0;
  self->fDone = 1;
  return v11;
}

- (BOOL)hasBytesAvailable
{
  return !self->fDone;
}

- (id)streamError
{
  unint64_t fCurrentStream;
  __end_ **begin;
  __end_cap_ **var0;
  uint64_t v5;
  id *v6;
  id *v7;
  id *v8;

  fCurrentStream = self->fCurrentStream;
  begin = self->fStreams.__begin_;
  var0 = self->fStreams.var0;
  v5 = (char *)var0 - (char *)begin;
  v6 = (id *)(var0 - 1);
  v7 = (id *)&begin[fCurrentStream];
  if (fCurrentStream >= v5 >> 3)
    v8 = v6;
  else
    v8 = v7;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*v8, "streamError"));
}

- (unint64_t)streamStatus
{
  unint64_t fCurrentStream;
  __end_ **begin;
  __end_cap_ **var0;
  uint64_t v5;
  id *v6;
  id *v7;
  id *v8;

  fCurrentStream = self->fCurrentStream;
  begin = self->fStreams.__begin_;
  var0 = self->fStreams.var0;
  v5 = (char *)var0 - (char *)begin;
  v6 = (id *)(var0 - 1);
  v7 = (id *)&begin[fCurrentStream];
  if (fCurrentStream >= v5 >> 3)
    v8 = v6;
  else
    v8 = v7;
  return (unint64_t)objc_msgSend(*v8, "streamStatus");
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
  vector<NSInputStream *, std::allocator<NSInputStream *>> *p_fStreams;
  __end_ **begin;
  __end_cap_ **var0;
  __end_ **v5;
  void *v6;

  p_fStreams = &self->fStreams;
  begin = self->fStreams.__begin_;
  if (begin)
  {
    var0 = self->fStreams.var0;
    v5 = self->fStreams.__begin_;
    if (var0 != begin)
    {
      do
      {
        v6 = *--var0;

      }
      while (var0 != begin);
      v5 = p_fStreams->__begin_;
    }
    p_fStreams->var0 = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
