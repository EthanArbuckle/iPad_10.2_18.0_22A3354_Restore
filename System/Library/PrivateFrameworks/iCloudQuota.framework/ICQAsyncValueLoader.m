@implementation ICQAsyncValueLoader

void __47__ICQAsyncValueLoader_fetchValueAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "didUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "didUpdate");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)value
{
  os_unfair_lock_s *p_valueLock;
  id v4;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  v4 = self->_value;
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (ICQAsyncValueLoader)initWithDefaultValue:(id)a3 valueFetcher:(id)a4
{
  id v7;
  id v8;
  ICQAsyncValueLoader *v9;
  uint64_t v10;
  id fetchValue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQAsyncValueLoader;
  v9 = -[ICQAsyncValueLoader init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    fetchValue = v9->_fetchValue;
    v9->_fetchValue = (id)v10;

    v9->_valueLock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_value, a3);
    -[ICQAsyncValueLoader fetchValueAsynchronously](v9, "fetchValueAsynchronously");
  }

  return v9;
}

- (id)fetchValue
{
  return self->_fetchValue;
}

- (void)fetchValueAsynchronously
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  -[ICQAsyncValueLoader fetchValue](self, "fetchValue");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__ICQAsyncValueLoader_fetchValueAsynchronously__block_invoke;
  v4[3] = &unk_1E8B3A260;
  v4[4] = self;
  ((void (**)(_QWORD, _QWORD *))v3)[2](v3, v4);

}

- (id)didUpdate
{
  return self->_didUpdate;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void)setDidUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFetchValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchValue, 0);
  objc_storeStrong(&self->_didUpdate, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
