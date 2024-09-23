@implementation _SSCAMLTimeInterval

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[_SSCAMLTimeInterval startMachContinuousTime](self, "startMachContinuousTime");
  -[_SSCAMLTimeInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[_SSCAMLTimeInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[_SSCAMLTimeInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[_SSCAMLTimeInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[_SSCAMLTimeInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[_SSCAMLTimeInterval endSeconds](self, "endSeconds");
  v4 = v3;
  -[_SSCAMLTimeInterval startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[_SSCAMLTimeInterval startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[_SSCAMLTimeInterval endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[_SSCAMLTimeInterval durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[_SSCAMLTimeInterval startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[_SSCAMLTimeInterval endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[_SSCAMLTimeInterval durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[_SSCAMLTimeInterval jsonDescription:](self, "jsonDescription:", 3);
}

- (_SSCAMLTimeInterval)initWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 timebaseRatio:(double)a7
{
  id v13;
  id v14;
  void *v15;
  _SSCAMLTimeInterval *v16;
  double v18;
  double v19;
  double v20;
  _SSCAMLTimeInterval *v21;
  id *p_isa;
  objc_super v23;

  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (a3 >= a4 || !v13 && v14 || v13 && !v14)
    goto LABEL_6;
  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSince1970");
    v19 = v18;
    objc_msgSend(v15, "timeIntervalSince1970");
    v16 = 0;
    if (a7 <= 0.0 || v19 >= v20)
      goto LABEL_7;
  }
  else if (a7 <= 0.0)
  {
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  v23.receiver = self;
  v23.super_class = (Class)_SSCAMLTimeInterval;
  v21 = -[_SSCAMLTimeInterval init](&v23, sel_init);
  p_isa = (id *)&v21->super.isa;
  if (v21)
  {
    v21->_startMachContinuousTime = a3;
    v21->_endMachContinuousTime = a4;
    v21->_timebaseRatio = a7;
    objc_storeStrong((id *)&v21->_startDate, a5);
    objc_storeStrong(p_isa + 2, a6);
  }
  self = p_isa;
  v16 = self;
LABEL_7:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  _SSCAMLTimeInterval *v4;
  _SSCAMLTimeInterval *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (_SSCAMLTimeInterval *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_SSCAMLTimeInterval startMachContinuousTime](self, "startMachContinuousTime");
      if (v6 == -[_SSCAMLTimeInterval startMachContinuousTime](v5, "startMachContinuousTime")
        || (v7 = -[_SSCAMLTimeInterval endMachContinuousTime](self, "endMachContinuousTime"),
            v7 != -[_SSCAMLTimeInterval endMachContinuousTime](v5, "endMachContinuousTime"))
        || (-[_SSCAMLTimeInterval timebaseRatio](self, "timebaseRatio"),
            v9 = v8,
            -[_SSCAMLTimeInterval timebaseRatio](v5, "timebaseRatio"),
            v9 != v10))
      {
        -[_SSCAMLTimeInterval startDate](self, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          -[_SSCAMLTimeInterval startDate](v5, "startDate");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
            goto LABEL_25;
        }
        -[_SSCAMLTimeInterval startDate](self, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[_SSCAMLTimeInterval startDate](v5, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          if (!v13)
            goto LABEL_23;
        }
        else
        {

          if (v11)
        }
        -[_SSCAMLTimeInterval endDate](self, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          -[_SSCAMLTimeInterval endDate](v5, "endDate");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
LABEL_25:
            v19 = (void *)v15;
            v14 = 0;
            goto LABEL_34;
          }
        }
        -[_SSCAMLTimeInterval endDate](self, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[_SSCAMLTimeInterval endDate](v5, "endDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          if (!v18)
            goto LABEL_23;
        }
        else
        {

          if (v16)
        }
        -[_SSCAMLTimeInterval startDate](self, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v14 = 1;
          goto LABEL_35;
        }
        -[_SSCAMLTimeInterval startDate](self, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SSCAMLTimeInterval startDate](v5, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToDate:", v21))
        {
          -[_SSCAMLTimeInterval endDate](self, "endDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_SSCAMLTimeInterval endDate](v5, "endDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v22, "isEqualToDate:", v23);

        }
        else
        {
          v14 = 0;
        }

LABEL_34:
        goto LABEL_35;
      }
LABEL_23:
      v14 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v14 = 0;
  }
LABEL_36:

  return v14;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
