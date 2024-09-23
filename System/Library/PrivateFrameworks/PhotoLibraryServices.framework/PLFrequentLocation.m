@implementation PLFrequentLocation

- (PLFrequentLocation)initWithSortedMoments:(id)a3
{
  id v4;
  PLFrequentLocation *v5;
  uint64_t v6;
  NSMutableArray *sortedMoments;
  void *v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLFrequentLocation;
  v5 = -[PLFrequentLocation init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    sortedMoments = v5->_sortedMoments;
    v5->_sortedMoments = (NSMutableArray *)v6;

    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pl_coordinate");
      v5->_coordinate.latitude = v9;
      v5->_coordinate.longitude = v10;

    }
    else if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v5->_coordinate = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
    }
    else
    {
      v5->_coordinate.latitude = PLCentroidForMoments(v4);
      v5->_coordinate.longitude = v11;
    }
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PLFrequentLocation;
  -[PLFrequentLocation description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFrequentLocation dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFrequentLocation dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@ - %@] <%f,%f> %lu moments"), v4, v6, v8, *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude, -[NSMutableArray count](self->_sortedMoments, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  PLFrequentLocation *v4;
  PLFrequentLocation *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PLFrequentLocation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PLFrequentLocation sortedMoments](self, "sortedMoments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLFrequentLocation sortedMoments](v5, "sortedMoments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToArray:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isSimilarToFrequentLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  if (-[PLFrequentLocation isWithinDistance:toCoordinate:](self, "isWithinDistance:toCoordinate:", 50.0, v5, v6))
  {
    -[PLFrequentLocation dateInterval](self, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectionWithDateInterval:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v11 = v10;

    objc_msgSend(v7, "duration");
    v13 = v12;
    objc_msgSend(v8, "duration");
    if (v13 >= v14)
      v14 = v13;
    v15 = v11 / v14 >= 0.8;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isWithinDistance:(double)a3 toCoordinate:(CLLocationCoordinate2D)a4
{
  _BOOL4 v5;
  double v6;

  v5 = CLLocationCoordinate2DIsValid(a4);
  if (v5)
  {
    CLLocationCoordinate2DGetDistanceFrom();
    LOBYTE(v5) = v6 <= a3;
  }
  return v5;
}

- (void)addMomentToSortedMoments:(id)a3
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  id v30;

  v30 = a3;
  -[PLFrequentLocation sortedMoments](self, "sortedMoments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[PLFrequentLocation coordinate](self, "coordinate");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v30, "pl_coordinate");
    PLCentroidForCoordinates(v7, v9, (double)v5, v10, v11, 1.0);
  }
  else
  {
    objc_msgSend(v30, "pl_coordinate");
  }
  -[PLFrequentLocation setCoordinate:](self, "setCoordinate:");
  -[PLFrequentLocation sortedMoments](self, "sortedMoments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = 0;
  if (v13)
  {
    while (1)
    {
      -[PLFrequentLocation sortedMoments](self, "sortedMoments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "pl_startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pl_startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "compare:", v18);

      if (v19 == -1)
        break;
      if (v13 == ++v14)
      {
        v14 = v13;
        break;
      }
    }
  }
  v20 = v14;
  while (1)
  {
    v21 = v20 - 1;
    if (v20 - 1 < 0)
    {
      v20 = v14;
      goto LABEL_15;
    }
    -[PLFrequentLocation sortedMoments](self, "sortedMoments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v20 - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "pl_startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pl_startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "compare:", v25);

    if (v26)
      break;
    v27 = objc_msgSend(v30, "hash");
    v28 = objc_msgSend(v23, "hash");

    --v20;
    if (v27 > v28)
    {
      v20 = v21 + 1;
      goto LABEL_15;
    }
  }

LABEL_15:
  -[PLFrequentLocation sortedMoments](self, "sortedMoments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "insertObject:atIndex:", v30, v20);

  -[PLFrequentLocation _invalidateLazyProperties](self, "_invalidateLazyProperties");
}

- (void)_invalidateLazyProperties
{
  PLRunWithUnfairLock();
}

- (NSDateInterval)dateInterval
{
  PLResultWithUnfairLock();
  return (NSDateInterval *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSSet)momentsSet
{
  PLResultWithUnfairLock();
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (PLMomentProcessingProtocol)centroid
{
  PLResultWithUnfairLock();
  return (PLMomentProcessingProtocol *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)sortedMoments
{
  return self->_sortedMoments;
}

- (void)setSortedMoments:(id)a3
{
  objc_storeStrong((id *)&self->_sortedMoments, a3);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (void)setMomentsSet:(id)a3
{
  objc_storeStrong((id *)&self->_momentsSet, a3);
}

- (void)setCentroid:(id)a3
{
  objc_storeStrong((id *)&self->_centroid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centroid, 0);
  objc_storeStrong((id *)&self->_momentsSet, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sortedMoments, 0);
}

id __30__PLFrequentLocation_centroid__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (!v3)
  {
    objc_msgSend(v2, "coordinate");
    v24 = v4;
    v25 = v5;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sortedMoments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      v10 = 1.79769313e308;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "pl_coordinate", 0, 0);
          v18 = v13;
          v19 = v14;
          CLLocationCoordinate2DGetDistanceFrom();
          if (v15 < v10)
          {
            v16 = v15;
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v12);
            v10 = v16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16, v18, v19);
      }
      while (v8);
    }

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return v3;
}

id __32__PLFrequentLocation_momentsSet__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "sortedMoments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v3;
}

id __34__PLFrequentLocation_dateInterval__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  if (!v3)
  {
    objc_msgSend(v2, "sortedMoments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v5, "pl_startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pl_endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 24);
      *(_QWORD *)(v13 + 24) = v12;

    }
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return v3;
}

void __47__PLFrequentLocation__invalidateLazyProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

@end
