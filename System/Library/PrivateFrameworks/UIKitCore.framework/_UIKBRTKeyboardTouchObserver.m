@implementation _UIKBRTKeyboardTouchObserver

- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7
{
  NSArray *v9;
  NSArray *rowOffsets;
  double x;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *rowXEdges;
  NSArray *v23;
  NSArray *v24;
  double v25;
  int v26;
  void *v27;
  void *v28;
  NSArray *rowYEdgesLeft;
  NSArray *v30;
  NSArray *rowYEdgesRight;
  void *v32;
  void *v33;
  _QWORD v34[11];

  v34[10] = *MEMORY[0x1E0C80C00];
  self->_fCenter = a3;
  self->_jCenter = a4;
  self->_keySize = a5;
  v9 = (NSArray *)objc_msgSend(a6, "copy");
  rowOffsets = self->_rowOffsets;
  self->_rowOffsets = v9;

  self->_homeRowOffsetIndex = a7;
  x = self->_fCenter.x;
  v12 = (x + self->_jCenter.x) * 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x - self->_keySize.width * 2.5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fCenter.x - self->_keySize.width * 1.5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fCenter.x - self->_keySize.width * 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fCenter.x + self->_keySize.width * 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jCenter.x - self->_keySize.width * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jCenter.x + self->_keySize.width * 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jCenter.x + self->_keySize.width * 1.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jCenter.x + self->_keySize.width * 2.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 + v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 10);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rowXEdges = self->_rowXEdges;
  self->_rowXEdges = v21;

  v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = -2.0;
  v26 = 6;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fCenter.y + (v25 + -0.5) * self->_keySize.height);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v23, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jCenter.y + (v25 + -0.5) * self->_keySize.height);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v24, "addObject:", v28);

    v25 = v25 + 1.0;
    --v26;
  }
  while (v26);
  rowYEdgesLeft = self->_rowYEdgesLeft;
  self->_rowYEdgesLeft = v23;
  v30 = v23;

  rowYEdgesRight = self->_rowYEdgesRight;
  self->_rowYEdgesRight = v24;

}

- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withIdentifier:(id)a5
{
  double y;
  double x;
  void *v9;
  id v10;
  double v11;
  id v12;

  y = a3.y;
  x = a3.x;
  v9 = (void *)MEMORY[0x1E0CB3898];
  v10 = a5;
  objc_msgSend(v9, "processInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemUptime");
  -[_UIKBRTKeyboardTouchObserver addTouchLocation:withRadius:withTouchTime:withIdentifier:](self, "addTouchLocation:withRadius:withTouchTime:withIdentifier:", v10, x, y, a4, v11);

}

- (void)removeTouchWithIdentifier:(id)a3
{
  -[_UIKBRTKeyboardTouchObserver removeTouchWithIdentifier:touchCancelled:](self, "removeTouchWithIdentifier:touchCancelled:", a3, 0);
}

- (CGPoint)fCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_fCenter.x;
  y = self->_fCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFCenter:(CGPoint)a3
{
  self->_fCenter = a3;
}

- (CGPoint)jCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_jCenter.x;
  y = self->_jCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setJCenter:(CGPoint)a3
{
  self->_jCenter = a3;
}

- (CGSize)keySize
{
  double width;
  double height;
  CGSize result;

  width = self->_keySize.width;
  height = self->_keySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setKeySize:(CGSize)a3
{
  self->_keySize = a3;
}

- (NSArray)rowOffsets
{
  return self->_rowOffsets;
}

- (void)setRowOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_rowOffsets, a3);
}

- (int)homeRowOffsetIndex
{
  return self->_homeRowOffsetIndex;
}

- (void)setHomeRowOffsetIndex:(int)a3
{
  self->_homeRowOffsetIndex = a3;
}

- (NSArray)rowXEdges
{
  return self->_rowXEdges;
}

- (void)setRowXEdges:(id)a3
{
  objc_storeStrong((id *)&self->_rowXEdges, a3);
}

- (NSArray)rowYEdgesLeft
{
  return self->_rowYEdgesLeft;
}

- (void)setRowYEdgesLeft:(id)a3
{
  objc_storeStrong((id *)&self->_rowYEdgesLeft, a3);
}

- (NSArray)rowYEdgesRight
{
  return self->_rowYEdgesRight;
}

- (void)setRowYEdgesRight:(id)a3
{
  objc_storeStrong((id *)&self->_rowYEdgesRight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowYEdgesRight, 0);
  objc_storeStrong((id *)&self->_rowYEdgesLeft, 0);
  objc_storeStrong((id *)&self->_rowXEdges, 0);
  objc_storeStrong((id *)&self->_rowOffsets, 0);
}

@end
