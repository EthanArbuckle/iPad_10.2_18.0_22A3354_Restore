@implementation STStatusBarDataEntry(Testing)

+ (id)entryWithKey:()Testing updatedKeys:enabledKeys:
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a4, "containsObject:", v8))
  {
    if (objc_msgSend(v9, "containsObject:", v8))
      objc_msgSend(a1, "entry");
    else
      objc_msgSend(a1, "disabledEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)entryWithKey:()Testing updatedKeys:enabledKeys:populatedEntry:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a4, "containsObject:", v10))
  {
    if ((objc_msgSend(v11, "containsObject:", v10) & 1) == 0)
    {
      objc_msgSend(a1, "disabledEntry");
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
    v14 = v12;
    v12 = v14;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
