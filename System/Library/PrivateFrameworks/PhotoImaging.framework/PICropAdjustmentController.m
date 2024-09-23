@implementation PICropAdjustmentController

- (PICropAdjustmentController)initWithAdjustment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PICropAdjustmentController;
  return -[PIAdjustmentController initWithAdjustment:](&v4, sel_initWithAdjustment_, a3);
}

- (id)visualInputKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  +[PICropAdjustmentController angleKey](PICropAdjustmentController, "angleKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController pitchKey](PICropAdjustmentController, "pitchKey", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  +[PICropAdjustmentController yawKey](PICropAdjustmentController, "yawKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  +[PICropAdjustmentController xOriginKey](PICropAdjustmentController, "xOriginKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  +[PICropAdjustmentController yOriginKey](PICropAdjustmentController, "yOriginKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  +[PICropAdjustmentController widthKey](PICropAdjustmentController, "widthKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  +[PICropAdjustmentController heightKey](PICropAdjustmentController, "heightKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  +[PICropAdjustmentController constraintWidthKey](PICropAdjustmentController, "constraintWidthKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  +[PICropAdjustmentController constraintHeightKey](PICropAdjustmentController, "constraintHeightKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isGeometryIdentityForImageSize:(CGSize)a3
{
  _BOOL4 v4;

  v4 = -[PICropAdjustmentController isCropIdentityForImageSize:](self, "isCropIdentityForImageSize:", a3.width, a3.height);
  if (v4)
    LOBYTE(v4) = !-[PICropAdjustmentController isCropConstrained](self, "isCropConstrained");
  return v4;
}

- (BOOL)isCropConstrained
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController constraintWidthKey](PICropAdjustmentController, "constraintWidthKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController constraintHeightKey](PICropAdjustmentController, "constraintHeightKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  return v6 > 0 && v10 > 0;
}

- (BOOL)isCropIdentityForImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  -[PICropAdjustmentController cropRect](self, "cropRect");
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = width;
  v12.size.height = height;
  v6 = CGRectEqualToRect(v11, v12);
  if (v6)
  {
    -[PICropAdjustmentController angle](self, "angle");
    if (fabs(v7) >= 0.0000000596046448
      || (-[PICropAdjustmentController pitch](self, "pitch"), fabs(v8) >= 0.0000000596046448))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      -[PICropAdjustmentController yaw](self, "yaw");
      LOBYTE(v6) = fabs(v9) < 0.0000000596046448;
    }
  }
  return v6;
}

- (CGRect)cropRect
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  CGRect result;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController xOriginKey](PICropAdjustmentController, "xOriginKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController yOriginKey](PICropAdjustmentController, "yOriginKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController widthKey](PICropAdjustmentController, "widthKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController heightKey](PICropAdjustmentController, "heightKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v21 = v5;
  v22 = v10;
  v23 = v15;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (int64_t)constraintWidth
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController constraintWidthKey](PICropAdjustmentController, "constraintWidthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)constraintHeight
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController constraintHeightKey](PICropAdjustmentController, "constraintHeightKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)angle
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController angleKey](PICropAdjustmentController, "angleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)angleRadians
{
  double v2;

  -[PICropAdjustmentController angle](self, "angle");
  return v2 / 180.0 * 3.14159265;
}

- (double)pitch
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController pitchKey](PICropAdjustmentController, "pitchKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)pitchRadians
{
  double v2;

  -[PICropAdjustmentController pitch](self, "pitch");
  return v2 / 180.0 * 3.14159265;
}

- (double)yaw
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController yawKey](PICropAdjustmentController, "yawKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)yawRadians
{
  double v2;

  -[PICropAdjustmentController yaw](self, "yaw");
  return v2 / 180.0 * 3.14159265;
}

- (void)setCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const void **v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
  {
    NUAssertLogger_9151();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot set empty crop rect"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9151();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController xOriginKey](PICropAdjustmentController, "xOriginKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController yOriginKey](PICropAdjustmentController, "yOriginKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController widthKey](PICropAdjustmentController, "widthKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController heightKey](PICropAdjustmentController, "heightKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, v18);

}

- (void)setConstraintWidth:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PICropAdjustmentController constraintWidthKey](PICropAdjustmentController, "constraintWidthKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PICropAdjustmentController constraintWidthKey](PICropAdjustmentController, "constraintWidthKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);
  }

}

- (void)setConstraintHeight:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PICropAdjustmentController constraintHeightKey](PICropAdjustmentController, "constraintHeightKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
  else
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PICropAdjustmentController constraintHeightKey](PICropAdjustmentController, "constraintHeightKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);
  }

}

