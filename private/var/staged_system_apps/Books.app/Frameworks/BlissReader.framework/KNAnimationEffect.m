@implementation KNAnimationEffect

- (KNAnimationEffect)initWithAnimationContext:(id)a3
{
  KNAnimationEffect *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KNAnimationEffect;
  result = -[KNAnimationEffect init](&v5, "init");
  if (result)
    result->mAnimationContext = (KNAnimationContext *)a3;
  return result;
}

+ (id)animationName
{
  return 0;
}

+ (int)animationCategory
{
  return 205;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return 0;
}

+ (id)localizedMenuString:(int)a3
{
  return 0;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNBuildAttributesDuration");
  v4 = &off_469C10;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return 0;
}

+ (id)updateDirectionAttributeValue:(int64_t)a3 andCustomTextDirectionValue:(unint64_t)a4 turnOffBounce:(BOOL)a5 forAttributes:(id)a6
{
  _BOOL4 v7;
  id v10;

  v7 = a5;
  v10 = objc_msgSend(a6, "mutableCopy");
  objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), CFSTR("KNBuildAttributesDirection"));
  if (!objc_msgSend(a6, "objectForKey:", CFSTR("KNBuildCustomAttributesTextDelivery")))
    objc_msgSend(v10, "setObject:forKey:", &off_469320, CFSTR("KNBuildCustomAttributesTextDelivery"));
  objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4), CFSTR("KNBuildCustomAttributesDeliveryOption"));
  if (v7)
    objc_msgSend(v10, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("KNBuildCustomAttributesBounce"));
  return v10;
}

- (CATransform3D)mvpMatrixWithContext:(SEL)a3
{
  CATransform3D *result;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  if (!objc_msgSend(a4, "isTransition"))
  {
    v8 = objc_msgSend(objc_msgSend(a4, "textures"), "firstObject");
    if (objc_msgSend(a4, "isMetalRenderer"))
    {
      -[KNAnimationContext slideRect](self->mAnimationContext, "slideRect");
    }
    else
    {
      result = (CATransform3D *)objc_msgSend(a4, "drawableFrame");
      if (!self)
        goto LABEL_8;
    }
    result = -[KNAnimationEffect mvpMatrixWithTexture:andFrame:](self, "mvpMatrixWithTexture:andFrame:", v8);
    goto LABEL_9;
  }
  result = (CATransform3D *)self->mAnimationContext;
  if (!result)
  {
LABEL_8:
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    goto LABEL_9;
  }
  result = (CATransform3D *)-[CATransform3D slideProjectionMatrix](result, "slideProjectionMatrix");
LABEL_9:
  *(_OWORD *)&retstr->m31 = v13;
  *(_OWORD *)&retstr->m33 = v14;
  *(_OWORD *)&retstr->m41 = v15;
  *(_OWORD *)&retstr->m43 = v16;
  *(_OWORD *)&retstr->m11 = v9;
  *(_OWORD *)&retstr->m13 = v10;
  *(_OWORD *)&retstr->m21 = v11;
  *(_OWORD *)&retstr->m23 = v12;
  return result;
}

- (CATransform3D)mvpMatrixWithFrame:(SEL)a3 size:(CGPoint)a4
{
  double y;
  CGFloat x;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CATransform3D *result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CATransform3D v17;
  CATransform3D v18;

  y = a4.y;
  x = a4.x;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  TSDTransform3DMakeOrtho(0.0, a5.width, 0.0, a5.height, -1.0, 1.0);
  v8 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v17.m33 = v8;
  v9 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v17.m43 = v9;
  v10 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v17.m13 = v10;
  v11 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v17.m23 = v11;
  result = CATransform3DTranslate(&v18, &v17, x, -y, 0.0);
  v13 = *(_OWORD *)&v18.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v18.m31;
  *(_OWORD *)&retstr->m33 = v13;
  v14 = *(_OWORD *)&v18.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v18.m41;
  *(_OWORD *)&retstr->m43 = v14;
  v15 = *(_OWORD *)&v18.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v18.m11;
  *(_OWORD *)&retstr->m13 = v15;
  v16 = *(_OWORD *)&v18.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v18.m21;
  *(_OWORD *)&retstr->m23 = v16;
  return result;
}

