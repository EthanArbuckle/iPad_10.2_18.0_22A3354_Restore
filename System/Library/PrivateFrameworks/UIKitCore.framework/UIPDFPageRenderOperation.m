@implementation UIPDFPageRenderOperation

- (UIPDFPageRenderOperation)initWithJob:(id)a3
{
  UIPDFPageRenderOperation *v4;
  UIPDFPageRenderOperation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPDFPageRenderOperation;
  v4 = -[UIPDFPageRenderOperation init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[UIPDFPageRenderOperation setJob:](v4, "setJob:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPDFPageRenderOperation setJob:](self, "setJob:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageRenderOperation;
  -[UIPDFPageRenderOperation dealloc](&v3, sel_dealloc);
}

- (void)start
{
  const __CFString *v3;
  int *v4;

  if (-[UIPDFPageRenderOperation isCancelled](self, "isCancelled"))
  {
    v3 = CFSTR("isFinished");
    -[UIPDFPageRenderOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    v4 = &OBJC_IVAR___UIPDFPageRenderOperation_finished;
  }
  else
  {
    v3 = CFSTR("isExecuting");
    -[UIPDFPageRenderOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel_main, self, 0);
    v4 = &OBJC_IVAR___UIPDFPageRenderOperation_executing;
  }
  *((_BYTE *)&self->super.super.isa + *v4) = 1;
  -[UIPDFPageRenderOperation didChangeValueForKey:](self, "didChangeValueForKey:", v3);
}

- (void)main
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((-[UIPDFPageRenderOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[UIPDFPageRenderJob renderImage](-[UIPDFPageRenderOperation job](self, "job"), "renderImage");
  if ((-[UIPDFPageRenderOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[UIPDFPageRenderJob sendImage](-[UIPDFPageRenderOperation job](self, "job"), "sendImage");
  -[UIPDFPageRenderOperation completeOperation](self, "completeOperation");

}

- (void)completeOperation
{
  -[UIPDFPageRenderOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[UIPDFPageRenderOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->executing = 0;
  self->finished = 1;
  -[UIPDFPageRenderOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[UIPDFPageRenderOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->executing;
}

- (BOOL)isFinished
{
  return self->finished;
}

- (UIPDFPageRenderJob)job
{
  return (UIPDFPageRenderJob *)objc_getProperty(self, a2, 248, 1);
}

- (void)setJob:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

@end
