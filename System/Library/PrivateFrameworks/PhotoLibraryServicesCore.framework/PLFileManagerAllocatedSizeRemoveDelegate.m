@implementation PLFileManagerAllocatedSizeRemoveDelegate

- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0C99AC0];
  v5 = v14;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceValuesForKeys:error:", v8, 0, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  v12 = vdupq_n_s64(1uLL);
  v12.i64[0] = v11;
  *(int64x2_t *)&self->_totalFileAllocatedSize = vaddq_s64(*(int64x2_t *)&self->_totalFileAllocatedSize, v12);

  return 1;
}

- (int64_t)totalFileAllocatedSize
{
  return self->_totalFileAllocatedSize;
}

- (unint64_t)count
{
  return self->_count;
}

@end
