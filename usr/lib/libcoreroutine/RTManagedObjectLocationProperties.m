@implementation RTManagedObjectLocationProperties

- (RTManagedObjectLocationProperties)initWithLatitudePropertyPath:(id)a3 longitudePropertyPath:(id)a4 referenceFramePropertyPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  RTManagedObjectLocationProperties *v14;
  id *p_isa;
  RTManagedObjectLocationProperties *v16;
  NSObject *v17;
  const char *v18;
  objc_super v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: latitudePropertyPath";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: longitudePropertyPath";
    goto LABEL_17;
  }
  v12 = objc_msgSend(v9, "count");
  if (v12 != objc_msgSend(v10, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: latitudePropertyPath.count == longitudePropertyPath.count";
    goto LABEL_17;
  }
  if (v11)
  {
    v13 = objc_msgSend(v9, "count");
    if (v13 != objc_msgSend(v11, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v18 = "Invalid parameter not satisfying: latitudePropertyPath.count == referenceFramePropertyPath.count";
        goto LABEL_17;
      }
LABEL_18:

      v16 = 0;
      goto LABEL_19;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)RTManagedObjectLocationProperties;
  v14 = -[RTManagedObjectLocationProperties init](&v20, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_latitudePropertyPath, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  self = p_isa;
  v16 = self;
LABEL_19:

  return v16;
}

- (NSArray)latitudePropertyPath
{
  return self->_latitudePropertyPath;
}

- (void)setLatitudePropertyPath:(id)a3
{
  objc_storeStrong((id *)&self->_latitudePropertyPath, a3);
}

- (NSArray)longitudePropertyPath
{
  return self->_longitudePropertyPath;
}

- (void)setLongitudePropertyPath:(id)a3
{
  objc_storeStrong((id *)&self->_longitudePropertyPath, a3);
}

- (NSArray)referenceFramePropertyPath
{
  return self->_referenceFramePropertyPath;
}

- (void)setReferenceFramePropertyPath:(id)a3
{
  objc_storeStrong((id *)&self->_referenceFramePropertyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceFramePropertyPath, 0);
  objc_storeStrong((id *)&self->_longitudePropertyPath, 0);
  objc_storeStrong((id *)&self->_latitudePropertyPath, 0);
}

@end
