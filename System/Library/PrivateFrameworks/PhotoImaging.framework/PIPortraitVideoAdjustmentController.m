@implementation PIPortraitVideoAdjustmentController

- (id)_keyframesForKey:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PIAdjustmentController adjustment](self, "adjustment", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend([a4 alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
          objc_msgSend(v9, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(v9, "copy");
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_setKeyframes:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "dictionaryRepresentation", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[PIAdjustmentController adjustment](self, "adjustment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v7);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v7);

  }
}

- (NSArray)disparityKeyframes
{
  return (NSArray *)-[PIPortraitVideoAdjustmentController _keyframesForKey:class:](self, "_keyframesForKey:class:", CFSTR("disparityKeyframes"), objc_opt_class());
}

- (void)setDisparityKeyframes:(id)a3
{
  -[PIPortraitVideoAdjustmentController _setKeyframes:forKey:](self, "_setKeyframes:forKey:", a3, CFSTR("disparityKeyframes"));
}

- (NSNumber)aperture
{
  void *v2;
  double *v3;
  void *v4;

  -[PIPortraitVideoAdjustmentController _keyframesForKey:class:](self, "_keyframesForKey:class:", CFSTR("apertureKeyframes"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3[1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setAperture:(id)a3
{
  id v4;
  PIScalarKeyframe *v5;
  float v6;
  PIScalarKeyframe *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = [PIScalarKeyframe alloc];
    objc_msgSend(v4, "floatValue");
    v9 = *MEMORY[0x1E0CA2E68];
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v7 = -[PIScalarKeyframe initWithTime:value:](v5, "initWithTime:value:", &v9, v6);
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPortraitVideoAdjustmentController _setKeyframes:forKey:](self, "_setKeyframes:forKey:", v8, CFSTR("apertureKeyframes"));

  }
  else
  {
    -[PIPortraitVideoAdjustmentController _setKeyframes:forKey:](self, "_setKeyframes:forKey:", 0, CFSTR("apertureKeyframes"));
  }

}

- (NSDictionary)cinematographyState
{
  void *v2;
  void *v3;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cinematographyState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setCinematographyState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("cinematographyState"));

}

- (int64_t)debugMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("debugMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)setDebugMode:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("debugMode"));

}

- (unint64_t)renderingVersionAtCapture
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("renderingVersionAtCapture"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setRenderingVersionAtCapture:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("renderingVersionAtCapture"));

}

- (id)visualInputKeys
{
  void *v2;
  void *v3;

  -[PIAdjustmentController inputKeys](self, "inputKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", CFSTR("cinematographyState"));
  return v3;
}

- (void)trimToTimeRange:(id *)a3 usingScript:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  PIScalarKeyframe *v19;
  double v20;
  PIScalarKeyframe *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CMTime lhs;
  CMTime v26;
  CMTime time;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTimeRange range;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PIPortraitVideoAdjustmentController cinematographyState](self, "cinematographyState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    objc_msgSend(v6, "changesDictionaryTrimmedByTimeRange:", &range);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPortraitVideoAdjustmentController setCinematographyState:](self, "setCinematographyState:", v9);

  }
  -[PIPortraitVideoAdjustmentController disparityKeyframes](self, "disparityKeyframes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v24 = v7;
    v11 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v10;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
          if (v17)
            time = *(CMTime *)(v17 + 16);
          else
            memset(&time, 0, sizeof(time));
          v18 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&range.start.epoch = v18;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
          if (CMTimeRangeContainsTime(&range, &time))
          {
            v19 = [PIScalarKeyframe alloc];
            if (v17)
            {
              lhs = *(CMTime *)(v17 + 16);
              *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
              range.start.epoch = a3->var0.var3;
              CMTimeSubtract(&v26, &lhs, &range.start);
              v20 = *(double *)(v17 + 8);
            }
            else
            {
              memset(&lhs, 0, sizeof(lhs));
              *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
              range.start.epoch = a3->var0.var3;
              CMTimeSubtract(&v26, &lhs, &range.start);
              v20 = 0.0;
            }
            v21 = -[PIScalarKeyframe initWithTime:value:](v19, "initWithTime:value:", &v26, v20);
            objc_msgSend(v11, "addObject:", v21);

          }
          ++v16;
        }
        while (v14 != v16);
        v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        v14 = v22;
      }
      while (v22);
    }

    -[PIPortraitVideoAdjustmentController setDisparityKeyframes:](self, "setDisparityKeyframes:", v11);
    v7 = v24;
    v10 = v23;
  }

}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[PIAdjustmentController enabledKey](PIAdjustmentController, "enabledKey", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = CFSTR("apertureKeyframes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
