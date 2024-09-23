@implementation PTFocusBlurMap

- (PTFocusBlurMap)init
{
  PTFocusBlurMap *v2;
  CGSize v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTFocusBlurMap;
  v2 = -[PTFocusBlurMap init](&v5, sel_init);
  if (v2)
  {
    v2->_map = (PTFigCaptureStreamFocusBlurMap *)malloc_type_calloc(1uLL, 0x1028uLL, 0x10000404F0D65F2uLL);
    v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->_autoFocusRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_autoFocusRect.size = v3;
  }
  return v2;
}

- (void)dealloc
{
  PTFigCaptureStreamFocusBlurMap *map;
  objc_super v4;

  map = self->_map;
  if (map)
    free(map);
  v4.receiver = self;
  v4.super_class = (Class)PTFocusBlurMap;
  -[PTFocusBlurMap dealloc](&v4, sel_dealloc);
}

- (PTFocusBlurMap)initWithFocusBlurMapData:(id)a3 sensorSize:(CGSize)a4 validSensorRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  PTFigCaptureStreamFocusBlurMap *v13;
  PTFigCaptureStreamFocusBlurMap *map;
  PTFocusBlurMap *v15;
  objc_super v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  if (!objc_msgSend(v12, "length"))
    goto LABEL_7;
  v17.receiver = self;
  v17.super_class = (Class)PTFocusBlurMap;
  self = -[PTFocusBlurMap init](&v17, sel_init);
  if (self)
  {
    v13 = (PTFigCaptureStreamFocusBlurMap *)malloc_type_malloc(objc_msgSend(v12, "length"), 0xFA178D6EuLL);
    self->_map = v13;
    objc_msgSend(v12, "getBytes:length:", v13, objc_msgSend(v12, "length"));
    map = self->_map;
    if (map->var0 && map->var1.var12 * (unint64_t)map->var1.var11 - 1 <= 0x1FF)
    {
      self->_sensorWidth = (unint64_t)v10;
      self->_sensorHeight = (unint64_t)v9;
      self->_validX = (unint64_t)x;
      self->_validY = (unint64_t)y;
      self->_validWidth = (unint64_t)width;
      self->_validHeight = (unint64_t)height;
      goto LABEL_6;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
LABEL_6:
  self = self;
  v15 = self;
LABEL_8:

  return v15;
}

- (PTFocusBlurMap)initWithFocusBlurMapDictionary:(id)a3
{
  id v4;
  PTFocusBlurMap *v5;
  PTFocusBlurMap *v6;
  PTFigCaptureStreamFocusBlurMap *map;
  PTFocusBlurMap *v8;
  PTFocusBlurMap *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  unsigned __int8 *p_var5;
  void *v36;
  void *v37;
  float v38;
  void *v39;
  void *v40;
  int v41;
  __int16 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;

  v4 = a3;
  v5 = -[PTFocusBlurMap init](self, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_25;
  map = v5->_map;
  if (!map)
    goto LABEL_25;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flow"));
  v8 = (PTFocusBlurMap *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    -[PTFocusBlurMap objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("frame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {

LABEL_24:
      v9 = 0;
      goto LABEL_26;
    }
    v11 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("focusPos"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var0 = objc_msgSend(v12, "intValue");

    -[PTFocusBlurMap objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("regions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("enabled")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v6->_map->var0 = objc_msgSend(v15, "BOOLValue"),
          v15,
          !v6->_map->var0))
    {
      v33 = 1;
      goto LABEL_23;
    }
    v49 = v11;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sizeX"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_sensorWidth = (int)objc_msgSend(v16, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sizeY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_sensorHeight = (int)objc_msgSend(v17, "intValue");

    -[PTFocusBlurMap _initValidRectFromSensorWidth:height:](v6, "_initValidRectFromSensorWidth:height:", v6->_sensorWidth, v6->_sensorHeight);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startX"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var1 = objc_msgSend(v18, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startY"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var2 = objc_msgSend(v19, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sizeX"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var3 = objc_msgSend(v20, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sizeY"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var4 = objc_msgSend(v21, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startX"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var5 = objc_msgSend(v22, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var6 = objc_msgSend(v23, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sizeX"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var7 = objc_msgSend(v24, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sizeY"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var8 = objc_msgSend(v25, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tileSizeX"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var9 = objc_msgSend(v26, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tileSizeY"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var10 = objc_msgSend(v27, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tileCountX"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var11 = objc_msgSend(v28, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tileCountY"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    map->var1.var12 = objc_msgSend(v29, "intValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tiles"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = map->var1.var12 * (unint64_t)map->var1.var11;
      if (v31 <= 0x200)
      {
        if (!v31)
        {
LABEL_21:
          v33 = 0;
          goto LABEL_22;
        }
        v34 = 0;
        p_var5 = &v6->_map->var2[0].var5;
        while (1)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("defocus"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatValue");
          *((_WORD *)p_var5 - 3) = vcvts_n_s32_f32(v38, 8uLL);

          objc_msgSend(v30, "objectAtIndexedSubscript:", v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("conf"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "intValue");
          v42 = v41 + 255;
          if (v41 >= 0)
            HIBYTE(v42) = BYTE1(v41);
          *(p_var5 - 4) = HIBYTE(v42);

          objc_msgSend(v30, "objectAtIndexedSubscript:", v34);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("flags"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
            break;
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("valid"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(p_var5 - 2) = objc_msgSend(v45, "BOOLValue");

          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("flat"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(p_var5 - 1) = objc_msgSend(v46, "BOOLValue");

          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("level"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *p_var5 = objc_msgSend(v47, "intValue");
          p_var5 += 8;

          if (v31 == ++v34)
            goto LABEL_21;
        }
      }
      else
      {
        _PTLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[PTFocusBlurMap initWithFocusBlurMapDictionary:].cold.1(v31, v32);

      }
    }
    v33 = 1;
LABEL_22:
    v11 = v49;

LABEL_23:
    if (v33)
      goto LABEL_24;
LABEL_25:
    v9 = v6;
  }
LABEL_26:

  return v9;
}

- (void)_initValidRectFromSensorWidth:(unint64_t)a3 height:(unint64_t)a4
{
  float v4;

  v4 = (float)a3 / 1.78;
  self->_validWidth = a3;
  self->_validHeight = (unint64_t)v4;
  self->_validX = 0;
  self->_validY = a4 - ((unint64_t)v4 >> 1);
}

- (NSIndexSet)inFocusRegion
{
  void *v3;
  void *v4;

  -[PTFocusBlurMap _nodesForNormalizedRect:](self, "_nodesForNormalizedRect:", self->_autoFocusRect.origin.x, self->_autoFocusRect.origin.y, self->_autoFocusRect.size.width, self->_autoFocusRect.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTFocusBlurMap _blurExtendedNodes:options:](self, "_blurExtendedNodes:options:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (NSIndexSet)largestFocusRegion
{
  void *v3;
  void *v4;
  void *v5;

  -[PTFocusBlurMap inFocusRegion](self, "inFocusRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTFocusBlurMap _connectedComponents:](self, "_connectedComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTFocusBlurMap _largestOfComponents:](self, "_largestOfComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v5;
}

- (CGRect)_inputSensorPixelRect
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  PTFigCaptureStreamFocusBlurMap *map;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  map = self->_map;
  LOWORD(v2) = map->var1.var1;
  v7 = (double)v2;
  LOWORD(v3) = map->var1.var2;
  v8 = (double)v3;
  LOWORD(v4) = map->var1.var3;
  v9 = (double)v4;
  LOWORD(v5) = map->var1.var4;
  v10 = (double)v5;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)inputValidNormalizedRect
{
  unint64_t v2;
  PTFigCaptureStreamFocusBlurMap *map;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  map = self->_map;
  LOBYTE(v2) = map->var1.var11;
  v5 = (double)v2;
  LOBYTE(v2) = map->var1.var12;
  -[PTFocusBlurMap _sensorPixelRectFromTileRect:](self, "_sensorPixelRectFromTileRect:", 0.0, 0.0, v5, (double)v2);
  -[PTFocusBlurMap _validNormalizedRectFromSensorPixelRect:](self, "_validNormalizedRectFromSensorPixelRect:");
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)focusValidNormalizedRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PTFocusBlurMap largestFocusRegion](self, "largestFocusRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTFocusBlurMap _sensorPixelRectFromRegion:](self, "_sensorPixelRectFromRegion:", v3);
  -[PTFocusBlurMap _validNormalizedRectFromSensorPixelRect:](self, "_validNormalizedRectFromSensorPixelRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)validNormalizedRectFromRegion:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PTFocusBlurMap _sensorPixelRectFromRegion:](self, "_sensorPixelRectFromRegion:", a3);
  -[PTFocusBlurMap _validNormalizedRectFromSensorPixelRect:](self, "_validNormalizedRectFromSensorPixelRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (unint64_t)inputX
{
  return self->_map->var1.var1;
}

- (unint64_t)inputY
{
  return self->_map->var1.var2;
}

- (unint64_t)inputWidth
{
  return self->_map->var1.var3;
}

- (unint64_t)inputHeight
{
  return self->_map->var1.var4;
}

- (unint64_t)tileWidth
{
  return self->_map->var1.var9;
}

- (unint64_t)tileHeight
{
  return self->_map->var1.var10;
}

- (unint64_t)tileCountX
{
  return self->_map->var1.var11;
}

- (unint64_t)tileCountY
{
  return self->_map->var1.var12;
}

- (unint64_t)tileXForTile:(unint64_t)a3
{
  return a3 % self->_map->var1.var11;
}

- (unint64_t)tileYForTile:(unint64_t)a3
{
  return a3 / self->_map->var1.var11;
}

- (id)_nodesForNormalizedRect:(CGRect)a3
{
  -[PTFocusBlurMap _pixelRectFromNormalRect:](self, "_pixelRectFromNormalRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PTFocusBlurMap _tileRectFromSensorPixelRect:](self, "_tileRectFromSensorPixelRect:");
  return -[PTFocusBlurMap _nodesFromTileRect:](self, "_nodesFromTileRect:");
}

- (id)_nodesBetweenBlurMin:(int)a3 blurMax:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTFocusBlurMap _blurExtendedNodes:blurMin:blurMax:](self, "_blurExtendedNodes:blurMin:blurMax:", v7, v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_blurExtendedNodes:(id)a3 blurMin:(int)a4 blurMax:(int)a5
{
  id v8;
  void *v9;
  PTFigCaptureStreamFocusBlurMap *map;
  unint64_t v11;
  uint64_t v12;
  int v13;
  void *v15;

  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  map = self->_map;
  if (map->var1.var12 * (unint64_t)map->var1.var11)
  {
    v11 = 0;
    v12 = 40;
    do
    {
      v13 = *(__int16 *)(&map->var0 + v12);
      if (v13 >= a4 && v13 <= a5)
      {
        objc_msgSend(v9, "addIndex:", v11);
        map = self->_map;
      }
      ++v11;
      v12 += 8;
    }
    while (v11 < map->var1.var12 * (unint64_t)map->var1.var11);
  }
  v15 = (void *)objc_msgSend(v9, "copy");

  return v15;
}

- (void)_getBlurRangeOfNodes:(id)a3 blurMin:(int *)a4 blurMax:(int *)a5
{
  id v8;
  uint64_t v9;
  uint64_t i;
  int var0;
  id v12;

  v8 = a3;
  *a4 = 0x7FFFFFFF;
  *a5 = 0x80000000;
  v12 = v8;
  v9 = objc_msgSend(v8, "firstIndex");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v9; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v12, "indexGreaterThanIndex:"))
    {
      var0 = self->_map->var2[i].var0;
      if (*a4 > var0)
        *a4 = var0;
      if (*a5 < var0)
        *a5 = var0;
    }
  }

}

- (id)_blurExtendedNodes:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v4 = a4;
  v6 = a3;
  v11 = 0;
  if (!objc_msgSend(v6, "count"))
  {
    if ((v4 & 2) != 0)
      v7 = 4294967040;
    else
      v7 = 0;
    HIDWORD(v11) = v7;
    v8 = 0x7FFFFFFFLL;
    goto LABEL_14;
  }
  -[PTFocusBlurMap _getBlurRangeOfNodes:blurMin:blurMax:](self, "_getBlurRangeOfNodes:blurMin:blurMax:", v6, (char *)&v11 + 4, &v11);
  v7 = HIDWORD(v11);
  if ((v4 & 1) == 0)
  {
    v8 = v11;
    if ((v4 & 2) == 0)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (SHIDWORD(v11) >= 1)
  {
    v7 = 0;
    HIDWORD(v11) = 0;
  }
  v8 = v11;
  if ((v11 & 0x80000000) != 0)
  {
    v8 = 0;
    LODWORD(v11) = 0;
    if ((v4 & 2) == 0)
      goto LABEL_15;
    goto LABEL_13;
  }
  if ((v4 & 2) != 0)
  {
LABEL_13:
    v7 = (v7 - 256);
    HIDWORD(v11) = v7;
    v8 = (v8 + 256);
LABEL_14:
    LODWORD(v11) = v8;
  }
LABEL_15:
  -[PTFocusBlurMap _blurExtendedNodes:blurMin:blurMax:](self, "_blurExtendedNodes:blurMin:blurMax:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_inFocusNodes
{
  void *v3;
  PTFigCaptureStreamFocusBlurMap *map;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  map = self->_map;
  if (map->var1.var12 * (unint64_t)map->var1.var11)
  {
    v5 = 0;
    v6 = 42;
    do
    {
      if (*(&map->var0 + v6))
      {
        objc_msgSend(v3, "addIndex:", v5);
        map = self->_map;
      }
      ++v5;
      v6 += 8;
    }
    while (v5 < map->var1.var12 * (unint64_t)map->var1.var11);
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)_connectedComponentWithNode:(unint64_t)a3 unvisited:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t var11;
  unint64_t v11;
  unint64_t v12;
  uint64_t i;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  PTFigCaptureStreamFocusBlurMap *map;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v23;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  while (objc_msgSend(v7, "count"))
  {
    v9 = objc_msgSend(v8, "firstIndex");
    objc_msgSend(v23, "addIndex:", v9);
    objc_msgSend(v8, "removeIndex:", v9);
    objc_msgSend(v6, "removeIndex:", v9);
    var11 = self->_map->var1.var11;
    v11 = v9 / var11;
    v12 = v9 % var11;
    for (i = -1; i != 2; ++i)
    {
      v14 = i + v11;
      v15 = -1;
      v16 = 3;
      do
      {
        if ((v14 & 0x8000000000000000) == 0)
        {
          v17 = v15 + v12;
          if ((uint64_t)(v15 + v12) >= 0)
          {
            map = self->_map;
            if (v14 < map->var1.var12)
            {
              v19 = map->var1.var11;
              if (v17 < v19)
              {
                v20 = v17 + v14 * v19;
                if (objc_msgSend(v6, "containsIndex:", v20))
                  objc_msgSend(v8, "addIndex:", v20);
              }
            }
          }
        }
        ++v15;
        --v16;
      }
      while (v16);
    }
    v7 = v8;
  }
  v21 = (void *)objc_msgSend(v23, "copy");

  return v21;
}

- (id)_connectedComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  v7 = v6;
  while (objc_msgSend(v6, "count"))
  {
    -[PTFocusBlurMap _connectedComponentWithNode:unvisited:](self, "_connectedComponentWithNode:unvisited:", objc_msgSend(v7, "firstIndex"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v6 = v7;
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)_largestOfComponents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "count", (_QWORD)v14);
        if (v11 > objc_msgSend(v4, "count"))
        {
          v12 = v10;

          v4 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (CGRect)_validNormalizedRectFromSensorPixelRect:(CGRect)a3
{
  double validWidth;
  double v4;
  double validHeight;
  double v6;
  double v7;
  double v8;
  CGRect result;

  validWidth = (double)self->_validWidth;
  v4 = (a3.origin.x - (double)self->_validX) / validWidth;
  validHeight = (double)self->_validHeight;
  v6 = (a3.origin.y - (double)self->_validY) / validHeight;
  v7 = a3.size.width / validWidth;
  v8 = a3.size.height / validHeight;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (CGRect)_normalRectFromPixelRect:(CGRect)a3
{
  unint64_t v3;
  unint64_t v4;
  PTFigCaptureStreamFocusBlurMap *map;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  map = self->_map;
  LOWORD(v3) = map->var1.var3;
  v6 = (double)v3;
  v7 = a3.origin.x / v6;
  LOWORD(v4) = map->var1.var4;
  v8 = (double)v4;
  v9 = a3.origin.y / v8;
  v10 = a3.size.width / v6;
  v11 = a3.size.height / v8;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (CGRect)_pixelRectFromNormalRect:(CGRect)a3
{
  unint64_t v3;
  unint64_t v4;
  PTFigCaptureStreamFocusBlurMap *map;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  map = self->_map;
  LOWORD(v3) = map->var1.var3;
  v6 = (double)v3;
  v7 = a3.origin.x * v6;
  LOWORD(v4) = map->var1.var4;
  v8 = (double)v4;
  v9 = a3.origin.y * v8;
  v10 = a3.size.width * v6;
  v11 = a3.size.height * v8;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (CGRect)_tileRectFromSensorPixelRect:(CGRect)a3
{
  unint64_t v3;
  unint64_t v4;
  PTFigCaptureStreamFocusBlurMap *map;
  unint64_t v6;
  CGFloat v7;
  double v8;
  double v9;
  unint64_t v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  map = self->_map;
  LOWORD(v3) = map->var1.var1;
  *(double *)&v6 = (double)v3;
  v7 = a3.origin.x - *(double *)&v6;
  LOWORD(v6) = map->var1.var9;
  v8 = (double)v6;
  v9 = v7 / v8;
  LOWORD(v4) = map->var1.var2;
  *(double *)&v10 = (double)v4;
  v11 = a3.origin.y - *(double *)&v10;
  LOWORD(v10) = map->var1.var10;
  v12 = (double)v10;
  v13 = v11 / v12;
  v14 = a3.size.width / v8;
  v15 = a3.size.height / v12;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v9;
  return result;
}

- (CGRect)_sensorPixelRectFromTileRect:(CGRect)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  PTFigCaptureStreamFocusBlurMap *map;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  map = self->_map;
  LOWORD(v3) = map->var1.var1;
  *(double *)&v7 = (double)v3;
  LOWORD(v4) = map->var1.var9;
  v8 = (double)v4;
  v9 = *(double *)&v7 + a3.origin.x * v8;
  LOWORD(v7) = map->var1.var2;
  LOWORD(v5) = map->var1.var10;
  v10 = (double)v5;
  v11 = (double)v7 + a3.origin.y * v10;
  v12 = a3.size.width * v8;
  v13 = a3.size.height * v10;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (CGRect)_tileRectFromNodes:(id)a3
{
  id v4;
  PTFigCaptureStreamFocusBlurMap *map;
  unint64_t var11;
  unint64_t var12;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    map = self->_map;
    var11 = map->var1.var11;
    var12 = map->var1.var12;
    v8 = objc_msgSend(v4, "firstIndex");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v15 = v8;
      v10 = 0;
      v9 = 0;
      do
      {
        v16 = self->_map->var1.var11;
        v17 = v15 / v16;
        v18 = v15 % v16;
        if (v18 < var11)
          var11 = v18;
        if (v17 < var12)
          var12 = v17;
        if (v18 >= v9)
          v9 = v18 + 1;
        if (v17 + 1 > v10)
          v10 = v17 + 1;
        v15 = objc_msgSend(v4, "indexGreaterThanIndex:");
      }
      while (v15 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v19 = v9 - var11;
    if (v9 < var11)
      v19 = 0;
    v20 = v10 - var12;
    if (v10 < var12)
      v20 = 0;
    v11 = (double)var11;
    v12 = (double)var12;
    v13 = (double)v19;
    v14 = (double)v20;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)_nodesFromTileRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v9 = floor(CGRectGetMinX(v25));
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = 0.0;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v11 = floor(CGRectGetMinY(v26));
  if (v11 < 0.0)
    v11 = 0.0;
  v12 = (unint64_t)v11;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v13 = ceil(CGRectGetMaxX(v27));
  LOBYTE(v14) = self->_map->var1.var11;
  v15 = (double)v14;
  if (v13 >= v15)
    v16 = v15;
  else
    v16 = v13;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v17 = ceil(CGRectGetMaxY(v28));
  LOBYTE(v18) = self->_map->var1.var12;
  v19 = (double)v18;
  if (v17 >= v19)
    v17 = v19;
  v20 = (unint64_t)v17;
  if (v12 < (unint64_t)v17)
  {
    v21 = (unint64_t)v16;
    do
    {
      v22 = (unint64_t)v10;
      if ((unint64_t)v10 < v21)
      {
        do
        {
          objc_msgSend(v8, "addIndex:", v22 + v12 * self->_map->var1.var11);
          ++v22;
        }
        while (v21 != v22);
      }
      ++v12;
    }
    while (v12 != v20);
  }
  v23 = (void *)objc_msgSend(v8, "copy");

  return v23;
}

- (CGRect)_sensorPixelRectFromRegion:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PTFocusBlurMap _tileRectFromNodes:](self, "_tileRectFromNodes:", a3);
  -[PTFocusBlurMap _sensorPixelRectFromTileRect:](self, "_sensorPixelRectFromTileRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_boxFromComponent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PTFocusBlurMap _tileRectFromNodes:](self, "_tileRectFromNodes:", a3);
  -[PTFocusBlurMap _sensorPixelRectFromTileRect:](self, "_sensorPixelRectFromTileRect:");
  -[PTFocusBlurMap _normalRectFromPixelRect:](self, "_normalRectFromPixelRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)autoFocusRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_autoFocusRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAutoFocusRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_autoFocusRect, &v3, 32, 1, 0);
}

- (unint64_t)sensorWidth
{
  return self->_sensorWidth;
}

- (unint64_t)sensorHeight
{
  return self->_sensorHeight;
}

- (unint64_t)validX
{
  return self->_validX;
}

- (unint64_t)validY
{
  return self->_validY;
}

- (unint64_t)validWidth
{
  return self->_validWidth;
}

- (unint64_t)validHeight
{
  return self->_validHeight;
}

- (void)initWithFocusBlurMapDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "ignoring blur map with tile count %@ - too big", (uint8_t *)&v4, 0xCu);

}

@end
