@implementation PTLogObjectForTopic

void __PTLogObjectForTopic_block_invoke()
{
  void *v0;
  uint64_t i;
  const char *v2;
  const char *v3;
  os_log_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    if (i == 1)
      v2 = "domain";
    else
      v2 = "settings";
    if (i == 2)
      v3 = "server";
    else
      v3 = v2;
    v4 = os_log_create("PrototypeTools", v3);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setObject:forKey:", v4, v5);

    }
  }
  v6 = (void *)PTLogObjectForTopic___logObjects;
  PTLogObjectForTopic___logObjects = (uint64_t)v0;

}

@end
