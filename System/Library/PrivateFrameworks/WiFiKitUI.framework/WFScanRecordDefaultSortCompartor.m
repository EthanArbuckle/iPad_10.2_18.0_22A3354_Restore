@implementation WFScanRecordDefaultSortCompartor

uint64_t __WFScanRecordDefaultSortCompartor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isInstantHotspot") && !objc_msgSend(v5, "isInstantHotspot"))
    goto LABEL_11;
  if ((objc_msgSend(v4, "isInstantHotspot") & 1) == 0 && (objc_msgSend(v5, "isInstantHotspot") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_8;
  }
  objc_msgSend(v5, "title");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_8:
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "localizedCaseInsensitiveCompare:", v11);

        goto LABEL_13;
      }
LABEL_12:
      v7 = 1;
      goto LABEL_13;
    }
LABEL_11:
    v7 = -1;
  }
LABEL_13:

  return v7;
}

@end
