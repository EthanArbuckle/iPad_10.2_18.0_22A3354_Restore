@implementation TSTTableStrokePresetData

- (TSTTableStrokePresetData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableStrokePresetData;
  return -[TSTTableStrokePresetData init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableStrokePresetData;
  -[TSTTableStrokePresetData dealloc](&v3, sel_dealloc);
}

- (TSTTableStrokePresetData)initWithMask:(unsigned int)a3 horizontalStroke:(id)a4 verticalStroke:(id)a5 exteriorStroke:(id)a6
{
  TSTTableStrokePresetData *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSTTableStrokePresetData;
  v10 = -[TSTTableStrokePresetData init](&v12, sel_init);
  if (v10)
  {
    v10->mVerticalStroke = (TSDStroke *)a5;
    v10->mHorizontalStroke = (TSDStroke *)a4;
    v10->mExteriorStroke = (TSDStroke *)a6;
    v10->mVisibleMask = a3;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  return self->mHorizontalStroke == (TSDStroke *)*((_QWORD *)a3 + 1)
      && self->mVerticalStroke == (TSDStroke *)*((_QWORD *)a3 + 2)
      && self->mExteriorStroke == (TSDStroke *)*((_QWORD *)a3 + 3)
      && self->mVisibleMask == *((_DWORD *)a3 + 8);
}

- (TSDStroke)horizontalStroke
{
  return self->mHorizontalStroke;
}

- (void)setHorizontalStroke:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSDStroke)verticalStroke
{
  return self->mVerticalStroke;
}

- (void)setVerticalStroke:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDStroke)exteriorStroke
{
  return self->mExteriorStroke;
}

- (void)setExteriorStroke:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)mask
{
  return self->mVisibleMask;
}

- (void)setMask:(unsigned int)a3
{
  self->mVisibleMask = a3;
}

@end
