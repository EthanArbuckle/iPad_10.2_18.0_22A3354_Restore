@implementation PDAnimateMotionBehavior

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->mPath, a3);
}

- (void)setRotationCenter:(CGPoint)a3
{
  self->mRotationCenter = a3;
  self->mHasRotationCenter = 1;
}

+ (id)bezierPathFromNSString:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v26;
  id v27;
  unint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[OITSUBezierPath bezierPath](OITSUBezierPath, "bezierPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "length");
  if ((v4 & 1) == 0
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("MLCZEmlcze"));
    +[PDAnimateMotionBehavior bezierPathFromNSString:]::commandCharacterSet = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v3);
  v6 = 0;
  while ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
  {
    v31 = 0;
    v7 = objc_msgSend(v5, "scanCharactersFromSet:intoString:", +[PDAnimateMotionBehavior bezierPathFromNSString:]::commandCharacterSet, &v31);
    v8 = v31;
    v9 = v8;
    if ((v7 & 1) == 0)
    {

      goto LABEL_57;
    }
    v10 = objc_msgSend(v8, "length");
    if (!v10)
      goto LABEL_52;
    v11 = 0;
    while (1)
    {
      v12 = objc_msgSend(v9, "characterAtIndex:", v11);
      v13 = objc_msgSend(v5, "scanLocation");
      if ((v12 & 0xFFFFFFDF) == 0x45)
        break;
      v14 = 0;
      v15 = v12 - 67;
      if ((v12 - 67) > 0x2A)
        goto LABEL_14;
      if (((1 << v15) & 0x60000000600) != 0)
      {
        v14 = 1;
      }
      else
      {
        if (((1 << v15) & 0x100000001) == 0)
          goto LABEL_14;
        v14 = 3;
      }
      if (v11 + 1 < v10)
        goto LABEL_42;
LABEL_14:
      v33 = *MEMORY[0x24BDBEFB0];
      v34 = v33;
      v35 = v33;
      if (v14)
      {
        v16 = (_QWORD *)&v33 + 1;
        while (1)
        {
          v17 = v5;
          v32 = 0;
          if ((objc_msgSend(v17, "scanDouble:", &v32) & 1) == 0)
            break;
          *(v16 - 1) = v32;
          v32 = 0;
          if ((objc_msgSend(v17, "scanDouble:", &v32) & 1) == 0)
            break;
          *v16 = v32;

          v16 += 2;
          if (!--v14)
            goto LABEL_19;
        }

        goto LABEL_42;
      }
LABEL_19:
      if ((v6 & 1) != 0)
        goto LABEL_42;
      if (v12 <= 98)
      {
        if (v12 <= 76)
        {
          if (v12 == 67)
          {
            objc_msgSend(v30, "curveToPoint:controlPoint1:controlPoint2:", v35, v33, v34);
          }
          else if (v12 == 76)
          {
            objc_msgSend(v30, "lineToPoint:", v33);
          }
          goto LABEL_39;
        }
        if (v12 == 77)
        {
          objc_msgSend(v30, "moveToPoint:", v33);
          goto LABEL_39;
        }
        if (v12 != 90)
          goto LABEL_39;
LABEL_34:
        objc_msgSend(v30, "closePath");
        goto LABEL_39;
      }
      if (v12 <= 108)
      {
        if (v12 == 99)
        {
          objc_msgSend(v30, "relativeCurveToPoint:controlPoint1:controlPoint2:", v35, v33, v34);
        }
        else if (v12 == 108)
        {
          objc_msgSend(v30, "relativeLineToPoint:", v33);
        }
        goto LABEL_39;
      }
      if (v12 == 109)
      {
        objc_msgSend(v30, "relativeMoveToPoint:", v33);
        goto LABEL_39;
      }
      if (v12 == 122)
        goto LABEL_34;
LABEL_39:
      v6 = 0;
      v18 = 0;
      if (++v11 == v10)
        goto LABEL_53;
    }
    v19 = v13 + 1;
    if (v13 + 1 < v10)
    {
LABEL_42:
      v18 = 1;
      goto LABEL_53;
    }
    v20 = v29 - v19;
    if (v29 <= v19)
    {
LABEL_52:
      v18 = v6;
      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v21, 0, v19, v20);
    v24 = v23;

    v26 = v22 != v19 || v24 != v20;
    v18 = v26 | v6;
LABEL_53:

    v6 = v18;
  }
  if ((v6 & 1) == 0)
  {
    v27 = v30;
    goto LABEL_58;
  }
LABEL_57:
  v27 = 0;
LABEL_58:

  return v27;
}

+ (id)NSStringForBezierPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", objc_msgSend(v3, "cString"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "elementCount");
    v7 = v6;
    if (v6 >= 3 && !objc_msgSend(v4, "elementAtIndex:", v6 - 1) && objc_msgSend(v4, "elementAtIndex:", v7 - 2) == 3)
    {
      v8 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("Z"), 4);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "substringToIndex:", v8 + 1);
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasPath
{
  return self->mPath != 0;
}

- (id)path
{
  return self->mPath;
}

- (BOOL)hasAngle
{
  return self->mHasAngle;
}

