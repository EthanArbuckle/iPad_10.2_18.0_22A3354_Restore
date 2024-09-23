@implementation SBAtomicObjectQueue

- (SBAtomicObjectQueue)init
{
  SBAtomicObjectQueue *v2;
  SBAtomicObjectQueue *v3;
  uint64_t v4;
  NSMutableArray *data;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAtomicObjectQueue;
  v2 = -[SBAtomicObjectQueue init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    data = v3->_data;
    v3->_data = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)enqueue:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray _sb_enqueue:](self->_data, "_sb_enqueue:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)dequeue
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray _sb_dequeue](self->_data, "_sb_dequeue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
