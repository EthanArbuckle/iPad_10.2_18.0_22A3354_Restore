@implementation RestaurantReservationCollectionViewFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  RestaurantReservationCollectionViewFlowLayout *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)RestaurantReservationCollectionViewFlowLayout;
  v4 = -[RestaurantReservationCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v26, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationCollectionViewFlowLayout collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPath"));
        if ((objc_msgSend(v7, "containsObject:", v14) & 1) != 0
          || objc_msgSend(v13, "representedElementCategory") == (id)1)
        {

          v15 = 1.0;
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationCollectionViewFlowLayout dimmableIndexPaths](v21, "dimmableIndexPaths"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPath"));
          v18 = objc_msgSend(v16, "containsObject:", v17);

          v15 = 1.0;
          if (v18)
          {
            if (-[RestaurantReservationCollectionViewFlowLayout dimUnselected](v21, "dimUnselected", 1.0))
              v15 = 0.200000003;
            else
              v15 = 1.0;
          }
        }
        objc_msgSend(v13, "setAlpha:", v15);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v10 = v19;
    }
    while (v19);
  }

  return v8;
}

- (BOOL)dimUnselected
{
  return self->_dimUnselected;
}

- (void)setDimUnselected:(BOOL)a3
{
  self->_dimUnselected = a3;
}

- (NSSet)dimmableIndexPaths
{
  return self->_dimmableIndexPaths;
}

- (void)setDimmableIndexPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmableIndexPaths, 0);
}

@end
