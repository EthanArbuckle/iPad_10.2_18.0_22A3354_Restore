@implementation SSInFlightCAMetalDrawableInterval

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSInFlightCAMetalDrawableInterval startMachContinuousTime](self, "startMachContinuousTime");
  -[SSInFlightCAMetalDrawableInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSInFlightCAMetalDrawableInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SSInFlightCAMetalDrawableInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSInFlightCAMetalDrawableInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSInFlightCAMetalDrawableInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSInFlightCAMetalDrawableInterval endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSInFlightCAMetalDrawableInterval startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSInFlightCAMetalDrawableInterval startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSInFlightCAMetalDrawableInterval endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSInFlightCAMetalDrawableInterval durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSInFlightCAMetalDrawableInterval startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSInFlightCAMetalDrawableInterval endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSInFlightCAMetalDrawableInterval durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[SSInFlightCAMetalDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[SSInFlightCAMetalDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSInFlightCAMetalDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startMachContinuousTime");

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSInFlightCAMetalDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "endMachContinuousTime");

  return v3;
}

- (double)timebaseRatio
{
  void *v2;
  double v3;
  double v4;

  -[SSInFlightCAMetalDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timebaseRatio");
  v4 = v3;

  return v4;
}

- (double)totalEndToEndWalltime
{
  float v2;

  -[SSInFlightCAMetalDrawableInterval durationSeconds](self, "durationSeconds");
  return v2;
}

- (double)cpuEndToEndWalltime
{
  void *v2;
  float v3;
  double v4;

  -[SSInFlightCAMetalDrawableInterval cpuWalltimeInterval](self, "cpuWalltimeInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationSeconds");
  v4 = v3;

  return v4;
}

- (double)gpuEndToEndWalltime
{
  void *v2;
  float v3;
  double v4;

  -[SSInFlightCAMetalDrawableInterval gpuWalltimeInterval](self, "gpuWalltimeInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationSeconds");
  v4 = v3;

  return v4;
}

- (double)waitForGlassWalltime
{
  void *v2;
  float v3;
  double v4;

  -[SSInFlightCAMetalDrawableInterval waitForGlassWalltimeInterval](self, "waitForGlassWalltimeInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationSeconds");
  v4 = v3;

  return v4;
}

- (double)gpuResidencyRatio
{
  double v3;
  double v4;
  double result;
  double v6;
  double v7;
  double v8;

  -[SSInFlightCAMetalDrawableInterval gpuEndToEndWalltime](self, "gpuEndToEndWalltime");
  v4 = v3;
  result = 0.0;
  if (v4 != 0.0)
  {
    -[SSInFlightCAMetalDrawableInterval onGPUTime](self, "onGPUTime", 0.0);
    v7 = v6;
    -[SSInFlightCAMetalDrawableInterval gpuEndToEndWalltime](self, "gpuEndToEndWalltime");
    return v7 / v8;
  }
  return result;
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
  void *v12;

  _timeIntervalDict(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SSInFlightCAMetalDrawableInterval commandBufferCount](self, "commandBufferCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kSSInFlightCAMetalDrawableIntervalKey_CommandBufferCount);

  -[SSInFlightCAMetalDrawableInterval cpuWalltimeInterval](self, "cpuWalltimeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kSSInFlightCAMetalDrawableIntervalKey_CPUEndToEndInterval);

  -[SSInFlightCAMetalDrawableInterval gpuWalltimeInterval](self, "gpuWalltimeInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, kSSInFlightCAMetalDrawableIntervalKey_GPUEndToEndInterval);

  -[SSInFlightCAMetalDrawableInterval waitForGlassWalltimeInterval](self, "waitForGlassWalltimeInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, kSSInFlightCAMetalDrawableIntervalKey_GPUDoneToGlassWaitInterval);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[SSInFlightCAMetalDrawableInterval onGPUTime](self, "onGPUTime");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, kSSInFlightCAMetalDrawableIntervalKey_OnGPUTime);

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSInFlightCAMetalDrawableInterval jsonDescription:](self, "jsonDescription:", 3);
}

- (SSInFlightCAMetalDrawableInterval)initWithOnGlassSignpostInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  SSInFlightCAMetalDrawableInterval *v12;
  id v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
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
  void *v35;
  void *v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _SSCAMLTimeInterval *v46;
  _SSCAMLTimeInterval *v47;
  _SSCAMLTimeInterval *v48;
  _SSCAMLTimeInterval *v49;
  _SSCAMLTimeInterval *v50;
  _SSCAMLTimeInterval *v51;
  _SSCAMLTimeInterval *v52;
  SSInFlightCAMetalDrawableInterval *v53;
  SSInFlightCAMetalDrawableInterval *v54;
  unsigned int v56;
  _SSCAMLTimeInterval *v57;
  _SSCAMLTimeInterval *v58;
  unint64_t v59;
  _SSCAMLTimeInterval *obj;
  double v61;
  _SSCAMLTimeInterval *v62;
  void *v63;
  id v64;
  _SSCAMLTimeInterval *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;

  v4 = a3;
  objc_msgSend(v4, "beginEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderTokenValueDictForTokenKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  _objectValueForKey((uint64_t)CFSTR("command_buffer_count"), v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v7;
    objc_opt_class();
    _objectValueForKey((uint64_t)CFSTR("inflight_end_to_end_total_ms"), v9, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_msgSend(v10, "doubleValue"), v11 >= 0.0))
    {
      v13 = v9;
      objc_opt_class();
      _objectValueForKey((uint64_t)CFSTR("inflight_end_to_end_cpu_ms"), v13, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && (objc_msgSend(v14, "doubleValue"), v15 >= 0.0))
      {
        v16 = v13;
        objc_opt_class();
        _objectValueForKey((uint64_t)CFSTR("inflight_end_to_end_gpu_ms"), v16, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && (objc_msgSend(v17, "doubleValue"), v18 >= 0.0))
        {
          _numberValueForKey(CFSTR("inflight_on_gpu_ms"), v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19 && (objc_msgSend(v19, "doubleValue"), v21 >= 0.0))
          {
            _numberValueForKey(CFSTR("inflight_wait_for_glass_ms"), v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22 && (objc_msgSend(v22, "doubleValue"), v24 >= 0.0))
            {
              v56 = objc_msgSend(v8, "unsignedIntValue");
              objc_msgSend(v10, "doubleValue");
              v26 = v25 / 1000.0;
              objc_msgSend(v14, "doubleValue");
              v28 = v27 / 1000.0;
              objc_msgSend(v17, "doubleValue");
              v30 = v29 / 1000.0;
              objc_msgSend(v20, "doubleValue");
              v32 = v31;
              objc_msgSend(v23, "doubleValue");
              v34 = v33 / 1000.0;
              objc_msgSend(v4, "beginDate");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v63 = v23;
              v61 = v30;
              if (v35)
              {
                objc_msgSend(v4, "beginDate");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "dateByAddingTimeInterval:", -v26);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "dateByAddingTimeInterval:", v28);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v36;
                objc_msgSend(v36, "dateByAddingTimeInterval:", -v34);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "dateByAddingTimeInterval:", -v30);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v69 = 0;
                v70 = 0;
                v67 = 0;
                v68 = 0;
                v66 = 0;
              }
              v37 = objc_msgSend(v4, "startMachContinuousTime");
              v38 = (double)v37;
              objc_msgSend(v4, "timebaseRatio");
              v64 = (id)((double)v37 - v26 * 1000000000.0 / v39);
              objc_msgSend(v4, "timebaseRatio");
              v41 = v40;
              objc_msgSend(v4, "timebaseRatio");
              v43 = v42;
              objc_msgSend(v4, "timebaseRatio");
              v45 = v44;
              v46 = [_SSCAMLTimeInterval alloc];
              objc_msgSend(v4, "timebaseRatio");
              v59 = v37;
              v47 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v46, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:");
              if (v47)
              {
                obj = v47;
                v57 = [_SSCAMLTimeInterval alloc];
                objc_msgSend(v4, "timebaseRatio");
                v48 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v57, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", v64, (unint64_t)(v28 * 1000000000.0 / v41 + (double)(unint64_t)v64), v69, v68);
                if (v48)
                {
                  v65 = v48;
                  v49 = [_SSCAMLTimeInterval alloc];
                  objc_msgSend(v4, "timebaseRatio");
                  v50 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v49, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", (unint64_t)((double)(unint64_t)(v38 - v34 * 1000000000.0 / v43)- v61 * 1000000000.0 / v45), (unint64_t)(v38 - v34 * 1000000000.0 / v43), v66, v67);
                  if (v50)
                  {
                    v58 = v50;
                    v51 = [_SSCAMLTimeInterval alloc];
                    objc_msgSend(v4, "timebaseRatio");
                    v52 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v51, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", (unint64_t)(v38 - v34 * 1000000000.0 / v43), v59, v67, v70);
                    v23 = v63;
                    if (v52)
                    {
                      v62 = v52;
                      v71.receiver = self;
                      v71.super_class = (Class)SSInFlightCAMetalDrawableInterval;
                      v53 = -[SSInFlightCAMetalDrawableInterval init](&v71, sel_init);
                      v54 = v53;
                      if (v53)
                      {
                        objc_storeStrong((id *)&v53->_backingInterval, obj);
                        objc_storeStrong((id *)&v54->_cpuWalltimeInterval, v65);
                        objc_storeStrong((id *)&v54->_gpuWalltimeInterval, v58);
                        objc_storeStrong((id *)&v54->_waitForGlassWalltimeInterval, v62);
                        v54->_commandBufferCount = v56;
                        v54->_onGPUTime = v32 / 1000.0;
                      }
                      self = v54;
                      v12 = self;
                      v52 = v62;
                    }
                    else
                    {
                      v12 = 0;
                    }

                    v50 = v58;
                  }
                  else
                  {
                    v12 = 0;
                    v23 = v63;
                  }

                  v48 = v65;
                }
                else
                {
                  v12 = 0;
                  v23 = v63;
                }

                v47 = obj;
              }
              else
              {
                v12 = 0;
                v23 = v63;
              }

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unsigned)commandBufferCount
{
  return self->_commandBufferCount;
}

- (double)onGPUTime
{
  return self->_onGPUTime;
}

- (SSCAMLTimeInterval)cpuWalltimeInterval
{
  return self->_cpuWalltimeInterval;
}

- (SSCAMLTimeInterval)gpuWalltimeInterval
{
  return self->_gpuWalltimeInterval;
}

- (SSCAMLTimeInterval)waitForGlassWalltimeInterval
{
  return self->_waitForGlassWalltimeInterval;
}

- (_SSCAMLTimeInterval)backingInterval
{
  return self->_backingInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingInterval, 0);
  objc_storeStrong((id *)&self->_waitForGlassWalltimeInterval, 0);
  objc_storeStrong((id *)&self->_gpuWalltimeInterval, 0);
  objc_storeStrong((id *)&self->_cpuWalltimeInterval, 0);
}

@end
