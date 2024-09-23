@implementation PIDisparitySampleJob

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
}

- (id)result
{
  _PIDisparitySampleResult *v3;

  v3 = [_PIDisparitySampleResult alloc];
  -[PIDisparitySampleJob sampledDisparityValue](self, "sampledDisparityValue");
  return -[_PIDisparitySampleResult initWithDisparityValue:](v3, "initWithDisparityValue:");
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CVBuffer *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  _BYTE v32[24];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_408();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_408();
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
  -[NURenderJob outputVideo](self, "outputVideo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F528]), "initWithAsset:", v5);
    if (v6)
    {
      -[PIDisparitySampleJob sampleTime](self, "sampleTime");
      if (objc_msgSend(v6, "startReadingFrames:atTime:error:", 2, v32, a3))
      {
        v7 = (void *)objc_msgSend(v6, "nextFrame");
        if (v7)
        {
          objc_msgSend(v6, "stopReadingFrames");
          v8 = (__CVBuffer *)objc_msgSend(v7, "disparityBuffer");
          if (v8 && CVPixelBufferGetPixelFormatType(v8) == 1751411059)
          {
            -[PIDisparitySampleJob sampleRect](self, "sampleRect");
            PTDisparityInNormalizedRectFromPixelBuffer();
            -[PIDisparitySampleJob setSampledDisparityValue:](self, "setSampledDisparityValue:");
            v9 = 1;
LABEL_15:

            goto LABEL_16;
          }
          v14 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(v5, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "invalidError:object:", CFSTR("Incompatible disparity buffer"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(v5, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "failureError:object:", CFSTR("Failed to read video frame"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        *a3 = v16;

        v9 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v5, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "failureError:object:", CFSTR("Failed to make asset reader for video"), v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v10 = (void *)MEMORY[0x1E0D520A0];
  -[NURenderJob description](self, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "failureError:object:", CFSTR("Failed to find output video asset"), v11);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v9 = 0;
LABEL_17:

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[9].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[10].var2;
  return self;
}

- (void)setSampleTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)(&self->_sampledDisparityValue + 1) = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_sampleTime.flags = var3;
}

- (CGRect)sampleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sampleRect.origin.x;
  y = self->_sampleRect.origin.y;
  width = self->_sampleRect.size.width;
  height = self->_sampleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSampleRect:(CGRect)a3
{
  self->_sampleRect = a3;
}

- (float)sampledDisparityValue
{
  return self->_sampledDisparityValue;
}

- (void)setSampledDisparityValue:(float)a3
{
  self->_sampledDisparityValue = a3;
}

@end
