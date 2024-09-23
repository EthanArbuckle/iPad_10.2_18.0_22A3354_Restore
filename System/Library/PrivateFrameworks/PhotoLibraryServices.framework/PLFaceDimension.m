@implementation PLFaceDimension

- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 centerX:(double)a5 centerY:(double)a6 size:(double)a7
{
  return -[PLFaceDimension initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:](self, "initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:", a3, a4, a5, a6, a7, 0.0, 0.0, 0.0, 0.0);
}

- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 bodyCenterX:(double)a5 bodyCenterY:(double)a6 bodyWidth:(double)a7 bodyHeight:(double)a8
{
  return -[PLFaceDimension initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:](self, "initWithSourceWidth:sourceHeight:centerX:centerY:size:bodyCenterX:bodyCenterY:bodyWidth:bodyHeight:", a3, a4, 0.0, 0.0, 0.0, a5, a6, a7, a8);
}

- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 centerX:(double)a5 centerY:(double)a6 size:(double)a7 bodyCenterX:(double)a8 bodyCenterY:(double)a9 bodyWidth:(double)a10 bodyHeight:(double)a11
{
  PLFaceDimension *result;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PLFaceDimension;
  result = -[PLFaceDimension init](&v21, sel_init);
  if (result)
  {
    result->_sourceWidth = a3;
    result->_sourceHeight = a4;
    result->_centerX = a5;
    result->_centerY = a6;
    result->_size = a7;
    result->_bodyCenterX = a8;
    result->_bodyCenterY = a9;
    result->_bodyWidth = a10;
    result->_bodyHeight = a11;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  double bodyCenterX;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (self->_centerX == 0.0)
  {
    bodyCenterX = self->_bodyCenterX;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9;
    if (bodyCenterX == 0.0)
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> zero"), v9, self, v12, v13, v14, v15, v16, v17);
    else
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> body center: (%f, %f), body size: (%f, %f), width: %ld, height: %ld"), v9, self, *(_QWORD *)&self->_bodyCenterX, *(_QWORD *)&self->_bodyCenterY, *(_QWORD *)&self->_bodyWidth, *(_QWORD *)&self->_bodyHeight, self->_sourceWidth, self->_sourceHeight);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> center: (%f, %f), size: %f, width: %ld, height: %ld"), v5, self, *(_QWORD *)&self->_centerX, *(_QWORD *)&self->_centerY, *(_QWORD *)&self->_size, self->_sourceWidth, self->_sourceHeight, v17);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)photosFaceRepresentationSourceWidth
{
  return self->_sourceWidth;
}

- (int64_t)photosFaceRepresentationSourceHeight
{
  return self->_sourceHeight;
}

- (double)photosFaceRepresentationCenterX
{
  return self->_centerX;
}

- (double)photosFaceRepresentationCenterY
{
  return self->_centerY;
}

- (double)photosFaceRepresentationSize
{
  return self->_size;
}

- (double)photosFaceRepresentationBodyCenterX
{
  return self->_bodyCenterX;
}

- (double)photosFaceRepresentationBodyCenterY
{
  return self->_bodyCenterY;
}

- (double)photosFaceRepresentationBodyHeight
{
  return self->_bodyHeight;
}

- (double)photosFaceRepresentationBodyWidth
{
  return self->_bodyWidth;
}

- (double)photosFaceRepresentationBlurScore
{
  return 0.0;
}

- (BOOL)photosFaceRepresentationHasSmile
{
  return 0;
}

- (BOOL)photosFaceRepresentationIsLeftEyeClosed
{
  return 0;
}

- (BOOL)photosFaceRepresentationIsRightEyeClosed
{
  return 0;
}

- (int64_t)photosFaceRepresentationQualityMeasure
{
  return 0;
}

- (int64_t)photosFaceRepresentationClusterSequenceNumber
{
  return 0;
}

- (id)photosFaceRepresentationLocalIdentifier
{
  return 0;
}

- (double)photosFaceRepresentationRoll
{
  return 0.0;
}

- (double)photosFaceRepresentationQuality
{
  return -1.0;
}

@end