- (CATransform3D)mvpMatrixWithTexture:(SEL)a3 andFrame:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat MaxY;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CATransform3D *result;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CATransform3D v26;
  CATransform3D v27;
  CGRect v28;
  CGRect v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  objc_msgSend(a4, "frameOnCanvas", TSDTransform3DMakeOrtho(0.0, a5.size.width, 0.0, a5.size.height, -1.0, 1.0).n128_f64[0]);
  v12 = v11;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v13 = v12 - CGRectGetMinX(v28);
  objc_msgSend(a4, "frameOnCanvas");
  v15 = v14;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MaxY = CGRectGetMaxY(v29);
  v17 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v26.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v26.m33 = v17;
  v18 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v26.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v26.m43 = v18;
  v19 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v26.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v26.m13 = v19;
  v20 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v26.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v26.m23 = v20;
  result = CATransform3DTranslate(&v27, &v26, v13, -(v15 - MaxY), 0.0);
  v22 = *(_OWORD *)&v27.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v27.m31;
  *(_OWORD *)&retstr->m33 = v22;
  v23 = *(_OWORD *)&v27.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v27.m41;
  *(_OWORD *)&retstr->m43 = v23;
  v24 = *(_OWORD *)&v27.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v27.m11;
  *(_OWORD *)&retstr->m13 = v24;
  v25 = *(_OWORD *)&v27.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v27.m21;
  *(_OWORD *)&retstr->m23 = v25;
  return result;
}

- (CATransform3D)perspectiveMVPMatrixWithContext:(SEL)a3
{
  CATransform3D *result;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  if (!objc_msgSend(a4, "isTransition"))
  {
    v8 = objc_msgSend(objc_msgSend(a4, "textures"), "firstObject");
    if (objc_msgSend(a4, "isMetalRenderer"))
    {
      -[KNAnimationContext slideRect](self->mAnimationContext, "slideRect");
    }
    else
    {
      result = (CATransform3D *)objc_msgSend(a4, "drawableFrame");
      if (!self)
        goto LABEL_8;
    }
    result = -[KNAnimationEffect perspectiveMVPMatrixWithTexture:andFrame:](self, "perspectiveMVPMatrixWithTexture:andFrame:", v8);
    goto LABEL_9;
  }
  result = (CATransform3D *)self->mAnimationContext;
  if (!result)
  {
LABEL_8:
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    goto LABEL_9;
  }
  result = (CATransform3D *)-[CATransform3D slideProjectionMatrix](result, "slideProjectionMatrix");
LABEL_9:
  *(_OWORD *)&retstr->m31 = v13;
  *(_OWORD *)&retstr->m33 = v14;
  *(_OWORD *)&retstr->m41 = v15;
  *(_OWORD *)&retstr->m43 = v16;
  *(_OWORD *)&retstr->m11 = v9;
  *(_OWORD *)&retstr->m13 = v10;
  *(_OWORD *)&retstr->m21 = v11;
  *(_OWORD *)&retstr->m23 = v12;
  return result;
}

- (CATransform3D)perspectiveMVPMatrixWithTexture:(SEL)a3 andFrame:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  long double v18;
  long double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CATransform3D *result;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v32;
  CATransform3D v33;
  CGRect v34;
  CGRect v35;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "frameOnCanvas");
  v13 = v12;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v29 = v13 - CGRectGetMinX(v34);
  objc_msgSend(a4, "frameOnCanvas");
  v15 = v14;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v16 = v15 - CGRectGetMaxY(v35);
  -[KNAnimationContext fieldOfViewInRadians](self->mAnimationContext, "fieldOfViewInRadians");
  v18 = tan(v17 * 0.5);
  v19 = height / (v18 + v18);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  TSDTransform3DMakeProjection(retstr, -[KNAnimationContext fieldOfViewInRadians](self->mAnimationContext, "fieldOfViewInRadians"));
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeTranslation(&v33, width * -0.5 - x + x + v29, height * -0.5 - y + y - v16, -v19);
  a = v33;
  v20 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&b.m33 = v20;
  v21 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&b.m43 = v21;
  v22 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&b.m13 = v22;
  v23 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&b.m23 = v23;
  result = CATransform3DConcat(&v32, &a, &b);
  v25 = *(_OWORD *)&v32.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v32.m31;
  *(_OWORD *)&retstr->m33 = v25;
  v26 = *(_OWORD *)&v32.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v32.m41;
  *(_OWORD *)&retstr->m43 = v26;
  v27 = *(_OWORD *)&v32.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v32.m11;
  *(_OWORD *)&retstr->m13 = v27;
  v28 = *(_OWORD *)&v32.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v32.m21;
  *(_OWORD *)&retstr->m23 = v28;
  return result;
}

@end
