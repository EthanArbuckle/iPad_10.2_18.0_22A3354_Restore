@implementation PRDeviceScore

- (PRDeviceScore)init
{
  -[PRDeviceScore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRDeviceScore)initWithValues:(id)a3 proximity:(int64_t)a4 range:(id)a5 angle:(id)a6 score:(double)a7 scoreUncertainty:(double)a8
{
  id v15;
  id v16;
  id v17;
  PRDeviceScore *v18;
  uint64_t v19;
  NSData *btAddress;
  uint64_t v21;
  PRRangeMeasurement *range;
  uint64_t v23;
  PRAngleMeasurement *angle;
  void *v26;
  objc_super v27;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRDeviceScore.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("btAddress"));

  }
  v27.receiver = self;
  v27.super_class = (Class)PRDeviceScore;
  v18 = -[PRDeviceScore init](&v27, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v15, "copy");
    btAddress = v18->_btAddress;
    v18->_btAddress = (NSData *)v19;

    v18->_proximity = a4;
    v21 = objc_msgSend(v16, "copy");
    range = v18->_range;
    v18->_range = (PRRangeMeasurement *)v21;

    v23 = objc_msgSend(v17, "copy");
    angle = v18->_angle;
    v18->_angle = (PRAngleMeasurement *)v23;

    v18->_score = a7;
    v18->_scoreUncertainty = a8;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  PRDeviceScore *v4;
  PRDeviceScore *v5;
  BOOL v6;

  v4 = (PRDeviceScore *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PRDeviceScore isEqualToPRDeviceScore:](self, "isEqualToPRDeviceScore:", v5);

  return v6;
}

- (BOOL)isEqualToPRDeviceScore:(id)a3
{
  PRDeviceScore *v4;
  PRDeviceScore *v5;
  NSData *btAddress;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v4 = (PRDeviceScore *)a3;
  v5 = v4;
  if (self != v4)
  {
    btAddress = self->_btAddress;
    -[PRDeviceScore btAddress](v4, "btAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(btAddress) = -[NSData isEqual:](btAddress, "isEqual:", v7);

    if (!(_DWORD)btAddress)
      goto LABEL_17;
    v8 = -[PRDeviceScore proximity](self, "proximity");
    if (v8 != -[PRDeviceScore proximity](v5, "proximity"))
      goto LABEL_17;
    -[PRDeviceScore range](self, "range");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          -[PRDeviceScore range](v5, "range"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      -[PRDeviceScore range](self, "range");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRDeviceScore range](v5, "range");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) == 0)
        goto LABEL_17;
    }
    else
    {
      -[PRDeviceScore range](self, "range");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        goto LABEL_16;
      -[PRDeviceScore range](v5, "range");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_17;
    }
    -[PRDeviceScore angle](self, "angle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[PRDeviceScore angle](v5, "angle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[PRDeviceScore angle](self, "angle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRDeviceScore angle](v5, "angle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if ((v23 & 1) != 0)
        {
LABEL_20:
          -[PRDeviceScore score](self, "score");
          v27 = v26;
          -[PRDeviceScore score](v5, "score");
          if (v27 == v28)
          {
            -[PRDeviceScore scoreUncertainty](self, "scoreUncertainty");
            v30 = v29;
            -[PRDeviceScore scoreUncertainty](v5, "scoreUncertainty");
            v15 = v30 == v31;
            goto LABEL_18;
          }
        }
LABEL_17:
        v15 = 0;
        goto LABEL_18;
      }
    }
    -[PRDeviceScore angle](self, "angle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      -[PRDeviceScore angle](v5, "angle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        goto LABEL_20;
      goto LABEL_17;
    }
LABEL_16:

    goto LABEL_17;
  }
  v15 = 1;
LABEL_18:

  return v15;
}

- (NSData)btAddress
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (PRRangeMeasurement)range
{
  return (PRRangeMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (PRAngleMeasurement)angle
{
  return (PRAngleMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (double)score
{
  return self->_score;
}

- (double)scoreUncertainty
{
  return self->_scoreUncertainty;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angle, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
}

@end
