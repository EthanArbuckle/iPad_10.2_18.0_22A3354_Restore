@implementation NSFileWrapper(SBFFileSizeCalculation)

- (uint64_t)sb_fileSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(a1, "isDirectory"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    objc_msgSend(a1, "fileWrappers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__NSFileWrapper_SBFFileSizeCalculation__sb_fileSize__block_invoke;
    v7[3] = &unk_1E200EC58;
    v7[4] = &v8;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);

    v3 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (objc_msgSend(a1, "isRegularFile"))
    {
      objc_msgSend(a1, "regularFileContents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

      return v5;
    }
    return 0;
  }
  return v3;
}

@end
