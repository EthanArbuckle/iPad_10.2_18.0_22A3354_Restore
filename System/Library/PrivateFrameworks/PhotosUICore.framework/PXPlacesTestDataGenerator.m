@implementation PXPlacesTestDataGenerator

- (PXPlacesTestDataGenerator)init
{
  PXPlacesTestDataGenerator *v2;
  PXPlacesTestDataGenerator *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *generationQueue;
  uint64_t v6;
  NSMutableArray *dataPoints;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPlacesTestDataGenerator;
  v2 = -[PXPlacesTestDataGenerator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_max = 100;
    v2->_from = CLLocationCoordinate2DMake(47.608013, 122.335167);
    v3->_to = CLLocationCoordinate2DMake(28.538336, 81.379234);
    v4 = dispatch_queue_create("serializer", 0);
    generationQueue = v3->_generationQueue;
    v3->_generationQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    dataPoints = v3->_dataPoints;
    v3->_dataPoints = (NSMutableArray *)v6;

  }
  return v3;
}

- (id)generateOffsetArray:(double)a3 insert:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  void *v8;
  double v9;

  v4 = a4;
  v6 = (void *)objc_opt_new();
  v7 = 0.0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v6, "insertObject:atIndex:", v8, 0);
    else
      objc_msgSend(v6, "addObject:", v8);

    v9 = a3 * 0.5;
    if (a3 * 0.5 <= 0.0001)
      break;
    a3 = a3 - v9;
    v7 = v7 + v9;
  }
  while (a3 > 0.0);
  return v6;
}

- (unint64_t)generateDataPointsFromLocation:(CLLocationCoordinate2D)a3 toLocation:(CLLocationCoordinate2D)a4 longDir:(int64_t)a5 currentCount:(unint64_t)a6
{
  double longitude;
  double latitude;
  BOOL v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  double v22;
  double v23;
  PXPlacesTestDataPoint *v24;
  void *v25;
  CLLocationCoordinate2D v26;
  PXPlacesTestDataPoint *v27;
  unint64_t max;
  PXPlacesTestDataPoint *v29;
  void *v30;
  CLLocationCoordinate2D v31;
  PXPlacesTestDataPoint *v32;
  NSArray *obj;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3.latitude <= a4.latitude;
  v12 = 1.0;
  if (!v11)
    v12 = -1.0;
  v35 = v12;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_latOffsets;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v44;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v36)
        objc_enumerationMutation(obj);
      v38 = v13;
      objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v13), "doubleValue");
      v15 = v14;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v16 = self->_longOffsets;
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v17)
      {
        v18 = v17;
        v19 = latitude + v35 * v15;
        v20 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v40 != v20)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "doubleValue");
            v23 = longitude + (double)a5 * v22;
            if (fabs(v23) > 180.0)
            {
              if (v23 <= 0.0)
                v23 = v23 + 360.0;
              else
                v23 = v23 + -360.0;
            }
            v24 = [PXPlacesTestDataPoint alloc];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a6 + i);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = CLLocationCoordinate2DMake(v19, v23);
            v27 = -[PXPlacesTestDataPoint initWithName:location:](v24, "initWithName:location:", v25, v26.latitude, v26.longitude);

            -[NSMutableArray addObject:](self->_dataPoints, "addObject:", v27);
            max = self->_max;

            if (a6 + i + 1 == max)
            {
              a6 += i + 1;
              goto LABEL_22;
            }
          }
          a6 += i;
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_22:

      if (a6 == self->_max)
        break;
      v13 = v38 + 1;
      if (v38 + 1 == v37)
      {
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v37)
          goto LABEL_5;
        break;
      }
    }
  }

  if (a6 < self->_max)
  {
    v29 = [PXPlacesTestDataPoint alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CLLocationCoordinate2DMake(-9999.0, -9999.0);
    v32 = -[PXPlacesTestDataPoint initWithName:location:](v29, "initWithName:location:", v30, v31.latitude, v31.longitude);

    -[NSMutableArray addObject:](self->_dataPoints, "addObject:", v32);
    ++a6;

  }
  return a6;
}

- (void)generateTestImages:(unint64_t)a3 fromLocation:(CLLocationCoordinate2D)a4 toLocation:(CLLocationCoordinate2D)a5 atEnd:(id)a6
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  id v12;
  NSObject *generationQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  CLLocationDegrees v20;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v8 = a4.longitude;
  v9 = a4.latitude;
  v12 = a6;
  if (a3)
    self->_max = a3;
  self->_from.latitude = v9;
  self->_from.longitude = v8;
  self->_to.latitude = latitude;
  self->_to.longitude = longitude;
  generationQueue = self->_generationQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PXPlacesTestDataGenerator_generateTestImages_fromLocation_toLocation_atEnd___block_invoke;
  v15[3] = &unk_1E5145B58;
  v15[4] = self;
  v16 = v12;
  v17 = v9;
  v18 = v8;
  v19 = latitude;
  v20 = longitude;
  v14 = v12;
  dispatch_async(generationQueue, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPoints, 0);
  objc_storeStrong((id *)&self->_longOffsets, 0);
  objc_storeStrong((id *)&self->_latOffsets, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
}

uint64_t __78__PXPlacesTestDataGenerator_generateTestImages_fromLocation_toLocation_atEnd___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  CLLocationCoordinate2D v13;
  CLLocationCoordinate2D v14;
  CLLocationCoordinate2D v15;
  CLLocationCoordinate2D v16;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
  {
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v3 = *(_QWORD **)(a1 + 32);
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3[9]);
  }
  objc_msgSend(*(id *)(a1 + 32), "generateOffsetArray:insert:", 1, vabdd_f64(*(double *)(a1 + 48), *(double *)(a1 + 64)));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

  v7 = vabdd_f64(*(double *)(a1 + 56), *(double *)(a1 + 72));
  if (v7 > 180.0)
    v7 = 360.0 - v7;
  objc_msgSend(*(id *)(a1 + 32), "generateOffsetArray:insert:", 0, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3[4])
  {
    v11 = 0;
    do
    {
      v11 = objc_msgSend(v3, "generateDataPointsFromLocation:toLocation:longDir:currentCount:", 1, v11, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      v3 = *(_QWORD **)(a1 + 32);
      v12 = v3[4];
      if (v11 < v12)
      {
        v11 = objc_msgSend(*(id *)(a1 + 32), "generateDataPointsFromLocation:toLocation:longDir:currentCount:", -1, v11, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56));
        v3 = *(_QWORD **)(a1 + 32);
        v12 = v3[4];
      }
      if (v11 < v12)
      {
        v13 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 64), *(CLLocationDegrees *)(a1 + 56));
        v14 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 48), *(CLLocationDegrees *)(a1 + 72));
        v11 = objc_msgSend(v3, "generateDataPointsFromLocation:toLocation:longDir:currentCount:", 1, v11, v13.latitude, v13.longitude, v14.latitude, v14.longitude);
        v3 = *(_QWORD **)(a1 + 32);
        v12 = v3[4];
      }
      if (v11 < v12)
      {
        v15 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 48), *(CLLocationDegrees *)(a1 + 72));
        v16 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 64), *(CLLocationDegrees *)(a1 + 56));
        v11 = objc_msgSend(v3, "generateDataPointsFromLocation:toLocation:longDir:currentCount:", -1, v11, v15.latitude, v15.longitude, v16.latitude, v16.longitude);
        v3 = *(_QWORD **)(a1 + 32);
        v12 = v3[4];
      }
    }
    while (v11 < v12);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3[9]);
  return result;
}

@end
