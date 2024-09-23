@implementation SignpostRenderAccumulatedState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_imageQueueSampleEvents, 0);
}

- (NSMutableArray)imageQueueSampleEvents
{
  return self->_imageQueueSampleEvents;
}

- (SignpostRenderAccumulatedState)initWithFrameSeed:(unsigned int)a3
{
  SignpostRenderAccumulatedState *v4;
  SignpostRenderAccumulatedState *v5;
  uint64_t v6;
  NSMutableArray *imageQueueSampleEvents;
  uint64_t v8;
  NSMutableArray *clientDrawableIntervals;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SignpostRenderAccumulatedState;
  v4 = -[SignpostRenderAccumulatedState init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_frameSeed = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    imageQueueSampleEvents = v5->_imageQueueSampleEvents;
    v5->_imageQueueSampleEvents = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    clientDrawableIntervals = v5->_clientDrawableIntervals;
    v5->_clientDrawableIntervals = (NSMutableArray *)v8;

  }
  return v5;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)setImageQueueSampleEvents:(id)a3
{
  objc_storeStrong((id *)&self->_imageQueueSampleEvents, a3);
}

- (NSMutableArray)clientDrawableIntervals
{
  return self->_clientDrawableIntervals;
}

- (void)setClientDrawableIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_clientDrawableIntervals, a3);
}

@end
