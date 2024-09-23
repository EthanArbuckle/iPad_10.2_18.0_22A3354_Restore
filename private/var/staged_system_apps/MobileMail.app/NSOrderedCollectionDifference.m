@implementation NSOrderedCollectionDifference

- (id)mf_groupedInsertionsForCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _BYTE v26[128];

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedCollectionDifference insertions](self, "insertions"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003A50C;
    v23[3] = &unk_100523578;
    v24 = v18;
    v7 = v6;
    v25 = v7;
    v8 = objc_retainBlock(v23);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedCollectionDifference insertions](self, "insertions"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    v11 = 0;
    if (!v10)
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_17;
    }
    v12 = *(_QWORD *)v20;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "index");
LABEL_10:
          ++v11;
          continue;
        }
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "index") == (id)(v13 + v11))
          goto LABEL_10;
        ((void (*)(_QWORD *, uint64_t, uint64_t))v8[2])(v8, v13, v11);
        v13 = (uint64_t)objc_msgSend(v15, "index");
        v11 = 1;
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (!v10)
      {
LABEL_17:

        ((void (*)(_QWORD *, uint64_t, uint64_t))v8[2])(v8, v13, v11);
        v16 = v7;

        goto LABEL_18;
      }
    }
  }
  v16 = &__NSArray0__struct;
LABEL_18:

  return v16;
}

@end
