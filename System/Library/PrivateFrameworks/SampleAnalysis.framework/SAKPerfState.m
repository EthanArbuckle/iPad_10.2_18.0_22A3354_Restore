@implementation SAKPerfState

- (void)nextSampleForThread:(int)a3 isOnCore:
{
  void *v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v5;
    if (a3)
      objc_msgSend(v4, "addObject:", v5);
    else
      objc_msgSend(v4, "removeObject:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentSampleTimestamp, 0);
  objc_storeStrong((id *)&self->_onCoreThreads, 0);
}

@end
