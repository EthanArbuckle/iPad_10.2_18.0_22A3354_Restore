@implementation PBUIBokehColorArbiter

+ (uint64_t)bokehColorForVariant:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("New")))
  {
    if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Mixed")) & 1) != 0)
    {
      v3 = -1;
    }
    else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Green")) & 1) != 0)
    {
      v3 = 2;
    }
    else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Yellow")) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Orange")) & 1) != 0)
    {
      v3 = 4;
    }
    else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Red")) & 1) != 0)
    {
      v3 = 0;
    }
    else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Purple")) & 1) != 0)
    {
      v3 = 3;
    }
    else if (objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Blue")))
    {
      v3 = 5;
    }
    else
    {
      v3 = -2;
    }
  }
  else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("GradientSilver")) & 1) != 0)
  {
    v3 = 12;
  }
  else if (objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Gradient"))
         && !objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Silver")))
  {
    v3 = 11;
  }
  else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Blue")) & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Green")) & 1) != 0)
  {
    v3 = 7;
  }
  else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Yellow")) & 1) != 0)
  {
    v3 = 8;
  }
  else if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Red")) & 1) != 0)
  {
    v3 = 9;
  }
  else
  {
    v3 = -2;
    if (objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Silver"))
      && !objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("Gradient")))
    {
      v3 = 10;
    }
  }

  return v3;
}

+ (id)gradientColorsForBokehColor:(uint64_t)a1
{
  _BYTE *v3;
  id v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  void *v9;

  objc_opt_self();
  v3 = *(&allGradientColors + a2 + 2);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  LOBYTE(v8) = v3[3];
  if ((_BYTE)v8)
  {
    do
    {
      LOBYTE(v5) = *v3;
      LOBYTE(v6) = v3[1];
      LOBYTE(v7) = v3[2];
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (float)((float)v5 / 255.0), (float)((float)v6 / 255.0), (float)((float)v7 / 255.0), (float)((float)v8 / 255.0));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", objc_msgSend(v9, "cgColor"));

      v8 = v3[7];
      v3 += 4;
    }
    while (v8);
  }
  return v4;
}

+ (uint64_t)randomCircleColorForBokehColor:(uint64_t)a1
{
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  unsigned int v7;
  _BYTE *v8;
  unsigned int v9;
  unsigned int v10;

  objc_opt_self();
  v3 = (uint64_t)*(&allCircleColors + a2 + 2);
  v4 = (unsigned __int8 *)(v3 + 3);
  v5 = -1;
  do
  {
    v6 = *v4;
    v4 += 4;
    ++v5;
  }
  while (v6);
  *(float *)&v7 = (float)((float)((float)rand() * 4.6566e-10) * (float)v5) + 0.0;
  v8 = (_BYTE *)(v3 + 4 * (int)*(float *)&v7);
  LOBYTE(v7) = *v8;
  LOBYTE(v9) = v8[2];
  LOBYTE(v10) = v8[3];
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (float)((float)v7 / 255.0), (float)((float)v8[1] / 255.0), (float)((float)v9 / 255.0), (float)((float)v10 / 255.0));
}

+ (uint64_t)averageColorForBokehColor:(uint64_t)a1
{
  char *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  objc_opt_self();
  v3 = (char *)&allAverageColors + 4 * a2;
  LOBYTE(v4) = v3[8];
  LOBYTE(v5) = v3[9];
  LOBYTE(v6) = v3[10];
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (float)((float)v4 / 255.0), (float)((float)v5 / 255.0), (float)((float)v6 / 255.0), 1.0);
}

+ (id)legibilityColorForBokehColor:(uint64_t)a1
{
  uint64_t v3;

  v3 = objc_opt_self();
  if (a2 == 8)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.988235295, 0.90196079, 1.0);
  else
    +[PBUIBokehColorArbiter averageColorForBokehColor:](v3, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorSwatchForBokehColor:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v10;
  _QWORD v12[6];
  __int128 v13;

  v3 = objc_opt_self();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", 10.0, 10.0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__PBUIBokehColorArbiter_colorSwatchForBokehColor___block_invoke;
  v12[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v12[4] = v3;
  v12[5] = a2;
  __asm { FMOV            V0.2D, #10.0 }
  v13 = _Q0;
  objc_msgSend(v4, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __50__PBUIBokehColorArbiter_colorSwatchForBokehColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  +[PBUIBokehColorArbiter averageColorForBokehColor:](v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  objc_msgSend(v6, "fillRect:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
