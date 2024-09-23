@implementation BKMousePointerRegion

- (BKMousePointerRegion)initWithPointSize:(CGSize)a3 cornerRadius:(double)a4 scale:(double)a5 displayUUID:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  BKMousePointerRegion *v12;
  BKMousePointerRegion *v13;
  NSString *v14;
  NSString *displayUUID;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BKMousePointerRegion;
  v12 = -[BKMousePointerRegion init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    v12->_pointSize.width = width;
    v12->_pointSize.height = height;
    v12->_cornerRadius = a4;
    v12->_scale = a5;
    v14 = (NSString *)objc_msgSend(v11, "copy");
    displayUUID = v13->_displayUUID;
    v13->_displayUUID = v14;

  }
  return v13;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pointSize:%g,%g cornerRadius:%g scale:%g display:%@"), *(_QWORD *)&self->_pointSize.width, *(_QWORD *)&self->_pointSize.height, *(_QWORD *)&self->_cornerRadius, *(_QWORD *)&self->_scale, self->_displayUUID);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_displayUUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BKMousePointerRegion *v4;
  uint64_t v5;
  uint64_t v6;
  BKMousePointerRegion *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = (BKMousePointerRegion *)a3;
  v7 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v8 = objc_opt_class(v4, v5, v6);
    if (v8 == objc_opt_class(BKMousePointerRegion, v9, v10)
      && BSSizeEqualToSize(self->_pointSize.width, self->_pointSize.height, v7->_pointSize.width, v7->_pointSize.height)&& BSFloatEqualToFloat(self->_cornerRadius, v7->_cornerRadius)&& BSFloatEqualToFloat(self->_scale, v7->_scale))
    {
      v11 = BSEqualObjects(self->_displayUUID, v7->_displayUUID);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self, a2)), "initWithPointSize:cornerRadius:scale:displayUUID:", self->_displayUUID, self->_pointSize.width, self->_pointSize.height, self->_cornerRadius, self->_scale);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)pointSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pointSize.width;
  height = self->_pointSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

@end
