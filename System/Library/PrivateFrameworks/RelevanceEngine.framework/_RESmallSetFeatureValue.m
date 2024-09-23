@implementation _RESmallSetFeatureValue

- (_RESmallSetFeatureValue)initWithSet:(id)a3
{
  id v4;
  _RESmallSetFeatureValue *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_RESmallSetFeatureValue;
  v5 = -[_RESmallSetFeatureValue init](&v18, sel_init);
  if (!v5)
    goto LABEL_13;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (!v7)
  {

    v9 = 0;
    do
    {
LABEL_12:
      v12 = v9;
      v5->_values[v9] = 0;
      v9 = 1;
    }
    while (!v12);
    goto LABEL_13;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v6);
      v5->_values[v9 + i] = RECreateFeatureValueTaggedPointer(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i));
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    v9 += i;
  }
  while (v8);

  if (v9 <= 1)
    goto LABEL_12;
LABEL_13:

  return v5;
}

- (id)setValue
{
  void *v3;
  uint64_t v4;
  unint64_t *values;
  char v6;
  char v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  values = self->_values;
  v6 = 1;
  do
  {
    v7 = v6;
    REFeatureValueForTaggedPointer((void *)values[v4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "addObject:", v8);

    v6 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

@end
