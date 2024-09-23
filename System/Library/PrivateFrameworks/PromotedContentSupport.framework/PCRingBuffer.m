@implementation PCRingBuffer

+ (id)sharedInstance
{
  if (qword_253DA4CB0 != -1)
    dispatch_once(&qword_253DA4CB0, &unk_24D33A928);
  return (id)qword_253DA4CB8;
}

- (PCRingBuffer)init
{
  PCRingBuffer *v2;
  uint64_t v3;
  APUnfairLock *lock;
  uint64_t v5;
  NSMutableArray *ringBuffer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PCRingBuffer;
  v2 = -[PCRingBuffer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDFD4C0]), "initWithOptions:", 1);
    lock = v2->_lock;
    v2->_lock = (APUnfairLock *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    ringBuffer = v2->_ringBuffer;
    v2->_ringBuffer = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)cappedRingBufferTo:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[PCRingBuffer ringBuffer](self, "ringBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6 - a3;
  if (v6 > a3)
  {
    -[PCRingBuffer ringBuffer](self, "ringBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", v7, a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v10, "mutableCopy");
    -[PCRingBuffer setRingBuffer:](self, "setRingBuffer:", v9);

  }
}

- (NSMutableArray)ringBuffer
{
  return self->_ringBuffer;
}

- (void)setRingBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_ringBuffer, a3);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_ringBuffer, 0);
}

@end
