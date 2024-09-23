@implementation PAAccessInterval

- (PAAccessInterval)initWithLogger:(id)a3 slot:(id)a4
{
  id v6;
  id v7;
  PAAccessInterval *v8;
  PAAccessInterval *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PAAccessInterval;
  v8 = -[PAAccessInterval init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_logger, v6);
    objc_storeStrong((id *)&v9->_slot, a4);
    atomic_store(0, (unsigned __int8 *)&v9->_wasEnded);
    v9->_accessCount = 0;
  }

  return v9;
}

- (void)recordAccessToAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5
{
  PAAccessLogger **p_logger;
  id v9;
  id WeakRetained;

  p_logger = &self->_logger;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_logger);
  objc_msgSend(WeakRetained, "recordAssetIdentifiers:withVisibilityState:accessEventCount:forSlot:", v9, a4, a5, self->_slot);

}

+ (id)placeholderAccessInterval
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLogger:slot:", 0, &unk_1E4FAC530);
}

- (void)end
{
  -[PAAccessInterval endWithTimestampAdjustment:accessCount:](self, "endWithTimestampAdjustment:accessCount:", self->_accessCount, 0.0);
}

- (void)endWithTimestampAdjustment:(double)a3 accessCount:(int64_t)a4
{
  atomic_flag *p_wasEnded;
  unsigned __int8 v8;
  id WeakRetained;

  p_wasEnded = &self->_wasEnded;
  do
    v8 = __ldaxr((unsigned __int8 *)p_wasEnded);
  while (__stlxr(1u, (unsigned __int8 *)p_wasEnded));
  if ((v8 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_logger);
    objc_msgSend(WeakRetained, "endIntervalWithSlot:timestampAdjustment:accessCount:", self->_slot, a4, a3);

  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p slot:%@>"), objc_opt_class(), self, self->_slot);
}

- (void)dealloc
{
  objc_super v3;

  -[PAAccessInterval end](self, "end");
  v3.receiver = self;
  v3.super_class = (Class)PAAccessInterval;
  -[PAAccessInterval dealloc](&v3, sel_dealloc);
}

- (NSNumber)slot
{
  return self->_slot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);
  objc_destroyWeak((id *)&self->_logger);
}

@end
