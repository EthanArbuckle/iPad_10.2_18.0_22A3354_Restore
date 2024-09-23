@implementation WBSTranslationErrorController

- (WBSTranslationErrorController)init
{
  WBSTranslationErrorController *v2;
  uint64_t v3;
  NSCountedSet *errorCounter;
  uint64_t v5;
  NSMutableSet *errorKeysReachingThreshold;
  WBSTranslationErrorController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSTranslationErrorController;
  v2 = -[WBSTranslationErrorController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    errorCounter = v2->_errorCounter;
    v2->_errorCounter = (NSCountedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    errorKeysReachingThreshold = v2->_errorKeysReachingThreshold;
    v2->_errorKeysReachingThreshold = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)addError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id WeakRetained;
  id v14;

  v4 = a3;
  v14 = v4;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%ld"), v6, objc_msgSend(v14, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[NSCountedSet addObject:](self->_errorCounter, "addObject:", v7);
  v8 = -[NSCountedSet countForObject:](self->_errorCounter, "countForObject:", v7);
  -[WBSTranslationErrorController _overriddenThresholdForError:](self, "_overriddenThresholdForError:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "BOOLForKey:", CFSTR("WBSTranslationLowErrorAlertThresholdSettingsKey")))
      v11 = 1;
    else
      v11 = 5;

  }
  if (v8 >= v11 && (-[NSMutableSet containsObject:](self->_errorKeysReachingThreshold, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_errorKeysReachingThreshold, "addObject:", v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "errorController:didReachThresholdForError:", self, v14);

  }
}

- (void)invalidate
{
  -[NSCountedSet removeAllObjects](self->_errorCounter, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_errorKeysReachingThreshold, "removeAllObjects");
}

- (id)_overriddenThresholdForError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEF810]))
    v4 = &unk_1E547A188;
  else
    v4 = 0;

  return v4;
}

- (WBSTranslationErrorControllerDelegate)delegate
{
  return (WBSTranslationErrorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_errorKeysReachingThreshold, 0);
  objc_storeStrong((id *)&self->_errorCounter, 0);
}

@end
