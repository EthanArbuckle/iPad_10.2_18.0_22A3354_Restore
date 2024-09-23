@implementation SCLTimeInterval

- (SCLTimeInterval)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  SCLTimeInterval *v8;
  uint64_t v9;
  SCLScheduleTime *startTime;
  uint64_t v11;
  SCLScheduleTime *endTime;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCLTimeInterval;
  v8 = -[SCLTimeInterval init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    startTime = v8->_startTime;
    v8->_startTime = (SCLScheduleTime *)v9;

    v11 = objc_msgSend(v7, "copy");
    endTime = v8->_endTime;
    v8->_endTime = (SCLScheduleTime *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLTimeInterval)initWithCoder:(id)a3
{
  id v4;
  SCLTimeInterval *v5;
  uint64_t v6;
  SCLScheduleTime *startTime;
  uint64_t v8;
  SCLScheduleTime *endTime;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLTimeInterval;
  v5 = -[SCLTimeInterval init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (SCLScheduleTime *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (SCLScheduleTime *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SCLScheduleTime *startTime;
  id v5;

  startTime = self->_startTime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startTime, CFSTR("startTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTime, CFSTR("endTime"));

}

- (BOOL)crossesDayBoundary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[SCLTimeInterval endTime](self, "endTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hour"))
  {

  }
  else
  {
    -[SCLTimeInterval endTime](self, "endTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "minute");

    if (!v5)
      return 0;
  }
  -[SCLTimeInterval startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTimeInterval endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7) == 1;

  return v8;
}

- (BOOL)containsScheduleTime:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[SCLTimeInterval crossesDayBoundary](self, "crossesDayBoundary"))
  {
    v5 = -[SCLScheduleTime compare:](self->_endTime, "compare:", v4) == 1
      || -[SCLScheduleTime compare:](self->_startTime, "compare:", v4) != 1;
  }
  else
  {
    -[SCLTimeInterval startTime](self, "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v4) == 1)
    {
      v5 = 0;
    }
    else
    {
      -[SCLTimeInterval endTime](self, "endTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "compare:", v4) == 1;

    }
  }

  return v5;
}

- (BOOL)intersectsTimeInterval:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  int v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLTimeInterval containsScheduleTime:](self, "containsScheduleTime:", v5);

  if (!v6)
  {
    objc_msgSend(v4, "endTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SCLTimeInterval containsScheduleTime:](self, "containsScheduleTime:", v7);

    -[SCLTimeInterval startTime](self, "startTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "endTime");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = (void *)v10;
      v16 = objc_msgSend(v9, "isEqual:", v10);

      v12 = v16 ^ 1;
      goto LABEL_9;
    }
    v11 = objc_msgSend(v4, "containsScheduleTime:", v9);

    if ((v11 & 1) == 0)
    {
      -[SCLTimeInterval endTime](self, "endTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "containsScheduleTime:", v13);

      if (!v14)
      {
        v12 = 0;
        goto LABEL_9;
      }
      -[SCLTimeInterval endTime](self, "endTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startTime");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SCLTimeInterval *v4;
  SCLTimeInterval *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SCLTimeInterval *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCLTimeInterval startTime](self, "startTime");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLTimeInterval startTime](v5, "startTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SCLTimeInterval endTime](self, "endTime");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLTimeInterval endTime](v5, "endTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SCLTimeInterval startTime](self, "startTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SCLTimeInterval endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTimeInterval startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hour");
  -[SCLTimeInterval startTime](self, "startTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "minute");
  -[SCLTimeInterval endTime](self, "endTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hour");
  -[SCLTimeInterval endTime](self, "endTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %02d:%02d - %02d:%02d>"),
    v5,
    self,
    v7,
    v9,
    v11,
    objc_msgSend(v12, "minute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SCLScheduleTime)startTime
{
  return self->_startTime;
}

- (SCLScheduleTime)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
