@implementation OU3DObjectCorner

- (OU3DObjectCorner)init
{
  OU3DObjectCorner *v2;
  uint64_t v3;
  NSMutableArray *coordinate;
  uint64_t v5;
  NSMutableArray *inView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OU3DObjectCorner;
  v2 = -[OU3DObjectCorner init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    coordinate = v2->_coordinate;
    v2->_coordinate = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    inView = v2->_inView;
    v2->_inView = (NSMutableArray *)v5;

  }
  *(_OWORD *)&v2->kCornerTimerThreshold = xmmword_2295608F0;
  v2->isCompleted = 0;
  return v2;
}

- (void)updateIsCompleted
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double kCornerTimerThreshold;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  float32x4_t v22;
  float32x4_t v23;
  BOOL v24;
  id v25;
  id v26;
  float32x4_t v27;
  float32x4_t v28;

  if (!self->isCompleted)
  {
    v3 = -[NSMutableArray count](self->_coordinate, "count");
    if (v3 <= 1)
    {
      self->isCompleted = 0;
      return;
    }
    v4 = v3;
    -[NSMutableArray objectAtIndexedSubscript:](self->_timer, "objectAtIndexedSubscript:", v3 - 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v6 = v5;
    -[NSMutableArray objectAtIndexedSubscript:](self->_timer, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v6 - v8;
    kCornerTimerThreshold = self->kCornerTimerThreshold;

    if (v9 > kCornerTimerThreshold)
    {
      self->isCompleted = 1;
      return;
    }
    v26 = (id)objc_opt_new();
    v11 = 0;
    v12 = MEMORY[0x24BDBD1C8];
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_inView, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v12);

      if (v14)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_coordinate, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v15);

      }
      ++v11;
    }
    while (v4 != v11);
    v16 = objc_msgSend(v26, "count");
    v17 = v16 - 1;
    if (v16 <= 1)
    {
      self->isCompleted = 0;
LABEL_19:

      return;
    }
    v28.i32[2] = 0;
    v28.i64[0] = 0;
    v27.i32[2] = 0;
    v27.i64[0] = 0;
    objc_msgSend(v26, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = float3FromNSArray(v18, &v28);

    if (v19
      && (objc_msgSend(v26, "objectAtIndexedSubscript:", v17),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = float3FromNSArray(v20, &v27),
          v20,
          v21))
    {
      v22 = vsubq_f32(v28, v27);
      v23 = vmulq_f32(v22, v22);
      if (self->kCornerLocationThreshold <= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0]))goto LABEL_19;
      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
    self->isCompleted = v24;
    goto LABEL_19;
  }
}

- (void)addCornerStatus:(id)a3 inView:(id)a4 timestamp:
{
  __int128 v4;
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  _QWORD v15[4];

  v14 = v4;
  v15[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  HIDWORD(v10) = DWORD1(v14);
  LODWORD(v10) = DWORD1(v14);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v14), DWORD2(v14))));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_coordinate, "addObject:", v13);
  -[NSMutableArray addObject:](self->_inView, "addObject:", v7);
  -[NSMutableArray addObject:](self->_timer, "addObject:", v8);
  -[OU3DObjectCorner updateIsCompleted](self, "updateIsCompleted");

}

- (BOOL)isCompleted
{
  return self->isCompleted;
}

- (NSArray)coordinate
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoordinate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)inView
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)timestamp
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_inView, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end
