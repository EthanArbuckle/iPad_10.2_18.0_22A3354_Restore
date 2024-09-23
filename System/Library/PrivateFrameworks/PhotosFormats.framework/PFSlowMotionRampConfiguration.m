@implementation PFSlowMotionRampConfiguration

- (id)initForRampDown:(BOOL)a3
{
  _BOOL4 v3;
  id result;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  float v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFSlowMotionRampConfiguration;
  result = -[PFSlowMotionRampConfiguration init](&v10, sel_init);
  if (result)
  {
    v5 = 0.35;
    if (v3)
      v5 = 0.56;
    v6 = 0.08;
    v7 = 0.1;
    if (v3)
      v6 = 0.1;
    else
      v7 = 0.07;
    v8 = 20;
    if (v3)
      v8 = 34;
    v9 = 1.2;
    if (!v3)
      v9 = 2.0;
    *((double *)result + 2) = v5;
    *((double *)result + 3) = v6;
    *((_OWORD *)result + 2) = xmmword_1A17B6D90;
    *((double *)result + 6) = v7;
    *((_QWORD *)result + 7) = v8;
    *((_QWORD *)result + 8) = 5;
    *((float *)result + 2) = v9;
    *((_DWORD *)result + 3) = 1069547520;
  }
  return result;
}

- (PFSlowMotionRampConfiguration)init
{
  -[PFSlowMotionRampConfiguration doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)computeRampToTargetRate:(float)a3 forExport:(BOOL)a4 outTimeSteps:(id *)a5 outIntermediateRates:(id *)a6
{
  _BOOL4 v8;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  float v32;
  uint64_t i;
  float v34;
  float v35;
  float v36;
  double v37;
  void *v38;
  id v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, void *, uint64_t);
  void *v53;
  id v54;
  float v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v8 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v13 = -[PFSlowMotionRampConfiguration exportNumIntermediateSteps](self, "exportNumIntermediateSteps");
  else
    v13 = -[PFSlowMotionRampConfiguration playbackNumIntermediateSteps](self, "playbackNumIntermediateSteps");
  v14 = v13;
  -[PFSlowMotionRampConfiguration rampTime](self, "rampTime");
  v16 = v15;
  -[PFSlowMotionRampConfiguration introTime](self, "introTime");
  v18 = v17;
  -[PFSlowMotionRampConfiguration outroTime](self, "outroTime");
  v20 = v19;
  v21 = 1.0;
  v22 = 1.0 - a3;
  if (v14)
  {
    v23 = v22 / (float)(v14 + 1);
    do
    {
      v21 = v21 - v23;
      *(float *)&v19 = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v24);

      --v14;
    }
    while (v14);
  }
  if (v8)
    -[PFSlowMotionRampConfiguration exportRampCurveExponent](self, "exportRampCurveExponent");
  else
    -[PFSlowMotionRampConfiguration playbackRampCurveExponent](self, "playbackRampCurveExponent");
  v26 = v25;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v27 = v12;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v28)
  {
    v29 = v28;
    v30 = v16 - (v18 + v20);
    v31 = *(_QWORD *)v57;
    v32 = 0.0;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v57 != v31)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "floatValue");
        v35 = v34;
        v36 = powf((float)(1.0 - v34) / v22, v26);
        v32 = v32 + v36;
        *(float *)&v37 = v35 * (float)(v36 * v30);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v38);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v29);
  }
  else
  {
    v32 = 0.0;
  }

  v50 = MEMORY[0x1E0C809B0];
  v51 = 3221225472;
  v52 = __101__PFSlowMotionRampConfiguration_computeRampToTargetRate_forExport_outTimeSteps_outIntermediateRates___block_invoke;
  v53 = &unk_1E45A3348;
  v55 = v32;
  v39 = v11;
  v54 = v39;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", &v50);
  -[PFSlowMotionRampConfiguration introTime](self, "introTime", v50, v51, v52, v53);
  *(float *)&v40 = v40;
  if (*(float *)&v40 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "insertObject:atIndex:", v41, 0);

    LODWORD(v42) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertObject:atIndex:", v43, 0);

  }
  -[PFSlowMotionRampConfiguration outroTime](self, "outroTime");
  *(float *)&v44 = v44;
  if (*(float *)&v44 > 0.0)
  {
    *(float *)&v44 = *(float *)&v44 * a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v45);

    *(float *)&v46 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v47);

  }
  v48 = objc_retainAutorelease(v39);
  *a5 = v48;
  v49 = objc_retainAutorelease(v27);
  *a6 = v49;

}

- (double)rampTime
{
  return self->_rampTime;
}

- (double)introTime
{
  return self->_introTime;
}

- (double)outroTime
{
  return self->_outroTime;
}

- (double)volumeSuppressionIntroTime
{
  return self->_volumeSuppressionIntroTime;
}

- (double)volumeSuppressionOutroTime
{
  return self->_volumeSuppressionOutroTime;
}

- (unint64_t)playbackNumIntermediateSteps
{
  return self->_playbackNumIntermediateSteps;
}

- (unint64_t)exportNumIntermediateSteps
{
  return self->_exportNumIntermediateSteps;
}

- (float)playbackRampCurveExponent
{
  return self->_playbackRampCurveExponent;
}

- (float)exportRampCurveExponent
{
  return self->_exportRampCurveExponent;
}

void __101__PFSlowMotionRampConfiguration_computeRampToTargetRate_forExport_outTimeSteps_outIntermediateRates___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float v5;
  void *v6;
  float v7;
  double v8;
  id v9;

  objc_msgSend(a2, "floatValue");
  v5 = *(float *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  *(float *)&v8 = v7 / v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceObjectAtIndex:withObject:", a3, v9);

}

@end
