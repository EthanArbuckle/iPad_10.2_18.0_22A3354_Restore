@implementation PMPresentationIndexingMapper

- (void)mapWithState:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMPresentationIndexingMapper.mm"), 23, CFSTR("PowerPoint should go through the startMapping family of API instead"));

}

- (void)_indexTextBody:(id)a3 intoString:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(a3, "plainText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "appendString:", v5);
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }

}

- (void)_indexTable:(id)a3 intoString:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  for (i = 0; objc_msgSend(v12, "rowCount") > i; ++i)
  {
    objc_msgSend(v12, "rowAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; objc_msgSend(v8, "cellCount") > j; ++j)
    {
      objc_msgSend(v8, "cellAtIndex:", j);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMPresentationIndexingMapper _indexTextBody:intoString:](self, "_indexTextBody:intoString:", v11, v6);

    }
  }

}

- (void)_indexDrawable:(id)a3 intoString:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    for (i = 0; objc_msgSend(v10, "childCount") > i; ++i)
    {
      objc_msgSend(v10, "childAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMPresentationIndexingMapper _indexDrawable:intoString:](self, "_indexDrawable:intoString:", v8, v6);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "textBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMPresentationIndexingMapper _indexTextBody:intoString:](self, "_indexTextBody:intoString:", v9, v6);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PMPresentationIndexingMapper _indexTable:intoString:](self, "_indexTable:intoString:", v10, v6);
    }
  }

}

- (void)_indexSlide:(id)a3 intoString:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "drawables");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[PMPresentationIndexingMapper _indexDrawable:intoString:](self, "_indexDrawable:intoString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v6, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "isHidden") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMPresentationIndexingMapper _indexSlide:intoString:](self, "_indexSlide:intoString:", v9, v10);
      objc_msgSend(v8, "textContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v10);

    }
  }

}

@end
