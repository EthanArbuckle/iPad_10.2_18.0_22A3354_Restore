@implementation TSWPDataDetectors

+ (void)registerDataDetectorClass:(Class)a3
{
  id v4;

  if (class_conformsToProtocol(a3, (Protocol *)&unk_254FA73F0))
  {
    v4 = (id)gRegisteredDataDetectors;
    if (!gRegisteredDataDetectors)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      gRegisteredDataDetectors = (uint64_t)v4;
    }
    objc_msgSend(v4, "addObject:", a3);
  }
}

+ (id)calculateScanRanges:(id)a3 changedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  length = a4.length;
  location = a4.location;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)gRegisteredDataDetectors;
  v8 = objc_msgSend((id)gRegisteredDataDetectors, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "calculateScanRangeForString:changedRange:", a3, location, length);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v13, v14), objc_msgSend(v12, "detectorIdentifier"));
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  return v7;
}

+ (id)scanString:(id)a3 scanRanges:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)gRegisteredDataDetectors;
  v8 = objc_msgSend((id)gRegisteredDataDetectors, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v12, "detectorIdentifier")), "rangeValue");
        if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0)
        {
          v16 = objc_msgSend(v12, "scanString:scanRange:", a3, v13, v14);
          if (v16)
            objc_msgSend(v6, "addObjectsFromArray:", v16);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  return v6;
}

@end
