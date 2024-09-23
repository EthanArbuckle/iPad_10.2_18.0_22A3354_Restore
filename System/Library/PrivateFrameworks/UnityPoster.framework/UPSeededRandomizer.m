@implementation UPSeededRandomizer

- (unint64_t)unsignedLongValue
{
  unint64_t v2;

  v2 = 1103515245 * self->_nextValue + 12345;
  self->_nextValue = v2;
  return v2;
}

- (double)fractionValue
{
  return (double)(-[UPSeededRandomizer unsignedLongValue](self, "unsignedLongValue") % 0x3E8 + 1) / 1000.0;
}

- (BOOL)BOOLValue
{
  return -[UPSeededRandomizer BOOLValueWithChance:](self, "BOOLValueWithChance:", 0.5);
}

- (BOOL)BOOLValueWithChance:(double)a3
{
  double v3;
  unint64_t v4;

  v3 = a3 * 100.0;
  v4 = -[UPSeededRandomizer unsignedLongValue](self, "unsignedLongValue");
  return v3 > (double)(v4 / 0x64
                     - 100 * ((unint64_t)((v4 / 0x64 * (unsigned __int128)0x51EB851EB851EB9uLL) >> 64) >> 1));
}

- (double)floatValueBetweenFirstValue:(double)a3 secondValue:(double)a4
{
  double v5;
  double v6;

  v5 = a4 - a3;
  -[UPSeededRandomizer fractionValue](self, "fractionValue");
  return a3 + v6 * v5;
}

- (CGPoint)pointBetweenFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  v5 = a3.y;
  -[UPSeededRandomizer floatValueBetweenFirstValue:secondValue:](self, "floatValueBetweenFirstValue:secondValue:", a3.x, a4.x);
  v8 = v7;
  -[UPSeededRandomizer floatValueBetweenFirstValue:secondValue:](self, "floatValueBetweenFirstValue:secondValue:", v5, y);
  v10 = v9;
  v11 = v8;
  result.y = v10;
  result.x = v11;
  return result;
}

- (void)reset
{
  self->_nextValue = self->_seedValue;
}

+ (id)randomizerWithSeedValue:(unint64_t)a3
{
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)objc_msgSend(a1, "new");
  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  v4[1] = v5;
  v4[2] = v5;
  return v4;
}

@end
