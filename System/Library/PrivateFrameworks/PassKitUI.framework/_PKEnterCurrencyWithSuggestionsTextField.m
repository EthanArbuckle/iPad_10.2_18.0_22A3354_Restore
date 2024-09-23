@implementation _PKEnterCurrencyWithSuggestionsTextField

- (void)setInputDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _PKEnterCurrencyWithSuggestionsTextField *v8;
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PKEnterCurrencyWithSuggestionsTextField;
  -[_PKEnterCurrencyWithSuggestionsTextField setInputDelegate:](&v11, sel_setInputDelegate_, v4);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61___PKEnterCurrencyWithSuggestionsTextField_setInputDelegate___block_invoke;
  v6[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, &location);
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)insertTextSuggestion:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_PKEnterCurrencyWithSuggestionsTextField setText:](self, "setText:", &stru_1E3E7D690);
  -[_PKEnterCurrencyWithSuggestionsTextField delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "inputText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "textField:shouldChangeCharactersInRange:replacementString:", self, 0, 0, v5);

    if (v6)
    {
      objc_msgSend(v8, "inputText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PKEnterCurrencyWithSuggestionsTextField setText:](self, "setText:", v7);

    }
  }

}

- (_PKEnterCurrencyWithSuggestionsTextFieldDataSource)suggestionsDataSource
{
  return (_PKEnterCurrencyWithSuggestionsTextFieldDataSource *)objc_loadWeakRetained((id *)&self->_suggestionsDataSource);
}

- (void)setSuggestionsDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionsDataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionsDataSource);
}

@end
