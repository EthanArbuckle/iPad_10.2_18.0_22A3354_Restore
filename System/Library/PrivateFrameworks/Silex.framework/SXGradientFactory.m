@implementation SXGradientFactory

- (id)gradientForColorStops:(id)a3 angle:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  float v9;
  __float2 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SXGradient *v15;

  if (a3)
  {
    v6 = a3;
    -[SXGradientFactory colorsFromColorStops:](self, "colorsFromColorStops:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXGradientFactory locationsFromColorStops:](self, "locationsFromColorStops:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 1.79769313e308)
    {
      v11 = 0.0;
      v12 = 1.0;
      v13 = 0.0;
      v14 = 0.0;
    }
    else
    {
      v9 = a4 / 180.0 * 3.14159265 + -1.57079633;
      v10 = __sincosf_stret(v9);
      v11 = (float)((float)(v10.__cosval + 1.0) * 0.5);
      v12 = (float)((float)(v10.__sinval + 1.0) * 0.5);
      v13 = 1.0 - v11;
      v14 = 1.0 - v12;
    }
    v15 = -[SXGradient initWithStartPoint:endPoint:colors:locations:]([SXGradient alloc], "initWithStartPoint:endPoint:colors:locations:", v7, v8, v13, v14, v11, v12);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)colorsFromColorStops:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "color", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)locationsFromColorStops:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "location");
      if (v9 == 1.79769313e308)
      {
        if (v6)
        {
          if (v6 == objc_msgSend(v3, "count") - 1)
          {
            v10 = v5;
            v11 = &unk_24D6FF0B8;
          }
          else
          {
            objc_msgSend(v4, "addIndex:", v6);
            v11 = (void *)objc_opt_class();
            v10 = v5;
          }
        }
        else
        {
          v10 = v5;
          v11 = &unk_24D6FF0A0;
        }
        objc_msgSend(v10, "addObject:", v11);
      }
      else
      {
        objc_msgSend(v8, "location");
        v13 = fmin(v12 / 100.0, 1.0);
        if (v13 >= 0.0)
          v14 = v13;
        else
          v14 = 0.0;
        if (v14 >= v7)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

          v7 = v14;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__SXGradientFactory_locationsFromColorStops___block_invoke;
  v19[3] = &unk_24D68BFA8;
  v17 = v5;
  v20 = v17;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v19);

  return v17;
}

void __45__SXGradientFactory_locationsFromColorStops___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2 + a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  if (a3)
  {
    v12 = 0;
    v13 = v8;
    v14 = (v11 - v13) / (double)(unint64_t)(a3 + 1);
    do
    {
      v15 = v12 + 1;
      v16 = *(void **)(a1 + 32);
      v17 = a2 + v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 + v14 * (double)(unint64_t)(v12 + 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", v17, v18);

      v12 = v15;
    }
    while (a3 != v15);
  }
}

@end
