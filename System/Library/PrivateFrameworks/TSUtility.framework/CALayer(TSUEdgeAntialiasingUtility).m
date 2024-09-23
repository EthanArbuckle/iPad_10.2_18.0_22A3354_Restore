@implementation CALayer(TSUEdgeAntialiasingUtility)

- (uint64_t)tsu_recursivelySetAllowsEdgeAntialiasing:()TSUEdgeAntialiasingUtility
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "setAllowsEdgeAntialiasing:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_msgSend(a1, "sublayers", 0);
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "tsu_recursivelySetAllowsEdgeAntialiasing:", a3);
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

@end
