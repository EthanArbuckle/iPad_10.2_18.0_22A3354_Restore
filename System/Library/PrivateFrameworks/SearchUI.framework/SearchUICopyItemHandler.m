@implementation SearchUICopyItemHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[SearchUICopyItemHandler handlerForCopying](self, "handlerForCopying", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemProviders:", v8);

LABEL_5:
    goto LABEL_6;
  }
  -[SearchUICommandHandler command](self, "command");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUICommandHandler command](self, "command");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "copyableItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIItemProviderUtilities copy:](SearchUIItemProviderUtilities, "copy:", v12);

    goto LABEL_5;
  }
LABEL_6:

}

- (id)itemProvider
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;

  -[SearchUICommandHandler command](self, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUICommandHandler command](self, "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "copyableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIItemProviderUtilities itemProviderForItem:](SearchUIItemProviderUtilities, "itemProviderForItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)defaultTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("COPY"));
}

- (id)defaultSymbolName
{
  return CFSTR("doc.on.doc");
}

- (unint64_t)destination
{
  return 3;
}

- (SearchUICommandHandler)handlerForCopying
{
  return (SearchUICommandHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHandlerForCopying:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerForCopying, 0);
}

@end
