@implementation SearchUICollectionViewLayoutConfiguration

- (NSSet)sectionIndexesForHeightMatching
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (SearchUICollectionViewLayoutConfiguration)initWithSnapshot:(id)a3
{
  id v4;
  SearchUICollectionViewLayoutConfiguration *v5;
  NSSet *v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSSet *sectionIndexesForHeightMatching;
  NSSet *v18;
  NSSet *sectionIndexesUsingListLayout;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUICollectionViewLayoutConfiguration;
  v5 = -[SearchUICollectionViewLayoutConfiguration init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSSet *)objc_opt_new();
    v7 = (NSSet *)objc_opt_new();
    objc_msgSend(v4, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v4, "sectionIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "shouldHeightMatchSection"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v6, "addObject:", v13);

        }
        if (objc_msgSend(v12, "isMemberOfClass:", objc_opt_class()))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v7, "addObject:", v14);

        }
        ++v10;
        objc_msgSend(v4, "sectionIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v10 < v16);
    }
    sectionIndexesForHeightMatching = v5->_sectionIndexesForHeightMatching;
    v5->_sectionIndexesForHeightMatching = v6;
    v18 = v6;

    sectionIndexesUsingListLayout = v5->_sectionIndexesUsingListLayout;
    v5->_sectionIndexesUsingListLayout = v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexesUsingListLayout, 0);
  objc_storeStrong((id *)&self->_sectionIndexesForHeightMatching, 0);
}

- (NSSet)sectionIndexesUsingListLayout
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

@end
