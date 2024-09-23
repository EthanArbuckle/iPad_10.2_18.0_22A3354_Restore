@implementation PXGViewRecordingFrameStartEventSerializable

- (PXGViewRecordingFrameStartEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGViewRecordingFrameStartEventSerializable *v5;
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
  v26.super_class = (Class)PXGViewRecordingFrameStartEventSerializable;
  v5 = -[PXGViewRecordingFrameStartEventSerializable init](&v26, sel_init);
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
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  void *v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("viewSize");
  -[PXGViewRecordingFrameStartEventSerializable viewSize](self, "viewSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v7;
  v16[1] = CFSTR("renderOrigin");
  -[PXGViewRecordingFrameStartEventSerializable renderOrigin](self, "renderOrigin");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v12;
  v16[2] = CFSTR("screenScale");
  -[PXGViewRecordingFrameStartEventSerializable screenScale](self, "screenScale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
