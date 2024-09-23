@implementation _PIVideoStabilizeFlowControl

- (void)ICReportProgress:(float)a3
{
  void (**progressHandler)(double);

  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](self->_rangeMin + a3 * (self->_rangeMax - self->_rangeMin));
}

- (BOOL)ICShouldBeCanceled
{
  void *v3;
  uint64_t (**v4)(void);
  char v5;

  -[_PIVideoStabilizeFlowControl shouldCancelHandler](self, "shouldCancelHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_PIVideoStabilizeFlowControl shouldCancelHandler](self, "shouldCancelHandler");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();

  return v5;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)rangeMin
{
  return self->_rangeMin;
}

- (void)setRangeMin:(double)a3
{
  self->_rangeMin = a3;
}

- (double)rangeMax
{
  return self->_rangeMax;
}

- (void)setRangeMax:(double)a3
{
  self->_rangeMax = a3;
}

- (id)shouldCancelHandler
{
  return self->_shouldCancelHandler;
}

- (void)setShouldCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldCancelHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
