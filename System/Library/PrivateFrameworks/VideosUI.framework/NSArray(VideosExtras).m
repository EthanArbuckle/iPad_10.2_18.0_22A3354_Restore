@implementation NSArray(VideosExtras)

- (uint64_t)ikAssetArraysEqual:()VideosExtras
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (v4 && (v5 = objc_msgSend(a1, "count"), v5 == objc_msgSend(v4, "count")))
  {
    objc_msgSend(a1, "ikAssetAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == objc_msgSend(v6, "count"))
    {
      objc_msgSend(v4, "ikAssetAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == objc_msgSend(v7, "count"))
        v8 = objc_msgSend(v6, "isEqualToArray:", v7);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)ikAssetAttributes
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__NSArray_VideosExtras__ikAssetAttributes__block_invoke;
  v6[3] = &unk_1E9FA4B60;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
