@implementation PFSlowMotionTimeRangeMapper

- (PFSlowMotionTimeRangeMapper)init
{
  PFSlowMotionTimeRangeMapper *v2;
  NSMutableArray *v3;
  NSMutableArray *originalLengths;
  NSMutableArray *v5;
  NSMutableArray *scaledLengths;
  NSMutableArray *v7;
  NSMutableArray *scaledRegions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFSlowMotionTimeRangeMapper;
  v2 = -[PFSlowMotionTimeRangeMapper init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    originalLengths = v2->_originalLengths;
    v2->_originalLengths = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scaledLengths = v2->_scaledLengths;
    v2->_scaledLengths = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scaledRegions = v2->_scaledRegions;
    v2->_scaledRegions = v7;

  }
  return v2;
}

- (void)addNextRange:(float)a3 scaledLength:(float)a4
{
  NSMutableArray *originalLengths;
  void *v7;
  NSMutableArray *scaledLengths;
  double v9;
  id v10;

  originalLengths = self->_originalLengths;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](originalLengths, "addObject:", v7);

  scaledLengths = self->_scaledLengths;
  *(float *)&v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](scaledLengths, "addObject:", v10);

}

- (float)scaledTimeForOriginalTime:(float)a3
{
  float result;

  -[PFSlowMotionTimeRangeMapper _mapTime:fromLengths:toLengths:](self, "_mapTime:fromLengths:toLengths:", self->_originalLengths, self->_scaledLengths);
  return result;
}

- (float)originalTimeForScaledTime:(float)a3
{
  float result;

  -[PFSlowMotionTimeRangeMapper _mapTime:fromLengths:toLengths:](self, "_mapTime:fromLengths:toLengths:", self->_scaledLengths, self->_originalLengths);
  return result;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)scaledTimeRangeForOriginalTimeRange:(SEL)a3
{
  double Seconds;
  __int128 v8;
  Float64 v9;
  double v10;
  float v11;
  Float64 v12;
  double v13;
  float v14;
  Float64 v15;
  CMTime v17;
  CMTime start;
  CMTimeRange time;
  CMTime v20;

  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  time.start.epoch = a4->var0.var3;
  Seconds = CMTimeGetSeconds(&time.start);
  v8 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&time.start.epoch = v8;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CMTimeRangeGetEnd(&v20, &time);
  v9 = CMTimeGetSeconds(&v20);
  v10 = v9;
  *(float *)&v9 = Seconds;
  -[PFSlowMotionTimeRangeMapper scaledTimeForOriginalTime:](self, "scaledTimeForOriginalTime:", v9);
  v12 = v11;
  *(float *)&v13 = v10;
  -[PFSlowMotionTimeRangeMapper scaledTimeForOriginalTime:](self, "scaledTimeForOriginalTime:", v13);
  v15 = v14;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  CMTimeMakeWithSeconds(&start, v12, 600);
  CMTimeMakeWithSeconds(&v17, v15, 600);
  return ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v17);
}

- (float)_mapTime:(float)a3 fromLengths:(id)a4 toLengths:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  float v19;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0.0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      v19 = (float)(a3 * v18) / v15;
      if (a3 <= v15)
      {
        a3 = 0.0;
      }
      else
      {
        v19 = v18;
        a3 = a3 - v15;
      }
      v12 = v12 + v19;
      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    v12 = 0.0;
  }

  return v12 + a3;
}

- (void)markScaledRegionWithRate:(float)a3 rampInStartTime:(float)a4 rampInEndTime:(float)a5 rampOutStartTime:(float)a6 rampOutEndTime:(float)a7
{
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PFSlowMotionTimeRangeMapperScaledRegion *v18;

  v18 = objc_alloc_init(PFSlowMotionTimeRangeMapperScaledRegion);
  *(float *)&v13 = a3;
  -[PFSlowMotionTimeRangeMapperScaledRegion setRate:](v18, "setRate:", v13);
  *(float *)&v14 = a4;
  -[PFSlowMotionTimeRangeMapperScaledRegion setRampInStartTime:](v18, "setRampInStartTime:", v14);
  *(float *)&v15 = a5;
  -[PFSlowMotionTimeRangeMapperScaledRegion setRampInEndTime:](v18, "setRampInEndTime:", v15);
  *(float *)&v16 = a6;
  -[PFSlowMotionTimeRangeMapperScaledRegion setRampOutStartTime:](v18, "setRampOutStartTime:", v16);
  *(float *)&v17 = a7;
  -[PFSlowMotionTimeRangeMapperScaledRegion setRampOutEndTime:](v18, "setRampOutEndTime:", v17);
  -[NSMutableArray addObject:](self->_scaledRegions, "addObject:", v18);

}

- (void)enumerateScaledRegionsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *scaledRegions;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  scaledRegions = self->_scaledRegions;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PFSlowMotionTimeRangeMapper_enumerateScaledRegionsUsingBlock___block_invoke;
  v7[3] = &unk_1E45A3430;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](scaledRegions, "enumerateObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaledRegions, 0);
  objc_storeStrong((id *)&self->_scaledLengths, 0);
  objc_storeStrong((id *)&self->_originalLengths, 0);
}

uint64_t __64__PFSlowMotionTimeRangeMapper_enumerateScaledRegionsUsingBlock___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  id v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "rate");
    v5 = v4;
    objc_msgSend(v3, "rampInStartTime");
    v7 = v6;
    objc_msgSend(v3, "rampInEndTime");
    v9 = v8;
    objc_msgSend(v3, "rampOutStartTime");
    v11 = v10;
    objc_msgSend(v3, "rampOutEndTime");
    v13 = v12;

    return (*(uint64_t (**)(uint64_t, float, float, float, float, float))(v2 + 16))(v2, v5, v7, v9, v11, v13);
  }
  return result;
}

@end
