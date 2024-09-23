@implementation UIApplicationEndBackgroundTask

void ___UIApplicationEndBackgroundTask_block_invoke(_QWORD *a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = qword_1ECD7DED8;
  if (!qword_1ECD7DED8)
  {
    v2 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&qword_1ECD7DED8);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[7];
    v5 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138478339;
    v16 = v5;
    v17 = 2048;
    v18 = v4;
    v19 = 2113;
    v20 = v6;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Decrementing reference count for assertion %{private}@ (used by background task with identifier %lu: %{private}@)", buf, 0x20u);
  }
  v7 = (void *)qword_1ECD7DEB0;
  v8 = (void *)a1[4];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___UIApplicationEndBackgroundTask_block_invoke_65;
  v11[3] = &unk_1E16C8D08;
  v9 = v8;
  v10 = a1[7];
  v13 = a1[6];
  v14 = v10;
  v12 = v9;
  objc_msgSend(v7, "decrementReferenceForObject:invalidationHandler:", v9, v11);

}

uint64_t ___UIApplicationEndBackgroundTask_block_invoke_65(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)qword_1ECD7DEA8;
  if (qword_1ECD7DEA8 == a1[4])
  {
    qword_1ECD7DEA8 = 0;

  }
  v3 = qword_1ECD7DEE0;
  if (!qword_1ECD7DEE0)
  {
    v3 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&qword_1ECD7DEE0);
  }
  v4 = *(NSObject **)(v3 + 8);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  v6 = (void *)a1[4];
  if (v5)
  {
    v7 = a1[6];
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Will invalidate assertion: %@ for task identifier: %lu", (uint8_t *)&v9, 0x16u);
    v6 = (void *)a1[4];
  }
  result = objc_msgSend(v6, "invalidate");
  if (!qword_1ECD7DEA8)
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  return result;
}

@end
