@implementation UIAvoidanceLargestArea

- (id)avoid:(id)a3 forClient:(id)a4 withCoordinator:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "unionSet:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "avoidanceFrame");
  FindRectanglesAroundRectangles(v8, v9, v15, v16, v17, v18);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_27);
  objc_msgSend(v8, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __58__UIAvoidanceLargestArea_avoid_forClient_withCoordinator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(a2, "CGRectValue");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "CGRectValue");
  v10 = v9;
  v12 = v11;

  if (v6 * v8 < v10 * v12)
    return -1;
  else
    return v6 * v8 > v10 * v12;
}

@end
