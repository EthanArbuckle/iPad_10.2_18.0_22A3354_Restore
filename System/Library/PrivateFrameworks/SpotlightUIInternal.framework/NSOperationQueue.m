@implementation NSOperationQueue

void __69__NSOperationQueue_SPUIAdditions__logStateOperationCountGreaterThan___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "operationCount") > *(_QWORD *)(a1 + 40))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "operations");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      LODWORD(v5) = 0;
      LODWORD(v6) = 0;
      LODWORD(v7) = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v2);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          v7 = v7 + objc_msgSend(v10, "isExecuting");
          v5 = v5 + objc_msgSend(v10, "isCancelled");
          v6 = v6 + objc_msgSend(v10, "isFinished");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
    }

    NSLog(CFSTR("******** Queue State: count:%d [active:%d cancel:%d finished:%d]"), objc_msgSend(*(id *)(a1 + 32), "operationCount"), v7, v5, v6);
  }
}

@end
