@implementation TSTTableHeaderInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableHeaderInfo;
  -[TSTTableHeaderInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p size %f count %hu hiding 0x%02hx cstyle %p tstyle %p"), NSStringFromClass(v4), self, *(_QWORD *)&self->mSize, self->mNumberOfCells, self->mHidingState, self->mCellStyle, self->mTextStyle);
}

- (TSTCellStyle)cellStyle
{
  return self->mCellStyle;
}

- (void)setCellStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSWPParagraphStyle)textStyle
{
  return self->mTextStyle;
}

- (void)setTextStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (double)size
{
  return self->mSize;
}

- (void)setSize:(double)a3
{
  self->mSize = a3;
}

- (unsigned)hidingState
{
  return self->mHidingState;
}

- (void)setHidingState:(unsigned __int8)a3
{
  self->mHidingState = a3;
}

- (unsigned)numberOfCells
{
  return self->mNumberOfCells;
}

- (void)setNumberOfCells:(unsigned __int16)a3
{
  self->mNumberOfCells = a3;
}

@end
