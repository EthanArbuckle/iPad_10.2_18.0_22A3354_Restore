@implementation VKARWalkingFeature

- (VKARWalkingFeature)initWithType:(int64_t)a3
{
  return -[VKARWalkingFeature initWithType:intraFeaturePriority:](self, "initWithType:intraFeaturePriority:", a3, -1);
}

- (VKARWalkingFeature)initWithType:(int64_t)a3 intraFeaturePriority:(unint64_t)a4
{
  VKARWalkingFeature *v6;
  VKARWalkingFeature *v7;
  VKARWalkingFeature *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKARWalkingFeature;
  v6 = -[VKARWalkingFeature init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_intraFeaturePriority = a4;
    v8 = v6;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VKARWalkingFeature *v4;
  uint64_t v5;
  BOOL v6;
  VKARWalkingFeature *v7;
  int64_t type;
  unint64_t intraFeaturePriority;

  v4 = (VKARWalkingFeature *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      type = self->_type;
      if (type == -[VKARWalkingFeature type](v7, "type"))
      {
        intraFeaturePriority = self->_intraFeaturePriority;
        v6 = intraFeaturePriority == -[VKARWalkingFeature intraFeaturePriority](v7, "intraFeaturePriority");
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)intraFeaturePriority
{
  return self->_intraFeaturePriority;
}

@end
