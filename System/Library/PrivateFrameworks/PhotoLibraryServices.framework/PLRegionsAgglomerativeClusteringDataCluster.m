@implementation PLRegionsAgglomerativeClusteringDataCluster

- (PLRegionsAgglomerativeClusteringDataCluster)initWithDataVector:(id)a3
{
  id v4;
  PLRegionsAgglomerativeClusteringDataCluster *v5;
  uint64_t v6;
  NSArray *vectors;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRegionsAgglomerativeClusteringDataCluster;
  v5 = -[PLRegionsAgglomerativeClusteringDataCluster init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    vectors = v5->_vectors;
    v5->_vectors = (NSArray *)v6;

    v5->_latitude = *(double *)objc_msgSend(v4, "data");
    v5->_longitude = *(double *)(objc_msgSend(v4, "data") + 8);
    *(_OWORD *)&v5->_radius = xmmword_199B9FD50;
  }

  return v5;
}

- (double)score
{
  double result;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = self->_score;
  if (result < 0.0)
  {
    self->_score = 0.0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_vectors;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v10 = *(double *)objc_msgSend(v9, "data", (_QWORD)v13) - self->_latitude;
          v11 = *(double *)objc_msgSend(v9, "data") - self->_latitude;
          v12 = *(double *)(objc_msgSend(v9, "data") + 8) - self->_longitude;
          self->_score = self->_score + v12 * (*(double *)(objc_msgSend(v9, "data") + 8) - self->_longitude) + v10 * v11;
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    return self->_score;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d points, latitude = %f, longitude = %f, radius = %f, score = %f"), -[NSArray count](self->_vectors, "count"), *(_QWORD *)&self->_latitude, *(_QWORD *)&self->_longitude, *(_QWORD *)&self->_radius, *(_QWORD *)&self->_score);
}

- (NSArray)vectors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectors, 0);
}

+ (id)dataClusterWithDataVector:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataVector:", v4);

  return v5;
}

+ (id)mergedClusterFrom:(id)a3
{
  id v3;
  PLRegionsAgglomerativeClusteringDataCluster *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSArray *vectors;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(PLRegionsAgglomerativeClusteringDataCluster);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = 1.0e100;
    v11 = -1.0e100;
    v12 = -1.0e100;
    v13 = 1.0e100;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", *(_QWORD *)(v15 + 8), (_QWORD)v24);
        v17 = *(double *)(v15 + 24);
        v16 = *(double *)(v15 + 32);
        v18 = *(double *)(v15 + 16);
        if (v18 - v16 < v13)
          v13 = v18 - v16;
        v19 = v18 + v16;
        if (v19 > v12)
          v12 = v19;
        if (v17 - v16 < v10)
          v10 = v17 - v16;
        v20 = v16 + v17;
        if (v20 > v11)
          v11 = v20;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1.0e100;
    v11 = -1.0e100;
    v12 = -1.0e100;
    v13 = 1.0e100;
  }

  vectors = v4->_vectors;
  v4->_vectors = v5;

  v22 = v12 - v13;
  if (v12 - v13 < v11 - v10)
    v22 = v11 - v10;
  v4->_latitude = (v12 + v13) * 0.5;
  v4->_longitude = (v11 + v10) * 0.5;
  v4->_radius = v22 * 0.5;
  v4->_score = -1.0;

  return v4;
}

@end
