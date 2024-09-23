@implementation MTCoalescableWorkManifest

- (id)workBlock
{
  return self->_workBlock;
}

- (MTCoalescableWorkManifest)initWithWorkBlock:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  MTCoalescableWorkManifest *v10;

  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  v8 = _Block_copy(a4);
  objc_msgSend(v6, "arrayWithObjects:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTCoalescableWorkManifest initWithWorkBlock:completions:](self, "initWithWorkBlock:completions:", v7, v9);

  return v10;
}

- (MTCoalescableWorkManifest)initWithWorkBlock:(id)a3 completions:(id)a4
{
  id v6;
  id v7;
  MTCoalescableWorkManifest *v8;
  void *v9;
  id workBlock;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTCoalescableWorkManifest;
  v8 = -[MTCoalescableWorkManifest init](&v13, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    workBlock = v8->_workBlock;
    v8->_workBlock = v9;

    if (v7)
      v11 = v7;
    else
      v11 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v8->_completions, v11);
  }

  return v8;
}

- (NSArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

- (id)manifestByReplacingWorkBlock:(id)a3 appendingCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MTCoalescableWorkManifest *v11;

  v6 = a4;
  v7 = a3;
  -[MTCoalescableWorkManifest completions](self, "completions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v6)
  {
    v10 = _Block_copy(v6);
    objc_msgSend(v9, "addObject:", v10);

  }
  v11 = -[MTCoalescableWorkManifest initWithWorkBlock:completions:]([MTCoalescableWorkManifest alloc], "initWithWorkBlock:completions:", v7, v9);

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTCoalescableWorkManifest;
  -[MTCoalescableWorkManifest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCoalescableWorkManifest completions](self, "completions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: completions.count = %d"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setWorkBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

@end
