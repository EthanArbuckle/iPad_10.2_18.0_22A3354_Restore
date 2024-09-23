@implementation IMDebugViewHierarchyDataProvider

- (id)debugDataFileName
{
  return CFSTR("ViewHierarchy.txt");
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = &stru_10758;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__IMDebugViewHierarchyDataProvider_debugData__block_invoke;
  block[3] = &unk_10570;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6[5], "dataUsingEncoding:", 4));
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __45__IMDebugViewHierarchyDataProvider_debugData__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[DebugUtil allViewControllers](DebugUtil, "allViewControllers"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v8 = (objc_class *)objc_opt_class(v6);
        v9 = NSStringFromClass(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\nView Hierarchy for: %@\n"), v10));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", v11));
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recursiveDescription"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", v17));
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v3);
  }

}

@end
