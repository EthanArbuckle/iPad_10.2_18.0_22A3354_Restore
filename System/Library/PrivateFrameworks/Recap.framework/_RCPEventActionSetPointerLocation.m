@implementation _RCPEventActionSetPointerLocation

- (_RCPEventActionSetPointerLocation)initWithCoder:(id)a3
{
  id v4;
  _RCPEventActionSetPointerLocation *v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_RCPEventActionSetPointerLocation;
  v5 = -[RCPEventAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("modelPointX"));
    v5->_modelPoint.x = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("modelPointY"));
    v5->_modelPoint.y = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double *v3;
  id v4;
  objc_super v5;

  v3 = (double *)self;
  v5.receiver = self;
  v5.super_class = (Class)_RCPEventActionSetPointerLocation;
  v4 = a3;
  -[RCPEventAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("modelPointX"), *++v3, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("modelPointY"), v3[1]);

}

- (void)play
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double x;
  double y;
  double v9;
  double v10;
  id v11;
  const char *v12;
  FILE **v13;
  void *v14;
  id v15;

  +[RCPEventEnvironment currentEnvironment](RCPEventEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pointSize");
  x = self->_modelPoint.x;
  y = self->_modelPoint.y;
  v9 = v5 * x;
  v10 = v6 * y;
  if (_CLTLogLevel >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set model point: %g,%g -> %g,%g \n"), *(_QWORD *)&x, *(_QWORD *)&y, v5 * x, v6 * y);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    v13 = (FILE **)MEMORY[0x1E0C80C20];
    fputs(v12, (FILE *)*MEMORY[0x1E0C80C20]);

    fflush(*v13);
  }
  objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGlobalPointerPosition:", v9, v10);

}

- (CGPoint)modelPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_modelPoint.x;
  y = self->_modelPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setModelPoint:(CGPoint)a3
{
  self->_modelPoint = a3;
}

@end
