@implementation TIRadialErrorGenerator

- (TIRadialErrorGenerator)initWithAttributes:(id)a3
{
  id v4;
  TIRadialErrorGenerator *v5;
  TIRadialErrorGenerator *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIRadialErrorGenerator;
  v5 = -[TIErrorGenerator initWithAttributes:](&v19, sel_initWithAttributes_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_letterErrorProbability = 0;
    v5->_defaultDistanceMax = 0;
    v5->_defaultDistanceMin = 0;
    v5->_letterDistanceMax = 0;
    v5->_letterDistanceMin = 0;
    objc_msgSend(v4, "valueForKey:", CFSTR("LETTER_ERROR_PROBABILITY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("LETTER_ERROR_PROBABILITY"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v6->_letterErrorProbability = (unint64_t)v9;

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("DEFAULT_ERROR_RADIAL_MIN_DISTANCE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("DEFAULT_ERROR_RADIAL_MIN_DISTANCE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_defaultDistanceMin = (int)objc_msgSend(v11, "intValue");

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("DEFAULT_ERROR_RADIAL_MAX_DISTANCE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("DEFAULT_ERROR_RADIAL_MAX_DISTANCE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_defaultDistanceMax = (int)objc_msgSend(v13, "intValue");

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("LETTER_ERROR_RADIAL_MIN_DISTANCE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("LETTER_ERROR_RADIAL_MIN_DISTANCE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_letterDistanceMin = (int)objc_msgSend(v15, "intValue");

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("LETTER_ERROR_RADIAL_MAX_DISTANCE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("LETTER_ERROR_RADIAL_MAX_DISTANCE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_letterDistanceMax = (int)objc_msgSend(v17, "intValue");

    }
  }

  return v6;
}

- (CGPoint)randomBiasForKeyString:(id)a3 rect:(CGRect)a4
{
  double v5;
  double v6;
  unint64_t letterErrorProbability;
  double v8;
  double v9;
  int *v10;
  unint64_t v11;
  int *v12;
  unint64_t v13;
  uint32_t v14;
  float v15;
  float v16;
  __float2 v17;
  double v18;
  double v19;
  CGPoint result;

  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = v5;
  letterErrorProbability = self->_letterErrorProbability;
  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
  v9 = v8;
  v10 = &OBJC_IVAR___TIRadialErrorGenerator__defaultDistanceMin;
  if (v6 < (double)letterErrorProbability)
    v10 = &OBJC_IVAR___TIRadialErrorGenerator__letterDistanceMin;
  v11 = *(unint64_t *)((char *)&self->super.super.isa + *v10);
  v12 = &OBJC_IVAR___TIRadialErrorGenerator__defaultDistanceMax;
  if (v6 < (double)letterErrorProbability)
    v12 = &OBJC_IVAR___TIRadialErrorGenerator__letterDistanceMax;
  v13 = *(unint64_t *)((char *)&self->super.super.isa + *v12);
  v14 = arc4random();
  v15 = (v9 + v9) * 3.14159265;
  v16 = (float)v11 + (double)v14 / 4294967300.0 * (float)((float)v13 - (float)v11);
  v17 = __sincosf_stret(v15);
  v18 = (float)(v17.__sinval * v16);
  v19 = (float)(v17.__cosval * v16);
  result.y = v18;
  result.x = v19;
  return result;
}

@end
