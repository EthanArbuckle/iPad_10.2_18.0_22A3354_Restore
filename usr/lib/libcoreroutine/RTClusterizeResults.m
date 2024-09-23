@implementation RTClusterizeResults

- (RTClusterizeResults)initWithClusters:(id)a3 objectIDs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTClusterizeResults *v10;
  id *p_isa;
  RTClusterizeResults *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: clusters";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: objectIDs";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTClusterizeResults;
  v10 = -[RTClusterizeResults init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clusters, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (NSArray)clusters
{
  return self->_clusters;
}

- (void)setClusters:(id)a3
{
  objc_storeStrong((id *)&self->_clusters, a3);
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
}

@end
