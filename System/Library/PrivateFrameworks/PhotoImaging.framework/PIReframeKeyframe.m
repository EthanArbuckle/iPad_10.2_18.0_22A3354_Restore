@implementation PIReframeKeyframe

- (__n128)initWithTime:(__n128)a3 homography:(__n128)a4
{
  char *v7;
  uint64_t v8;
  __n128 result;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)PIReframeKeyframe;
  v7 = -[PIReframeKeyframe init](&v13, sel_init);
  v8 = *(_QWORD *)(a6 + 16);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)a6;
  *((_QWORD *)v7 + 3) = v8;
  *((__n128 *)v7 + 2) = a2;
  *((__n128 *)v7 + 3) = a3;
  result = a4;
  *((__n128 *)v7 + 4) = a4;
  return result;
}

- (PIReframeKeyframe)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PIReframeKeyframe *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  CMTime v31;
  CMTime v32;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeScale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homography"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v7, "count") == 9
      && (memset(&v32, 0, sizeof(v32)),
          CMTimeMake(&v32, objc_msgSend(v5, "longLongValue"), objc_msgSend(v6, "intValue")),
          (v32.flags & 1) != 0))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      v27 = v9;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");
      v26 = v10;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v25 = v11;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      v24 = v13;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v23 = v15;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v22 = v17;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      objc_msgSend(v7, "objectAtIndexedSubscript:", 7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      objc_msgSend(v7, "objectAtIndexedSubscript:", 8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");

      v31 = v32;
      self = -[PIReframeKeyframe initWithTime:homography:](self, "initWithTime:homography:", &v31, COERCE_DOUBLE(__PAIR64__(v24, v27)), COERCE_DOUBLE(__PAIR64__(v23, v26)), COERCE_DOUBLE(__PAIR64__(v22, v25)));
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIReframeKeyframe time](self, "time");
  NUStringFromTime();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p time:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint32x4_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  _QWORD v32[9];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("timeValue");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PIReframeKeyframe time](self, "time");
  objc_msgSend(v3, "numberWithLongLong:", v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = CFSTR("timeScale");
  v34[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PIReframeKeyframe time](self, "time");
  objc_msgSend(v5, "numberWithInt:", v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._time.timescale, *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 16)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[1].super.isa, *MEMORY[0x1E0C83FE8])), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[2].super.isa, *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32)));
  v8.i32[3] = v8.i32[2];
  if ((vminvq_u32(v8) & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    LODWORD(v9) = self[1]._time.timescale;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v28;
    LODWORD(v10) = self[2].super.isa;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v11;
    LODWORD(v12) = HIDWORD(self[1].super.isa);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v13;
    LODWORD(v14) = self[1]._time.flags;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v15;
    LODWORD(v16) = HIDWORD(self[2].super.isa);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[5] = v17;
    LODWORD(v18) = self[1]._time.value;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = v19;
    LODWORD(v20) = self[1]._time.epoch;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[7] = v21;
    LODWORD(v22) = self[2]._time.value;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[8] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("homography"));
    v26 = objc_msgSend(v25, "copy");

    v7 = (void *)v26;
  }
  return (NSDictionary *)v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (__n128)homography
{
  return a1[2];
}

+ (id)keyframesFromDictionaryRepresentations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PIReframeKeyframe *v11;
  PIReframeKeyframe *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [PIReframeKeyframe alloc];
        v12 = -[PIReframeKeyframe initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

@end
