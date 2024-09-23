@implementation PXGVisionRecordingFrameStartEventSerializable

- (PXGVisionRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGVisionRecordingFrameStartEventSerializable *v5;
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
  float v16;
  CGFloat v17;
  void *v18;
  float v19;
  CGFloat v20;
  void *v21;
  id v22;
  float v23;
  double v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PXGVisionRecordingFrameStartEventSerializable;
  v5 = -[PXGVisionRecordingFrameStartEventSerializable init](&v26, sel_init);
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
    v17 = v16;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    v5->_renderOrigin.x = v17;
    v5->_renderOrigin.y = v20;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("screenScale"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v21;
    objc_msgSend(v22, "floatValue");
    v24 = v23;

    v5->_screenScale = v24;
  }

  return v5;
}

- (id)createSerializableObject
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  double y;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("viewSize");
  height = self->_viewSize.height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_viewSize.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v6;
  v14[1] = CFSTR("renderOrigin");
  y = self->_renderOrigin.y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_renderOrigin.x);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = v10;
  v14[2] = CFSTR("screenScale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_screenScale);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

- (CGPoint)renderOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_renderOrigin.x;
  y = self->_renderOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRenderOrigin:(CGPoint)a3
{
  self->_renderOrigin = a3;
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
