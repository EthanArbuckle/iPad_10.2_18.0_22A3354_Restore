@implementation TTKDefaultContinuousPathGenerator

- (double)dotProduct:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return a3.y * a4.y + a3.x * a4.x;
}

- (CGPoint)subtractPoint:(CGPoint)a3 byPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x - a4.x;
  v5 = a3.y - a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)addPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)scalarMultiplyPoint:(CGPoint)a3 by:(double)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x * a4;
  v5 = a3.y * a4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)targetDeviatedNormallyFromPoint:(CGPoint)a3 withKeyWidth:(double)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[TTKDefaultContinuousPathGenerator randomNumberFromNormalDistribution](self, "randomNumberFromNormalDistribution");
  v9 = v8 * a4 * self->_normalKeyWidthMultiple;
  -[TTKDefaultContinuousPathGenerator randomNumberFromNormalDistribution](self, "randomNumberFromNormalDistribution");
  v11 = v10 * a4 * self->_normalKeyWidthMultiple;
  v12 = x + v9;
  v13 = y + v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (double)distanceBetween:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return sqrt((a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y));
}

- (id)boxPoint:(CGPoint)a3
{
  CGPoint v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v4, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (TTKDefaultContinuousPathGenerator)initWithParams:(id)a3
{
  id v4;
  void *v5;
  TTKDefaultContinuousPathGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  float v12;
  void *v13;
  double v14;
  void *v15;
  float v16;
  void *v17;
  double v18;
  void *v19;
  float v20;
  void *v21;
  double v22;
  void *v23;
  float v24;
  void *v25;
  double v26;
  void *v27;
  float v28;
  void *v29;
  double v30;
  void *v31;
  float v32;
  void *v33;
  double v34;
  void *v35;
  float v36;
  void *v37;
  double v38;
  void *v39;
  float v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  void *v44;
  double v45;
  void *v46;
  float v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t i;
  _QWORD *v51;
  uint64_t v52;
  objc_super v54;

  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1B8];
  v54.receiver = self;
  v54.super_class = (Class)TTKDefaultContinuousPathGenerator;
  v6 = -[TTKDefaultContinuousPathGenerator init](&v54, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("GENERATE_MIDDLE_POINT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6->_genMidPoint = objc_msgSend(v8, "BOOLValue");
    if (!v7)

    objc_msgSend(v5, "objectForKey:", CFSTR("FINGER_KEY_WIDTH_MULTIPLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (!v9)
    {
      LODWORD(v10) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "floatValue");
    v6->_fingerKeyWdithMultiple = v12;
    if (!v9)

    objc_msgSend(v5, "objectForKey:", CFSTR("MID_POINT_KEY_WIDTH_MULTIPLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    if (!v13)
    {
      LODWORD(v14) = 3.5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "floatValue");
    v6->_midPointKeyWidthMultiple = v16;
    if (!v13)

    objc_msgSend(v5, "objectForKey:", CFSTR("MID_POINT_DEV_KEY_HEIGHT_MULTIPLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    if (!v17)
    {
      LODWORD(v18) = 3.5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "floatValue");
    v6->_midPointDevKeyHeightMultiple = v20;
    if (!v17)

    objc_msgSend(v5, "objectForKey:", CFSTR("PATH_BETA_PARAMETER"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    if (!v21)
    {
      LODWORD(v22) = 4.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "floatValue");
    v6->_betaParam = v24;
    if (!v21)

    objc_msgSend(v5, "objectForKey:", CFSTR("PATH_NORMAL_KEY_WIDTH_MULTIPLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    if (!v25)
    {
      LODWORD(v26) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "floatValue");
    v6->_normalKeyWidthMultiple = v28;
    if (!v25)

    objc_msgSend(v5, "objectForKey:", CFSTR("CPPATHGEN_TIME_INTERVAL"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v29;
    if (!v29)
    {
      LODWORD(v30) = 1034594987;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v31, "floatValue");
    v6->_timeDelta = v32;
    if (!v29)

    objc_msgSend(v5, "objectForKey:", CFSTR("CPPATHGEN_FORCE"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    if (!v33)
    {
      LODWORD(v34) = 1.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "floatValue");
    v6->_force = v36;
    if (!v33)

    objc_msgSend(v5, "objectForKey:", CFSTR("CPPATHGEN_VELOCITY"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    if (!v37)
    {
      LODWORD(v38) = 1129840640;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v39, "floatValue");
    v6->_velocity = v40;
    if (!v37)

    objc_msgSend(v5, "objectForKey:", CFSTR("CPPATHGEN_TIMING_ALGORITHM"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (__CFString *)v41;
    else
      v43 = CFSTR("EQUIDISTANT");
    objc_storeStrong((id *)&v6->_touchTimingAlgorithm, v43);

    objc_msgSend(v5, "objectForKey:", CFSTR("CPPATHGEN_ACCELERATION"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v44;
    if (!v44)
    {
      LODWORD(v45) = 1070386381;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v46, "floatValue");
    v6->_acceleration = v47;
    if (!v44)

    v48 = operator new();
    v49 = 5489;
    *(_DWORD *)v48 = 5489;
    for (i = 1; i != 624; ++i)
    {
      v49 = i + 1812433253 * (v49 ^ (v49 >> 30));
      *(_DWORD *)(v48 + 4 * i) = v49;
    }
    *(_QWORD *)(v48 + 2496) = 0;
    v6->m_generator = (void *)v48;
    v51 = (_QWORD *)operator new();
    *v51 = *(_QWORD *)&v6->_betaParam;
    v51[1] = 0x3FF0000000000000;
    v6->m_gamma_distribution = v51;
    v52 = operator new();
    *(_OWORD *)v52 = xmmword_22FAC90C0;
    *(_BYTE *)(v52 + 24) = 0;
    v6->m_normal_distribution = (void *)v52;
  }

  return v6;
}

- (TTKDefaultContinuousPathGenerator)init
{
  return -[TTKDefaultContinuousPathGenerator initWithParams:](self, "initWithParams:", MEMORY[0x24BDBD1B8]);
}

- (void)dealloc
{
  void *m_generator;
  void *m_gamma_distribution;
  void *m_normal_distribution;
  objc_super v6;

  m_generator = self->m_generator;
  if (m_generator)
    MEMORY[0x2348A8A24](m_generator, 0x1000C407BAC9B3ELL);
  m_gamma_distribution = self->m_gamma_distribution;
  if (m_gamma_distribution)
    MEMORY[0x2348A8A24](m_gamma_distribution, 0x1000C40451B5BE8);
  m_normal_distribution = self->m_normal_distribution;
  if (m_normal_distribution)
    MEMORY[0x2348A8A24](m_normal_distribution, 0x1000C4024AC2F66);
  v6.receiver = self;
  v6.super_class = (Class)TTKDefaultContinuousPathGenerator;
  -[TTKDefaultContinuousPathGenerator dealloc](&v6, sel_dealloc);
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  _DWORD *m_generator;
  uint64_t i;

  m_generator = self->m_generator;
  *m_generator = a3;
  for (i = 1; i != 624; ++i)
  {
    a3 = i + 1812433253 * (a3 ^ (a3 >> 30));
    m_generator[i] = a3;
  }
  *((_QWORD *)m_generator + 312) = 0;
  -[TTKDefaultContinuousPathGenerator reset](self, "reset");
}

- (double)randomNumberFromBetaDistribution
{
  double v3;

  v3 = std::gamma_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator, (double *)self->m_gamma_distribution);
  return v3
       / (v3
        + std::gamma_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator, (double *)self->m_gamma_distribution));
}

- (double)randomNumberFromNormalDistribution
{
  return std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)self->m_normal_distribution, (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator, (double *)self->m_normal_distribution);
}

- (BOOL)canHandleDoubleLetter
{
  return 0;
}

- (id)generateKeysFromString:(id)a3 layout:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int16 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (v7 == 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (int)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v10 = 0;
      v11 = v7;
      do
      {
        v24 = 0;
        v24 = objc_msgSend(v5, "characterAtIndex:", v10);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v24, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        ++v10;
      }
      while (v11 != v10);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(v6, "findKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            v8 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v13, "addObject:", v18);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v15)
          continue;
        break;
      }
    }

    v8 = v13;
LABEL_16:

  }
  return v8;
}

- (id)generateKeyCentersFromKeys:(id)a3 string:(id)a4 layout:(id)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "center", (_QWORD)v14);
        -[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)generatePathFromString:(id)a3 layout:(id)a4
{
  -[TTKDefaultContinuousPathGenerator generatePathFromString:timestamp:layout:](self, "generatePathFromString:timestamp:layout:", a3, a4, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generatePathFromString:(id)a3 timestamp:(double)a4 layout:(id)a5
{
  -[TTKDefaultContinuousPathGenerator generatePathFromString:timestamp:duration:layout:](self, "generatePathFromString:timestamp:duration:layout:", a3, a5, a4, -1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generatePathFromString:(id)a3 timestamp:(double)a4 duration:(double)a5 layout:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a6;
  -[TTKDefaultContinuousPathGenerator generateKeysFromString:layout:](self, "generateKeysFromString:layout:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[TTKDefaultContinuousPathGenerator generateKeyCentersFromKeys:string:layout:](self, "generateKeyCentersFromKeys:string:layout:", v12, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      -[TTKDefaultContinuousPathGenerator generateInflections:](self, "generateInflections:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTKDefaultContinuousPathGenerator generateTimingArray:](self, "generateTimingArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5 == -1.0)
        -[TTKDefaultContinuousPathGenerator generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:](self, "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:", v14, v15, v12, v10, v11, a4);
      else
        -[TTKDefaultContinuousPathGenerator generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:](self, "generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:", v14, v15, v12, v10, v11, a4, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)generatePathFromInflectionPoints:(id)a3 segmentTiming:(id)a4 keys:(id)a5 string:(id)a6 layout:(id)a7
{
  return 0;
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 segmentTiming:(id)a5 keys:(id)a6 string:(id)a7 layout:(id)a8
{
  return 0;
}

- (id)generatePathFromInflectionPoints:(id)a3 timestamp:(double)a4 duration:(double)a5 segmentTiming:(id)a6 keys:(id)a7 string:(id)a8 layout:(id)a9
{
  return 0;
}

- (id)generateInflections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double midPointDevKeyHeightMultiple;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v63;
  double v64;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v64 = v7;
  objc_msgSend(v6, "frame");
  v63 = v8;
  objc_msgSend(v6, "center");
  -[TTKDefaultContinuousPathGenerator targetDeviatedNormallyFromPoint:withKeyWidth:](self, "targetDeviatedNormallyFromPoint:withKeyWidth:");
  v10 = v9;
  v12 = v11;
  -[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  v14 = objc_msgSend(v4, "count");
  v15 = v14;
  if (v14 >= 2)
  {
    v16 = v14 - 1;
    v17 = 1;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "center");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v4, "objectAtIndex:", v17 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "center");
      v25 = v24;
      v27 = v26;

      if (v20 != v25 || v22 != v27)
        break;
      if (-[TTKDefaultContinuousPathGenerator canHandleDoubleLetter](self, "canHandleDoubleLetter"))
      {
        objc_msgSend(v5, "lastObject");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v61);
LABEL_28:

      }
      if (++v17 >= v15)
        goto LABEL_30;
    }
    v29 = v17 + 1;
    if (v17 + 1 < v15)
    {
      objc_msgSend(v4, "objectAtIndex:", v17 + 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "center");
      v32 = v31;
      v34 = v33;

      if (v22 == v27 && v22 == v34 && (v25 < v20 && v20 < v32 || v25 > v20 && v20 > v32))
      {
        objc_msgSend(v4, "objectAtIndex:", v17 + 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "center");
        v18 = v35;
        v17 = v29;
      }
    }
    objc_msgSend(v18, "center");
    -[TTKDefaultContinuousPathGenerator distanceBetween:andPoint:](self, "distanceBetween:andPoint:", v10, v12, v36, v37);
    v39 = v38;
    v40 = v64 * self->_fingerKeyWdithMultiple;
    if (v40 > 0.0)
    {
      objc_msgSend(v18, "frame");
      v38 = v39 + v40 + v41 * -0.5;
    }
    if (v17 == v16)
      v42 = v39 + v40 * 0.75;
    else
      v42 = v38;
    objc_msgSend(v18, "center", v38);
    v44 = v43;
    objc_msgSend(v18, "center");
    -[TTKDefaultContinuousPathGenerator targetDeviatedNormallyFromPoint:withKeyWidth:](self, "targetDeviatedNormallyFromPoint:withKeyWidth:", v10 + v42 * (v44 - v10) / v39, v12 + v42 * (v45 - v12) / v39, v64);
    v47 = v46;
    v49 = v48;
    if (self->_genMidPoint && v42 > v64 * self->_midPointKeyWidthMultiple)
    {
      -[TTKDefaultContinuousPathGenerator randomNumberFromBetaDistribution](self, "randomNumberFromBetaDistribution");
      v51 = v50;
      midPointDevKeyHeightMultiple = self->_midPointDevKeyHeightMultiple;
      -[TTKDefaultContinuousPathGenerator randomNumberFromBetaDistribution](self, "randomNumberFromBetaDistribution");
      v54 = sqrt((v47 - v10) * (v47 - v10) + (v49 - v12) * (v49 - v12));
      v55 = (v47 - v10) / v54;
      v56 = (v49 - v12) / v54;
      v57 = v63 * (midPointDevKeyHeightMultiple + midPointDevKeyHeightMultiple);
      v58 = (v49 * v56 + v55 * v47 - (v12 * v56 + v55 * v10)) * v51;
      v59 = fabs(v58);
      if (v57 >= v59)
        v57 = v59;
      -[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:", v10 + (v57 * -0.5 + v57 * v53) * -v56 + v55 * v58, v12 + v55 * (v57 * -0.5 + v57 * v53) + v56 * v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v60);

    }
    -[TTKDefaultContinuousPathGenerator boxPoint:](self, "boxPoint:", v47, v49);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v61);
    v12 = v49;
    v10 = v47;
    goto LABEL_28;
  }
LABEL_30:

  return v5;
}

- (id)generateTimingArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[NSString isEqualToString:](self->_touchTimingAlgorithm, "isEqualToString:", CFSTR("ANGULAR")))
    -[TTKDefaultContinuousPathGenerator generateAngularTiming:](self, "generateAngularTiming:", v4);
  else
    -[TTKDefaultContinuousPathGenerator generateEquidistantTiming:](self, "generateEquidistantTiming:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)generateAngularTiming:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double timeDelta;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v31;
  double acceleration;
  double v33;
  double v34;
  void *v35;
  double v36;
  double (**v37)(_QWORD, double, double, double, double);
  double v38;
  double v39;
  double v40;
  long double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v48;
  double v50;
  double v51;
  double v52;
  _QWORD v53[5];
  double v54;
  double v55;
  __int128 v56;
  double v57[4];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTKDefaultContinuousPathGenerator velocity](self, "velocity");
  v50 = v6;
  timeDelta = self->_timeDelta;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getValue:", v57);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", &unk_24FD5F768);
  v10 = ceil(2.0 / timeDelta);
  v11 = 1;
  v12 = 1.0;
  v13 = v10;
  while (v11 < objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getValue:", &v56);

    -[TTKDefaultContinuousPathGenerator distanceBetween:andPoint:](self, "distanceBetween:andPoint:", *(_OWORD *)v57, v56);
    v16 = v15;
    v18 = v10;
    if (v11 < objc_msgSend(v4, "count") - 1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v11 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getValue:", &v54);

      v20 = *(double *)&v56 - v57[0];
      v21 = *((double *)&v56 + 1) - v57[1];
      v22 = v54 - *(double *)&v56;
      v23 = v55 - *((double *)&v56 + 1);
      -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", *(double *)&v56 - v57[0], *((double *)&v56 + 1) - v57[1], v54 - *(double *)&v56, v55 - *((double *)&v56 + 1));
      v25 = v24;
      -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v20, v21, v20, v21);
      v27 = v26;
      -[TTKDefaultContinuousPathGenerator dotProduct:andPoint:](self, "dotProduct:andPoint:", v22, v23, v22, v23);
      v29 = v25 / sqrt(v27 * v28);
      v17 = v50 * v29;
      if (v50 * v29 <= v10 || v29 <= 0.0)
        v18 = v10;
      else
        v18 = v50 * v29;
      v12 = 1.0;
    }
    v31 = 0;
    acceleration = self->_acceleration;
    v52 = v18 * 0.8;
    v33 = 0.0;
    while (1)
    {
      v33 = v33 + v13 * self->_timeDelta >= v16 ? v16 : v33 + v13 * self->_timeDelta;
      v34 = v33 / v16;
      *(float *)&v34 = v33 / v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34, v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v35);

      if (vabdd_f64(v33, v16) < v12)
        break;
      if (v31)
      {
        if (v13 * acceleration <= v10)
          v13 = v10;
        else
          v13 = v13 * acceleration;
        v31 = 1;
      }
      else
      {
        v36 = v13 * acceleration;
        if (v13 * acceleration >= v50)
          v36 = v50;
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        if (v13 < v50)
          v13 = v36;
        v53[2] = __59__TTKDefaultContinuousPathGenerator_generateAngularTiming___block_invoke;
        v53[3] = &unk_24FD48E58;
        v53[4] = self;
        v37 = (double (**)(_QWORD, double, double, double, double))MEMORY[0x2348A8EA4](v53);
        v51 = v18;
        v38 = pow(v18 / v13, 0.2);
        v39 = self->_acceleration;
        if (v38 >= v39)
          v38 = self->_acceleration;
        v40 = v12 / v39;
        if (v38 <= v40)
          v41 = v40;
        else
          v41 = v38;
        v42 = v13 * self->_timeDelta;
        v43 = v42 * (1.0 - pow(v41, 6.0)) / (1.0 - v41);
        v31 = v43 >= v16 - v33;
        if (v43 >= v16 - v33)
        {
          acceleration = v37[2](v37, v16 - v33, v13, 5.0, v41);
          if (v13 * pow(acceleration, 5.0) < v52)
          {
            v44 = 5.0;
            do
            {
              v45 = self->_acceleration;
              if (acceleration >= v45 || acceleration <= 1.0 / v45)
                break;
              v44 = v44 + -1.0;
              acceleration = v37[2](v37, v16 - v33, v13, v44, v41);
              v46 = v13 * pow(acceleration, v44);
            }
            while (v44 > 2.0 && v46 < v52);
          }
        }

        v12 = 1.0;
        v18 = v51;
      }
    }
    v48 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v5, "addObject:", v48);

    objc_msgSend(v9, "removeAllObjects");
    *(_OWORD *)v57 = v56;
    ++v11;
  }

  return v5;
}

- (id)generateEquidistantTiming:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValue:", &v21);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", &unk_24FD5F768);
  for (i = 1; i < objc_msgSend(v4, "count"); ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getValue:", &v20);

    -[TTKDefaultContinuousPathGenerator distanceBetween:andPoint:](self, "distanceBetween:andPoint:", v21, v20);
    v11 = ceil(v10 / (self->_timeDelta * self->_velocity));
    if (v11 <= 4.0)
      v12 = 3.0;
    else
      v12 = v11 + -1.0;
    v13 = (uint64_t)v12;
    if ((uint64_t)v12 >= 1)
    {
      v14 = 1;
      v15 = 1.0 / (double)(uint64_t)v12;
      do
      {
        v16 = v15 * (double)(int)v14;
        *(float *)&v16 = v16;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v17);

        ++v14;
      }
      while (v14 <= v13);
    }
    v18 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "addObject:", v18);

    objc_msgSend(v7, "removeAllObjects");
    v21 = v20;
  }

  return v5;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)timeDelta
{
  return self->_timeDelta;
}

- (void)setTimeDelta:(double)a3
{
  self->_timeDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchTimingAlgorithm, 0);
}

double __59__TTKDefaultContinuousPathGenerator_generateAngularTiming___block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a5;
  v6 = a2 / (*(double *)(*(_QWORD *)(a1 + 32) + 112) * a3);
  v7 = 0.0;
  if (v6 > 1.0)
  {
    v8 = a4 + 1.0;
    v9 = (1.0 - pow(a5, a4 + 1.0)) / (1.0 - a5);
    v10 = v5;
    if (v9 > v6)
    {
      v10 = v5;
      do
        v10 = v10 * 0.5;
      while ((1.0 - pow(v10, v8)) / (1.0 - v10) > v6);
    }
    if (v9 < v6)
    {
      do
        v5 = v5 + v5;
      while ((1.0 - pow(v5, v8)) / (1.0 - v5) < v6);
    }
    while (1)
    {
      v7 = (v10 + v5) * 0.5;
      v11 = (1.0 - pow(v7, v8)) / (1.0 - v7);
      if (vabdd_f64(v6, v11) <= 0.0001)
        break;
      if (v11 > v6)
        v5 = (v10 + v5) * 0.5;
      else
        v10 = (v10 + v5) * 0.5;
    }
  }
  return v7;
}

+ (id)pathGeneratorWithAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __objc2_class **v7;
  void *v8;

  v3 = a3;
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1B8];
  objc_msgSend(v4, "objectForKey:", CFSTR("CONTINUOUS_PATH_GENERATOR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("TYPIST"));

  v7 = &off_24FD47780;
  if (!v6)
    v7 = off_24FD47748;
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithParams:", v4);

  return v8;
}

@end
