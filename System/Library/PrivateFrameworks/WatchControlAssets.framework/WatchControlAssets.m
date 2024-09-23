id WatchControlAssetsBundle()
{
  if (WatchControlAssetsBundle_onceToken != -1)
    dispatch_once(&WatchControlAssetsBundle_onceToken, &__block_literal_global);
  return (id)WatchControlAssetsBundle_bundle;
}

id WCImageForAssetName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  v2 = a1;
  WatchControlAssetsBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:withConfiguration:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

