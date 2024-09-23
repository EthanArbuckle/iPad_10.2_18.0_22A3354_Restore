@implementation NSDictionary(PVStabilizationConfig)

- (id)timedStabilizationConfigWithCleanAperture:()PVStabilizationConfig cropRect:fillMode:
{
  id v20;
  void *v21;
  void *v22;
  const __CFDictionary *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v31;
  double v32;
  double v33;
  CMTime v34;
  CMTime v35;

  v20 = a1;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("rawTime"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21
    && (objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("homography")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    memset(&v35, 0, sizeof(v35));
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("rawTime"));
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v35, v23);

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("homography"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "SIMDFloat3x3");
    v32 = v26;
    v33 = v25;
    v31 = v27;

    +[PVStabilizationConfig configWithHomography:cleanAperture:cropRect:fillMode:](PVStabilizationConfig, "configWithHomography:cleanAperture:cropRect:fillMode:", a11, v33, v32, v31, a2, a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v35;
    +[PVTimedObject timedObjectWithTime:object:](PVTimedObject, "timedObjectWithTime:object:", &v34, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)arrayOfTimedStabilizationConfigsWithCleanAperture:()PVStabilizationConfig fillMode:
{
  CGSize v12;
  id v13;
  const __CFDictionary *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  int v30;
  CGRect rect;

  v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  rect.size = v12;
  v13 = a1;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGRectMakeWithDictionaryRepresentation(v14, &rect);

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("frameInstructions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __98__NSDictionary_PVStabilizationConfig__arrayOfTimedStabilizationConfigsWithCleanAperture_fillMode___block_invoke;
    v23 = &unk_1E64D6190;
    v25 = a2;
    v26 = a3;
    v27 = a4;
    v28 = a5;
    v29 = rect;
    v30 = a7;
    v17 = v16;
    v24 = v17;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v20);
    if (objc_msgSend(v17, "count", v20, v21, v22, v23))
      v18 = v17;
    else
      v18 = 0;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
