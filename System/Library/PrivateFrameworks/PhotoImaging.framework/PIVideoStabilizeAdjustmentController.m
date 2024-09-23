@implementation PIVideoStabilizeAdjustmentController

- (double)cropFraction
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cropFraction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setCropFraction:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("cropFraction"));

}

- (unint64_t)analysisType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("analysisType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pixel")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("gyro")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAnalysisType:(unint64_t)a3
{
  void *v3;
  const __CFString *v4;
  id v5;

  if (a3 == 2)
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("gyro");
  }
  else
  {
    if (a3 != 1)
      return;
    -[PIAdjustmentController adjustment](self, "adjustment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("pixel");
  }
  v5 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("analysisType"));

}

- (NSArray)keyframes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoStabilizeAdjustmentController keyframesKey](PIVideoStabilizeAdjustmentController, "keyframesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIReframeKeyframe keyframesFromDictionaryRepresentations:](PIReframeKeyframe, "keyframesFromDictionaryRepresentations:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setKeyframes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[PIAdjustmentController adjustment](self, "adjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoStabilizeAdjustmentController keyframesKey](PIVideoStabilizeAdjustmentController, "keyframesKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, v13);

}

- ($B5E4F2499D3E0A90C7E8AF059312C337)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  int v14;
  $B5E4F2499D3E0A90C7E8AF059312C337 *result;
  id v16;

  v4 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)(MEMORY[0x1E0D51EA0] + 16);
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E0D51EA0];
  retstr->var1 = v4;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoStabilizeAdjustmentController stabCropRectKey](PIVideoStabilizeAdjustmentController, "stabCropRectKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("X"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int)objc_msgSend(v7, "intValue");
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Y"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (int)objc_msgSend(v9, "intValue");
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Width"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (int)objc_msgSend(v11, "intValue");
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Height"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    retstr->var0.var0 = v8;
    retstr->var0.var1 = v10;
    retstr->var1.var0 = v12;
    retstr->var1.var1 = v14;

  }
  return result;
}

- (void)setStabCropRect:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("X");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var0.var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("Y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var0.var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("Width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var1.var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("Height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var1.var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIVideoStabilizeAdjustmentController stabCropRectKey](PIVideoStabilizeAdjustmentController, "stabCropRectKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
    return 1;
  v8 = v4;
  v9 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PIVideoStabilizeAdjustmentController;
  return -[PIAdjustmentController isEqual:forKeys:](&v7, sel_isEqual_forKeys_, 0, a4);
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)keyframesKey
{
  return CFSTR("keyframes");
}

+ (id)stabCropRectKey
{
  return CFSTR("stabCropRect");
}

@end
