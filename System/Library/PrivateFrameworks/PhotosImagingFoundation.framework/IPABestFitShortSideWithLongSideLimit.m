@implementation IPABestFitShortSideWithLongSideLimit

- (IPABestFitShortSideWithLongSideLimit)initWithNominalShortSide:(int64_t)a3 minLongSide:(int64_t)a4 maxLongSide:(int64_t)a5
{
  IPABestFitShortSideWithLongSideLimit *result;
  IPABestFitShortSideWithLongSideLimit *v9;
  SEL v10;
  objc_super v11;

  if (a3 <= 0)
  {
    _PFAssertFailHandler();
    goto LABEL_8;
  }
  if (a4 <= 0)
  {
LABEL_8:
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  if (a5 <= 0)
  {
LABEL_9:
    v9 = (IPABestFitShortSideWithLongSideLimit *)_PFAssertFailHandler();
    return (IPABestFitShortSideWithLongSideLimit *)-[IPABestFitShortSideWithLongSideLimit isBestFitPolicy](v9, v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)IPABestFitShortSideWithLongSideLimit;
  result = -[IPABestFitShortSideWithLongSideLimit init](&v11, sel_init);
  if (result)
  {
    result->_nominalShortSide = a3;
    result->_minLongSide = a4;
    result->_maxLongSide = a5;
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (CGSize)transformSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  IPABestFitShortSideWithLongSideLimit *v8;
  SEL v9;
  CGSize v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    v8 = (IPABestFitShortSideWithLongSideLimit *)_PFAssertFailHandler();
    v7 = -[IPABestFitShortSideWithLongSideLimit transformScaleForSize:](v8, v9, v10);
  }
  else
  {
    -[IPABestFitShortSideWithLongSideLimit transformScaleForSize:](self, "transformScaleForSize:", a3.width, a3.height);
    v6 = height * v5;
    v7 = width * v5;
  }
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height;
  double result;
  double v5;
  double minLongSide;

  if (a3.width >= a3.height)
    height = a3.height;
  else
    height = a3.width;
  if (a3.width >= a3.height)
    a3.height = a3.width;
  result = (double)self->_nominalShortSide / height;
  v5 = floor(a3.height * result);
  minLongSide = (double)self->_minLongSide;
  if (v5 < minLongSide || (minLongSide = (double)self->_maxLongSide, v5 > minLongSide))
    result = minLongSide / a3.height;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> nominalShort=%d, minLong=%d, maxLong=%d"), objc_opt_class(), self, self->_nominalShortSide, self->_minLongSide, self->_maxLongSide);
}

- (IPABestFitShortSideWithLongSideLimit)initWithCoder:(id)a3
{
  id v3;
  IPABestFitShortSideWithLongSideLimit *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IPABestFitShortSideWithLongSideLimit;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v7, sel_initWithCoder_, v3);
  v4->_nominalShortSide = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("nominal short"), v7.receiver, v7.super_class);
  v4->_minLongSide = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("min long"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("max long"));

  v4->_maxLongSide = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPABestFitShortSideWithLongSideLimit;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_nominalShortSide, CFSTR("nominal short"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minLongSide, CFSTR("min long"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maxLongSide, CFSTR("max long"));

}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  v5 = *(_OWORD *)&self->_nominalShortSide == *(_OWORD *)(v4 + 8) && self->_maxLongSide == *((_QWORD *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (16 * self->_nominalShortSide) ^ ((unint64_t)self->_nominalShortSide >> 28) ^ self->_minLongSide;
  return (16 * v2) ^ (v2 >> 28) ^ self->_maxLongSide;
}

@end
