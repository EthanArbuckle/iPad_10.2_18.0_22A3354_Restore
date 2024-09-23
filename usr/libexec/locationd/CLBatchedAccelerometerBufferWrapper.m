@implementation CLBatchedAccelerometerBufferWrapper

- (CLBatchedAccelerometerBufferWrapper)initWithMovedBuffer:(void *)a3
{
  CLBatchedAccelerometerBufferWrapper *v4;
  CLBatchedAccelerometerBufferWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLBatchedAccelerometerBufferWrapper;
  v4 = -[CLBatchedAccelerometerBufferWrapper init](&v7, "init");
  v5 = v4;
  if (v4)
    sub_100006898((uint64_t)&v4->_buffer, (__n128 *)a3);
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLBatchedAccelerometerBufferWrapper;
  -[CLBatchedAccelerometerBufferWrapper dealloc](&v2, "dealloc");
}

- (const)buffer
{
  return &self->_buffer;
}

- (void).cxx_destruct
{
  CMAccel800 *begin;

  begin = self->_buffer.__begin_;
  if (begin)
  {
    self->_buffer.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
