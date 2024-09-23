@implementation CAMediaTimingFunction

uint64_t __69__CAMediaTimingFunction_TSDCAAnimationAdditions__TSD_valueAtPercent___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  float v17[2];
  float v18[2];
  float v19[2];
  float v20[2];
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v0 = *MEMORY[0x24BDE5D18];
  v21[0] = *MEMORY[0x24BDE5D10];
  v21[1] = v0;
  v1 = *MEMORY[0x24BDE5D28];
  v21[2] = *MEMORY[0x24BDE5D20];
  v21[3] = v1;
  v21[4] = *MEMORY[0x24BDE5D30];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 5);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
  if (result)
  {
    v4 = result;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      v8 = &TSD_valueAtPercent__s_TSDBezierPathsCacheArray[v5];
      v12 = v5;
      v9 = &TSD_valueAtPercent__s_CAMediaTimingFunctionsCacheArray[v5];
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v10 = (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
        objc_msgSend(v10, "getControlPointAtIndex:values:", 0, v20);
        objc_msgSend(v10, "getControlPointAtIndex:values:", 1, v19);
        objc_msgSend(v10, "getControlPointAtIndex:values:", 2, v18);
        objc_msgSend(v10, "getControlPointAtIndex:values:", 3, v17);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "moveToPoint:", v20[0], v20[1]);
        objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v17[0], v17[1], v19[0], v19[1], v18[0], v18[1]);
        v9[v7] = (uint64_t)v10;
        v8[v7++] = (uint64_t)v11;
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
      v4 = result;
      v5 = v12 + v7;
    }
    while (result);
  }
  return result;
}

@end
