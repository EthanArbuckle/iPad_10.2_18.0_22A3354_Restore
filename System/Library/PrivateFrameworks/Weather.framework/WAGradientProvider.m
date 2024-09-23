@implementation WAGradientProvider

- (id)gradientForConditionCode:(int64_t)a3 isDay:(BOOL)a4
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v13;
  float v14;
  float v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v5 = -90.0;
  if (a4)
    v5 = 90.0;
  v16 = 0u;
  v17 = 0u;
  LODWORD(v4) = 0;
  -[WAGradientProvider mixedGradientForSunheight:hourAngle:condition:latitude:](self, "mixedGradientForSunheight:hourAngle:condition:latitude:", a3, v5, 0.0, v4, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v13, v14, v15, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", *(float *)&v16, *((float *)&v16 + 1), *((float *)&v16 + 2), 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", *(float *)&v17, *((float *)&v17 + 1), *((float *)&v17 + 2), 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)getTopColor:(id *)a3 middleColor:(id *)a4 bottomColor:(id *)a5 gradientStopPoint:(double *)a6 forCity:(id)a7 date:(id)a8
{
  id v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  float v18;

  v13 = a7;
  if (objc_msgSend(v13, "isDay"))
    v14 = 90.0;
  else
    v14 = -90.0;
  v15 = objc_msgSend(v13, "conditionCode", 0, 0);

  LODWORD(v16) = 0;
  -[WAGradientProvider mixedGradientForSunheight:hourAngle:condition:latitude:](self, "mixedGradientForSunheight:hourAngle:condition:latitude:", v15, v14, 0.0, v16);
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", *(float *)&v17, *((float *)&v17 + 1), v18, 1.0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  *a6 = 0.0;
}

- ($7EA73340C7CC676E337367CBF1F3785A)mixedGradientForSunheight:(SEL)a3 hourAngle:(double)a4 condition:(double)a5 latitude:(int64_t)a6
{
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  double v29;
  $7EA73340C7CC676E337367CBF1F3785A *result;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;

  v11 = a4;
  *(float *)&a4 = v11;
  *(float *)&a5 = a7;
  -[WAGradientProvider mixedColorsForIndex:solarHeight:condition:latitude:](self, "mixedColorsForIndex:solarHeight:condition:latitude:", 0, a6, a4, a5);
  v35 = v13;
  v36 = v12;
  v15 = v14;
  v17 = v16;
  *(float *)&v18 = v11;
  *(float *)&v19 = a7;
  -[WAGradientProvider mixedColorsForIndex:solarHeight:condition:latitude:](self, "mixedColorsForIndex:solarHeight:condition:latitude:", 1, a6, v18, v19);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  *(float *)&v28 = v11;
  *(float *)&v29 = a7;
  result = ($7EA73340C7CC676E337367CBF1F3785A *)-[WAGradientProvider mixedColorsForIndex:solarHeight:condition:latitude:](self, "mixedColorsForIndex:solarHeight:condition:latitude:", 2, a6, v28, v29);
  retstr->var0.var0 = v36;
  retstr->var0.var1 = v35;
  retstr->var0.var2 = v15;
  retstr->var0.var3 = v17;
  retstr->var1.var0 = v21;
  retstr->var1.var1 = v23;
  retstr->var1.var2 = v25;
  retstr->var1.var3 = v27;
  retstr->var2.var0 = v31;
  retstr->var2.var1 = v32;
  retstr->var2.var2 = v33;
  retstr->var2.var3 = v34;
  return result;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)mixedColorsForIndex:(int64_t)a3 solarHeight:(float)a4 condition:(int64_t)a5 latitude:(float)a6
{
  double *v6;
  double *v7;
  float v8;
  float v9;
  float v11;
  float64x2_t *v12;
  float v13;
  float v14;
  float64x2_t *v15;
  float v16;
  float v17;
  float32x2_t v18;
  float v19;
  float v20;
  float v21;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  if ((unint64_t)a5 > 0x2F)
  {
    v7 = (double *)&clearDay;
    v6 = (double *)&clearNight;
  }
  else
  {
    v6 = (double *)*(&off_24DD9E0B8 + a5);
    v7 = (double *)*(&off_24DD9E238 + a5);
  }
  v8 = 0.0;
  if (a4 > -9.0)
    v8 = 1.0;
  if (a4 >= 9.0 || a4 <= -9.0)
  {
    v11 = v8;
  }
  else
  {
    v9 = (a4 + 9.0) / 18.0;
    v11 = v9;
  }
  v12 = (float64x2_t *)&v7[4 * a3];
  v13 = v12[1].f64[0];
  v14 = v7[a3 + 12];
  v15 = (float64x2_t *)&v6[4 * a3];
  v16 = v15[1].f64[0];
  v17 = v6[a3 + 12];
  v18 = vmla_n_f32(vmul_n_f32(vcvt_f32_f64(*v12), v11), vcvt_f32_f64(*v15), 1.0 - v11);
  v19 = (float)(v11 * v13) + (float)(v16 * (float)(1.0 - v11));
  v20 = (float)(v11 * v14) + (float)(v17 * (float)(1.0 - v11));
  v21 = v18.f32[1];
  result.var0 = v18.f32[0];
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v21;
  return result;
}

@end
