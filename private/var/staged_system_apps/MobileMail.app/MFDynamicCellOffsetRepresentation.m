@implementation MFDynamicCellOffsetRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFDynamicCellOffsetRepresentation)initWithRelativeCellAnchor:(double)a3 relativeDistanceFromTop:(double)a4
{
  MFDynamicCellOffsetRepresentation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFDynamicCellOffsetRepresentation;
  result = -[MFDynamicCellOffsetRepresentation init](&v7, "init");
  if (result)
  {
    result->_relativeCellAnchor = a3;
    result->_relativeDistanceFromTop = a4;
  }
  return result;
}

- (MFDynamicCellOffsetRepresentation)initWithCoder:(id)a3
{
  id v4;
  MFDynamicCellOffsetRepresentation *v5;
  NSSet *v6;
  void *v7;
  void *v8;
  float v9;
  NSSet *v10;
  void *v11;
  void *v12;
  float v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFDynamicCellOffsetRepresentation;
  v5 = -[MFDynamicCellOffsetRepresentation init](&v15, "init");
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("EFPropertyKey_relativeCellAnchor")));
    objc_msgSend(v8, "floatValue");
    v5->_relativeCellAnchor = v9;

    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("EFPropertyKey_relativeDistanceFromTop")));
    objc_msgSend(v12, "floatValue");
    v5->_relativeDistanceFromTop = v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFDynamicCellOffsetRepresentation relativeCellAnchor](self, "relativeCellAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_relativeCellAnchor"));

  -[MFDynamicCellOffsetRepresentation relativeDistanceFromTop](self, "relativeDistanceFromTop");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_relativeDistanceFromTop"));

}

- (NSString)ef_publicDescription
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  v3 = objc_opt_class(self);
  -[MFDynamicCellOffsetRepresentation relativeCellAnchor](self, "relativeCellAnchor");
  v5 = v4 * 100.0;
  -[MFDynamicCellOffsetRepresentation relativeDistanceFromTop](self, "relativeDistanceFromTop");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p cellAnchor=%.02f%% distanceFromTop=%.02f%%>"), v3, self, *(_QWORD *)&v5, v6 * 100.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_opt_class(MFDynamicCellOffsetRepresentation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    -[MFDynamicCellOffsetRepresentation relativeCellAnchor](self, "relativeCellAnchor");
    v8 = v7;
    objc_msgSend(v6, "relativeCellAnchor");
    if (v8 == v9)
    {
      -[MFDynamicCellOffsetRepresentation relativeDistanceFromTop](self, "relativeDistanceFromTop");
      v11 = v10;
      objc_msgSend(v6, "relativeDistanceFromTop");
      v13 = v11 == v12;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)relativeCellAnchor
{
  return self->_relativeCellAnchor;
}

- (void)setRelativeCellAnchor:(double)a3
{
  self->_relativeCellAnchor = a3;
}

- (double)relativeDistanceFromTop
{
  return self->_relativeDistanceFromTop;
}

- (void)setRelativeDistanceFromTop:(double)a3
{
  self->_relativeDistanceFromTop = a3;
}

@end
