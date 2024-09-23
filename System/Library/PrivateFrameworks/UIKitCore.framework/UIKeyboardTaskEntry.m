@implementation UIKeyboardTaskEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__creationStack, 0);
  objc_storeStrong(&self->__task, 0);
}

- (UIKeyboardTaskEntry)initWithTask:(id)a3
{
  id v4;
  UIKeyboardTaskEntry *v5;
  uint64_t v6;
  id task;
  uint64_t v8;
  NSArray *creationStack;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardTaskEntry;
  v5 = -[UIKeyboardTaskEntry init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    task = v5->__task;
    v5->__task = (id)v6;

    if (os_variant_has_internal_diagnostics())
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    else
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
    v8 = objc_claimAutoreleasedReturnValue();
    creationStack = v5->__creationStack;
    v5->__creationStack = (NSArray *)v8;

  }
  return v5;
}

- (NSArray)originatingStack
{
  return self->__creationStack;
}

- (void)execute:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  kdebug_trace();
  kace_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "task", ", buf, 2u);
    }
  }

  (*((void (**)(void))self->__task + 2))();
  kdebug_trace();
  kace_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v8, OS_SIGNPOST_INTERVAL_END, v10, "task", ", v11, 2u);
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKeyboardTaskEntry *v4;
  uint64_t v5;
  id task;

  v4 = objc_alloc_init(UIKeyboardTaskEntry);
  v5 = objc_msgSend(self->__task, "copy");
  task = v4->__task;
  v4->__task = (id)v5;

  return v4;
}

@end
