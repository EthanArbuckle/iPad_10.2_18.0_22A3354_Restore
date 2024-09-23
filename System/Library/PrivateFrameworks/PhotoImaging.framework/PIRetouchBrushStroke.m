@implementation PIRetouchBrushStroke

- (BOOL)hasSource
{
  double v3;
  double v4;

  -[PIRetouchBrushStroke sourceOffset](self, "sourceOffset");
  if (v3 == 0.0)
    return 0;
  -[PIRetouchBrushStroke sourceOffset](self, "sourceOffset");
  return v4 != 0.0;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CGPoint)sourceOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_sourceOffset.x;
  y = self->_sourceOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSourceOffset:(CGPoint)a3
{
  self->_sourceOffset = a3;
}

- (BOOL)repairEdges
{
  return self->_repairEdges;
}

- (void)setRepairEdges:(BOOL)a3
{
  self->_repairEdges = a3;
}

+ (id)dictionaryFromBrushStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___PIRetouchBrushStroke;
  objc_msgSendSuper2(&v23, sel_dictionaryFromBrushStroke_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v4, "type");
  v8 = CFSTR("RepairML");
  if (v7 != 1)
    v8 = 0;
  if (v7)
    v9 = v8;
  else
    v9 = CFSTR("Repair");
  +[PIRetouchAdjustmentController modeKey](PIRetouchAdjustmentController, "modeKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, v10);

  v11 = (void *)objc_opt_new();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "sourceOffset");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController sourceOffsetXKey](PIRetouchAdjustmentController, "sourceOffsetXKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, v14);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "sourceOffset");
  objc_msgSend(v15, "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController sourceOffsetYKey](PIRetouchAdjustmentController, "sourceOffsetYKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v17, v18);

  +[PIRetouchAdjustmentController sourceOffsetKey](PIRetouchAdjustmentController, "sourceOffsetKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v11, v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "repairEdges"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIRetouchAdjustmentController repairEdgesKey](PIRetouchAdjustmentController, "repairEdgesKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v20, v21);

  return v6;
}

@end
