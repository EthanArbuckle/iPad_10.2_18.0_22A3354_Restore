@implementation PKAccountPromotionBehavior

- (PKAccountPromotionBehavior)initWithMinRefreshPeriod:(id)a3 maxImpressionCount:(id)a4 timeVisibleAfterCompleted:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAccountPromotionBehavior *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPromotionBehavior;
  v11 = -[PKAccountPromotionBehavior init](&v16, sel_init);
  if (v11)
  {
    if (v8)
      objc_msgSend(v8, "doubleValue");
    else
      v12 = 0x4092C00000000000;
    *(_QWORD *)&v11->_minRefreshPeriod = v12;
    if (v9)
      v13 = objc_msgSend(v9, "integerValue");
    else
      v13 = 1;
    v11->_maxImpressionCount = v13;
    if (v10)
      objc_msgSend(v10, "doubleValue");
    else
      v14 = 0x4122750000000000;
    *(_QWORD *)&v11->_timeVisibleAfterCompleted = v14;
  }

  return v11;
}

- (PKAccountPromotionBehavior)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKAccountPromotionBehavior *v8;

  v4 = a3;
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("minRefreshPeriod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("maxImpressionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("timeVisibleAfterCompleted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKAccountPromotionBehavior initWithMinRefreshPeriod:maxImpressionCount:timeVisibleAfterCompleted:](self, "initWithMinRefreshPeriod:maxImpressionCount:timeVisibleAfterCompleted:", v5, v6, v7);
  return v8;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("minRefreshPeriod: '%f'; "), *(_QWORD *)&self->_minRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("maxImpressionCount: '%ld'; "), self->_maxImpressionCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("timeVisibleAfterCompleted: '%f'; "),
    *(_QWORD *)&self->_timeVisibleAfterCompleted);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountPromotionBehavior *v4;
  PKAccountPromotionBehavior *v5;
  BOOL v6;

  v4 = (PKAccountPromotionBehavior *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountPromotionBehavior isEqualToAccountPromotionBehavior:](self, "isEqualToAccountPromotionBehavior:", v5);

  return v6;
}

- (BOOL)isEqualToAccountPromotionBehavior:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = v4
    && self->_minRefreshPeriod == v4[1]
    && self->_maxImpressionCount == *((_QWORD *)v4 + 2)
    && self->_timeVisibleAfterCompleted == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_maxImpressionCount
     - (unint64_t)self->_minRefreshPeriod
     + 32 * (unint64_t)self->_minRefreshPeriod;
  return (unint64_t)self->_timeVisibleAfterCompleted - v2 + 32 * v2 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPromotionBehavior)initWithCoder:(id)a3
{
  id v4;
  PKAccountPromotionBehavior *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountPromotionBehavior;
  v5 = -[PKAccountPromotionBehavior init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minRefreshPeriod"));
    v5->_minRefreshPeriod = v6;
    v5->_maxImpressionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxImpressionCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeVisibleAfterCompleted"));
    v5->_timeVisibleAfterCompleted = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double minRefreshPeriod;
  id v5;

  minRefreshPeriod = self->_minRefreshPeriod;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minRefreshPeriod"), minRefreshPeriod);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxImpressionCount, CFSTR("maxImpressionCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeVisibleAfterCompleted"), self->_timeVisibleAfterCompleted);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_minRefreshPeriod;
  *((_QWORD *)result + 2) = self->_maxImpressionCount;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_timeVisibleAfterCompleted;
  return result;
}

- (double)minRefreshPeriod
{
  return self->_minRefreshPeriod;
}

- (void)setMinRefreshPeriod:(double)a3
{
  self->_minRefreshPeriod = a3;
}

- (int64_t)maxImpressionCount
{
  return self->_maxImpressionCount;
}

- (void)setMaxImpressionCount:(int64_t)a3
{
  self->_maxImpressionCount = a3;
}

- (double)timeVisibleAfterCompleted
{
  return self->_timeVisibleAfterCompleted;
}

- (void)setTimeVisibleAfterCompleted:(double)a3
{
  self->_timeVisibleAfterCompleted = a3;
}

@end
