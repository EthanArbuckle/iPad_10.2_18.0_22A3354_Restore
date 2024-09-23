@implementation _MapsSuggestionsEntryTwoLinesContentViewModel

- (void)dealloc
{
  objc_super v3;

  -[_MapsSuggestionsEntryTwoLinesContentViewModel setObservedEntry:](self, "setObservedEntry:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_MapsSuggestionsEntryTwoLinesContentViewModel;
  -[_BasicTwoLinesContentViewModel dealloc](&v3, "dealloc");
}

- (void)setObservedEntry:(id)a3
{
  MapsSuggestionsEntry *v5;
  MapsSuggestionsEntry **p_observedEntry;
  MapsSuggestionsEntry *observedEntry;
  MapsSuggestionsEntry *v8;

  v5 = (MapsSuggestionsEntry *)a3;
  p_observedEntry = &self->_observedEntry;
  observedEntry = self->_observedEntry;
  if (observedEntry != v5)
  {
    v8 = v5;
    -[MapsSuggestionsEntry removeObserver:forKeyPath:](observedEntry, "removeObserver:forKeyPath:", self, CFSTR("title"));
    -[MapsSuggestionsEntry removeObserver:forKeyPath:](*p_observedEntry, "removeObserver:forKeyPath:", self, CFSTR("subtitle"));
    objc_storeStrong((id *)&self->_observedEntry, a3);
    -[MapsSuggestionsEntry addObserver:forKeyPath:options:context:](*p_observedEntry, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 1, 0);
    -[MapsSuggestionsEntry addObserver:forKeyPath:options:context:](*p_observedEntry, "addObserver:forKeyPath:options:context:", self, CFSTR("subtitle"), 1, 0);
    v5 = v8;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[_MapsSuggestionsEntryTwoLinesContentViewModel observedEntry](self, "observedEntry"));
  if (v10 == v9)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("title")) & 1) != 0)
    {

    }
    else
    {
      v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("subtitle"));

      if ((v11 & 1) == 0)
        goto LABEL_3;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsSuggestionsEntryTwoLinesContentViewModel observedEntry](self, "observedEntry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    -[_BasicTwoLinesContentViewModel setTitleText:](self, "setTitleText:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsSuggestionsEntryTwoLinesContentViewModel observedEntry](self, "observedEntry"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subtitle"));
    -[_BasicTwoLinesContentViewModel setSubtitleText:](self, "setSubtitleText:", v15);

    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      -[_BasicTwoLinesContentViewModel updateObservers](self, "updateObservers");
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1008CBE64;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {

  }
LABEL_3:

}

- (BOOL)hasVibrantBackground
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MapsSuggestionsEntryTwoLinesContentViewModel observedEntry](self, "observedEntry"));
  v3 = objc_msgSend(v2, "hasVibrantBackground");

  return v3;
}

- (MapsSuggestionsEntry)observedEntry
{
  return self->_observedEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedEntry, 0);
}

@end
