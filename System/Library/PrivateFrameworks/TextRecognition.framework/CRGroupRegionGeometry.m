@implementation CRGroupRegionGeometry

- (CRGroupRegionGeometry)initWithGroupRegion:(id)a3
{
  id v5;
  CRGroupRegionGeometry *v6;
  CRGroupRegionGeometry *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  CRTextRegion *firstTextRegion;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRGroupRegionGeometry;
  v6 = -[CRGroupRegionGeometry init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupRegion, a3);
    objc_msgSend(v5, "boundingQuad");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topLeft");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v5, "boundingQuad");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomRight");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "boundingQuad");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "normalizationSize");
    if (v19 > 0.0 && v20 > 0.0)
    {
      v10 = v10 * v19;
      v12 = v12 * v20;
      v15 = v15 * v19;
      v17 = v17 * v20;
    }
    v7->_diagonalDistance = sqrt((v12 - v17) * (v12 - v17) + (v10 - v15) * (v10 - v15));

    objc_msgSend(v5, "subregions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "conformsToProtocol:", &unk_1EFF145E0);

    if (v23)
    {
      objc_msgSend(v5, "subregions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = objc_claimAutoreleasedReturnValue();
      firstTextRegion = v7->_firstTextRegion;
      v7->_firstTextRegion = (CRTextRegion *)v25;

    }
  }

  return v7;
}

- (BOOL)isIsolatedClosestRegionDistance:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;

  -[CRGroupRegionGeometry groupRegion](self, "groupRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subregions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    -[CRGroupRegionGeometry firstTextRegion](self, "firstTextRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 <= 2)
    {
      -[CRGroupRegionGeometry diagonalDistance](self, "diagonalDistance");
      if (v10 * 20.0 < a3)
        return 1;
    }
  }
  else
  {

  }
  return 0;
}

- (BOOL)shouldBeConsiderForFiltering
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CRGroupRegionGeometry groupRegion](self, "groupRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subregions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[CRGroupRegionGeometry firstTextRegion](self, "firstTextRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "length") < 3;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldBeConsideredForNearestDistanceCalculation
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CRGroupRegionGeometry groupRegion](self, "groupRegion", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subregions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFF145E0))
        {
          objc_msgSend(v7, "text");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "length");

          if (v9 > 1)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (double)calculateMinimumDistanceFromOtherGeometries:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  CRGroupRegionGeometry *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = 1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v9 = *(CRGroupRegionGeometry **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v9 != self)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "shouldBeConsideredForNearestDistanceCalculation"))
          {
            -[CRGroupRegionGeometry groupRegion](self, "groupRegion");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "boundingQuad");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "denormalizedQuad");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRGroupRegionGeometry groupRegion](v9, "groupRegion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "boundingQuad");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "denormalizedQuad");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRGroupRegionGeometry _distanceFromQuad1:toQuad2:](self, "_distanceFromQuad1:toQuad2:", v12, v15);
            v17 = v16;

            if (v17 < v7)
              v7 = v17;
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.79769313e308;
  }

  return v7;
}

- (double)_distanceFromQuad1:(id)a3 toQuad2:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  _QWORD v19[9];

  v19[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "topLeft");
  v19[0] = v7;
  v19[1] = v8;
  objc_msgSend(v5, "topRight");
  v19[2] = v9;
  v19[3] = v10;
  objc_msgSend(v5, "bottomRight");
  v19[4] = v11;
  v19[5] = v12;
  objc_msgSend(v5, "bottomLeft");
  v13 = 0;
  v19[6] = v14;
  v19[7] = v15;
  v16 = 1.79769313e308;
  do
  {
    objc_msgSend(v6, "shortestDistanceFromPoint:", *(double *)&v19[v13], *(double *)&v19[v13 + 1]);
    if (v17 < v16)
      v16 = v17;
    v13 += 2;
  }
  while (v13 != 8);

  return v16;
}

- (CRGroupRegion)groupRegion
{
  return (CRGroupRegion *)objc_getProperty(self, a2, 8, 1);
}

- (double)diagonalDistance
{
  return self->_diagonalDistance;
}

- (CRTextRegion)firstTextRegion
{
  return (CRTextRegion *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTextRegion, 0);
  objc_storeStrong((id *)&self->_groupRegion, 0);
}

@end
