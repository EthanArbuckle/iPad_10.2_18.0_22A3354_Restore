@implementation MOHDBSCANClustering

- (MOHDBSCANClustering)initWithParameters:(id)a3
{
  id v5;
  MOHDBSCANClustering *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MOHDBSCANClustering;
  v6 = -[MOHDBSCANClustering init](&v8, "init");
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clusteringParams, a3);
    operator new();
  }

  return 0;
}

- (void)runHDBSCANClusteringOn:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t *value;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::string __p;
  _QWORD v25[3];
  uint8_t buf[8];
  uint64_t v27;
  _QWORD v28[4];
  NSMutableArray *v29;
  _BYTE v30[24];

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Start running HDBSCAN clustering", buf, 2u);
  }

  v7 = objc_opt_new(NSMutableArray);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke;
  v28[3] = &unk_1002B1408;
  v8 = v7;
  v29 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v28);
  objc_storeStrong((id *)&self->_bundleIDs, v7);
  -[MOHDBSCANClustering _getDistanceMatrixFrom:](self, "_getDistanceMatrixFrom:", v4);
  if (self->_HDBSCAN.__ptr_.__value_)
  {
    memset(v25, 0, sizeof(v25));
    std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v25, *(uint64_t *)buf, v27, 0xAAAAAAAAAAAAAAABLL * ((v27 - *(_QWORD *)buf) >> 3));
    -[MOHDBSCANClustering loadDistanceMatrix:](self, "loadDistanceMatrix:", v25);
    *(_QWORD *)v30 = v25;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)v30);
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 14)
                     - *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 13)) >> 3);
      *(_DWORD *)v30 = 134217984;
      *(_QWORD *)&v30[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "loaded distance matrix with size:%lu", v30, 0xCu);
    }

    v12 = -[MOClusteringParams minPoints](self->_clusteringParams, "minPoints");
    v13 = -[MOClusteringParams minClusterSize](self->_clusteringParams, "minClusterSize");
    value = (uint64_t *)self->_HDBSCAN.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    Hdbscan::execute(value, v12, v13, &__p);
  }
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[MOHDBSCANClustering runHDBSCANClusteringOn:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  *(_QWORD *)v30 = buf;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)v30);

}

void __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id os_log;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v6, "UUIDString"));
    objc_msgSend(v5, "addObject:", v7);

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke_cold_1((uint64_t)v3, v6);
  }

}

- (id)getClusterLabels
{
  NSMutableArray *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id os_log;
  NSObject *v8;
  uint8_t v10[16];

  v3 = objc_opt_new(NSMutableArray);
  v4 = *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 16);
  if (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 17) == v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Cluster label is empty", v10, 2u);
    }

  }
  else
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v4 + 4 * v5)));
      -[NSMutableArray addObject:](v3, "addObject:", v6);

      ++v5;
      v4 = *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 16);
    }
    while (v5 < (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 17) - v4) >> 2);
  }
  return v3;
}

- (id)getNormalizedClusterLabels
{
  NSMutableArray *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  NSMutableArray *v7;
  id os_log;
  NSObject *v9;
  uint8_t v11[16];

  v3 = objc_opt_new(NSMutableArray);
  v4 = *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 19);
  if (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 20) == v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Normalized cluster label is empty", v11, 2u);
    }

    v7 = 0;
  }
  else
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v4 + 4 * v5)));
      -[NSMutableArray addObject:](v3, "addObject:", v6);

      ++v5;
      v4 = *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 19);
    }
    while (v5 < (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 20) - v4) >> 2);
    v7 = v3;
  }

  return v7;
}

