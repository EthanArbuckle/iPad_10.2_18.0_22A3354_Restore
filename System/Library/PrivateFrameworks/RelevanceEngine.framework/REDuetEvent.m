@implementation REDuetEvent

+ (id)eventWithInterval:(id)a3 value:(id)a4 confidence:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_new();
  v10 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = v7;
  v11 = v7;

  v12 = objc_msgSend(v8, "copy");
  v13 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v12;

  *(double *)(v9 + 24) = a5;
  return (id)v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSDateInterval hash](self->_interval, "hash");
  v4 = -[REFeatureValue hash](self->_value, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  REDuetEvent *v4;
  REDuetEvent *v5;
  NSDateInterval *interval;
  NSDateInterval *v7;
  NSDateInterval *v8;
  NSDateInterval *v9;
  int v10;
  BOOL v11;
  REFeatureValue *value;
  REFeatureValue *v13;
  REFeatureValue *v14;
  REFeatureValue *v15;
  _BOOL4 v16;
  double v17;

  v4 = (REDuetEvent *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      interval = self->_interval;
      v7 = v5->_interval;
      if (interval == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = interval;
        v10 = -[NSDateInterval isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      value = self->_value;
      v13 = v5->_value;
      if (value == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = value;
        v16 = -[REFeatureValue isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      v17 = self->_confidence - v5->_confidence;
      if (v17 < 0.0)
        v17 = -v17;
      v11 = v17 < 0.00000011920929;
      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (REFeatureValue)value
{
  return self->_value;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
