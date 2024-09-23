@implementation TLKObject

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->observer);
}

- (TLKObserver)observer
{
  return (TLKObserver *)objc_loadWeakRetained((id *)&self->observer);
}

- (void)propertiesDidChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[TLKObject observer](self, "observer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[TLKObject observer](self, "observer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "batchUpdateCount");

    if (!v6)
    {
      -[TLKObject observer](self, "observer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "propertiesDidChange");

    }
  }
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->observer, a3);
}

- (int64_t)batchUpdateCount
{
  return self->batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->batchUpdateCount = a3;
}

@end
