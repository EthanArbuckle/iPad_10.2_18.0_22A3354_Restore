@implementation PIScalarKeyframe

- (PIScalarKeyframe)initWithTime:(id *)a3 value:(double)a4
{
  PIScalarKeyframe *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PIScalarKeyframe;
  result = -[PIScalarKeyframe init](&v8, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v7;
    result->_value = a4;
  }
  return result;
}

- (PIScalarKeyframe)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PIScalarKeyframe *v8;
  CMTime v10;
  CMTime v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeScale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6 && v7)
  {
    memset(&v11, 0, sizeof(v11));
    CMTimeMake(&v11, objc_msgSend(v5, "longLongValue"), objc_msgSend(v6, "intValue"));
    objc_msgSend(v7, "doubleValue");
    v10 = v11;
    v8 = -[PIScalarKeyframe initWithTime:value:](self, "initWithTime:value:", &v10);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  int64_t value;
  void *v4;
  uint64_t timescale;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("timeValue");
  if (self)
    value = self->_time.value;
  else
    value = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("timeScale");
  if (self)
    timescale = self->_time.timescale;
  else
    timescale = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", timescale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("value");
  if (self)
    v7 = self->_value;
  else
    v7 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (void)nu_updateDigest:(id)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_time;
  id v5;

  p_time = &self->_time;
  v5 = a3;
  objc_msgSend(v5, "addBytes:length:", p_time, 24);
  objc_msgSend(v5, "addBytes:length:", &self->_value, 8);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PIScalarKeyframe;
  -[PIScalarKeyframe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NUStringFromTime();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: t=%@, v=%f"), v4, v5, *(_QWORD *)&self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)keyframeInArray:(id)a3 closestToTime:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  CMTime time1;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      v12 = v6;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (v13)
          time1 = *(CMTime *)(v13 + 16);
        else
          memset(&time1, 0, sizeof(time1));
        v16 = *a4;
        if (CMTimeCompare(&time1, (CMTime *)&v16) > 0)
        {
          v6 = v12;
          goto LABEL_15;
        }
        v6 = (id)v13;

        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v14;
    }
    while (v14);
  }
LABEL_15:

  return v6;
}

@end
