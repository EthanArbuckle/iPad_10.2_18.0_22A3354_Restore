@implementation TSDFPSCounter

- (TSDFPSCounter)init
{
  TSDFPSCounter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDFPSCounter;
  v2 = -[TSDFPSCounter init](&v4, sel_init);
  if (v2)
    v2->_dateArray = (NSMutableArray *)objc_opt_new();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDFPSCounter;
  -[TSDFPSCounter dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_dateArray, "removeAllObjects");
}

- (void)addFrame
{
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  -[TSDFPSCounter addFrameAtDrawTime:duration:](self, "addFrameAtDrawTime:duration:");
}

- (void)addFrameAtDrawTime:(double)a3
{
  -[TSDFPSCounter addFrameAtDrawTime:duration:](self, "addFrameAtDrawTime:duration:", a3, 0.0);
}

- (void)addFrameAtDrawTime:(double)a3 duration:(double)a4
{
  NSMutableArray *dateArray;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  dateArray = self->_dateArray;
  v6[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  -[NSMutableArray addObject:](dateArray, "addObject:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2));
}

- (id)p_fpsSummaryStringIncludingGraph:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSMutableArray *dateArray;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v29;
  __CFString *v30;
  const __CFString *v31;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  const __CFString *v38;
  id v40;
  double v41;
  double v42;
  double v43;
  _BOOL4 v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)-[NSMutableArray count](self->_dateArray, "count") < 2)
    return CFSTR("FPSCounter error: not enough frames");
  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_24D82FEB0);
  if (v3)
    objc_msgSend(v40, "appendString:", CFSTR("\n===== FPS LOGGING BEGIN =====\n"));
  v44 = v3;
  v5 = (void *)objc_msgSend((id)-[NSMutableArray firstObject](self->_dateArray, "firstObject"), "firstObject");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  dateArray = self->_dateArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dateArray, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v7)
  {
    v11 = 0.0;
    v9 = 1.79769313e308;
    v42 = 0.0;
    v43 = 1.79769313e308;
    v12 = 0.0;
    v45 = 0.0;
    goto LABEL_46;
  }
  v8 = v7;
  v9 = 1.79769313e308;
  v10 = *(_QWORD *)v47;
  v11 = 0.0;
  v42 = 0.0;
  v43 = 1.79769313e308;
  v12 = 0.0;
  v45 = 0.0;
  v13 = v5;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v47 != v10)
        objc_enumerationMutation(dateArray);
      v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      v16 = (void *)objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 1), "doubleValue");
      v18 = v17;
      if (v16 != v5 || v17 != 0.0)
      {
        objc_msgSend(v16, "doubleValue");
        v20 = v19;
        objc_msgSend(v13, "doubleValue");
        v22 = v20 - v21;
        v23 = 0.0;
        if (v22 > 0.0)
        {
          v23 = 1.0 / v22;
          if (v43 >= 1.0 / v22)
            v24 = 1.0 / v22;
          else
            v24 = v43;
          if (v11 <= v23)
            v11 = 1.0 / v22;
          v42 = v42 + v23;
          v43 = v24;
        }
        if (v18 != 0.0)
        {
          if (v9 >= v18)
            v9 = v18;
          if (v12 <= v18)
            v12 = v18;
          v45 = v45 + v18;
        }
        if (!v44)
        {
          v13 = v16;
          continue;
        }
        v41 = v12;
        v25 = v9;
        v26 = v11;
        if (v23 / 60.0 <= 1.0)
          v27 = v23 / 60.0;
        else
          v27 = 1.0;
        v28 = 0.0;
        v29 = -7;
        v30 = &stru_24D82FEB0;
        while (1)
        {
          if (v27 <= v28 / 7.0)
            goto LABEL_33;
          if (v29 == -1)
          {
            v31 = CFSTR("*");
            goto LABEL_34;
          }
          v31 = CFSTR("*");
          if (v27 >= (double)(v29 + 8) / 7.0)
LABEL_33:
            v31 = CFSTR(" ");
LABEL_34:
          v28 = v28 + 1.0;
          v30 = (__CFString *)-[__CFString stringByAppendingString:](v30, "stringByAppendingString:", v31);
          if (__CFADD__(v29++, 1))
          {
            v33 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v16, "doubleValue");
            v35 = v34;
            objc_msgSend(v5, "doubleValue");
            v37 = objc_msgSend(v33, "stringWithFormat:", CFSTR("FPS(%0.2f): |%@| %0.0f"), v35 - v36, v30, *(_QWORD *)&v23);
            v38 = &stru_24D82FEB0;
            v11 = v26;
            if (v18 != 0.0)
              v38 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" ... duration:%2.0fms (%4.0f FPS)"), v18 * 1000.0, 1.0 / v18);
            objc_msgSend(v40, "appendFormat:", CFSTR("%@%@\n"), v37, v38);
            v13 = v16;
            v9 = v25;
            v12 = v41;
            break;
          }
        }
      }
    }
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dateArray, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v8);
LABEL_46:
  objc_msgSend(v40, "appendFormat:", CFSTR("FPS(min/avg/max): %0.0f/%0.0f/%0.0f (%d frames)"), *(_QWORD *)&v43, v42 / (double)(unint64_t)-[NSMutableArray count](self->_dateArray, "count"), *(_QWORD *)&v11, -[NSMutableArray count](self->_dateArray, "count") - 1);
  if (v45 > 0.0)
    objc_msgSend(v40, "appendFormat:", CFSTR("\nDuration(min/avg/max): %0.0f/%0.0f/%0.0fms (%d frames)"), v9 * 1000.0, v45 / (double)(unint64_t)-[NSMutableArray count](self->_dateArray, "count") * 1000.0, v12 * 1000.0, -[NSMutableArray count](self->_dateArray, "count") - 1);
  if (v44)
    objc_msgSend(v40, "appendString:", CFSTR("\n============================="));
  return v40;
}

