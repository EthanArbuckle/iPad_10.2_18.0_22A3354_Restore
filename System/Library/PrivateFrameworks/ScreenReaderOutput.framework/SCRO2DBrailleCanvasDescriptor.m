@implementation SCRO2DBrailleCanvasDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCRO2DBrailleCanvasDescriptor)initWithCoder:(id)a3
{
  id v4;
  SCRO2DBrailleCanvasDescriptor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SCRO2DBrailleCanvasDescriptor *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCRO2DBrailleCanvasDescriptor;
  v5 = -[SCRO2DBrailleCanvasDescriptor init](&v12, sel_init);
  if (v5)
  {
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
    v5->_cellHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellHeight"));
    v5->_cellWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellWidth"));
    v5->_hasConsistentHorizontalPinSpacing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConsistentHorizontalPinSpacing"));
    v5->_hasConsistentVerticalPinSpacing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConsistentVerticalPinSpacing"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalPinSpacing"));
    v5->_verticalPinSpacing = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalPinSpacing"));
    v5->_horizontalPinSpacing = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interCellHorizontalSpacing"));
    v5->_interCellHorizontalSpacing = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interCellVerticalSpacing"));
    v5->_interCellVerticalSpacing = v9;
    v5->_skipPinBetweenCellsHorizontally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipPinBetweenCellsHorizontally"));
    v5->_skipPinBetweenCellsVertically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipPinBetweenCellsVertically"));
    v5->_pinHeightStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pinHeightStyle"));
    v5->_detentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("detentCount"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t height;
  id v5;

  height = self->_height;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", height, CFSTR("height"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor cellHeight](self, "cellHeight"), CFSTR("cellHeight"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor cellWidth](self, "cellWidth"), CFSTR("cellWidth"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor hasConsistentHorizontalPinSpacing](self, "hasConsistentHorizontalPinSpacing"), CFSTR("hasConsistentHorizontalPinSpacing"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor hasConsistentVerticalPinSpacing](self, "hasConsistentVerticalPinSpacing"), CFSTR("hasConsistentVerticalPinSpacing"));
  -[SCRO2DBrailleCanvasDescriptor verticalPinSpacing](self, "verticalPinSpacing");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("verticalPinSpacing"));
  -[SCRO2DBrailleCanvasDescriptor horizontalPinSpacing](self, "horizontalPinSpacing");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalPinSpacing"));
  -[SCRO2DBrailleCanvasDescriptor interCellHorizontalSpacing](self, "interCellHorizontalSpacing");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("interCellHorizontalSpacing"));
  -[SCRO2DBrailleCanvasDescriptor interCellVerticalSpacing](self, "interCellVerticalSpacing");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("interCellVerticalSpacing"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsHorizontally](self, "skipPinBetweenCellsHorizontally"), CFSTR("skipPinBetweenCellsHorizontally"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self, "skipPinBetweenCellsVertically"), CFSTR("skipPinBetweenCellsVertically"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self, "pinHeightStyle"), CFSTR("pinHeightStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SCRO2DBrailleCanvasDescriptor detentCount](self, "detentCount"), CFSTR("detentCount"));

}

- (unint64_t)numberOfCellsInRowAvailable
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t width;
  unint64_t v6;

  v3 = -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsHorizontally](self, "skipPinBetweenCellsHorizontally");
  v4 = -[SCRO2DBrailleCanvasDescriptor cellWidth](self, "cellWidth") + v3;
  width = self->_width;
  v6 = width / v4;
  if (width % v4 == -[SCRO2DBrailleCanvasDescriptor cellWidth](self, "cellWidth"))
    return v6 + 1;
  else
    return v6;
}

- (unint64_t)numberOfTextLinesAvailable
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t height;
  unint64_t v6;

  v3 = -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self, "skipPinBetweenCellsVertically");
  v4 = -[SCRO2DBrailleCanvasDescriptor cellHeight](self, "cellHeight") + v3;
  height = self->_height;
  v6 = height / v4;
  if (height % v4 == -[SCRO2DBrailleCanvasDescriptor cellHeight](self, "cellHeight"))
    return v6 + 1;
  else
    return v6;
}

- (unint64_t)numberOfGraphicsLinesAvailableForTextLines:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL8 v8;

  v5 = -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self, "skipPinBetweenCellsVertically") << 63 >> 63;
  v6 = v5 - -[SCRO2DBrailleCanvasDescriptor cellHeight](self, "cellHeight");
  v7 = -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self, "skipPinBetweenCellsVertically");
  if (a3)
    v8 = v7;
  else
    v8 = 0;
  return self->_height + v6 * a3 + v8;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(unint64_t)a3
{
  self->_cellHeight = a3;
}

- (unint64_t)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(unint64_t)a3
{
  self->_cellWidth = a3;
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  return self->_hasConsistentHorizontalPinSpacing;
}

- (void)setHasConsistentHorizontalPinSpacing:(BOOL)a3
{
  self->_hasConsistentHorizontalPinSpacing = a3;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  return self->_hasConsistentVerticalPinSpacing;
}

- (void)setHasConsistentVerticalPinSpacing:(BOOL)a3
{
  self->_hasConsistentVerticalPinSpacing = a3;
}

- (double)verticalPinSpacing
{
  return self->_verticalPinSpacing;
}

- (void)setVerticalPinSpacing:(double)a3
{
  self->_verticalPinSpacing = a3;
}

- (double)horizontalPinSpacing
{
  return self->_horizontalPinSpacing;
}

- (void)setHorizontalPinSpacing:(double)a3
{
  self->_horizontalPinSpacing = a3;
}

- (double)interCellHorizontalSpacing
{
  return self->_interCellHorizontalSpacing;
}

- (void)setInterCellHorizontalSpacing:(double)a3
{
  self->_interCellHorizontalSpacing = a3;
}

- (double)interCellVerticalSpacing
{
  return self->_interCellVerticalSpacing;
}

- (void)setInterCellVerticalSpacing:(double)a3
{
  self->_interCellVerticalSpacing = a3;
}

- (BOOL)skipPinBetweenCellsHorizontally
{
  return self->_skipPinBetweenCellsHorizontally;
}

- (void)setSkipPinBetweenCellsHorizontally:(BOOL)a3
{
  self->_skipPinBetweenCellsHorizontally = a3;
}

- (BOOL)skipPinBetweenCellsVertically
{
  return self->_skipPinBetweenCellsVertically;
}

- (void)setSkipPinBetweenCellsVertically:(BOOL)a3
{
  self->_skipPinBetweenCellsVertically = a3;
}

- (unint64_t)pinHeightStyle
{
  return self->_pinHeightStyle;
}

- (void)setPinHeightStyle:(unint64_t)a3
{
  self->_pinHeightStyle = a3;
}

- (unint64_t)detentCount
{
  return self->_detentCount;
}

- (void)setDetentCount:(unint64_t)a3
{
  self->_detentCount = a3;
}

@end
