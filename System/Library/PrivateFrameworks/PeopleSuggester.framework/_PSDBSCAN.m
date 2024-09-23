@implementation _PSDBSCAN

- (_PSDBSCAN)initWithMinimumPointsForClustering:(unint64_t)a3 MaxNeighborDistance:(double)a4
{
  _PSDBSCAN *v6;
  _PSDBSCAN *v7;
  uint64_t v8;
  NSMutableSet *visitedPoints;
  uint64_t v10;
  NSMutableSet *clusteredPoints;
  uint64_t v12;
  NSMutableArray *noisePoints;
  uint64_t v14;
  NSMutableArray *clusters;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_PSDBSCAN;
  v6 = -[_PSDBSCAN init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_minPts = a3;
    v6->_eps = a4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    visitedPoints = v7->_visitedPoints;
    v7->_visitedPoints = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    clusteredPoints = v7->_clusteredPoints;
    v7->_clusteredPoints = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    noisePoints = v7->_noisePoints;
    v7->_noisePoints = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    clusters = v7->_clusters;
    v7->_clusters = (NSMutableArray *)v14;

  }
  return v7;
}

- (void)emptyCollections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSDBSCAN setPointsArray:](self, "setPointsArray:", v3);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSDBSCAN setClusteredPoints:](self, "setClusteredPoints:", v4);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSDBSCAN setVisitedPoints:](self, "setVisitedPoints:", v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSDBSCAN setClusters:](self, "setClusters:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_PSDBSCAN setNoisePoints:](self, "setNoisePoints:", v7);

}

- (void)fitData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[_PSDBSCAN setPointsArray:](self, "setPointsArray:", v4);

  -[_PSDBSCAN pointsArray](self, "pointsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[_PSDBSCAN pointsArray](self, "pointsArray");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[_PSDBSCAN visitedPoints](self, "visitedPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v9);

      if ((v11 & 1) == 0)
      {
        -[_PSDBSCAN visitedPoints](self, "visitedPoints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v9);

        -[_PSDBSCAN getNeighborIndices:](self, "getNeighborIndices:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count") + 1;
        if (v14 >= -[_PSDBSCAN minPts](self, "minPts"))
        {
          -[_PSDBSCAN expandClusterForPoint:withNeighborIndices:](self, "expandClusterForPoint:withNeighborIndices:", v9, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSDBSCAN clusters](self, "clusters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v15);

        }
        else
        {
          -[_PSDBSCAN noisePoints](self, "noisePoints");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v9);
        }

      }
      ++v7;
      -[_PSDBSCAN pointsArray](self, "pointsArray");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v7 < v18);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[_PSDBSCAN clusters](self, "clusters", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "computeConvexHull");
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v21);
  }

}

- (id)getNeighborIndices:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  unint64_t v18;

  -[_PSDBSCAN pointsArray](self, "pointsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSDBSCAN pointsArray](self, "pointsArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    do
    {
      if (a3 != v10)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_pointsArray, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "euclideanDistanceToPoint:", v11);
        v13 = v12;
        -[_PSDBSCAN eps](self, "eps");
        v15 = v14;

        if (v13 <= v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      ++v10;
      -[_PSDBSCAN pointsArray](self, "pointsArray");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v10 < v18);
  }

  return v7;
}

- (id)expandClusterForPoint:(id)a3 withNeighborIndices:(id)a4
{
  id v6;
  id v7;
  _PSCluster *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  char v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_PSCluster);
  -[_PSCluster addPointToCluster:](v8, "addPointToCluster:", v6);
  -[NSMutableSet addObject:](self->_clusteredPoints, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      -[_PSDBSCAN pointsArray](self, "pointsArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[_PSDBSCAN visitedPoints](self, "visitedPoints");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v14);

      if ((v16 & 1) == 0)
      {
        -[_PSDBSCAN visitedPoints](self, "visitedPoints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v14);

        -[_PSDBSCAN getNeighborIndices:](self, "getNeighborIndices:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count") + 1;
        if (v19 >= -[_PSDBSCAN minPts](self, "minPts"))
          -[_PSDBSCAN mergeCurrNeighbors:withArray:andUpdateSet:](self, "mergeCurrNeighbors:withArray:andUpdateSet:", v7, v18, v9);
        -[_PSDBSCAN clusteredPoints](self, "clusteredPoints");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", v14);

        if ((v21 & 1) == 0)
        {
          -[_PSCluster addPointToCluster:](v8, "addPointToCluster:", v14);
          -[_PSDBSCAN clusteredPoints](self, "clusteredPoints");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v14);

        }
      }

      ++v10;
    }
    while (v10 < objc_msgSend(v7, "count"));
  }

  return v8;
}

- (void)mergeCurrNeighbors:(id)a3 withArray:(id)a4 andUpdateSet:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v14);
          objc_msgSend(v9, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (unint64_t)minPts
{
  return self->_minPts;
}

- (double)eps
{
  return self->_eps;
}

- (NSMutableArray)pointsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPointsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableSet)visitedPoints
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVisitedPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)noisePoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNoisePoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableSet)clusteredPoints
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClusteredPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)clusters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClusters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_clusteredPoints, 0);
  objc_storeStrong((id *)&self->_noisePoints, 0);
  objc_storeStrong((id *)&self->_visitedPoints, 0);
  objc_storeStrong((id *)&self->_pointsArray, 0);
}

@end