- (void)setAngle:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PICropAdjustmentController_setAngle___block_invoke;
  block[3] = &unk_1E50195F0;
  block[4] = self;
  if (setAngle__onceToken != -1)
    dispatch_once(&setAngle__onceToken, block);
  v5 = *(double *)&setAngle__minAngle;
  v6 = *(double *)&setAngle__maxAngle;
  if (*(double *)&setAngle__maxAngle > a3)
    v6 = a3;
  if (*(double *)&setAngle__minAngle <= v6)
    v5 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController angleKey](PICropAdjustmentController, "angleKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setAngleRadians:(double)a3
{
  -[PICropAdjustmentController setAngle:](self, "setAngle:", a3 * 180.0 / 3.14159265);
}

- (void)setPitch:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PICropAdjustmentController_setPitch___block_invoke;
  block[3] = &unk_1E50195F0;
  block[4] = self;
  if (setPitch__onceToken != -1)
    dispatch_once(&setPitch__onceToken, block);
  v5 = *(double *)&setPitch__minAngle;
  v6 = *(double *)&setPitch__maxAngle;
  if (*(double *)&setPitch__maxAngle > a3)
    v6 = a3;
  if (*(double *)&setPitch__minAngle <= v6)
    v5 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController pitchKey](PICropAdjustmentController, "pitchKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setPitchRadians:(double)a3
{
  -[PICropAdjustmentController setPitch:](self, "setPitch:", a3 * 180.0 / 3.14159265);
}

- (void)setYaw:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PICropAdjustmentController_setYaw___block_invoke;
  block[3] = &unk_1E50195F0;
  block[4] = self;
  if (setYaw__onceToken != -1)
    dispatch_once(&setYaw__onceToken, block);
  v5 = *(double *)&setYaw__minAngle;
  v6 = *(double *)&setYaw__maxAngle;
  if (*(double *)&setYaw__maxAngle > a3)
    v6 = a3;
  if (*(double *)&setYaw__minAngle <= v6)
    v5 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController yawKey](PICropAdjustmentController, "yawKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setYawRadians:(double)a3
{
  -[PICropAdjustmentController setYaw:](self, "setYaw:", a3 * 180.0 / 3.14159265);
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  unsigned __int8 v18;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  char v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController angleKey](PICropAdjustmentController, "angleKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v11) & 1) != 0)
    goto LABEL_4;
  +[PICropAdjustmentController pitchKey](PICropAdjustmentController, "pitchKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v12))
  {
    +[PICropAdjustmentController yawKey](PICropAdjustmentController, "yawKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v7, "isEqualToString:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_5;
    +[PICropAdjustmentController xOriginKey](PICropAdjustmentController, "xOriginKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v22) & 1) == 0)
    {
      +[PICropAdjustmentController yOriginKey](PICropAdjustmentController, "yOriginKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v23) & 1) == 0)
      {
        +[PICropAdjustmentController widthKey](PICropAdjustmentController, "widthKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "isEqualToString:", v24))
        {
          +[PICropAdjustmentController heightKey](PICropAdjustmentController, "heightKey");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v7, "isEqualToString:", v28);

          if ((v29 & 1) == 0)
          {
            v30.receiver = self;
            v30.super_class = (Class)PICropAdjustmentController;
            v18 = -[PIAdjustmentController isSettingEqual:forKey:](&v30, sel_isSettingEqual_forKey_, v6, v7);
            goto LABEL_7;
          }
          goto LABEL_15;
        }

      }
    }

LABEL_15:
    objc_msgSend(v9, "doubleValue");
    v26 = v25;
    objc_msgSend(v10, "doubleValue");
    v16 = vabdd_f64(v26, v27);
    v17 = (double *)MEMORY[0x1E0D523C0];
    goto LABEL_6;
  }

LABEL_4:
LABEL_5:
  objc_msgSend(v9, "doubleValue");
  v14 = v13;
  objc_msgSend(v10, "doubleValue");
  v16 = vabdd_f64(v14, v15);
  v17 = (double *)MEMORY[0x1E0D523B0];
LABEL_6:
  v18 = v16 < *v17;
LABEL_7:

  return v18;
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

void __37__PICropAdjustmentController_setYaw___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "adjustment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController yawKey](PICropAdjustmentController, "yawKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  setYaw__minAngle = v6;

  objc_msgSend(v9, "maximumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  setYaw__maxAngle = v8;

}

void __39__PICropAdjustmentController_setPitch___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "adjustment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController pitchKey](PICropAdjustmentController, "pitchKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  setPitch__minAngle = v6;

  objc_msgSend(v9, "maximumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  setPitch__maxAngle = v8;

}

void __39__PICropAdjustmentController_setAngle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "adjustment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "schema");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAdjustmentController angleKey](PICropAdjustmentController, "angleKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  setAngle__minAngle = v6;

  objc_msgSend(v9, "maximumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  setAngle__maxAngle = v8;

}

+ (NSString)xOriginKey
{
  return (NSString *)CFSTR("xOrigin");
}

+ (NSString)yOriginKey
{
  return (NSString *)CFSTR("yOrigin");
}

+ (NSString)widthKey
{
  return (NSString *)CFSTR("width");
}

+ (NSString)heightKey
{
  return (NSString *)CFSTR("height");
}

+ (NSString)constraintWidthKey
{
  return (NSString *)CFSTR("constraintWidth");
}

+ (NSString)constraintHeightKey
{
  return (NSString *)CFSTR("constraintHeight");
}

+ (NSString)angleKey
{
  return (NSString *)CFSTR("angle");
}

+ (NSString)pitchKey
{
  return (NSString *)CFSTR("pitch");
}

+ (NSString)yawKey
{
  return (NSString *)CFSTR("yaw");
}

@end
