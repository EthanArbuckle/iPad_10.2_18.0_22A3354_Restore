@implementation RCWaveformSegmentAccumulator

- (RCWaveformSegmentAccumulator)initWithWaveformGenerator:(id)a3
{
  id v5;
  RCWaveformSegmentAccumulator *v6;
  uint64_t v7;
  NSMutableArray *segments;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RCWaveformSegmentAccumulator;
  v6 = -[RCWaveformSegmentAccumulator init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    segments = v6->_segments;
    v6->_segments = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_generator, a3);
    -[RCWaveformGenerator addSegmentOutputObserver:](v6->_generator, "addSegmentOutputObserver:", v6);
    -[RCWaveformGenerator beginLoading](v6->_generator, "beginLoading");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[RCWaveformGenerator removeSegmentOutputObserver:](self->_generator, "removeSegmentOutputObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformSegmentAccumulator;
  -[RCWaveformSegmentAccumulator dealloc](&v3, sel_dealloc);
}

- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4
{
  -[NSMutableArray addObject:](self->_segments, "addObject:", a4);
}

- (BOOL)waitUntilFinished
{
  dispatch_semaphore_t v3;
  RCWaveformGenerator *generator;
  NSObject *v5;
  _QWORD v7[4];
  NSObject *v8;

  v3 = dispatch_semaphore_create(0);
  generator = self->_generator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__RCWaveformSegmentAccumulator_waitUntilFinished__block_invoke;
  v7[3] = &unk_1E769BE28;
  v5 = v3;
  v8 = v5;
  -[RCWaveformGenerator finishLoadingWithCompletionTimeout:completionBlock:](generator, "finishLoadingWithCompletionTimeout:completionBlock:", -1, v7);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  self->_finishedSuccessfully = !-[RCWaveformGenerator canceled](self->_generator, "canceled");
  LODWORD(self) = !-[RCWaveformGenerator canceled](self->_generator, "canceled");

  return (char)self;
}

intptr_t __49__RCWaveformSegmentAccumulator_waitUntilFinished__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RCWaveformGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (BOOL)finishedSuccessfully
{
  return self->_finishedSuccessfully;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
