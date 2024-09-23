@implementation TVPInterstitialCollection

- (TVPInterstitialCollection)initWithInterstitials:(id)a3
{
  id v4;
  TVPInterstitialCollection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *interstitials;
  TVPInterstitialCollection *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSArray *interstitialsWithAdjacentsMerged;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, unint64_t);
  void *v19;
  TVPInterstitialCollection *v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[4];
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TVPInterstitialCollection;
  v5 = -[TVPInterstitialCollection init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_interstitials, v6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSArray count](v5->_interstitials, "count");
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    interstitials = v5->_interstitials;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __51__TVPInterstitialCollection_initWithInterstitials___block_invoke_2;
    v19 = &unk_24F15B878;
    v23 = v8;
    v10 = v5;
    v20 = v10;
    v22 = v24;
    v11 = v7;
    v21 = v11;
    -[NSArray enumerateObjectsUsingBlock:](interstitials, "enumerateObjectsUsingBlock:", &v16);
    v12 = objc_alloc(MEMORY[0x24BDBCE30]);
    v13 = objc_msgSend(v12, "initWithArray:", v11, v16, v17, v18, v19);
    interstitialsWithAdjacentsMerged = v10->_interstitialsWithAdjacentsMerged;
    v10->_interstitialsWithAdjacentsMerged = (NSArray *)v13;

    _Block_object_dispose(v24, 8);
  }

  return v5;
}

uint64_t __51__TVPInterstitialCollection_initWithInterstitials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "timeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTime");
  v7 = v6;

  objc_msgSend(v4, "timeRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startTime");
  v10 = v9;

  if (v7 < v10)
    return -1;
  else
    return v7 > v10;
}

void __51__TVPInterstitialCollection_initWithInterstitials___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  TVPMutableInterstitial *v14;
  TVPTimeRange *v15;
  double v16;
  void *v17;
  double v18;
  TVPTimeRange *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  if (*(_QWORD *)(a1 + 56) - 1 <= a3)
  {
    v5 = 0;
    if (!a3)
      goto LABEL_7;
LABEL_5:
    if (v5)
      goto LABEL_8;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a3 + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    goto LABEL_5;
LABEL_7:
  objc_msgSend(v22, "timeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  if (v5)
  {
LABEL_8:
    objc_msgSend(v5, "timeRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startTime");
    v10 = v9;
    objc_msgSend(v22, "timeRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endTime");
    v13 = v12;

    if (v10 == v13)
      goto LABEL_13;
  }
LABEL_9:
  v14 = objc_alloc_init(TVPMutableInterstitial);
  v15 = [TVPTimeRange alloc];
  v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v22, "timeRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endTime");
  v19 = -[TVPTimeRange initWithStartTime:endTime:](v15, "initWithStartTime:endTime:", v16, v18);

  -[TVPInterstitial setTimeRange:](v14, "setTimeRange:", v19);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startTime");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v21;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

LABEL_13:
}

- (double)timeAdjustedByRemovingInterstitials:(double)a3
{
  NSArray *interstitials;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  interstitials = self->_interstitials;
  if (interstitials)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = interstitials;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      v9 = 0.0;
      v10 = 0.0;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        objc_msgSend(v12, "timeRange", (_QWORD)v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startTime");
        v15 = v14 - v10;

        if (a3 <= v15)
          break;
        objc_msgSend(v12, "timeRange");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "endTime");
        v18 = v17;
        objc_msgSend(v12, "timeRange");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startTime");
        v21 = a3 - (v18 - v20);

        if (v21 - v15 >= 0.0)
          a3 = v21 - v15;
        else
          a3 = 0.0;
        v9 = v9 + v15;
        objc_msgSend(v12, "timeRange");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "endTime");
        v10 = v23;

        if (v7 == ++v11)
        {
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v9 = 0.0;
    }

    return v9 + a3;
  }
  return a3;
}

- (double)timeAdjustedByIncludingInterstitials:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_interstitials;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = 0.0;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      objc_msgSend(v10, "timeRange", (_QWORD)v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startTime");
      v13 = v12;

      if (v8 + a3 <= v13)
        break;
      objc_msgSend(v10, "timeRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startTime");
      a3 = a3 - (v15 - v8);

      objc_msgSend(v10, "timeRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endTime");
      v8 = v17;

      if (v6 == ++v9)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0.0;
  }

  return v8 + a3;
}

- (id)interstitialForTime:(double)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TVPInterstitialCollection interstitials](self, "interstitials", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "timeRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsTime:", a3);

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)mergedInterstitialForTime:(double)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TVPInterstitialCollection interstitialsWithAdjacentsMerged](self, "interstitialsWithAdjacentsMerged", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "timeRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsTime:", a3);

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (NSArray)interstitials
{
  return self->_interstitials;
}

- (void)setInterstitials:(id)a3
{
  objc_storeStrong((id *)&self->_interstitials, a3);
}

- (NSArray)interstitialsWithAdjacentsMerged
{
  return self->_interstitialsWithAdjacentsMerged;
}

- (void)setInterstitialsWithAdjacentsMerged:(id)a3
{
  objc_storeStrong((id *)&self->_interstitialsWithAdjacentsMerged, a3);
}

- (id)backingData
{
  return self->_backingData;
}

- (void)setBackingData:(id)a3
{
  objc_storeStrong(&self->_backingData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingData, 0);
  objc_storeStrong((id *)&self->_interstitialsWithAdjacentsMerged, 0);
  objc_storeStrong((id *)&self->_interstitials, 0);
}

@end
