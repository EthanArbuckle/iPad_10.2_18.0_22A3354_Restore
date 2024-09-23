@implementation KNBuildDiffuse

+ (id)animationName
{
  return CFSTR("com.apple.iWork.Keynote.KLNDiffuse");
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_469838;
}

+ (id)defaultAttributes
{
  return +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 2.0), CFSTR("KNBuildAttributesDuration"));
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return CFSTR("kn-mac-anim-icons-builds-diffuse");
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNBuildDiffuse;
  -[KNBuildDiffuse dealloc](&v3, "dealloc");
}

- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_mDrawableFrame;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect *p_mFrameRect;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_mDrawableFrame = &self->mDrawableFrame;
  self->mDrawableFrame = a3;
  MinX = CGRectGetMinX(a3);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v14 = p_mDrawableFrame->size.width;
  if (v14 < p_mDrawableFrame->size.height)
    v14 = p_mDrawableFrame->size.height;
  v15 = v14 + v14;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v16 = CGRectGetMinY(v28);
  if (v16 >= MinY - v15)
    v17 = v16;
  else
    v17 = MinY - v15;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v18 = CGRectGetMaxY(v29);
  if (v18 >= MaxY + v15)
    v19 = MaxY + v15;
  else
    v19 = v18;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v20 = CGRectGetMinX(v30);
  if (v20 >= MinX - v15)
    v21 = v20;
  else
    v21 = MinX - v15;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v22 = CGRectGetMaxX(v31);
  if (v22 >= MaxX + v15)
    v23 = MaxX + v15;
  else
    v23 = v22;
  p_mFrameRect = &self->mFrameRect;
  v32.origin.x = TSDRectWithPoints(v21, v17, v23, v19);
  *p_mFrameRect = v32;
  result = CGRectIntegral(v32);
  *p_mFrameRect = result;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
  -[KNBuildDiffuse metalRenderFrameWithContext:](self, "metalRenderFrameWithContext:", a3);
}

