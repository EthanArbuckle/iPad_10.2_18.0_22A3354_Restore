@implementation PMLClassificationEvaluationMetrics

+ (float)precision:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  unsigned int (**v9)(_QWORD, float);
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = (unsigned int (**)(_QWORD, float))a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "ptr");
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "ptr");
  v14 = 0.0;
  if (objc_msgSend(v10, "count"))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v13 + 4 * v15)))
      {
        ++v16;
        v17 += v9[2](v9, *(float *)(v11 + 4 * v15));
      }
      ++v15;
    }
    while (v15 < objc_msgSend(v10, "count"));
    if (v16)
      v14 = (double)v17 / (double)v16;
  }

  return v14;
}

+ (float)recall:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  unsigned int (**v9)(_QWORD, float);
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = (unsigned int (**)(_QWORD, float))a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "ptr");
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "ptr");
  v14 = 0.0;
  if (objc_msgSend(v10, "count"))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v11 + 4 * v15)))
      {
        ++v17;
        v16 += v9[2](v9, *(float *)(v13 + 4 * v15));
      }
      ++v15;
    }
    while (v15 < objc_msgSend(v10, "count"));
    if (v17)
      v14 = (double)v16 / (double)v17;
  }

  return v14;
}

+ (float)f1Score:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float result;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[PMLClassificationEvaluationMetrics precision:predictions:predicate:](PMLClassificationEvaluationMetrics, "precision:predictions:predicate:", v9, v8, v7);
  v11 = v10;
  +[PMLClassificationEvaluationMetrics recall:predictions:predicate:](PMLClassificationEvaluationMetrics, "recall:predictions:predicate:", v9, v8, v7);
  v13 = v12;

  result = 0.0;
  if ((float)(v11 + v13) != 0.0)
    return (float)((float)(v11 + v11) * v13) / (float)(v11 + v13);
  return result;
}

+ (unint64_t)truePositives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  unsigned int (**v9)(_QWORD, float);
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = (unsigned int (**)(_QWORD, float))a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "ptr");
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "ptr");
  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v11 + 4 * v14)))
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14));
      ++v14;
    }
    while (v14 < objc_msgSend(v10, "count"));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (unint64_t)falsePositives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  unsigned int (**v9)(_QWORD, float);
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = (unsigned int (**)(_QWORD, float))a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "ptr");
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "ptr");
  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if ((((uint64_t (*)(_QWORD, float))v9[2])(v9, *(float *)(v11 + 4 * v14)) & 1) == 0)
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14));
      ++v14;
    }
    while (v14 < objc_msgSend(v10, "count"));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (unint64_t)trueNegatives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  unsigned int (**v9)(_QWORD, float);
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = (unsigned int (**)(_QWORD, float))a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "ptr");
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "ptr");
  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if ((((uint64_t (*)(_QWORD, float))v9[2])(v9, *(float *)(v11 + 4 * v14)) & 1) == 0)
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14)) ^ 1;
      ++v14;
    }
    while (v14 < objc_msgSend(v10, "count"));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (unint64_t)falseNegatives:(id)a3 predictions:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  unsigned int (**v9)(_QWORD, float);
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = (unsigned int (**)(_QWORD, float))a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "ptr");
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "ptr");
  if (objc_msgSend(v10, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      if (v9[2](v9, *(float *)(v11 + 4 * v14)))
        v15 += v9[2](v9, *(float *)(v13 + 4 * v14)) ^ 1;
      ++v14;
    }
    while (v14 < objc_msgSend(v10, "count"));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)addScoresForOutcomes:(id)a3 predictions:(id)a4 predicate:(id)a5 metrics:(id)a6
{
  id v9;
  id v10;
  unsigned int (**v11)(_QWORD, float);
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  int v18;
  int v19;
  double v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = (unsigned int (**)(_QWORD, float))a5;
  v12 = a6;
  v21 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v21, "ptr");
  v14 = objc_retainAutorelease(v10);
  v15 = objc_msgSend(v14, "ptr");
  if (objc_msgSend(v21, "count"))
  {
    v16 = 0;
    do
    {
      if (arc4random_uniform(0x64u) < kReportSamplingRate
        || objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild"))
      {
        LODWORD(v17) = *(_DWORD *)(v15 + 4 * v16);
        +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v17);
        v19 = v18;
        if (v11[2](v11, *(float *)(v13 + 4 * v16)))
        {
          LODWORD(v20) = v19;
          objc_msgSend(v12, "addPositiveScores:", v20);
        }
        else
        {
          LODWORD(v20) = v19;
          objc_msgSend(v12, "addNegativeScores:", v20);
        }
      }
      ++v16;
    }
    while (v16 < objc_msgSend(v21, "count"));
  }

}

+ (float)roundFloatToSigFigs:(float)a3 sigFigs:(int)a4
{
  float v5;
  BOOL v6;
  unsigned int v7;
  float v8;
  float v9;

  v5 = a3;
  v6 = a3 < 0.0;
  if (a3 == 0.0)
  {
    v7 = 1;
  }
  else
  {
    v8 = -a3;
    if (!v6)
      v8 = v5;
    v7 = vcvtpd_s64_f64(log10(v8));
  }
  v9 = __exp10((double)(int)(a4 - v7));
  if (v9 != 0.0)
    return roundf(v9 * v5) / v9;
  return v5;
}

+ (void)setReportSamplingRate:(unsigned int)a3
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("python")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLClassificationEvaluationMetrics.m"), 184, CFSTR("Process name %@ is not python"), v8);

  }
  kReportSamplingRate = a3;

}

@end
