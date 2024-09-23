@implementation TTRReminderBaseTextStorage

- (TTRReminderBaseTextStorage)init
{
  TTRReminderBaseTextStorage *v2;
  id v3;
  id v4;
  uint64_t v5;
  REMCRMutableAttributedString *backingStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TTRReminderBaseTextStorage;
  v2 = -[TTRReminderBaseTextStorage init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D844A8]);
    v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v5 = objc_msgSend(v3, "initWithBackingStore:", v4);
    backingStore = v2->_backingStore;
    v2->_backingStore = (REMCRMutableAttributedString *)v5;

    -[REMCRMutableAttributedString setEditObserver:](v2->_backingStore, "setEditObserver:", v2);
  }
  return v2;
}

- (id)string
{
  void *v2;
  void *v3;

  -[TTRReminderBaseTextStorage backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;

  -[TTRReminderBaseTextStorage backingStore](self, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[TTRReminderBaseTextStorage backingStore](self, "backingStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceCharactersInRange:withString:", location, length, v7);

}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[TTRReminderBaseTextStorage backingStore](self, "backingStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributes:range:", v7, location, length);

}

- (void)mutableAttributedString:(id)a3 didEdit:(int64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  -[TTRReminderBaseTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", a4 & 3, a5.location, a5.length, a6);
}

- (REMCRMutableAttributedString)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end
