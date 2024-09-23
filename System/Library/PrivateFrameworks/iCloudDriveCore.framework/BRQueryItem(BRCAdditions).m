@implementation BRQueryItem(BRCAdditions)

- (unint64_t)_isAppLibraryTrashFolder
{
  return ((unint64_t)*(unsigned int *)(a1 + (int)*MEMORY[0x24BE17720]) >> 30) & 1;
}

- (id)asFileProviderItem
{
  void *v2;
  double v3;
  char busy;
  void *v5;
  uint64_t v6;
  id v7;

  if ((objc_msgSend(a1, "isDead") & 1) != 0)
    goto LABEL_6;
  if ((objc_msgSend(a1, "_isAppLibraryTrashFolder") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(a1, "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  busy = BRCIsBusyDate((uint64_t)v3);

  if ((busy & 1) != 0
    || (objc_msgSend(a1, "filename"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        !v6))
  {
LABEL_6:
    v7 = 0;
  }
  else
  {
    v7 = a1;
  }
  return v7;
}

@end
