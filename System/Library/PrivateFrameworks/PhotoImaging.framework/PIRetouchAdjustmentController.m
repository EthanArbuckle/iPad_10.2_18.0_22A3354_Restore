@implementation PIRetouchAdjustmentController

- (void)appendStroke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0C99E08];
  +[PIRetouchBrushStroke dictionaryFromBrushStroke:](PIRetouchBrushStroke, "dictionaryFromBrushStroke:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController inputStrokesKey](PIRetouchAdjustmentController, "inputStrokesKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v8, "count"))
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIRetouchAdjustmentController enabledKey](PIRetouchAdjustmentController, "enabledKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v10);

  }
  objc_msgSend(v8, "arrayByAddingObject:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController inputStrokesKey](PIRetouchAdjustmentController, "inputStrokesKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

}

- (NSArray)detectedFaces
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController detectedFacesKey](PIRetouchAdjustmentController, "detectedFacesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (void)setDetectedFaces:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v10;
    if (v6)
    {
      v7 = (void *)objc_msgSend(v10, "copy");
      -[PIAdjustmentController adjustment](self, "adjustment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIRetouchAdjustmentController detectedFacesKey](PIRetouchAdjustmentController, "detectedFacesKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

      v5 = v10;
    }
  }

}

- (unint64_t)retouchStrokeCount
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController inputStrokesKey](PIRetouchAdjustmentController, "inputStrokesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  return v5;
}

+ (id)clipRectKey
{
  return CFSTR("clipRect");
}

+ (id)modeKey
{
  return CFSTR("mode");
}

+ (id)sourceOffsetXKey
{
  return CFSTR("x");
}

+ (id)sourceOffsetYKey
{
  return CFSTR("y");
}

+ (id)sourceOffsetKey
{
  return CFSTR("sourceOffset");
}

+ (id)inputStrokesKey
{
  return CFSTR("inputStrokes");
}

+ (id)enabledKey
{
  return CFSTR("enabled");
}

+ (id)detectedFacesKey
{
  return CFSTR("detectedFaces");
}

+ (id)repairEdgesKey
{
  return CFSTR("repairEdges");
}

@end
