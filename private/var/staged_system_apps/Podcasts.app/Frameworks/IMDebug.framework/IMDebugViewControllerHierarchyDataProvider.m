@implementation IMDebugViewControllerHierarchyDataProvider

- (id)debugDataFileName
{
  return CFSTR("ViewControllerHierarchy.txt");
}

- (id)debugData
{
  void *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  __CFString *v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = &stru_10758;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55__IMDebugViewControllerHierarchyDataProvider_debugData__block_invoke;
  block[3] = &unk_10570;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6[5], "dataUsingEncoding:", 4));
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __55__IMDebugViewControllerHierarchyDataProvider_debugData__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUtil allViewControllers](DebugUtil, "allViewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", CFSTR("\n\n")));
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recursiveDescription"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", v12));
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

@end