- (id)getOutlierScoreDict
{
  NSMutableDictionary *v3;
  NSUInteger v4;
  Hdbscan *value;
  uint64_t v6;
  uint64_t v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id os_log;
  NSObject *v16;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  double v23;

  v3 = objc_opt_new(NSMutableDictionary);
  if (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 23) == *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 22)
    || (v4 = -[NSArray count](self->_bundleIDs, "count"),
        value = self->_HDBSCAN.__ptr_.__value_,
        v7 = *((_QWORD *)value + 22),
        v6 = *((_QWORD *)value + 23),
        v4 != 0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3)))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "OutlierScores is empty or bundle id count and score count do not match. Returning empty dict", buf, 2u);
    }

  }
  else
  {
    for (; v7 != v6; v7 += 24)
    {
      v8 = *(double *)(v7 + 8);
      v9 = *(_DWORD *)(v7 + 16);
      v10 = objc_autoreleasePoolPush();
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_bundleIDs, "objectAtIndex:", v9));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v11);

      }
      v13 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        v19 = v9;
        v20 = 2112;
        v21 = v11;
        v22 = 2048;
        v23 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Current outlierScore: idx %d,bundleID %@,score %.3f", buf, 0x1Cu);
      }

      objc_autoreleasePoolPop(v10);
    }
  }
  return v3;
}

- (id)getMembershipProbability
{
  NSMutableArray *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id os_log;
  NSObject *v8;
  uint8_t v10[16];

  v3 = objc_opt_new(NSMutableArray);
  v4 = *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 25);
  if (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 26) == v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "MembershipProbability is empty", v10, 2u);
    }

  }
  else
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(v4 + 8 * v5)));
      -[NSMutableArray addObject:](v3, "addObject:", v6);

      ++v5;
      v4 = *((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 25);
    }
    while (v5 < (*((_QWORD *)self->_HDBSCAN.__ptr_.__value_ + 26) - v4) >> 3);
  }
  return v3;
}

- (vector<std::vector<double>,)_getDistanceMatrixFrom:(MOHDBSCANClustering *)self
{
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *var0;
  vector<std::vector<double>, std::allocator<std::vector<double>>> *result;
  id v17;

  v17 = a4;
  v6 = objc_msgSend(v17, "count");
  v7 = v6;
  std::vector<std::vector<double>>::vector(retstr, v6);
  if (v6 >= 1)
  {
    v8 = 0;
    v9 = v6;
    do
    {
      std::vector<double>::resize((uint64_t)retstr->var0 + 24 * v8, v7);
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v8));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", i));
          -[MOHDBSCANClustering _getEmbeddingDistanceFrom:to:](self, "_getEmbeddingDistanceFrom:to:", v11, v12);
          v14 = v13;

          var0 = retstr->var0;
          *(_QWORD *)(*((_QWORD *)retstr->var0 + 3 * v8) + 8 * i) = v14;
          *(_QWORD *)(var0[3 * i] + 8 * v8) = v14;
        }
      }
      ++v8;
    }
    while (v8 != v9);
  }

  return result;
}

- (double)_getEmbeddingDistanceFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOClusteringParams embeddingDistanceWeights](self->_clusteringParams, "embeddingDistanceWeights"));
  objc_msgSend(v6, "getDistanceFrom:withWeights:", v7, v8);
  v10 = v9;

  return v10;
}

- (void)loadDistanceMatrix:()vector<std:(std::allocator<std::vector<double>>> *)a3 :vector<double>
{
  Hdbscan *value;
  id os_log;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[3];
  uint8_t buf[8];

  value = self->_HDBSCAN.__ptr_.__value_;
  if (value)
  {
    memset(v14, 0, sizeof(v14));
    std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v14, (uint64_t)a3->var0, (uint64_t)a3->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->var1 - (char *)a3->var0) >> 3));
    Hdbscan::loadDistanceMatrix((uint64_t)value, v14);
    *(_QWORD *)buf = v14;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Distance matrix is loaded", buf, 2u);
    }
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityHDBSCANClustering);
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MOHDBSCANClustering loadDistanceMatrix:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_clusteringParams, 0);
  std::unique_ptr<Hdbscan>::reset[abi:ne180100](&self->_HDBSCAN.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)runHDBSCANClusteringOn:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "HDBSCAN was not instantiated", a5, a6, a7, a8, 0);
}

void __46__MOHDBSCANClustering_runHDBSCANClusteringOn___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Embedding has nil bundleID:%@. Early exit from clustering", (uint8_t *)&v2, 0xCu);
}

- (void)loadDistanceMatrix:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Failed to load distance matrix since HDBSCAN was not instantiated", a5, a6, a7, a8, 0);
}

@end
