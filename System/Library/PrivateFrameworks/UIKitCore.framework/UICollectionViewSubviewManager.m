@implementation UICollectionViewSubviewManager

uint64_t __50___UICollectionViewSubviewManager_hasVisibleCells__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

void __67___UICollectionViewSubviewManager_allVisibleViewsSubviewCollection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  -[_UICollectionViewSubviewCollection setView:ofKind:inCategory:atIndexPath:](*(_QWORD *)(a1 + 32), a5, a4, a2, a3);
}

uint64_t __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke_2;
  v5[3] = &unk_1E16DC728;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a4;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
}

void __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v6);
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
      v11 = *a4;
      **(_BYTE **)(a1 + 40) = v11;
      if (v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
