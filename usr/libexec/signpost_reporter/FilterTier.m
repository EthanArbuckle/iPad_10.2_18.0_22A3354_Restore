@implementation FilterTier

- (id)entryForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier keyForChildren:](self, "keyForChildren:", v4));
  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier childTiers](self, "childTiers")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5)),
        v6,
        !v7)
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entryForQuery:", v4)), v7, !v8))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier downsampleEntry](self, "downsampleEntry"));
  }

  return v8;
}

- (id)keyForChildren:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[FilterTier keyForChildren:]", "SRSubsystemCategoryNameFilter.m", 121, "false");
}

- (id)newChildInstance
{
  __assert_rtn("-[FilterTier newChildInstance]", "SRSubsystemCategoryNameFilter.m", 127, "false");
}

- (void)setCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4 forQuery:(id)a5
{
  void *v8;
  void *v9;
  SRDownsampleEntry *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier keyForChildren:](self, "keyForChildren:"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier childTiers](self, "childTiers"));
    v10 = (SRDownsampleEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

    if (!v10)
    {
      v10 = -[FilterTier newChildInstance](self, "newChildInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier childTiers](self, "childTiers"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

    }
    -[SRDownsampleEntry setCap:downsampleRatio:forQuery:](v10, "setCap:downsampleRatio:forQuery:", a3, a4, v12);
  }
  else
  {
    v10 = -[SRDownsampleEntry initWithCap:downsampleRatio:]([SRDownsampleEntry alloc], "initWithCap:downsampleRatio:", a3, a4);
    -[FilterTier setDownsampleEntry:](self, "setDownsampleEntry:", v10);
  }

}

- (NSMutableDictionary)childTiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChildTiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SRDownsampleEntry)downsampleEntry
{
  return (SRDownsampleEntry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDownsampleEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleEntry, 0);
  objc_storeStrong((id *)&self->_childTiers, 0);
}

@end
