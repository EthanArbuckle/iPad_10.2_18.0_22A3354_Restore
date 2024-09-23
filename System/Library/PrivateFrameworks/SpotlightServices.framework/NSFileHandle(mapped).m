@implementation NSFileHandle(mapped)

- (id)prs_mappedData
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  stat v8;

  v2 = objc_msgSend(a1, "fileDescriptor");
  memset(&v8, 0, sizeof(v8));
  if (fstat(v2, &v8) || (v4 = mmap(0, v8.st_size, 1, 1, v2, 0)) == 0)
  {
    objc_msgSend(a1, "readDataToEndOfFile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    v3 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:deallocator:", v5, v8.st_size, &__block_literal_global_0);
  }
  return v3;
}

@end
