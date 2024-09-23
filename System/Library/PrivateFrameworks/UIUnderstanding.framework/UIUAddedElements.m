@implementation UIUAddedElements

- (UIUAddedElements)initWithContents:(id)a3
{
  AddedElementsCompat *v4;
  UIUAddedElements *v5;
  AddedElementsCompat *underlyingObject;
  objc_super v8;

  v4 = (AddedElementsCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIUAddedElements;
  v5 = -[UIUAddedElements init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (NSArray)results
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIUDedupeElement *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIUAddedElements underlyingObject](self, "underlyingObject", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dedupeElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = -[UIUDedupeElement initWithContents:]([UIUDedupeElement alloc], "initWithContents:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSString)groupID
{
  void *v2;
  void *v3;

  -[UIUAddedElements underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (AddedElementsCompat)underlyingObject
{
  return (AddedElementsCompat *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
