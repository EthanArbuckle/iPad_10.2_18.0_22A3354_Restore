@implementation _UITextSearchingFindSessionAggregator

- (_UITextSearchingFindSessionAggregator)initWithSession:(id)a3
{
  id v4;
  _UITextSearchingFindSessionAggregator *v5;
  _UITextSearchingFindSessionAggregator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextSearchingFindSessionAggregator;
  v5 = -[_UITextSearchingFindSessionAggregator init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_valid = 1;
    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v6;
}

- (void)_performOnMainIfValid:(id)a3
{
  void (**v4)(id, id);
  id WeakRetained;
  _QWORD block[4];
  void (**v7)(id, id);
  id v8;
  id to;

  v4 = (void (**)(id, id))a3;
  if (-[_UITextSearchingFindSessionAggregator isValid](self, "isValid"))
  {
    if (pthread_main_np() == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_session);
      v4[2](v4, WeakRetained);

    }
    else
    {
      objc_copyWeak(&to, (id *)&self->_session);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63___UITextSearchingFindSessionAggregator__performOnMainIfValid___block_invoke;
      block[3] = &unk_1E16C14D0;
      objc_copyWeak(&v8, &to);
      v7 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&to);
    }
  }

}

- (NSOrderedSet)allFoundRanges
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(WeakRetained, "_allFoundRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v3;
}

- (void)finishedSearching
{
  -[_UITextSearchingFindSessionAggregator _performOnMainIfValid:](self, "_performOnMainIfValid:", &__block_literal_global_512);
}

- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79___UITextSearchingFindSessionAggregator_foundRange_forSearchString_inDocument___block_invoke;
  v14[3] = &unk_1E16E35B0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_UITextSearchingFindSessionAggregator _performOnMainIfValid:](self, "_performOnMainIfValid:", v14);

}

- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73___UITextSearchingFindSessionAggregator_invalidateFoundRange_inDocument___block_invoke;
  v10[3] = &unk_1E16E35D8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_UITextSearchingFindSessionAggregator _performOnMainIfValid:](self, "_performOnMainIfValid:", v10);

}

- (void)invalidate
{
  -[_UITextSearchingFindSessionAggregator _performOnMainIfValid:](self, "_performOnMainIfValid:", &__block_literal_global_141_1);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (UITextSearchingFindSession)session
{
  return (UITextSearchingFindSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

@end
