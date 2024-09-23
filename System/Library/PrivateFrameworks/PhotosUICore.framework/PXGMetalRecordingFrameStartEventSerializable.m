@implementation PXGMetalRecordingFrameStartEventSerializable

- (PXGMetalRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGMetalRecordingFrameStartEventSerializable *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  CGFloat v10;
  void *v11;
  float v12;
  CGFloat v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int128 v20;
  int v21;
  void *v22;
  id v23;
  float v24;
  double v25;
  int v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PXGMetalRecordingFrameStartEventSerializable;
  v5 = -[PXGMetalRecordingFrameStartEventSerializable init](&v30, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    v5->_viewSize.width = v10;
    v5->_viewSize.height = v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("renderOrigin"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    *(_QWORD *)&v28 = v16;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v27 = v18;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v20 = v28;
    DWORD1(v20) = v27;
    DWORD2(v20) = v21;
    v29 = v20;

    *(_OWORD *)v5->_renderOrigin = v29;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("screenScale"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22;
    objc_msgSend(v23, "floatValue");
    v25 = v24;

    v5->_screenScale = v25;
  }

  return v5;
}

- (id)createSerializableObject
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  _QWORD v18[3];
  _QWORD v19[3];
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("viewSize");
  -[PXGMetalRecordingFrameStartEventSerializable viewSize](self, "viewSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v7;
  v18[1] = CFSTR("renderOrigin");
  -[PXGMetalRecordingFrameStartEventSerializable renderOrigin](self, "renderOrigin");
  v17 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  HIDWORD(v10) = DWORD1(v17);
  LODWORD(v10) = DWORD1(v17);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v17), DWORD2(v17))));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[1] = v13;
  v18[2] = CFSTR("screenScale");
  -[PXGMetalRecordingFrameStartEventSerializable screenScale](self, "screenScale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (__n128)renderOrigin
{
  return a1[2];
}

- (void)setRenderOrigin:(PXGMetalRecordingFrameStartEventSerializable *)self
{
  __int128 v2;

  *(_OWORD *)self->_renderOrigin = v2;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

@end
