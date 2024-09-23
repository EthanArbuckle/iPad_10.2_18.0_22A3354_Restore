@implementation USTrustIdentifierKeyedNonIntersectingIntervalsGetKeyOfEarliestIntersectionWithThreshold

void __USTrustIdentifierKeyedNonIntersectingIntervalsGetKeyOfEarliestIntersectionWithThreshold_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "intersectionWithDateInterval:", *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "duration");
          if (v13 >= *(double *)(a1 + 56))
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
              || (objc_msgSend(v12, "startDate"),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "startDate"),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(),
                  v16 = objc_msgSend(v14, "compare:", v15),
                  v15,
                  v14,
                  v16 == -1))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v12);
            }
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

@end
