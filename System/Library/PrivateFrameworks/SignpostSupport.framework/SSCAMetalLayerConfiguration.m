@implementation SSCAMetalLayerConfiguration

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerConfiguration startMachContinuousTime](self, "startMachContinuousTime");
  -[SSCAMetalLayerConfiguration timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerConfiguration endMachContinuousTime](self, "endMachContinuousTime");
  -[SSCAMetalLayerConfiguration timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSCAMetalLayerConfiguration endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSCAMetalLayerConfiguration startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSCAMetalLayerConfiguration endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSCAMetalLayerConfiguration startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSCAMetalLayerConfiguration startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSCAMetalLayerConfiguration endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSCAMetalLayerConfiguration durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSCAMetalLayerConfiguration startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSCAMetalLayerConfiguration endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSCAMetalLayerConfiguration durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (SSCAMetalLayerConfiguration)initWithLayerName:(id)a3 heightInPixels:(id)a4 widthInPixels:(id)a5 mtlPixelFormat:(id)a6 startMachContinuousTime:(unint64_t)a7 startDate:(id)a8 endMachContinuousTime:(unint64_t)a9 endDate:(id)a10 timebaseRatio:(double)a11
{
  id v18;
  id v19;
  id v20;
  SSCAMetalLayerConfiguration *v21;
  SSCAMetalLayerConfiguration *v22;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v18 = a3;
  v19 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a8;
  v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)SSCAMetalLayerConfiguration;
  v21 = -[SSCAMetalLayerConfiguration init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_layerName, a3);
    objc_storeStrong((id *)&v22->_heightPixels, a4);
    objc_storeStrong((id *)&v22->_widthPixels, a5);
    objc_storeStrong((id *)&v22->_mtlPixelFormat, a6);
    v22->_startMachContinuousTime = a7;
    objc_storeStrong((id *)&v22->_startDate, a8);
    v22->_endMachContinuousTime = a9;
    objc_storeStrong((id *)&v22->_endDate, a10);
    v22->_timebaseRatio = a11;
  }

  return v22;
}

- (SSCAMetalLayerConfiguration)initWithInterval:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  SSCAMetalLayerConfiguration *v20;

  v3 = a3;
  objc_msgSend(v3, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderTokenValueDictForTokenKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("name"), v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("Height"), v8, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("Width"), v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v10;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("PixelFormat"), v12, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v3, "startMachContinuousTime");
  objc_msgSend(v3, "beginDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "endMachContinuousTime");
  objc_msgSend(v3, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timebaseRatio");
  v19 = v18;

  v20 = -[SSCAMetalLayerConfiguration initWithLayerName:heightInPixels:widthInPixels:mtlPixelFormat:startMachContinuousTime:startDate:endMachContinuousTime:endDate:timebaseRatio:](self, "initWithLayerName:heightInPixels:widthInPixels:mtlPixelFormat:startMachContinuousTime:startDate:endMachContinuousTime:endDate:timebaseRatio:", v7, v9, v11, v13, v14, v15, v19, v16, v17);
  return v20;
}

- (void)updateTimeRange:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *startDate;
  void *v17;
  NSDate *v18;
  NSDate *endDate;
  id v20;

  v4 = a3;
  v5 = -[SSCAMetalLayerConfiguration startMachContinuousTime](self, "startMachContinuousTime");
  v6 = objc_msgSend(v4, "startMachContinuousTime");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  if (v5 + 1 >= 2)
    v8 = v7;
  else
    v8 = v6;
  self->_startMachContinuousTime = v8;
  v9 = -[SSCAMetalLayerConfiguration endMachContinuousTime](self, "endMachContinuousTime");
  v10 = objc_msgSend(v4, "endMachContinuousTime");
  if (v9 <= v10)
    v11 = v10;
  else
    v11 = v9;
  if (v9 + 1 >= 2)
    v12 = v11;
  else
    v12 = v10;
  self->_endMachContinuousTime = v12;
  -[SSCAMetalLayerConfiguration startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _getEarliestDate(v13, v14);
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v15;

  -[SSCAMetalLayerConfiguration endDate](self, "endDate");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _getLatestDate(v20, v17);
  v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v18;

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  _timeIntervalDict(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSCAMetalLayerConfiguration layerName](self, "layerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SSCAMetalLayerConfiguration layerName](self, "layerName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSSCAMLConfigurationKey_Name);

  }
  -[SSCAMetalLayerConfiguration heightPixels](self, "heightPixels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SSCAMetalLayerConfiguration heightPixels](self, "heightPixels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kSSCAMLConfigurationKey_HeightInPixels);

  }
  -[SSCAMetalLayerConfiguration widthPixels](self, "widthPixels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SSCAMetalLayerConfiguration widthPixels](self, "widthPixels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kSSCAMLConfigurationKey_WidthInPixels);

  }
  -[SSCAMetalLayerConfiguration mtlPixelFormat](self, "mtlPixelFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SSCAMetalLayerConfiguration mtlPixelFormat](self, "mtlPixelFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kSSCAMLConfigurationKey_MTLPixelFormat);

  }
  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerConfiguration jsonDescription:](self, "jsonDescription:", 3);
}

