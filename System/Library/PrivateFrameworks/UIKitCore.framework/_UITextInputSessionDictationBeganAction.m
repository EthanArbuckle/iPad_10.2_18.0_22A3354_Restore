@implementation _UITextInputSessionDictationBeganAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  v5 = -[_UITextInputSessionAction source](self, "source");
  if (v5 == objc_msgSend(v4, "source"))
  {
    objc_msgSend(v4, "asDictationBegan");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[_UITextInputSessionDictationBeganAction setDictationBeganCount:](self, "setDictationBeganCount:", -[_UITextInputSessionDictationBeganAction dictationBeganCount](self, "dictationBeganCount")+ objc_msgSend(v6, "dictationBeganCount"));
      -[_UITextInputSessionDictationBeganAction setModelessUsedAtLeastOnceCount:](self, "setModelessUsedAtLeastOnceCount:", -[_UITextInputSessionDictationBeganAction modelessUsedAtLeastOnceCount](self, "modelessUsedAtLeastOnceCount")+ objc_msgSend(v7, "modelessUsedAtLeastOnceCount"));
      -[_UITextInputSessionDictationBeganAction setMultiModalDictationBeganCount:](self, "setMultiModalDictationBeganCount:", -[_UITextInputSessionDictationBeganAction multiModalDictationBeganCount](self, "multiModalDictationBeganCount")+ objc_msgSend(v7, "multiModalDictationBeganCount"));
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UITextInputSessionDictationBeganAction;
  -[_UITextInputSessionAction description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dictationBeganCount=%lu"), -[_UITextInputSessionDictationBeganAction dictationBeganCount](self, "dictationBeganCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("modelessUsedAtLeastOnceCount=%lu"), -[_UITextInputSessionDictationBeganAction modelessUsedAtLeastOnceCount](self, "modelessUsedAtLeastOnceCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("multiModalDictationBeganCount=%lu"), -[_UITextInputSessionDictationBeganAction multiModalDictationBeganCount](self, "multiModalDictationBeganCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)dictationBeganCount
{
  return self->_dictationBeganCount;
}

- (void)setDictationBeganCount:(unint64_t)a3
{
  self->_dictationBeganCount = a3;
}

- (unint64_t)modelessUsedAtLeastOnceCount
{
  return self->_modelessUsedAtLeastOnceCount;
}

- (void)setModelessUsedAtLeastOnceCount:(unint64_t)a3
{
  self->_modelessUsedAtLeastOnceCount = a3;
}

- (unint64_t)multiModalDictationBeganCount
{
  return self->_multiModalDictationBeganCount;
}

- (void)setMultiModalDictationBeganCount:(unint64_t)a3
{
  self->_multiModalDictationBeganCount = a3;
}

@end
