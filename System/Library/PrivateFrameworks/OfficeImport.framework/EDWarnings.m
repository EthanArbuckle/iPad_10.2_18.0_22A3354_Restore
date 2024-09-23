@implementation EDWarnings

- (void)addWarning:(id)a3
{
  id v4;
  NSMutableArray *mWarnings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mWarnings = self->mWarnings;
  v8 = v4;
  if (!mWarnings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->mWarnings;
    self->mWarnings = v6;

    mWarnings = self->mWarnings;
    v4 = v8;
  }
  -[NSMutableArray addObject:](mWarnings, "addObject:", v4);

}

- (void)reportWarningsWithAssociatedObject:(id)a3
{
  NSMutableArray *mWarnings;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  mWarnings = self->mWarnings;
  if (mWarnings)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = mWarnings;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->mWarnings, "removeAllObjects");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWarnings, 0);
}

@end
