@implementation ShortcutsRowCellModel

- (NSString)_maps_diffableDataSourceIdentifier
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSString)subtitle
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (BOOL)vibrantBackground
{
  return 0;
}

- (int64_t)contentMode
{
  return 2;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___ShortcutsRowCellModelObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
