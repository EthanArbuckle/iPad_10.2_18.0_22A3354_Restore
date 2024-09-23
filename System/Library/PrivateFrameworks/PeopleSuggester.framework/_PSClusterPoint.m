@implementation _PSClusterPoint

- (_PSClusterPoint)initWithDate:(id)a3
{
  id v5;
  _PSClusterPoint *v6;
  _PSClusterPoint *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  __double2 v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_PSClusterPoint;
  v6 = -[_PSClusterPoint init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timestamp, a3);
    v7->_timestampExists = 1;
    v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v8, "setDateFormat:", CFSTR("HH"));
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "stringFromDate:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v8, "setDateFormat:", CFSTR("mm"));
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "stringFromDate:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    objc_msgSend(v8, "setDateFormat:", CFSTR("ss"));
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "stringFromDate:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (double)objc_msgSend(v24, "component:fromDate:", 512, v5);
    v26 = __sincos_stret((v18 + v13 * 60.0 + v23 / 60.0 + v18 + v13 * 60.0 + v23 / 60.0) * 3.14159265 / 1440.0);
    v7->_x = v26.__cosval * v25;
    v7->_y = v26.__sinval * v25;

  }
  return v7;
}

- (_PSClusterPoint)initWithX:(double)a3 Y:(double)a4
{
  _PSClusterPoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PSClusterPoint;
  result = -[_PSClusterPoint init](&v7, sel_init);
  if (result)
  {
    result->_x = a3;
    result->_y = a4;
    result->_timestampExists = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  _PSClusterPoint *v6;
  _BOOL4 timestampExists;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = (_PSClusterPoint *)a3;
  if (self == v6)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      timestampExists = self->_timestampExists;
      if (self->_timestampExists)
      {
        -[_PSClusterPoint timestamp](self, "timestamp");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSClusterPoint timestamp](v6, "timestamp");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_10;
        }
      }
      -[_PSClusterPoint x](self, "x");
      v10 = v9;
      -[_PSClusterPoint x](v6, "x");
      if (v10 != v11)
      {
        v8 = 0;
        if (!timestampExists)
          goto LABEL_11;
        goto LABEL_10;
      }
      -[_PSClusterPoint y](self, "y");
      v13 = v12;
      -[_PSClusterPoint y](v6, "y");
      v8 = v13 == v14;
      if (timestampExists)
      {
LABEL_10:

      }
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;

  -[_PSClusterPoint x](self, "x");
  v4 = v3;
  -[_PSClusterPoint y](self, "y");
  return (unint64_t)(v4 * v5);
}

- (double)euclideanDistanceToPoint:(id)a3
{
  double x;
  id v5;
  double v6;
  double v7;
  double y;
  double v9;
  double v10;

  x = self->_x;
  v5 = a3;
  objc_msgSend(v5, "x");
  v7 = (x - v6) * (x - v6);
  y = self->_y;
  objc_msgSend(v5, "y");
  v10 = v9;

  return sqrt(v7 + (y - v10) * (y - v10));
}

- (double)distanceToLineFormedByStart:(id)a3 End:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "x");
  v9 = v8;
  objc_msgSend(v6, "x");
  v11 = v9 - v10;
  -[_PSClusterPoint x](self, "x");
  v13 = v12;
  objc_msgSend(v6, "x");
  v15 = v13 - v14;
  objc_msgSend(v7, "y");
  v17 = v16;
  objc_msgSend(v6, "y");
  v19 = v17 - v18;
  -[_PSClusterPoint y](self, "y");
  v21 = v20;
  objc_msgSend(v6, "y");
  v23 = v19 * (v21 - v22) + v11 * v15;
  objc_msgSend(v6, "euclideanDistanceToPoint:", v7);
  v25 = v23 / (v24 * v24);
  v26 = 0.0;
  if (v25 >= 0.0)
  {
    v26 = v25;
    if (v25 > 1.0)
      v26 = 1.0;
  }
  -[_PSClusterPoint x](self, "x");
  v28 = v27;
  objc_msgSend(v6, "x");
  v30 = v28 - v29;
  objc_msgSend(v7, "x");
  v32 = v31;
  objc_msgSend(v6, "x");
  v34 = (v30 - v26 * (v32 - v33)) * (v30 - v26 * (v32 - v33));
  -[_PSClusterPoint y](self, "y");
  v36 = v35;
  objc_msgSend(v6, "y");
  v38 = v36 - v37;
  objc_msgSend(v7, "y");
  v40 = v39;
  objc_msgSend(v6, "y");
  v42 = sqrt(v34 + (v38 - v26 * (v40 - v41)) * (v38 - v26 * (v40 - v41)));

  return v42;
}

