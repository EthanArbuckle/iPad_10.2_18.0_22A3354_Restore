@implementation MapsUIDiffableDataSourceIdentifierCache

- (id)_currentGeneration
{
  NSMapTable *currentGeneration;
  NSMapTable *v4;
  NSMapTable *v5;

  currentGeneration = self->_currentGeneration;
  if (!currentGeneration)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    v5 = self->_currentGeneration;
    self->_currentGeneration = v4;

    currentGeneration = self->_currentGeneration;
  }
  return currentGeneration;
}

- (id)identifierForObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_currentGeneration, "objectForKey:", v4));
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_previousGeneration, "objectForKey:", v4));
    if (v6)
    {
      v5 = (void *)v6;
LABEL_5:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceIdentifierCache _currentGeneration](self, "_currentGeneration"));
      objc_msgSend(v7, "setObject:forKey:", v5, v4);

      goto LABEL_10;
    }
    if ((objc_opt_respondsToSelector(v4, "_maps_diffableDataSourceIdentifier") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_diffableDataSourceIdentifier"));
      if (!v5)
        goto LABEL_10;
      goto LABEL_5;
    }
LABEL_9:
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (void)markGeneration
{
  NSMapTable *currentGeneration;

  objc_storeStrong((id *)&self->_previousGeneration, self->_currentGeneration);
  currentGeneration = self->_currentGeneration;
  self->_currentGeneration = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGeneration, 0);
  objc_storeStrong((id *)&self->_previousGeneration, 0);
}

@end
