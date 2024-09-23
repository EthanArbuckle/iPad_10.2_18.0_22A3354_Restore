@implementation _UIColorPalette

- (_UIColorPalette)initWithColors:(id)a3 locations:(id)a4 colorSpaceName:(id)a5
{
  id v9;
  id v10;
  __CFString *v11;
  _UIColorPalette *v12;
  _UIColorPalette *v13;
  __CFString *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIColorPalette;
  v12 = -[_UIColorPalette init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_colors, a3);
    objc_storeStrong((id *)&v13->_locations, a4);
    if (v11)
      v14 = v11;
    else
      v14 = CFSTR("kCGColorSpaceDeviceRGB");
    objc_storeStrong((id *)&v13->_colorSpaceName, v14);
  }

  return v13;
}

- (_UIColorPalette)initWithColors:(id)a3
{
  return -[_UIColorPalette initWithColors:locations:colorSpaceName:](self, "initWithColors:locations:colorSpaceName:", a3, 0, CFSTR("kCGColorSpaceDeviceRGB"));
}

- (id)paletteByMergingPalette:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  _UIColorPalette *v36;
  void *v37;
  void *v38;

  v5 = a3;
  objc_msgSend(v5, "locations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    -[_UIColorPalette locations](self, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      -[_UIColorPalette colors](self, "colors");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "colors");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v38);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = -[_UIColorPalette initWithColors:](self, "initWithColors:", v13);
      goto LABEL_26;
    }
  }
  objc_msgSend(v5, "locations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {

    goto LABEL_24;
  }
  -[_UIColorPalette locations](self, "locations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorPalette.m"), 61, CFSTR("Can't merge a _UIColorPalette with locations, and one without locations."));
    v36 = 0;
    goto LABEL_26;
  }
  -[_UIColorPalette colors](self, "colors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  -[_UIColorPalette locations](self, "locations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v5, "colors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = 0;
    do
    {
      objc_msgSend(v5, "locations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "doubleValue");
        v23 = v22;
      }
      else
      {
        v23 = 0.0;
      }

      if (objc_msgSend(v15, "count"))
      {
        v24 = 0;
        while (1)
        {
          objc_msgSend(v15, "objectAtIndex:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            objc_msgSend(v25, "doubleValue");
            v28 = v27;
          }
          else
          {
            v28 = 0.0;
          }

          if (v23 >= v28)
            break;
          if (++v24 >= (unint64_t)objc_msgSend(v15, "count"))
            goto LABEL_19;
        }
        objc_msgSend(v5, "colors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndex:", v18);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "insertObject:atIndex:", v30, v24);

        objc_msgSend(v5, "locations");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndex:", v18);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "insertObject:atIndex:", v32, v24);

      }
LABEL_19:
      ++v18;
      objc_msgSend(v5, "colors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

    }
    while (v18 < v34);
  }
  objc_msgSend(v5, "colorSpaceName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[_UIColorPalette initWithColors:locations:colorSpaceName:](self, "initWithColors:locations:colorSpaceName:", v13, v15, v35);

LABEL_26:
  return v36;
}

- (CGGradient)gradientRepresentation
{
  CGColorSpace *v4;
  const __CFAllocator *v5;
  CFIndex v6;
  __CFArray *Mutable;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSArray *locations;
  uint64_t v14;
  CGFloat *v15;
  uint64_t j;
  void *v17;
  CGFloat v18;
  CGGradient *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = CGColorSpaceCreateWithName((CFStringRef)self->_colorSpaceName);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorPalette.m"), 70, CFSTR("Unable to create colorspace for name %@"), self->_colorSpaceName);

  }
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = -[NSArray count](self->_colors, "count");
  Mutable = CFArrayCreateMutable(v5, v6, MEMORY[0x1E0C9B378]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_colors;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i)), "CGColor"));
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  locations = self->_locations;
  if (locations)
  {
    v14 = -[NSArray count](locations, "count");
    v15 = (CGFloat *)malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
    if (v14)
    {
      for (j = 0; j != v14; ++j)
      {
        -[NSArray objectAtIndex:](self->_locations, "objectAtIndex:", j);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v15[j] = v18;

      }
    }
  }
  else
  {
    v15 = 0;
  }
  v19 = CGGradientCreateWithColors(v4, Mutable, v15);
  CGColorSpaceRelease(v4);
  CFRelease(Mutable);
  if (v15)
    free(v15);
  return v19;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)colorSpaceName
{
  return self->_colorSpaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpaceName, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

+ (id)_warmColors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.56, 0.011, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.933, 0.227, 0.498, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_coolColors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.768, 0.364, 0.909, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.337, 0.756, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)intelligenceAmbientPalette
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_warmColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_coolColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithColors:", v6);

  return v7;
}

+ (id)intelligenceProcessingPalette
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_warmColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithColors:", v4);

  return v5;
}

+ (id)intelligenceComputedPalette
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_coolColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithColors:", v4);

  return v5;
}

+ (id)textAssistantPonderingFillPalette
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.12, 1.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.81, 1.0, 1.0, 1.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 0.96, 0.98, 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.66, 1.0, 0.81, 0.72);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.66, 1.0, 0.81, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithColors:locations:colorSpaceName:", v8, &unk_1E1A94A00, 0);

  return v9;
}

+ (id)textAssistantPonderingLightSheenPalette
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithColors:locations:colorSpaceName:", v8, &unk_1E1A94A18, 0);

  return v9;
}

+ (id)textAssistantReplacementBuildInPalette
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.489, 0.631, 0.845, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.49, 0.631, 0.847, 0.5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.801, 0.615, 0.875, 0.72);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.986, 0.349, 0.948, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.121, 0.319, 0.864, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.057, 0.092, 0.95, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.129, 1.0, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithColors:locations:colorSpaceName:", v10, &unk_1E1A94A30, 0);

  return v11;
}

+ (id)textAssistantReplacementBuildOutPalette
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.945, 0.678, 0.388, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.812, 0.518, 0.4, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.475, 0.345, 0.773, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithColors:", v7);

  return v8;
}

+ (id)textAssistantReplacementSheenPalette
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 0.31, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 0.4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 0.6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 0.6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithColors:locations:colorSpaceName:", v10, &unk_1E1A94A48, 0);

  return v11;
}

+ (id)intelligenceSymbolLivingColorPalette
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)a1);
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.471, 0.2, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.98, 0.263, 0.408, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.294, 0.678, 0.976, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.851, 0.588, 0.992, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithColors:", v7);

  return v8;
}

@end
