@implementation _RERelevanceEngineObserverWrapper

- (_RERelevanceEngineObserverWrapper)initWithObserver:(id)a3
{
  id v4;
  _RERelevanceEngineObserverWrapper *v5;
  _RERelevanceEngineObserverWrapper *v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_RERelevanceEngineObserverWrapper;
  v5 = -[_RERelevanceEngineObserverWrapper init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFFD | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFF7 | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFEF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFFBF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFF7F | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 256;
    else
      v14 = 0;
    *(_WORD *)&v6->_observerCallbacks = *(_WORD *)&v6->_observerCallbacks & 0xFEFF | v14;
  }

  return v6;
}

- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v11 = WeakRetained;
  if (WeakRetained && (*(_WORD *)&self->_observerCallbacks & 1) != 0)
  {
    objc_msgSend(WeakRetained, "relevanceEngine:performBatchUpdateBlock:completion:", v12, v8, v9);
  }
  else
  {
    if (v8)
      v8[2](v8);
    if (v9)
      v9[2](v9);
  }

}

- (void)relevanceEngine:(id)a3 didReloadElement:(id)a4 atPath:(id)a5
{
  RERelevanceEngineObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 2) != 0)
  {
    p_observer = &self->_observer;
    v8 = a5;
    v9 = a4;
    v10 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngine:didReloadElement:atPath:", v10, v9, v8);

  }
}

- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5
{
  RERelevanceEngineObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 4) != 0)
  {
    p_observer = &self->_observer;
    v8 = a5;
    v9 = a4;
    v10 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngine:didRemoveElement:atPath:", v10, v9, v8);

  }
}

- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5
{
  RERelevanceEngineObserver **p_observer;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 8) != 0)
  {
    p_observer = &self->_observer;
    v8 = a5;
    v9 = a4;
    v10 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngine:didInsertElement:atPath:", v10, v9, v8);

  }
}

- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6
{
  RERelevanceEngineObserver **p_observer;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 0x10) != 0)
  {
    p_observer = &self->_observer;
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngine:didMoveElement:fromPath:toPath:", v13, v12, v11, v10);

  }
}

- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v9 = WeakRetained;
  if (WeakRetained && (*(_WORD *)&self->_observerCallbacks & 0x20) != 0)
    v10 = objc_msgSend(WeakRetained, "relevanceEngine:isElementAtPathVisible:", v6, v7);
  else
    v10 = 0;

  return v10;
}

- (void)relevanceEngine:(id)a3 didUpdateRelevanceForElement:(id)a4
{
  RERelevanceEngineObserver **p_observer;
  id v6;
  id v7;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 0x40) != 0)
  {
    p_observer = &self->_observer;
    v6 = a4;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngine:didUpdateRelevanceForElement:", v7, v6);

  }
}

- (void)relevanceEngineDidBeginUpdatingRelevance:(id)a3
{
  RERelevanceEngineObserver **p_observer;
  id v4;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 0x80) != 0)
  {
    p_observer = &self->_observer;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngineDidBeginUpdatingRelevance:", v4);

  }
}

- (void)relevanceEngineDidFinishUpdatingRelevance:(id)a3
{
  RERelevanceEngineObserver **p_observer;
  id v4;
  id WeakRetained;

  if ((*(_WORD *)&self->_observerCallbacks & 0x100) != 0)
  {
    p_observer = &self->_observer;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_observer);
    objc_msgSend(WeakRetained, "relevanceEngineDidFinishUpdatingRelevance:", v4);

  }
}

- (RERelevanceEngineObserver)observer
{
  return (RERelevanceEngineObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

@end
