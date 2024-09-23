@implementation NSMutableArray

uint64_t __79__NSMutableArray_OSABinaryImageListExtension__sortByAddressAndSetInferredSizes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "symbolInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "start");
  objc_msgSend(v5, "symbolInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= objc_msgSend(v8, "start"))
  {
    objc_msgSend(v4, "symbolInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "start");
    objc_msgSend(v5, "symbolInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11 != objc_msgSend(v12, "start");

  }
  else
  {
    v9 = -1;
  }

  return v9;
}

@end
