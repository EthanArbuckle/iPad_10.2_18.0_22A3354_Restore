@implementation KNWipeEffect

- (KNWipeEffect)initWithContext:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KNWipeEffect;
  v5 = -[KNWipeEffect init](&v17, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metalContext"));
    v7 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v6;

    *((_QWORD *)v5 + 4) = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
    v5[8] = objc_msgSend(v8, "isBuildIn");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
    *((_QWORD *)v5 + 9) = objc_msgSend(v9, "direction");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animatedBuild"));
    objc_msgSend(v10, "duration");
    *((_QWORD *)v5 + 10) = v11;

    v12 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)(v5 + 152) = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)(v5 + 168) = v12;
    v13 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)(v5 + 184) = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)(v5 + 200) = v13;
    v14 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)(v5 + 88) = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)(v5 + 104) = v14;
    v15 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)(v5 + 120) = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)(v5 + 136) = v15;
    *((_QWORD *)v5 + 3) = 0x3FF0000000000000;
  }

  return (KNWipeEffect *)v5;
}

- (void)setTexture:(id)a3
{
  double v4;

  self->_texture = (TSDTexturedRectangle *)a3;
  objc_msgSend(a3, "singleTextureOpacity");
  self->_opacity = v4;
}

- (void)setMVPMatrix:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  KNWipeDataBuffer *wipeDataBuffer;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_MVPMatrix.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_MVPMatrix.m21 = v5;
  *(_OWORD *)&self->_MVPMatrix.m13 = v4;
  *(_OWORD *)&self->_MVPMatrix.m11 = v3;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_MVPMatrix.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_MVPMatrix.m41 = v8;
  *(_OWORD *)&self->_MVPMatrix.m33 = v7;
  *(_OWORD *)&self->_MVPMatrix.m31 = v6;
  wipeDataBuffer = self->_wipeDataBuffer;
  if (wipeDataBuffer)
  {
    v10 = *(_OWORD *)&a3->m33;
    v14[4] = *(_OWORD *)&a3->m31;
    v14[5] = v10;
    v11 = *(_OWORD *)&a3->m43;
    v14[6] = *(_OWORD *)&a3->m41;
    v14[7] = v11;
    v12 = *(_OWORD *)&a3->m13;
    v14[0] = *(_OWORD *)&a3->m11;
    v14[1] = v12;
    v13 = *(_OWORD *)&a3->m23;
    v14[2] = *(_OWORD *)&a3->m21;
    v14[3] = v13;
    -[KNWipeDataBuffer setMVPMatrix:](wipeDataBuffer, "setMVPMatrix:", v14);
  }
}

- (double)p_animationPercentWithPercent:(double)a3
{
  double v4;
  double result;

  v4 = fmin(fmax((TSUClamp(a3, 0.0, 1.0) - self->_startWipeAtPercent) / (self->_stopWipeAtPercent - self->_startWipeAtPercent), 0.0), 1.0);
  if (!self->_isBuildIn)
    v4 = 1.0 - v4;
  -[CAMediaTimingFunction TSD_valueAtPercent:](self->_timingFunction, "TSD_valueAtPercent:", v4);
  return result;
}

