@implementation OADAutoNumberBulletProperties

- (OADAutoNumberBulletProperties)initWithAutoNumberSchemeType:(int)a3 startIndex:(unint64_t)a4
{
  OADAutoNumberBulletProperties *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OADAutoNumberBulletProperties;
  result = -[OADAutoNumberBulletProperties init](&v7, sel_init);
  if (result)
  {
    result->mSchemeType = a3;
    result->mStartIndex = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->mSchemeType == v4[2] && self->mStartIndex == *((_QWORD *)v4 + 2);

  return v5;
}

- (int)autoNumberSchemeType
{
  return self->mSchemeType;
}

- (unint64_t)startIndex
{
  return self->mStartIndex;
}

- (unint64_t)hash
{
  return self->mStartIndex ^ self->mSchemeType;
}

@end