- (double)angle
{
  return self->mAngle;
}

- (void)setAngle:(double)a3
{
  self->mAngle = a3;
  self->mHasAngle = 1;
}

- (id)pointsTypes
{
  return self->mPointsTypes;
}

- (void)setPointsTypes:(id)a3
{
  objc_storeStrong((id *)&self->mPointsTypes, a3);
}

- (BOOL)hasOriginType
{
  return self->mHasOriginType;
}

- (int)originType
{
  return self->mOriginType;
}

- (void)setOriginType:(int)a3
{
  self->mOriginType = a3;
  self->mHasOriginType = 1;
}

- (BOOL)hasRotationCenter
{
  return self->mHasRotationCenter;
}

- (CGPoint)rotationCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->mRotationCenter.x;
  y = self->mRotationCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)hasPathEditMode
{
  return self->mHasPathEditMode;
}

- (int)pathEditMode
{
  return self->mPathEditMode;
}

- (void)setPathEditMode:(int)a3
{
  self->mHasPathEditMode = 1;
  self->mPathEditMode = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  double mAngle;
  double v14;
  void *v15;
  NSString *mPointsTypes;
  void *v17;
  int v18;
  int mOriginType;
  int v20;
  double y;
  double x;
  double v23;
  double v24;
  int v25;
  BOOL v26;
  int mPathEditMode;
  objc_super v29;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_18;
  v7 = -[PDAnimateMotionBehavior hasPath](self, "hasPath");
  if (v7 != objc_msgSend(v6, "hasPath"))
    goto LABEL_18;
  if (-[PDAnimateMotionBehavior hasPath](self, "hasPath"))
  {
    +[PDAnimateMotionBehavior NSStringForBezierPath:](PDAnimateMotionBehavior, "NSStringForBezierPath:", self->mPath);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDAnimateMotionBehavior NSStringForBezierPath:](PDAnimateMotionBehavior, "NSStringForBezierPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
      goto LABEL_18;
  }
  v12 = -[PDAnimateMotionBehavior hasAngle](self, "hasAngle");
  if (v12 != objc_msgSend(v6, "hasAngle"))
    goto LABEL_18;
  if (-[PDAnimateMotionBehavior hasAngle](self, "hasAngle"))
  {
    mAngle = self->mAngle;
    objc_msgSend(v6, "angle");
    if (mAngle != v14)
      goto LABEL_18;
  }
  -[PDAnimateMotionBehavior pointsTypes](self, "pointsTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    mPointsTypes = self->mPointsTypes;
    objc_msgSend(v6, "pointsTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(mPointsTypes) = -[NSString isEqualToString:](mPointsTypes, "isEqualToString:", v17);

    if ((mPointsTypes & 1) == 0)
      goto LABEL_18;
  }
  v18 = -[PDAnimateMotionBehavior hasOriginType](self, "hasOriginType");
  if (v18 != objc_msgSend(v6, "hasOriginType"))
    goto LABEL_18;
  if (-[PDAnimateMotionBehavior hasOriginType](self, "hasOriginType"))
  {
    mOriginType = self->mOriginType;
    if (mOriginType != objc_msgSend(v6, "originType"))
      goto LABEL_18;
  }
  if ((v20 = -[PDAnimateMotionBehavior hasRotationCenter](self, "hasRotationCenter"),
        v20 == objc_msgSend(v6, "hasRotationCenter"))
    && (!-[PDAnimateMotionBehavior hasRotationCenter](self, "hasRotationCenter")
     || (x = self->mRotationCenter.x, y = self->mRotationCenter.y, objc_msgSend(v6, "rotationCenter"), x == v24)
     && y == v23)
    && (v25 = -[PDAnimateMotionBehavior hasPathEditMode](self, "hasPathEditMode"),
        v25 == objc_msgSend(v6, "hasPathEditMode"))
    && (!-[PDAnimateMotionBehavior hasPathEditMode](self, "hasPathEditMode")
     || (mPathEditMode = self->mPathEditMode, mPathEditMode == objc_msgSend(v6, "pathEditMode"))))
  {

    v29.receiver = self;
    v29.super_class = (Class)PDAnimateMotionBehavior;
    v26 = -[PDAnimateScaleBehavior isEqual:](&v29, sel_isEqual_, v4);
  }
  else
  {
LABEL_18:

    v26 = 0;
  }

  return v26;
}

- (unint64_t)hash
{
  unint64_t mAngle;
  unint64_t v4;

  if (self->mHasAngle)
    mAngle = (unint64_t)self->mAngle;
  else
    mAngle = 0;
  if (self->mHasOriginType)
    mAngle ^= self->mOriginType;
  if (self->mHasRotationCenter)
    mAngle ^= (unint64_t)self->mRotationCenter.x ^ (unint64_t)self->mRotationCenter.y;
  if (self->mHasPathEditMode)
    mAngle ^= self->mPathEditMode;
  v4 = -[OITSUBezierPath hash](self->mPath, "hash");
  return mAngle + (v4 << 16) + (-[NSString hash](self->mPointsTypes, "hash") << 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPointsTypes, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end
