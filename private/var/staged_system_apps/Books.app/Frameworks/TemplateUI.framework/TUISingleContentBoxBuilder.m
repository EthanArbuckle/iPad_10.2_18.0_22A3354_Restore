@implementation TUISingleContentBoxBuilder

- (unint64_t)checkContents:(id)a3
{
  id v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  void *i;
  void *v12;
  _BOOL4 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  NSMutableArray *v20;
  _BYTE v21[128];

  v3 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_38DAC;
  v19[3] = &unk_23DA88;
  v4 = objc_opt_new(NSMutableArray);
  v20 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    v10 = 1021;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "role") & 1) != 0)
        {
          v13 = objc_msgSend(v12, "role", (_QWORD)v15) == 0;
          if ((v13 & v8 & 1) != 0)
            goto LABEL_14;
          v8 |= v13;
        }
        else
        {
          if ((v8 & 1) != 0)
            goto LABEL_14;
          v8 = 1;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }
  v10 = 0;
LABEL_14:

  return v10;
}

@end
