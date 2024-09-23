@implementation RoutePlanningTiming

- (RoutePlanningTiming)initWithDepartureDate:(id)a3 arrivalDate:(id)a4 departureTimeZone:(id)a5 arrivalTimeZone:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RoutePlanningTiming *v14;
  NSDate *v15;
  NSDate *departureDate;
  NSDate *v17;
  NSDate *arrivalDate;
  NSTimeZone *v19;
  NSTimeZone *departureTimeZone;
  NSTimeZone *v21;
  NSTimeZone *arrivalTimeZone;
  RoutePlanningTiming *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RoutePlanningTiming;
  v14 = -[RoutePlanningTiming init](&v25, "init");
  if (v14)
  {
    v15 = (NSDate *)objc_msgSend(v10, "copy");
    departureDate = v14->_departureDate;
    v14->_departureDate = v15;

    v17 = (NSDate *)objc_msgSend(v11, "copy");
    arrivalDate = v14->_arrivalDate;
    v14->_arrivalDate = v17;

    v19 = (NSTimeZone *)objc_msgSend(v12, "copy");
    departureTimeZone = v14->_departureTimeZone;
    v14->_departureTimeZone = v19;

    v21 = (NSTimeZone *)objc_msgSend(v13, "copy");
    arrivalTimeZone = v14->_arrivalTimeZone;
    v14->_arrivalTimeZone = v21;

    v23 = v14;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](self, "departureDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](self, "arrivalDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self, "departureTimeZone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self, "arrivalTimeZone"));
  v9 = objc_msgSend(v4, "initWithDepartureDate:arrivalDate:departureTimeZone:arrivalTimeZone:", v5, v6, v7, v8);

  return v9;
}

+ (id)leaveNowTiming
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithDepartureDate:arrivalDate:departureTimeZone:arrivalTimeZone:", 0, 0, 0, 0);
}

+ (RoutePlanningTiming)timingWithDepartureDate:(id)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithDepartureDate:arrivalDate:departureTimeZone:arrivalTimeZone:", v10, 0, v9, v8);

  return (RoutePlanningTiming *)v11;
}

+ (RoutePlanningTiming)timingWithArrivalDate:(id)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithDepartureDate:arrivalDate:departureTimeZone:arrivalTimeZone:", 0, v10, v9, v8);

  return (RoutePlanningTiming *)v11;
}

+ (RoutePlanningTiming)timingWithTimePoint:(GEOTimepoint *)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5
{
  id v8;
  id v9;
  int var2;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  id v20;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v8 = a4;
  v9 = a5;
  if ((~*(_BYTE *)&a3->var3 & 6) == 0)
  {
    var2 = a3->var2;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->var1));
    v12 = v11;
    if (var2 == 1)
    {
      v14 = v11;
    }
    else
    {
      if (!var2)
      {
        v13 = v11;
        v14 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315650;
        v23 = "+[RoutePlanningTiming timingWithTimePoint:departureTimeZone:arrivalTimeZone:]";
        v24 = 2080;
        v25 = "RoutePlanningTiming.m";
        v26 = 1024;
        v27 = 65;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v22, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v17 = sub_1004318FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v22 = 138412290;
          v23 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);

        }
      }
      v14 = 0;
    }
    v13 = 0;
    goto LABEL_15;
  }
  v14 = 0;
  v13 = 0;
LABEL_16:
  v20 = objc_msgSend(objc_alloc((Class)a1), "initWithDepartureDate:arrivalDate:departureTimeZone:arrivalTimeZone:", v13, v14, v8, v9);

  return (RoutePlanningTiming *)v20;
}

- (BOOL)isDepartNow
{
  return !self->_departureDate && self->_arrivalDate == 0;
}

- (NSTimeZone)bestTimeZone
{
  void *v2;

  if (self->_arrivalDate)
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self, "arrivalTimeZone"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self, "departureTimeZone"));
  return (NSTimeZone *)v2;
}

- (BOOL)isEqualToRoutePlanningTiming:(id)a3
{
  void *v3;
  void *v4;
  RoutePlanningTiming *v6;
  RoutePlanningTiming *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;

  v6 = (RoutePlanningTiming *)a3;
  v7 = v6;
  if (v6)
  {
    if (self != v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](self, "departureDate"));
      if (v8
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](v7, "departureDate"))) != 0)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](self, "departureDate"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](v7, "departureDate"));
        v10 = objc_msgSend(v4, "isEqualToDate:", v9);

        if (v8)
        {
LABEL_11:

          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](self, "arrivalDate"));
          if (v12
            || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](v7, "arrivalDate"))) != 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](self, "arrivalDate"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](v7, "arrivalDate"));
            v15 = objc_msgSend(v13, "isEqualToDate:", v14);

            if (v12)
            {
LABEL_17:

              v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self, "departureTimeZone"));
              v17 = objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](v7, "departureTimeZone"));
              v18 = objc_msgSend(v16, "_navigation_hasSameOffsetFromGMTAsTimeZone:", v17);

              v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self, "arrivalTimeZone"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](v7, "arrivalTimeZone"));
              LOBYTE(v17) = objc_msgSend(v19, "_navigation_hasSameOffsetFromGMTAsTimeZone:", v20);

              v11 = v10 & v15 & v18 & v17;
              goto LABEL_18;
            }
          }
          else
          {
            v15 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(RoutePlanningTiming);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[RoutePlanningTiming isEqualToRoutePlanningTiming:](self, "isEqualToRoutePlanningTiming:", v4);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](self, "departureDate"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](self, "arrivalDate"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureTimeZone](self, "departureTimeZone"));
  v8 = (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalTimeZone](self, "arrivalTimeZone"));
  v10 = v6 ^ v8 ^ (unint64_t)objc_msgSend(v9, "hash");

  return v10;
}

