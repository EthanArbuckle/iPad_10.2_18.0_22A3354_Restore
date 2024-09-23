@implementation UIAnimatedTextAttachment

void __33___UIAnimatedTextAttachment_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePresentationValues");

}

uint64_t __39___UIAnimatedTextAttachment_setBounds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setValue:", *(double *)(a1 + 64));
}

uint64_t __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setValue:", *(double *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeAllObjects", (_QWORD)v8);
}

uint64_t __67___UIAnimatedTextAttachment__initiateAnimationUsingSpringBehavior___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects", (_QWORD)v8);
}

@end
