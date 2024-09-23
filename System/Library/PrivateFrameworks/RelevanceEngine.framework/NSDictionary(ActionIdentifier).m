@implementation NSDictionary(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v1);
        objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v4 ^= objc_msgSend(v7, "re_actionIdentifierHashValue");

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
