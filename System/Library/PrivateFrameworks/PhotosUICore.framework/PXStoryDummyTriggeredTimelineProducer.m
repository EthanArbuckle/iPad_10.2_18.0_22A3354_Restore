@implementation PXStoryDummyTriggeredTimelineProducer

- (PXStoryDummyTriggeredTimelineProducer)init
{
  return -[PXStoryDummyTriggeredTimelineProducer initWithNumberOfIterations:](self, "initWithNumberOfIterations:", 10);
}

- (PXStoryDummyTriggeredTimelineProducer)initWithNumberOfIterations:(int64_t)a3
{
  PXStoryDummyTriggeredTimelineProducer *v4;
  PXStoryDummyTimelineProducer *v5;
  PXStoryDummyTimelineProducer *timelineProducer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryDummyTriggeredTimelineProducer;
  v4 = -[PXStoryDummyTriggeredTimelineProducer init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(PXStoryDummyTimelineProducer);
    timelineProducer = v4->_timelineProducer;
    v4->_timelineProducer = v5;

    v4->_numberOfIterations = a3;
  }
  return v4;
}

- (void)setResultHandler:(id)a3
{
  id v5;
  id resultHandler;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  resultHandler = self->_resultHandler;
  if (resultHandler != v5)
  {
    v10 = v5;
    if (resultHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTriggeredTimelineProducer.m"), 39, CFSTR("not supporting multiple concurrent requests"));

    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = self->_resultHandler;
    self->_resultHandler = v7;

    v5 = v10;
  }

}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7;

  v7 = a5;
  -[PXStoryDummyTriggeredTimelineProducer setConfiguration:](self, "setConfiguration:", a3);
  -[PXStoryDummyTriggeredTimelineProducer setResultHandler:](self, "setResultHandler:", v7);

  -[PXStoryDummyTriggeredTimelineProducer trigger](self, "trigger");
  return 0;
}

- (void)trigger
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  PXStoryProducerResult *v8;
  void *v9;
  id v10;

  v3 = -[PXStoryDummyTriggeredTimelineProducer currentIteration](self, "currentIteration");
  v4 = (double)v3 / (double)-[PXStoryDummyTriggeredTimelineProducer numberOfIterations](self, "numberOfIterations");
  -[PXStoryDummyTriggeredTimelineProducer timelineProducer](self, "timelineProducer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDummyTriggeredTimelineProducer configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createTimelineWithConfiguration:detailsFraction:", v6, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryDummyTriggeredTimelineProducer resultHandler](self, "resultHandler", 1.0);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v10);
  -[PXStoryProducerResult flags:](v8, "flags:", v4 < 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  -[PXStoryDummyTriggeredTimelineProducer setCurrentIteration:](self, "setCurrentIteration:", v3 + 1);
}

- (int64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (PXStoryDummyTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (int64_t)currentIteration
{
  return self->_currentIteration;
}

- (void)setCurrentIteration:(int64_t)a3
{
  self->_currentIteration = a3;
}

- (PXStoryTimelineProducerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_timelineProducer, 0);
}

@end
