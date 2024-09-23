@implementation WBSPasswordWordList

- (WBSPasswordWordList)initWithIdentifier:(id)a3
{
  id v4;
  WBSPasswordWordList *v5;
  uint64_t v6;
  NSString *identifier;
  WBSPasswordWordList *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordWordList;
  v5 = -[WBSPasswordWordList init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)entriesForString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__WBSPasswordWordList_entriesForString___block_invoke;
  v9[3] = &unk_1E649E710;
  v7 = v6;
  v10 = v7;
  -[WBSPasswordWordList enumerateEntriesForString:withBlock:](self, "enumerateEntriesForString:withBlock:", v5, v9);

  return v7;
}

uint64_t __40__WBSPasswordWordList_entriesForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