- (void)setupEffectIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  KNWipeDataBuffer *v7;
  KNWipeDataBuffer *wipeDataBuffer;
  uint64_t v9;
  unint64_t direction;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[8];

  if (!self->_texture)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeEffect setupEffectIfNecessary]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 509, CFSTR("invalid nil value for '%s'"), "_texture");

  }
  if (self->_metalContext)
  {
    v6 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v6, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    objc_msgSend(v6, "setBlendingEnabled:", 1);
    objc_msgSend(v6, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v6, "setDestinationAlphaBlendFactor:", 5);
    v7 = +[KNWipeDataBuffer newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:](KNWipeDataBuffer, "newWipeDataBufferWithVertexRect:textureRect:metalContext:colorAttachment:", self->_metalContext, v6, TSDRectWithSize(-[TSDTexturedRectangle frame](self->_texture, "frame")));
    wipeDataBuffer = self->_wipeDataBuffer;
    self->_wipeDataBuffer = v7;

  }
  v9 = 11;
  if (self->_direction == 11)
    v9 = 12;
  if (self->_isBuildIn)
    direction = self->_direction;
  else
    direction = v9;
  -[KNWipeDataBuffer setDirection:](self->_wipeDataBuffer, "setDirection:", direction);
  -[KNWipeDataBuffer setBlurFraction:](self->_wipeDataBuffer, "setBlurFraction:", *(double *)&kKNWipeDataBufferBlurFractionTransitionDefault);
  v11 = *(_OWORD *)&self->_MVPMatrix.m33;
  v15[4] = *(_OWORD *)&self->_MVPMatrix.m31;
  v15[5] = v11;
  v12 = *(_OWORD *)&self->_MVPMatrix.m43;
  v15[6] = *(_OWORD *)&self->_MVPMatrix.m41;
  v15[7] = v12;
  v13 = *(_OWORD *)&self->_MVPMatrix.m13;
  v15[0] = *(_OWORD *)&self->_MVPMatrix.m11;
  v15[1] = v13;
  v14 = *(_OWORD *)&self->_MVPMatrix.m23;
  v15[2] = *(_OWORD *)&self->_MVPMatrix.m21;
  v15[3] = v14;
  -[KNWipeDataBuffer setMVPMatrix:](self->_wipeDataBuffer, "setMVPMatrix:", v15);
}

- (void)teardown
{
  KNWipeDataBuffer *wipeDataBuffer;

  wipeDataBuffer = self->_wipeDataBuffer;
  self->_wipeDataBuffer = 0;

}

- (void)renderEffectAtPercent:(double)a3 atBufferIndex:(unint64_t)a4 withEncoder:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  TSDTexturedRectangle *texture;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  KNWipeDataBuffer *wipeDataBuffer;
  id v16;

  v16 = a5;
  if (!self->_metalContext)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeEffect renderEffectAtPercent:atBufferIndex:withEncoder:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 537, CFSTR("invalid nil value for '%s'"), "_metalContext");

  }
  texture = self->_texture;
  if (!texture)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNWipeEffect renderEffectAtPercent:atBufferIndex:withEncoder:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNWipeDataBuffer.m"));
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 538, CFSTR("invalid nil value for '%s'"), "_texture");

    texture = self->_texture;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSDTexturedRectangle metalTexture](texture, "metalTexture"));
  objc_msgSend(v16, "setFragmentTexture:atIndex:", v14, 0);

  wipeDataBuffer = self->_wipeDataBuffer;
  -[KNWipeEffect p_animationPercentWithPercent:](self, "p_animationPercentWithPercent:", a3);
  -[KNWipeDataBuffer drawWipeWithPercent:opacity:renderEncoder:](wipeDataBuffer, "drawWipeWithPercent:opacity:renderEncoder:", v16);

}

- (TSDTexturedRectangle)texture
{
  return self->_texture;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CATransform3D)MVPMatrix
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].m22;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m14;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m32;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m24;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[1].m12;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  self->_timingFunction = (CAMediaTimingFunction *)a3;
}

- (double)startWipeAtPercent
{
  return self->_startWipeAtPercent;
}

- (void)setStartWipeAtPercent:(double)a3
{
  self->_startWipeAtPercent = a3;
}

- (double)stopWipeAtPercent
{
  return self->_stopWipeAtPercent;
}

- (void)setStopWipeAtPercent:(double)a3
{
  self->_stopWipeAtPercent = a3;
}

- (KNWipeDataBuffer)wipeDataBuffer
{
  return self->_wipeDataBuffer;
}

- (void)setWipeDataBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_wipeDataBuffer, a3);
}

- (TSDMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
  objc_storeStrong((id *)&self->_metalContext, a3);
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isBuildIn
{
  return self->_isBuildIn;
}

- (void)setIsBuildIn:(BOOL)a3
{
  self->_isBuildIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_wipeDataBuffer, 0);
}

@end