- (GEOTimepoint)timepoint
{
  GEOTimepoint *result;
  double v6;

  retstr->var0 = 0.0;
  retstr->var1 = 0.0;
  *(_QWORD *)&retstr->var2 = 0;
  result = (GEOTimepoint *)self->_departureDate;
  if (result)
  {
    *(_BYTE *)&retstr->var3 = 4;
  }
  else
  {
    result = (GEOTimepoint *)self->_arrivalDate;
    if (!result)
      return result;
    *(_BYTE *)&retstr->var3 = 4;
    retstr->var2 = 1;
  }
  result = (GEOTimepoint *)-[GEOTimepoint timeIntervalSinceReferenceDate](result, "timeIntervalSinceReferenceDate");
  *(_BYTE *)&retstr->var3 = 6;
  retstr->var1 = v6;
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p - departure: %@, arrival: %@, departureTimeZone: %@, arrivalTimeZone: %@>"), objc_opt_class(self), self, self->_departureDate, self->_arrivalDate, self->_departureTimeZone, self->_arrivalTimeZone);
}

- (NSTimeZone)departureTimeZone
{
  NSTimeZone *departureTimeZone;
  NSTimeZone *v4;
  NSTimeZone *v5;

  departureTimeZone = self->_departureTimeZone;
  if (!departureTimeZone)
  {
    v4 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v5 = self->_departureTimeZone;
    self->_departureTimeZone = v4;

    departureTimeZone = self->_departureTimeZone;
  }
  return departureTimeZone;
}

- (NSTimeZone)arrivalTimeZone
{
  NSTimeZone *arrivalTimeZone;
  NSTimeZone *v4;
  NSTimeZone *v5;

  arrivalTimeZone = self->_arrivalTimeZone;
  if (!arrivalTimeZone)
  {
    v4 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v5 = self->_arrivalTimeZone;
    self->_arrivalTimeZone = v4;

    arrivalTimeZone = self->_arrivalTimeZone;
  }
  return arrivalTimeZone;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_arrivalTimeZone, 0);
  objc_storeStrong((id *)&self->_departureTimeZone, 0);
}

+ (RoutePlanningTiming)timingWithUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  void *v9;
  unsigned int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  uint8_t buf[24];
  int v25;
  __int16 v26;
  const char *v27;

  v3 = a3;
  if (!v3)
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "+[RoutePlanningTiming(DirectionsUserInfo) timingWithUserInfo:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "RoutePlanningPreferences+DirectionsUserInfo.m";
      *(_WORD *)&buf[22] = 1024;
      v25 = 46;
      v26 = 2080;
      v27 = "userInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GEOURLTimePoint")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GEOURLTimePoint")));
    if (objc_msgSend(v5, "hasTime"))
    {
      objc_msgSend(v5, "time");
      v7 = v6;
      v8 = 2;
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    if (!objc_msgSend(v5, "hasType"))
      goto LABEL_12;
    v10 = objc_msgSend(v5, "type");
    if (!v10)
    {
      v11 = 0;
      v8 |= 4u;
      goto LABEL_16;
    }
    if (v10 == 1)
    {
      v8 |= 4u;
      v11 = 1;
    }
    else
    {
LABEL_12:
      v11 = 0;
    }
LABEL_16:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = v7;
    *(_DWORD *)&buf[16] = v11;
    buf[20] = v8;
    *(_WORD *)&buf[21] = 0;
    buf[23] = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithTimePoint:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithTimePoint:departureTimeZone:arrivalTimeZone:", buf, 0, 0));

    goto LABEL_17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DirectionsDepartureDateKey")));
  if (v9)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DirectionsArrivalDateKey")));

    if (!v12)
    {
      v15 = 0;
      goto LABEL_17;
    }
  }
  memset(buf, 0, sizeof(buf));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DirectionsDepartureDateKey")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DirectionsArrivalDateKey")));
  sub_1004D99DC((uint64_t)buf, v13, v14);

  v22 = *(_OWORD *)buf;
  v23 = *(_QWORD *)&buf[16];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithTimePoint:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithTimePoint:departureTimeZone:arrivalTimeZone:", &v22, 0, 0));
LABEL_17:

  return (RoutePlanningTiming *)v15;
}

@end