- (BOOL)hasEqualConfiguration:(id)a3
{
  SSCAMetalLayerConfiguration *v4;
  SSCAMetalLayerConfiguration *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  char v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  int v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;

  v4 = (SSCAMetalLayerConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (self != v4)
    {
      -[SSCAMetalLayerConfiguration layerName](self, "layerName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerConfiguration layerName](v5, "layerName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = (void *)v9;
      if (!v8 && v9)
      {
        v11 = 0;
        v12 = v9;
LABEL_34:

        goto LABEL_35;
      }
      if (v8 | v9)
      {
        v13 = objc_msgSend((id)v8, "isEqual:", v9);

        if (!v13)
        {
          v11 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      -[SSCAMetalLayerConfiguration heightPixels](self, "heightPixels");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerConfiguration heightPixels](v5, "heightPixels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v16 = v15;
      v17 = (void *)v16;
      if (!v12 && v16)
      {
        v11 = 0;
        v12 = 0;
        v18 = v16;
LABEL_32:

        goto LABEL_33;
      }
      if (v12 | v16)
      {
        v19 = objc_msgSend((id)v12, "isEqual:", v16);

        if (!v19)
        {
          v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      -[SSCAMetalLayerConfiguration widthPixels](self, "widthPixels");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerConfiguration widthPixels](v5, "widthPixels");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v22 = v21;
      v23 = (void *)v22;
      if (v18 || !v22)
      {
        if (v18 | v22)
        {
          v25 = objc_msgSend((id)v18, "isEqual:", v22);

          if (!v25)
          {
            v11 = 0;
LABEL_31:

            goto LABEL_32;
          }
        }
        -[SSCAMetalLayerConfiguration mtlPixelFormat](self, "mtlPixelFormat");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSCAMetalLayerConfiguration mtlPixelFormat](v5, "mtlPixelFormat");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v26;
        v28 = v27;
        v29 = (void *)v28;
        if (v24 || !v28)
        {
          if (v24 | v28)
            v11 = objc_msgSend((id)v24, "isEqual:", v28);
          else
            v11 = 1;
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v18 = 0;
        v11 = 0;
        v24 = v22;
      }

      goto LABEL_31;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
LABEL_36:

  return v11;
}

- (BOOL)includeTimelines
{
  return 1;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (NSNumber)heightPixels
{
  return self->_heightPixels;
}

- (NSNumber)widthPixels
{
  return self->_widthPixels;
}

- (NSNumber)mtlPixelFormat
{
  return self->_mtlPixelFormat;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (void)setStartMachContinuousTime:(unint64_t)a3
{
  self->_startMachContinuousTime = a3;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)setEndMachContinuousTime:(unint64_t)a3
{
  self->_endMachContinuousTime = a3;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_mtlPixelFormat, 0);
  objc_storeStrong((id *)&self->_widthPixels, 0);
  objc_storeStrong((id *)&self->_heightPixels, 0);
  objc_storeStrong((id *)&self->_layerName, 0);
}

@end
