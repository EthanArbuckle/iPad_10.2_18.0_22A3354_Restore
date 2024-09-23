@implementation OADCharacterBulletProperties

- (OADCharacterBulletProperties)initWithBullet:(id)a3
{
  id v4;
  NSString *v5;
  NSString *mBullet;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  mBullet = self->mBullet;
  self->mBullet = v5;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->mBullet, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (id)bullet
{
  return self->mBullet;
}

- (unint64_t)hash
{
  return -[NSString hash](self->mBullet, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBullet, 0);
}

@end
