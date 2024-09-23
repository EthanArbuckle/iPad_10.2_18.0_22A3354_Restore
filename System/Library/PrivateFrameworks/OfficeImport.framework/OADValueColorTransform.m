@implementation OADValueColorTransform

- (void)setValue:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (float)value
{
  return *((float *)&self->super.mType + 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float v5;
  float v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    && (v5 = *((float *)&self->super.mType + 1), objc_msgSend(v4, "value"), v5 == v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)OADValueColorTransform;
    v7 = -[OADColorTransform isEqual:](&v9, sel_isEqual_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2;
  objc_super v4;

  v2 = (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADValueColorTransform;
  return -[OADColorTransform hash](&v4, sel_hash) ^ v2;
}

@end
