@implementation CATransformLayer(TSUEdgeAntialiasingUtility)

- (uint64_t)tsu_recursivelySetAllowsEdgeAntialiasing:()TSUEdgeAntialiasingUtility
{
  void *v4;
  uint64_t result;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(a1, "sublayers", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "tsu_recursivelySetAllowsEdgeAntialiasing:", a3);
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

@end
