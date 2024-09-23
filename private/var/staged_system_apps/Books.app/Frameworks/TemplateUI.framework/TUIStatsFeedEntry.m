@implementation TUIStatsFeedEntry

- (TUIStatsFeedEntry)initWithCollector:(id)a3
{
  id v4;
  TUIStatsFeedEntry *v5;
  uint64_t i;
  double v7;
  uint64_t j;
  void *v9;
  NSArray *v10;
  NSArray *passes;
  NSArray *v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *k;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUIStatsFeedEntry;
  v5 = -[TUIStatsFeedEntry init](&v25, "init");
  if (v5)
  {
    for (i = 0; i != 5; ++i)
    {
      objc_msgSend(v4, "elapsedTimeForPhase:", i);
      v5->_elapsedTime[i] = v7;
    }
    for (j = 0; j != 29; ++j)
      v5->_eventCount[j] = (unint64_t)objc_msgSend(v4, "countForEvent:", j);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passes"));
    v10 = (NSArray *)objc_msgSend(v9, "copy");
    passes = v5->_passes;
    v5->_passes = v10;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v5->_passes;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v14; k = (char *)k + 1)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)k);
          if (((unint64_t)objc_msgSend(v19, "reason", (_QWORD)v21) & 0xE) != 0)
            ++v15;
          else
            v16 += (unint64_t)objc_msgSend(v19, "reason") & 1;
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }

    v5->_numberOfFullPasses = v15;
    v5->_numberOfPartialPasses = v16;
  }

  return v5;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (NSArray)passes
{
  return self->_passes;
}

- (unint64_t)numberOfFullPasses
{
  return self->_numberOfFullPasses;
}

- (unint64_t)numberOfPartialPasses
{
  return self->_numberOfPartialPasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passes, 0);
}

@end
