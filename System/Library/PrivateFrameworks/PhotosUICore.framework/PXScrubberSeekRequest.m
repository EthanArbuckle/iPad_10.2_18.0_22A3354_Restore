@implementation PXScrubberSeekRequest

- (PXScrubberSeekRequest)init
{
  return -[PXScrubberSeekRequest initWithTarget:seekTime:](self, "initWithTarget:seekTime:", 0, 0.0);
}

- (PXScrubberSeekRequest)initWithTarget:(id)a3 seekTime:(double)a4
{
  id v7;
  PXScrubberSeekRequest *v8;
  uint64_t v9;
  NSDate *dateCreated;
  void *v12;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXScrubberSeekRequest;
  v8 = -[PXScrubberSeekRequest init](&v13, sel_init);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PXVideoScrubberController.m"), 440, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target != nil"));

    }
    objc_storeWeak((id *)&v8->_target, v7);
    v8->_seekTime = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    dateCreated = v8->_dateCreated;
    v8->_dateCreated = (NSDate *)v9;

  }
  return v8;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)seekTime
{
  return self->_seekTime;
}

- (void)setSeekTime:(double)a3
{
  self->_seekTime = a3;
}

- (PXVideoScrubberControllerTarget)target
{
  return (PXVideoScrubberControllerTarget *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end
