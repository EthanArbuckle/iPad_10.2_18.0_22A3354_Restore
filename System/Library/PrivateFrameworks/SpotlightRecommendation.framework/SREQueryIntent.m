@implementation SREQueryIntent

+ (id)queryIntentWithGenres:(id)a3
{
  id v3;
  SREQueryIntent *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(SREQueryIntent);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[SREQueryIntent setGenres:](v4, "setGenres:", v5);
  return v4;
}

- (SREQueryIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SREQueryIntent;
  return -[SREQueryIntent init](&v3, sel_init);
}

- (NSSet)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
  objc_storeStrong((id *)&self->_genres, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genres, 0);
}

@end