- (int)findSideOfLineFormedByStart:(id)a3 End:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "x");
  v9 = v8;
  objc_msgSend(v7, "x");
  v11 = v9 - v10;
  -[_PSClusterPoint y](self, "y");
  v13 = v12;
  objc_msgSend(v7, "y");
  v15 = v13 - v14;
  objc_msgSend(v6, "y");
  v17 = v16;

  objc_msgSend(v7, "y");
  v19 = v17 - v18;
  -[_PSClusterPoint x](self, "x");
  v21 = v20;
  objc_msgSend(v7, "x");
  v23 = v22;

  v24 = v11 * v15 - v19 * (v21 - v23);
  if (v24 >= 0.0)
    v25 = 0;
  else
    v25 = -1;
  if (v24 > 0.0)
    return 1;
  else
    return v25;
}

- (BOOL)inConvexHull:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  v5 = 0;
  do
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "count");
    if (v5 >= v7)
      break;
    objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", ++v5 % objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_PSClusterPoint findSideOfLineFormedByStart:End:](self, "findSideOfLineFormedByStart:End:", v8, v9);

  }
  while (v10 != -1);

  return v6 >= v7;
}

- (double)distanceToHull:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      v6 = 1.79769313e308;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", ++v5 % objc_msgSend(v4, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSClusterPoint distanceToLineFormedByStart:End:](self, "distanceToLineFormedByStart:End:", v7, v8);
        v10 = v9;

        if (v10 < v6)
          v6 = v10;
      }
      while (v5 < objc_msgSend(v4, "count"));
    }
    else
    {
      v6 = 1.79769313e308;
    }
    if (-[_PSClusterPoint inConvexHull:](self, "inConvexHull:", v4))
      v11 = -v6;
    else
      v11 = v6;
  }
  else
  {
    v11 = 14.0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  id v4;
  _BOOL8 timestampExists;
  NSDate *timestamp;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_timestamp)
    v3 = (void *)objc_opt_new();
  else
    v3 = 0;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  timestampExists = self->_timestampExists;
  timestamp = self->_timestamp;
  objc_msgSend(v3, "setDateFormat:", CFSTR("HH"));
  objc_msgSend(v3, "stringFromDate:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateFormat:", CFSTR("mm"));
  objc_msgSend(v3, "stringFromDate:", self->_timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateFormat:", CFSTR("ss"));
  objc_msgSend(v3, "stringFromDate:", self->_timestamp);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_timestamp)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<_PSClusterPoint %p> timestampExists=%d timestamp=%@ (%@:%@:%@ weekday=%ld) x=%f y=%f"), self, timestampExists, timestamp, v7, v8, v10, objc_msgSend(v11, "component:fromDate:", 512, self->_timestamp), *(_QWORD *)&self->_x, *(_QWORD *)&self->_y);

  }
  else
  {
    v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<_PSClusterPoint %p> timestampExists=%d timestamp=%@ (%@:%@:%@ weekday=%ld) x=%f y=%f"), self, timestampExists, timestamp, v7, v8, v9, -1, *(_QWORD *)&self->_x, *(_QWORD *)&self->_y);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_PSClusterPoint timestamp](self, "timestamp");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (_PSClusterPoint)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _PSClusterPoint *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_PSClusterPoint initWithDate:](self, "initWithDate:", v7);
  return v8;
}

- (BOOL)timestampExists
{
  return self->_timestampExists;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
