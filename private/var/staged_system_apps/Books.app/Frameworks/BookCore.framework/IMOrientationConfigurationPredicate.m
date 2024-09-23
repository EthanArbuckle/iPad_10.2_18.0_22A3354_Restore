@implementation IMOrientationConfigurationPredicate

+ (id)portraitPredicate
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithType:", 0);
}

+ (id)landscapePredicate
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithType:", 1);
}

- (IMOrientationConfigurationPredicate)initWithType:(unint64_t)a3
{
  IMOrientationConfigurationPredicate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMOrientationConfigurationPredicate;
  result = -[IMConfigurationPredicate init](&v5, "init");
  if (result)
    result->_type = a3;
  return result;
}

- (BOOL)evaluateWithContext:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  unint64_t v12;
  double Width;
  double Height;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(a3, "im_frameEnvironmentBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[IMOrientationConfigurationPredicate type](self, "type");
  if (v12 == 1)
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    Width = CGRectGetWidth(v18);
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    Height = CGRectGetHeight(v19);
    return Width > Height;
  }
  if (!v12)
  {
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    Width = CGRectGetHeight(v16);
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    Height = CGRectGetWidth(v17);
    return Width > Height;
  }
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
