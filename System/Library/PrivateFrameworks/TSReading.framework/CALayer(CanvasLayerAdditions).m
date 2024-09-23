@implementation CALayer(CanvasLayerAdditions)

- (uint64_t)p_clearAllLayerDelegates
{
  char isKindOfClass;
  uint64_t result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "delegate");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if ((result & 1) == 0)
      return result;
  }
  else
  {
    objc_msgSend(a1, "setDelegate:", 0);
  }
  v4 = (void *)objc_msgSend(a1, "sublayers");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "p_clearAllLayerDelegates");
      }
      while (v5 != v7);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

@end
