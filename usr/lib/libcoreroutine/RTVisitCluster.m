@implementation RTVisitCluster

- (RTVisitLocationPoints)points
{
  return self->_points;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visit, 0);
  objc_storeStrong((id *)&self->_points, 0);
}

- (RTVisitCluster)initWithPoints:(id)a3
{
  return -[RTVisitCluster initWithPoints:visit:](self, "initWithPoints:visit:", a3, 0);
}

- (RTVisitCluster)initWithPoints:(id)a3 visit:(id)a4
{
  unint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  RTVisitCluster *v14;
  id *p_isa;
  RTVisitCluster *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (unint64_t)a3;
  v8 = a4;
  objc_msgSend(v8, "exit");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v7 | v9;

  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTVisitCluster initWithPoints:visit:]";
      v21 = 1024;
      v22 = 23;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit.exit || points (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v8, "exit");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v7 | v12;

  if (v13)
  {
    v18.receiver = self;
    v18.super_class = (Class)RTVisitCluster;
    v14 = -[RTVisitCluster init](&v18, sel_init);
    p_isa = (id *)&v14->super.isa;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_points, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (RTVisit)visit
{
  return self->_visit;
}

- (BOOL)isPartialAndExitDateIsEqualToDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTVisit exit](self->_visit, "exit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      -[RTVisitLocationPoints lastDate](self->_points, "lastDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqualToDate:", v8);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTVisitCluster isPartialAndExitDateIsEqualToDate:]";
      v12 = 1024;
      v13 = 74;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

    v6 = 0;
  }

  return v6;
}

- (BOOL)isDateInside:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTVisitCluster isDateInside:]";
      v12 = 1024;
      v13 = 46;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

    goto LABEL_7;
  }
  -[RTVisit entry](self->_visit, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAfterDate:", v4);

  if ((v6 & 1) != 0)
  {
LABEL_7:
    LOBYTE(v7) = 0;
    goto LABEL_8;
  }
  v7 = !-[RTVisitCluster isExitDateBeforeDate:](self, "isExitDateBeforeDate:", v4);
LABEL_8:

  return v7;
}

- (BOOL)isExitDateBeforeDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTVisit exit](self->_visit, "exit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBeforeDate:", v4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTVisitCluster isExitDateBeforeDate:]";
      v11 = 1024;
      v12 = 63;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

    v6 = 0;
  }

  return v6;
}

- (RTVisitCluster)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPoints_visit_);
}

- (BOOL)isCompleteAndExitDateIsEqualToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTVisit exit](self->_visit, "exit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[RTVisit exit](self->_visit, "exit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEqualToDate:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTVisitCluster isCompleteAndExitDateIsEqualToDate:]";
      v12 = 1024;
      v13 = 83;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("visit, %@, points, %@"), self->_visit, self->_points);
}

@end
