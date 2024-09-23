@implementation TIWordSearchController

- (TIWordSearchController)init
{
  TIWordSearchController *v2;
  uint64_t v3;
  NSMapTable *inputModeToWordSearchMapping;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIWordSearchController;
  v2 = -[TIWordSearchController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 16);
    inputModeToWordSearchMapping = v2->_inputModeToWordSearchMapping;
    v2->_inputModeToWordSearchMapping = (NSMapTable *)v3;

  }
  return v2;
}

- (void)setWordSearch:(id)a3 forInputMode:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "normalizedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v6)
  {
    -[TIWordSearchController inputModeToWordSearchMapping](self, "inputModeToWordSearchMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

- (id)wordSearchForInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  -[TIWordSearchController inputModeToWordSearchMapping](self, "inputModeToWordSearchMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "normalizedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TICanonicalInputModeName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)TIInputManagerClassForInputMode();

    if ((objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
      || objc_msgSend(v5, "hasSuffix:", CFSTR("HWR")))
    {
      v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "performSelector:", sel_wordSearchClass)), "initTIWordSearchWithInputMode:", v4);
      -[TIWordSearchController inputModeToWordSearchMapping](self, "inputModeToWordSearchMapping");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v7, v5);

      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
  }
LABEL_7:

  return v7;
}

- (void)reset
{
  id v2;

  -[TIWordSearchController inputModeToWordSearchMapping](self, "inputModeToWordSearchMapping");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMapTable)inputModeToWordSearchMapping
{
  return self->_inputModeToWordSearchMapping;
}

- (void)setInputModeToWordSearchMapping:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeToWordSearchMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModeToWordSearchMapping, 0);
}

+ (id)sharedWordSearchController
{
  if (sharedWordSearchController___onceToken != -1)
    dispatch_once(&sharedWordSearchController___onceToken, &__block_literal_global_15961);
  return (id)sharedWordSearchController___sharedInstance;
}

void __52__TIWordSearchController_sharedWordSearchController__block_invoke()
{
  TIWordSearchController *v0;
  void *v1;

  v0 = objc_alloc_init(TIWordSearchController);
  v1 = (void *)sharedWordSearchController___sharedInstance;
  sharedWordSearchController___sharedInstance = (uint64_t)v0;

}

@end
