@implementation CHDLegendEntry

- (CHDLegendEntry)initWithResources:(id)a3
{
  id v4;
  CHDLegendEntry *v5;
  CHDLegendEntry *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDLegendEntry;
  v5 = -[CHDLegendEntry init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mFontIndex = -1;
    v6->mEntryIndex = -1;
  }

  return v6;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

- (void)setEntryIndex:(unsigned int)a3
{
  self->mEntryIndex = a3;
}

- (void)setFont:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mFontIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (id)font
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mFontIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)entryIndex
{
  return self->mEntryIndex;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDLegendEntry;
  -[CHDLegendEntry description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

@end
