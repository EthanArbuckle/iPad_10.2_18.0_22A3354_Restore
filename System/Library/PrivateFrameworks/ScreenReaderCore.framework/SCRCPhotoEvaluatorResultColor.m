@implementation SCRCPhotoEvaluatorResultColor

- (SCRCPhotoEvaluatorResultColor)initWithRedLevel:(double)a3 blueLevel:(double)a4 greenLevel:(double)a5
{
  SCRCPhotoEvaluatorResultColor *v8;
  SCRCPhotoEvaluatorResultColor *v9;
  SCRCPhotoEvaluatorResultColor *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCRCPhotoEvaluatorResultColor;
  v8 = -[SCRCPhotoEvaluatorResultColor init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_redLevel = a3;
    v8->_blueLevel = a4;
    v8->_greenLevel = a5;
    v10 = v8;
  }

  return v9;
}

- (id)humanReadableResult
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rgb %2.2f %2.2f %2.2f 1.00"), *(_QWORD *)&self->_redLevel, *(_QWORD *)&self->_greenLevel, *(_QWORD *)&self->_blueLevel);
}

- (double)redLevel
{
  return self->_redLevel;
}

- (double)blueLevel
{
  return self->_blueLevel;
}

- (double)greenLevel
{
  return self->_greenLevel;
}

@end