- (id)fpsSummaryString
{
  return -[TSDFPSCounter p_fpsSummaryStringIncludingGraph:](self, "p_fpsSummaryStringIncludingGraph:", 0);
}

- (id)fpsGraphString
{
  return -[TSDFPSCounter p_fpsSummaryStringIncludingGraph:](self, "p_fpsSummaryStringIncludingGraph:", 1);
}

- (void)writeFPSInfoToLog:(id)a3 identifier:(id)a4 type:(id)a5 direction:(id)a6 duration:(double)a7 graphing:(BOOL)a8 slide:(int64_t)a9
{
  _BOOL4 v10;
  id v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v10 = a8;
  v40 = *MEMORY[0x24BDAC8D0];
  v16 = -[TSDFPSCounter p_getFPSInfo:](self, "p_getFPSInfo:", a8);
  if (!v16)
    return;
  v17 = v16;
  objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("min")), "floatValue");
  v19 = v18;
  objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avg")), "floatValue");
  v21 = v20;
  objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("max")), "floatValue");
  v23 = v22;
  v24 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("array"));
  v25 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v25, "appendString:", CFSTR("\nKNAnimTest"));
  objc_msgSend(v25, "appendString:", CFSTR("**"));
  if (!a3)
  {
    if (!a4)
    {
      objc_msgSend(v25, "appendString:", CFSTR("UnknownAnimation"));
      if (!a5)
        goto LABEL_10;
      goto LABEL_9;
    }
    objc_msgSend(v25, "appendString:", a4);
    goto LABEL_7;
  }
  objc_msgSend(v25, "appendString:", a3);
  if (a4)
  {
LABEL_7:
    objc_msgSend(v25, "appendString:", CFSTR("**"));
    objc_msgSend(v25, "appendFormat:", CFSTR("Identifier:::%@"), a4);
  }
  if (a5)
  {
LABEL_9:
    objc_msgSend(v25, "appendString:", CFSTR("**"));
    objc_msgSend(v25, "appendFormat:", CFSTR("Type:::%@"), a5);
  }
LABEL_10:
  v26 = v19;
  v27 = v21;
  v28 = v23;
  if (a6)
  {
    objc_msgSend(v25, "appendString:", CFSTR("**"));
    objc_msgSend(v25, "appendFormat:", CFSTR("Direction:::%@"), a6);
  }
  objc_msgSend(v25, "appendString:", CFSTR("**"));
  objc_msgSend(v25, "appendFormat:", CFSTR("Duration:::%.2f"), *(_QWORD *)&a7);
  objc_msgSend(v25, "appendString:", CFSTR("**"));
  objc_msgSend(v25, "appendFormat:", CFSTR("Slide:::%ld"), a9);
  objc_msgSend(v25, "appendString:", CFSTR("**"));
  objc_msgSend(v25, "appendFormat:", CFSTR("FPS:::%.2f %.2f %.2f"), *(_QWORD *)&v26, *(_QWORD *)&v27, *(_QWORD *)&v28);
  if (v10)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v36;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v24);
          objc_msgSend(v25, "appendFormat:", CFSTR(" %d"), objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v31++), "intValue"));
        }
        while (v29 != v31);
        v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v29);
    }
  }
  objc_msgSend(v25, "appendString:", CFSTR("\n"));
  v32 = objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("animationTest_log"));
  v33 = (void *)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v32);
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "seekToEndOfFile");
    objc_msgSend(v34, "writeData:", objc_msgSend(v25, "dataUsingEncoding:", 4));
    objc_msgSend(v34, "closeFile");
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createFileAtPath:contents:attributes:", v32, objc_msgSend(v25, "dataUsingEncoding:", 4), 0);
  }
}

- (id)p_getFPSInfo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *dateArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  TSDFPSCounter *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)-[NSMutableArray count](self->_dateArray, "count") < 2)
    return 0;
  v6 = objc_msgSend((id)-[NSMutableArray firstObject](self->_dateArray, "firstObject"), "firstObject");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = self;
  dateArray = self->_dateArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dateArray, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v12 = 0.0;
    v13 = 1.79769313e308;
    v14 = 0.0;
    v15 = (void *)v6;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(dateArray);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "objectAtIndexedSubscript:", 0);
        if (v17 != (void *)v6)
        {
          v18 = v17;
          objc_msgSend(v17, "doubleValue");
          v20 = v19;
          objc_msgSend(v15, "doubleValue");
          v22 = v20 - v21;
          if (v22 > 0.0)
          {
            v23 = 1.0 / v22;
            if (v13 >= v23)
              v13 = v23;
            if (v12 <= v23)
              v12 = v23;
            v14 = v14 + v23;
            if (v3)
              objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:"));
            v15 = v18;
          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dateArray, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
    v13 = 1.79769313e308;
    v14 = 0.0;
  }
  v24 = -[NSMutableArray count](v30->_dateArray, "count");
  v25 = (void *)MEMORY[0x24BDBCED8];
  v26 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14 / (double)v24);
  v27 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v28 = (void *)objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, CFSTR("avg"), v27, CFSTR("min"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12), CFSTR("max"), 0);
  v5 = v28;
  if (v3)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, CFSTR("array"));
  return v5;
}

@end
