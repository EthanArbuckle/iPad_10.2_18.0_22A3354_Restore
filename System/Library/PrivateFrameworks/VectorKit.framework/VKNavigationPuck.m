@implementation VKNavigationPuck

- (void)puck
{
  return self->_navigationPuck;
}

- (VKNavigationPuck)initWithAnimationRunner:(AnimationRunner *)a3
{
  VKNavigationPuck *v4;
  VKNavigationPuck *v5;
  uint64_t v6;
  VKNavigationPuck *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKNavigationPuck;
  v4 = -[VKNavigationPuck init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_animationRunner = a3;
    v4->_stale = 1;
    v6 = operator new();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v6 + 24) = 0;
    *(_DWORD *)(v6 + 40) = 1065353216;
    *(_WORD *)(v6 + 48) = 0;
    *(_BYTE *)(v6 + 50) = 0;
    v5->_navigationPuck = (void *)v6;
    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *navigationPuck;
  objc_super v4;

  navigationPuck = self->_navigationPuck;
  if (navigationPuck)
    MEMORY[0x1A1AF4E00](navigationPuck, 0x1020C40E65606A5);
  v4.receiver = self;
  v4.super_class = (Class)VKNavigationPuck;
  -[VKNavigationPuck dealloc](&v4, sel_dealloc);
}

- (VKEdgeInsets)annotationTrackingEdgeInsets
{
  float v2;
  float v3;
  float v4;
  float v5;
  VKEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)destroyAnimationRunner
{
  self->_animationRunner = 0;
}

- (void)runAnimation:(id)a3
{
  md::MapEngine **animationRunner;
  VKAnimation *v5;

  v5 = (VKAnimation *)a3;
  animationRunner = (md::MapEngine **)self->_animationRunner;
  if (animationRunner)
    md::AnimationRunner::runAnimation(animationRunner, v5);

}

- (double)minimumAccuracy
{
  return 0.0;
}

- (void)setMode:(int)a3
{
  *((_DWORD *)self->_navigationPuck + 11) = a3 != 0;
}

- (int)mode
{
  return *((_DWORD *)self->_navigationPuck + 11) != 0;
}

- (double)presentationCourse
{
  return *((double *)self->_navigationPuck + 4) * 57.2957795;
}

- (void)setPresentationCourse:(double)a3
{
  *((double *)self->_navigationPuck + 4) = a3 * 0.0174532925;
}

- (BOOL)showCourse
{
  return *((_BYTE *)self->_navigationPuck + 49);
}

- (void)setShowCourse:(BOOL)a3
{
  *((_BYTE *)self->_navigationPuck + 49) = a3;
}

- (void)setStale:(BOOL)a3
{
  uint64_t v5;

  if (self->_stale != a3)
  {
    if (a3)
      v5 = 4004;
    else
      v5 = 4005;
    objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", v5, 505, 0);
    self->_stale = a3;
  }
}

- (void)setScale:(float)a3
{
  *((float *)self->_navigationPuck + 10) = a3;
}

- (float)scale
{
  return *((float *)self->_navigationPuck + 10);
}

- (void)setAnnotation:(id)a3
{
  VKAnnotation *v5;
  double *navigationPuck;
  double v7;
  double v8;
  double v9;
  VKAnnotation *v10;

  v5 = (VKAnnotation *)a3;
  if (self->_annotation != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_annotation, a3);
    navigationPuck = (double *)self->_navigationPuck;
    -[VKAnnotation coordinate](self->_annotation, "coordinate");
    v8 = v7;
    -[VKAnnotation coordinate](self->_annotation, "coordinate");
    navigationPuck[1] = v8 * 0.0174532925;
    navigationPuck[2] = v9 * 0.0174532925;
    navigationPuck[3] = 0.0;
    v5 = v10;
  }

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate
{
  double *navigationPuck;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (self->_tracking || self->_animatingToCoordinate)
  {
    navigationPuck = (double *)self->_navigationPuck;
    v3 = navigationPuck[1] * 57.2957795;
    v4 = navigationPuck[2] * 57.2957795;
  }
  else
  {
    -[VKAnnotation coordinate](self->_annotation, "coordinate");
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)setPresentationCoordinate:(id)a3
{
  double *navigationPuck;

  navigationPuck = (double *)self->_navigationPuck;
  navigationPuck[1] = a3.var0 * 0.0174532925;
  navigationPuck[2] = a3.var1 * 0.0174532925;
  navigationPuck[3] = 0.0;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double *navigationPuck;

  if (self->_tracking != a3)
  {
    v3 = a3;
    -[VKNavigationPuck presentationCoordinate](self, "presentationCoordinate");
    self->_tracking = v3;
    if (v3)
    {
      navigationPuck = (double *)self->_navigationPuck;
      navigationPuck[1] = v5 * 0.0174532925;
      navigationPuck[2] = v6 * 0.0174532925;
      navigationPuck[3] = 0.0;
    }
  }
}

- (void)setAnimatingToCoordinate:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double *navigationPuck;

  if (self->_animatingToCoordinate != a3)
  {
    v3 = a3;
    -[VKNavigationPuck presentationCoordinate](self, "presentationCoordinate");
    self->_animatingToCoordinate = v3;
    if (v3)
    {
      navigationPuck = (double *)self->_navigationPuck;
      navigationPuck[1] = v5 * 0.0174532925;
      navigationPuck[2] = v6 * 0.0174532925;
      navigationPuck[3] = 0.0;
    }
  }
}

- (BOOL)enabled
{
  return *((_BYTE *)self->_navigationPuck + 48);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BYTE *navigationPuck;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  navigationPuck = self->_navigationPuck;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "NavigationPuck set enabled: %s", (uint8_t *)&v7, 0xCu);
  }

  navigationPuck[48] = v3;
}

- (VKAnnotation)annotation
{
  return self->_annotation;
}

- (BOOL)stale
{
  return self->_stale;
}

- (BOOL)animatingToCoordinate
{
  return self->_animatingToCoordinate;
}

- (BOOL)isAnimatingAccuracy
{
  return self->_animatingAccuracy;
}

- (void)setAnimatingAccuracy:(BOOL)a3
{
  self->_animatingAccuracy = a3;
}

- (double)presentationAccuracy
{
  return self->_presentationAccuracy;
}

- (void)setPresentationAccuracy:(double)a3
{
  self->_presentationAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
