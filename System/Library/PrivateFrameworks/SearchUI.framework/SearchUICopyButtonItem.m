@implementation SearchUICopyButtonItem

- (SearchUICopyButtonItem)initWithSFButtonItem:(id)a3
{
  SearchUICopyButtonItem *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICopyButtonItem;
  v3 = -[SearchUIButtonItem initWithSFButtonItem:](&v7, sel_initWithSFButtonItem_, a3);
  if (v3)
  {
    v4 = *MEMORY[0x1E0DC51B8];
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_didUpdatePasteboard, v4, 0);

  }
  return v3;
}

- (BOOL)hasState
{
  return 0;
}

- (void)didUpdatePasteboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIButtonItem command](self, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "copyableItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "copyableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v10);

    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  -[SearchUIButtonItem setStatus:](self, "setStatus:", v8);
  -[SearchUIButtonItem delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stateDidChangeForButtonItem:", self);

}

- (id)onStateSymbolName
{
  return CFSTR("checkmark");
}

- (BOOL)allowsContextMenu
{
  return 0;
}

@end