- (void)p_setupParticleSystemWithImage:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  KNBuildDiffuseSystem *v20;

  if (!a5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildDiffuse p_setupParticleSystemWithImage:build:randomGenerator:metalContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildDiffuse.m"), 160, CFSTR("invalid nil value for '%s'"), "randGen");
  objc_msgSend(a3, "frame");
  v12 = v11;
  v14 = v13;
  -[KNAnimationContext slideRect](self->super.mAnimationContext, "slideRect");
  v16 = v15;
  v18 = v17;
  objc_msgSend(a4, "duration");
  v19 = objc_msgSend(a4, "direction");
  if ((objc_msgSend(a4, "isBuildIn") & 1) == 0)
  {
    switch((unint64_t)v19)
    {
      case 0xBuLL:
        v19 = &dword_C;
        break;
      case 0xCuLL:
        v19 = &dword_8 + 3;
        break;
      case 0xDuLL:
        v19 = &dword_C + 2;
        break;
      case 0xEuLL:
        v19 = &dword_C + 1;
        break;
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1CuLL:
      case 0x1DuLL:
      case 0x1EuLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x23uLL:
      case 0x24uLL:
      case 0x25uLL:
      case 0x26uLL:
      case 0x27uLL:
      case 0x28uLL:
        break;
      case 0x15uLL:
        v19 = &dword_18;
        break;
      case 0x16uLL:
        v19 = &dword_14 + 3;
        break;
      case 0x17uLL:
        v19 = &dword_14 + 2;
        break;
      case 0x18uLL:
        v19 = &dword_14 + 1;
        break;
      case 0x1FuLL:
        v19 = &stru_20;
        break;
      case 0x20uLL:
        v19 = &dword_1C + 3;
        break;
      case 0x29uLL:
        v19 = &stru_20 + 10;
        break;
      case 0x2AuLL:
        v19 = &stru_20 + 9;
        break;
      case 0x2BuLL:
        v19 = &stru_20 + 12;
        break;
      case 0x2CuLL:
        v19 = &stru_20 + 11;
        break;
      default:
        switch((unint64_t)v19)
        {
          case 'o':
            v19 = &stru_68 + 8;
            break;
          case 'p':
            v19 = &stru_68 + 7;
            break;
          case 'r':
            v19 = &stru_68 + 11;
            break;
          case 's':
            v19 = &stru_68 + 10;
            break;
          case 'y':
            v19 = &stru_68 + 18;
            break;
          case 'z':
            v19 = &stru_68 + 17;
            break;
          default:
            goto LABEL_4;
        }
        break;
    }
  }
LABEL_4:
  objc_msgSend(a3, "size");
  v20 = (KNBuildDiffuseSystem *)+[KNBuildDiffuseSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildDiffuseSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", (unint64_t)(sqrt(sqrt(v12 * (v14 / v18) / v16)) * 4000.0), v19, a5, self->mDiffuseMetalShader, a6);
  self->mDiffuseSystem = v20;
  -[KNBuildDiffuseSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](v20, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, CGSizeZero.height);
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  double v14;
  double v15;
  double v16;
  CATransform3D v17;

  v5 = objc_msgSend(a3, "metalContext");
  v6 = objc_msgSend(v5, "device");
  v7 = objc_msgSend(a3, "textures");
  v8 = objc_msgSend(a3, "animatedBuild");
  v9 = objc_msgSend(v7, "lastObject");
  v10 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v10, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
  objc_msgSend(v10, "setBlendingEnabled:", 1);
  objc_msgSend(v10, "setDestinationAlphaBlendFactor:", 5);
  objc_msgSend(v10, "setDestinationRGBBlendFactor:", 5);
  self->mDiffuseMetalShader = (TSDMetalShader *)objc_msgSend(objc_alloc((Class)TSDMetalShader), "initCustomShaderWithVertexShader:fragmentShader:device:library:colorAttachment:", CFSTR("buildDiffuseVertexShader"), CFSTR("buildDiffuseFragmentShader"), v6, CFSTR("KeynoteMetalLibrary"), v10);
  -[KNAnimationEffect perspectiveMVPMatrixWithContext:](self, "perspectiveMVPMatrixWithContext:", a3);
  self->mBaseTransform = v17;
  -[KNBuildDiffuse p_setupParticleSystemWithImage:build:randomGenerator:metalContext:](self, "p_setupParticleSystemWithImage:build:randomGenerator:metalContext:", v9, v8, objc_msgSend(a3, "randomGenerator"), v5);
  v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m21), *(float64x2_t *)&self->mBaseTransform.m23);
  v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m31), *(float64x2_t *)&self->mBaseTransform.m33);
  v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m41), *(float64x2_t *)&self->mBaseTransform.m43);
  self->mDiffuseShaderUniforms = ($045A307E38343445EB0ECC42A557D6CA)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m11), *(float64x2_t *)&self->mBaseTransform.m13);
  *(float32x4_t *)self->_anon_30 = v11;
  *(float32x4_t *)&self->_anon_30[16] = v12;
  *(float32x4_t *)&self->_anon_30[32] = v13;
  objc_msgSend(v9, "singleTextureOpacity");
  *(float *)&v14 = v14;
  *(_DWORD *)&self->_anon_30[52] = LODWORD(v14);
  -[KNBuildDiffuseSystem rotationMax](self->mDiffuseSystem, "rotationMax");
  *(float *)&v15 = v15;
  *(_DWORD *)&self->_anon_30[56] = LODWORD(v15);
  -[KNBuildDiffuseSystem speedMax](self->mDiffuseSystem, "speedMax");
  *(float *)&v16 = v16;
  *(_DWORD *)&self->_anon_30[60] = LODWORD(v16);
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v5;
  id v6;
  double v7;
  id v8;
  id v9;

  v5 = objc_msgSend(objc_msgSend(a3, "metalContext"), "renderEncoder");
  if (!v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildDiffuse metalRenderFrameWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildDiffuse.m"), 230, CFSTR("invalid nil value for '%s'"), "renderEncoder");
  v6 = objc_msgSend(objc_msgSend(a3, "textures"), "lastObject");
  objc_msgSend(a3, "percent");
  *(float *)&v7 = v7;
  *(_DWORD *)&self->_anon_30[48] = LODWORD(v7);
  v8 = objc_msgSend(v6, "metalTextureWithContext:", objc_msgSend(a3, "metalContext"));
  if (v8)
  {
    v9 = v8;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->mDiffuseMetalShader, "setPipelineStateWithEncoder:vertexBytes:", v5, &self->mDiffuseShaderUniforms);
    objc_msgSend(v5, "setFragmentTexture:atIndex:", v9, 0);
    -[KNBuildDiffuseSystem drawMetalWithEncoder:](self->mDiffuseSystem, "drawMetalWithEncoder:", v5);
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  self->mDiffuseMetalShader = 0;
  self->mDiffuseSystem = 0;
}

@end
