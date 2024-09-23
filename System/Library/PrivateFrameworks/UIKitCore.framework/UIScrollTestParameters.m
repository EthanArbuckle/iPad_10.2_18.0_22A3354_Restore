@implementation UIScrollTestParameters

- (UIScrollTestParameters)init
{
  UIScrollTestParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIScrollTestParameters;
  result = -[UIScrollTestParameters init](&v3, sel_init);
  if (result)
  {
    result->_iterations = 3;
    *(_OWORD *)&result->_delta = xmmword_186685370;
    result->_axis = 2;
  }
  return result;
}

- (void)dealloc
{
  CADisplayLink *displayLink;
  objc_super v4;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIScrollTestParameters;
  -[UIScrollTestParameters dealloc](&v4, sel_dealloc);
}

- (double)endOffset
{
  double v3;
  double v4;
  double v5;

  -[UIScrollTestParameters startOffset](self, "startOffset");
  v4 = v3;
  -[UIScrollTestParameters length](self, "length");
  return v4 + v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIScrollTestParameters *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(UIScrollTestParameters);
  -[UIScrollTestParameters testName](self, "testName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollTestParameters setTestName:](v4, "setTestName:", v5);

  -[UIScrollTestParameters setIterations:](v4, "setIterations:", -[UIScrollTestParameters iterations](self, "iterations"));
  -[UIScrollTestParameters delta](self, "delta");
  -[UIScrollTestParameters setDelta:](v4, "setDelta:");
  -[UIScrollTestParameters length](self, "length");
  -[UIScrollTestParameters setLength:](v4, "setLength:");
  -[UIScrollTestParameters setAxis:](v4, "setAxis:", -[UIScrollTestParameters axis](self, "axis"));
  -[UIScrollTestParameters extraResultsBlock](self, "extraResultsBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollTestParameters setExtraResultsBlock:](v4, "setExtraResultsBlock:", v6);

  return v4;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (double)delta
{
  return self->_delta;
}

- (void)setDelta:(double)a3
{
  self->_delta = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (id)extraResultsBlock
{
  return self->_extraResultsBlock;
}

- (void)setExtraResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(double)a3
{
  self->_startOffset = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_extraResultsBlock, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
