@implementation CarSearchItemCellModel

+ (id)modelWithUpdateBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setUpdateBlock:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CarSearchItemCellModel observeObject:forKeyPaths:](self, "observeObject:forKeyPaths:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)CarSearchItemCellModel;
  -[CarSearchItemCellModel dealloc](&v3, "dealloc");
}

- (void)observeObject:(id)a3 forKeyPaths:(id)a4
{
  id v7;
  id v8;
  NSSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id observedObject;
  NSSet *observedKeyPaths;
  NSSet *v16;
  NSSet *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v7 = a3;
  v8 = a4;
  if (self->_observedObject)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = self->_observedKeyPaths;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(self->_observedObject, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13));
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    observedObject = self->_observedObject;
    self->_observedObject = 0;

    observedKeyPaths = self->_observedKeyPaths;
    self->_observedKeyPaths = 0;

  }
  if (v7 && objc_msgSend(v8, "count"))
  {
    objc_storeStrong(&self->_observedObject, a3);
    v16 = (NSSet *)objc_msgSend(v8, "copy");
    v17 = self->_observedKeyPaths;
    self->_observedKeyPaths = v16;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v22), 0, 0, (_QWORD)v23);
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  unsigned int v9;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCellModel observedKeyPaths](self, "observedKeyPaths"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
    -[CarSearchItemCellModel markAsUpdated](self, "markAsUpdated");
}

- (void)markAsUpdated
{
  void *v3;
  NSBlockOperation *markedAsUpdatedOperation;
  NSBlockOperation *v5;
  NSBlockOperation *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCellModel updateBlock](self, "updateBlock"));
  if (v3)
  {
    markedAsUpdatedOperation = self->_markedAsUpdatedOperation;

    if (!markedAsUpdatedOperation)
    {
      objc_initWeak(&location, self);
      v8 = _NSConcreteStackBlock;
      v9 = 3221225472;
      v10 = sub_10049DB28;
      v11 = &unk_1011AD260;
      objc_copyWeak(&v12, &location);
      v5 = (NSBlockOperation *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v8));
      v6 = self->_markedAsUpdatedOperation;
      self->_markedAsUpdatedOperation = v5;

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", v8, v9, v10, v11));
      objc_msgSend(v7, "addOperation:", self->_markedAsUpdatedOperation);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)shouldShowChargerlabel
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCellModel mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
  if ((objc_msgSend(v4, "_hasEVCharger") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCellModel chargerNumberString](self, "chargerNumberString"));
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (id)evChargerLabelText
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (MapsFeature_IsEnabled_RealTimeEVCharger(self, a2)
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCellModel mapItem](self, "mapItem")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem")),
        v5 = objc_msgSend(v4, "_hasEVCharger"),
        v4,
        v3,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCellModel mapItem](self, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_realTimeAvailableEVCharger"));

    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[EVChargerUtility realTimeEVChargerDisplayStringWithEvCharger:mapDisplay:](_TtC4Maps16EVChargerUtility, "realTimeEVChargerDisplayStringWithEvCharger:mapDisplay:", v7, 0));
  }
  else
  {
    v8 = &stru_1011EB268;
  }
  return v8;
}

- (NSString)firstLine
{
  return self->_firstLine;
}

- (void)setFirstLine:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)secondLine
{
  return self->_secondLine;
}

- (void)setSecondLine:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)rating
{
  return self->_rating;
}

- (void)setRating:(id)a3
{
  objc_storeStrong((id *)&self->_rating, a3);
}

- (NSString)chargerNumberString
{
  return self->_chargerNumberString;
}

- (void)setChargerNumberString:(id)a3
{
  objc_storeStrong((id *)&self->_chargerNumberString, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (BOOL)isRecent
{
  return self->_isRecent;
}

- (void)setIsRecent:(BOOL)a3
{
  self->_isRecent = a3;
}

- (BOOL)isShowingStops
{
  return self->_isShowingStops;
}

- (void)setIsShowingStops:(BOOL)a3
{
  self->_isShowingStops = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)observedKeyPaths
{
  return self->_observedKeyPaths;
}

- (void)setObservedKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_observedKeyPaths, a3);
}

- (id)observedObject
{
  return self->_observedObject;
}

- (void)setObservedObject:(id)a3
{
  objc_storeStrong(&self->_observedObject, a3);
}

- (NSString)debugSubtitle
{
  return self->_debugSubtitle;
}

- (void)setDebugSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSubtitle, 0);
  objc_storeStrong(&self->_observedObject, 0);
  objc_storeStrong((id *)&self->_observedKeyPaths, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_chargerNumberString, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_secondLine, 0);
  objc_storeStrong((id *)&self->_firstLine, 0);
  objc_storeStrong((id *)&self->_markedAsUpdatedOperation, 0);
}

@end
