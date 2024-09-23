@implementation PISegmentationGatingRange

- (PISegmentationGatingRange)initWithMin:(double)a3 max:(double)a4 manualMin:(double)a5 manualMax:(double)a6 depthMin:(double)a7 depthMax:(double)a8
{
  PISegmentationGatingRange *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PISegmentationGatingRange;
  result = -[PISegmentationGatingRange init](&v15, sel_init);
  result->_min = a3;
  result->_max = a4;
  result->_manualMin = a5;
  result->_manualMax = a6;
  result->_depthMin = a7;
  result->_depthMax = a8;
  return result;
}

- (id)withLenience:(double)a3
{
  return -[PISegmentationGatingRange initWithMin:max:manualMin:manualMax:depthMin:depthMax:]([PISegmentationGatingRange alloc], "initWithMin:max:manualMin:manualMax:depthMin:depthMax:", a3 * 0.0 + (1.0 - a3) * self->_min, a3 + (1.0 - a3) * self->_max, a3 * 0.0 + (1.0 - a3) * self->_manualMin, a3 + (1.0 - a3) * self->_manualMax, a3 * 0.0 + (1.0 - a3) * self->_depthMin, a3 + (1.0 - a3) * self->_depthMax);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PISegmentationGatingRange min](self, "min");
  v6 = v5;
  -[PISegmentationGatingRange max](self, "max");
  v8 = v7;
  -[PISegmentationGatingRange manualMin](self, "manualMin");
  v10 = v9;
  -[PISegmentationGatingRange manualMax](self, "manualMax");
  v12 = v11;
  -[PISegmentationGatingRange depthMin](self, "depthMin");
  v14 = v13;
  -[PISegmentationGatingRange depthMax](self, "depthMax");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; min = %.2f, max = %.2f, manualMin = %.2f, manualMax = %.2f, depthMin = %.2f, depthMax = %.2f>"),
               v4,
               self,
               v6,
               v8,
               v10,
               v12,
               v14,
               v15);
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)manualMin
{
  return self->_manualMin;
}

- (double)manualMax
{
  return self->_manualMax;
}

- (double)depthMin
{
  return self->_depthMin;
}

- (double)depthMax
{
  return self->_depthMax;
}

@end
