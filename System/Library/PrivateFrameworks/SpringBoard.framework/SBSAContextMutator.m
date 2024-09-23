@implementation SBSAContextMutator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (SBSAContextMutator)initWithContext:(id)a3
{
  id v5;
  SBSAContextMutator *v6;
  SBSAContextMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAContextMutator;
  v6 = -[SBSAContextMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)setPreferences:(id)a3
{
  -[SBSAContext _setPreferences:](self->_context, "_setPreferences:", a3);
}

- (void)setSystemContainerBounds:(CGRect)a3
{
  -[SBSAContext _setSystemContainerBounds:](self->_context, "_setSystemContainerBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setRequests:(id)a3
{
  -[SBSAContext _setRequests:](self->_context, "_setRequests:", a3);
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
  -[SBSAContext _setReduceTransparencyEnabled:](self->_context, "_setReduceTransparencyEnabled:", a3);
}

- (void)setPlatformMetrics:(id)a3
{
  -[SBSAContext _setPlatformMetrics:](self->_context, "_setPlatformMetrics:", a3);
}

- (void)setOverrideRenderingStyle:(int64_t)a3
{
  -[SBSAContext _setOverrideRenderingStyle:](self->_context, "_setOverrideRenderingStyle:", a3);
}

- (void)setMinimumNumberOfContainers:(unint64_t)a3
{
  -[SBSAContext _setMinimumNumberOfContainers:](self->_context, "_setMinimumNumberOfContainers:", a3);
}

- (void)setMaximumNumberOfElements:(unint64_t)a3
{
  -[SBSAContext _setMaximumNumberOfElements:](self->_context, "_setMaximumNumberOfElements:", a3);
}

- (void)setLayoutDirection:(int64_t)a3
{
  -[SBSAContext _setLayoutDirection:](self->_context, "_setLayoutDirection:", a3);
}

- (void)setLandscapeScreenEdgeInsets:(UIEdgeInsets)a3
{
  -[SBSAContext _setLandscapeScreenEdgeInsets:](self->_context, "_setLandscapeScreenEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setKeyLineRequiredForTransition:(BOOL)a3
{
  -[SBSAContext _setKeyLineRequiredForTransition:](self->_context, "_setKeyLineRequiredForTransition:", a3);
}

- (void)setInertContainerFrame:(CGRect)a3
{
  -[SBSAContext _setInertContainerFrame:](self->_context, "_setInertContainerFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setIndicatorVisible:(BOOL)a3
{
  -[SBSAContext _setIndicatorVisible:](self->_context, "_setIndicatorVisible:", a3);
}

- (void)setHeavyShadowRequiredForTransition:(BOOL)a3
{
  -[SBSAContext _setHeavyShadowRequiredForTransition:](self->_context, "_setHeavyShadowRequiredForTransition:", a3);
}

- (void)setGestureDescriptions:(id)a3
{
  -[SBSAContext _setGestureDescriptions:](self->_context, "_setGestureDescriptions:", a3);
}

- (void)setElementSnapshotContexts:(id)a3
{
  -[SBSAContext _setElementSnapshotContexts:](self->_context, "_setElementSnapshotContexts:", a3);
}

- (void)setElementInteractionResults:(id)a3
{
  -[SBSAContext _setElementInteractionResults:](self->_context, "_setElementInteractionResults:", a3);
}

- (void)setElementContexts:(id)a3
{
  -[SBSAContext _setElementContexts:](self->_context, "_setElementContexts:", a3);
}

- (void)setElapsedTimerDescriptions:(id)a3
{
  -[SBSAContext _setElapsedTimerDescriptions:](self->_context, "_setElapsedTimerDescriptions:", a3);
}

- (void)setDisplayScale:(double)a3
{
  -[SBSAContext _setDisplayScale:](self->_context, "_setDisplayScale:", a3);
}

- (void)setDefaultsContext:(id)a3
{
  -[SBSAContext _setDefaultsContext:](self->_context, "_setDefaultsContext:", a3);
}

- (void)setContainerViewDescriptions:(id)a3
{
  -[SBSAContext _setContainerViewDescriptions:](self->_context, "_setContainerViewDescriptions:", a3);
}

- (void)setContainerParentViewDescription:(id)a3
{
  -[SBSAContext _setContainerParentViewDescription:](self->_context, "_setContainerParentViewDescription:", a3);
}

- (void)setCloningStyle:(int64_t)a3
{
  -[SBSAContext _setCloningStyle:](self->_context, "_setCloningStyle:", a3);
}

- (void)setAnimatedTransitionResults:(id)a3
{
  -[SBSAContext _setAnimatedTransitionResults:](self->_context, "_setAnimatedTransitionResults:", a3);
}

- (void)setAnimatedTransitionInProgress:(BOOL)a3
{
  -[SBSAContext _setAnimatedTransitionInProgress:](self->_context, "_setAnimatedTransitionInProgress:", a3);
}

- (void)setAccessibilityZoomActiveAndEnabled:(BOOL)a3
{
  -[SBSAContext _setAccessibilityZoomActiveAndEnabled:](self->_context, "_setAccessibilityZoomActiveAndEnabled:", a3);
}

- (double)displayScale
{
  double result;

  -[SBSAContext displayScale](self->_context, "displayScale");
  return result;
}

- (unint64_t)minimumNumberOfContainers
{
  return -[SBSAContext minimumNumberOfContainers](self->_context, "minimumNumberOfContainers");
}

- (unint64_t)maximumNumberOfElements
{
  return -[SBSAContext maximumNumberOfElements](self->_context, "maximumNumberOfElements");
}

- (CGRect)inertContainerFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBSAContext inertContainerFrame](self->_context, "inertContainerFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)systemContainerBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBSAContext systemContainerBounds](self->_context, "systemContainerBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (SBSAPlatformMetricsContext)platformMetrics
{
  return -[SBSAContext platformMetrics](self->_context, "platformMetrics");
}

- (int64_t)layoutDirection
{
  return -[SBSAContext layoutDirection](self->_context, "layoutDirection");
}

- (UIEdgeInsets)landscapeScreenEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SBSAContext landscapeScreenEdgeInsets](self->_context, "landscapeScreenEdgeInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)overrideRenderingStyle
{
  return -[SBSAContext overrideRenderingStyle](self->_context, "overrideRenderingStyle");
}

- (int64_t)cloningStyle
{
  return -[SBSAContext cloningStyle](self->_context, "cloningStyle");
}

- (BOOL)isIndicatorVisible
{
  return -[SBSAContext isIndicatorVisible](self->_context, "isIndicatorVisible");
}

- (unint64_t)activeDisplay
{
  return -[SBSAContext activeDisplay](self->_context, "activeDisplay");
}

- (void)setActiveDisplay:(unint64_t)a3
{
  -[SBSAContext _setActiveDisplay:](self->_context, "_setActiveDisplay:", a3);
}

- (BOOL)isHeavyShadowRequiredForTransition
{
  return -[SBSAContext isHeavyShadowRequiredForTransition](self->_context, "isHeavyShadowRequiredForTransition");
}

- (BOOL)isKeyLineRequiredForTransition
{
  return -[SBSAContext isKeyLineRequiredForTransition](self->_context, "isKeyLineRequiredForTransition");
}

- (BOOL)isAccessibilityZoomActiveAndEnabled
{
  return -[SBSAContext isAccessibilityZoomActiveAndEnabled](self->_context, "isAccessibilityZoomActiveAndEnabled");
}

- (NSArray)requests
{
  return -[SBSAContext requests](self->_context, "requests");
}

- (SBSAViewDescription)containerParentViewDescription
{
  return -[SBSAContext containerParentViewDescription](self->_context, "containerParentViewDescription");
}

- (BOOL)isReduceTransparencyEnabled
{
  return -[SBSAContext isReduceTransparencyEnabled](self->_context, "isReduceTransparencyEnabled");
}

- (BOOL)isAnimatedTransitionInProgress
{
  return -[SBSAContext isAnimatedTransitionInProgress](self->_context, "isAnimatedTransitionInProgress");
}

- (BOOL)isReachabilityActive
{
  return -[SBSAContext isReachabilityActive](self->_context, "isReachabilityActive");
}

- (void)setReachabilityActive:(BOOL)a3
{
  -[SBSAContext _setReachabilityActive:](self->_context, "_setReachabilityActive:", a3);
}

- (BOOL)isTargetPlatformSimulator
{
  return -[SBSAContext isTargetPlatformSimulator](self->_context, "isTargetPlatformSimulator");
}

- (void)setTargetPlatformSimulator:(BOOL)a3
{
  -[SBSAContext _setTargetPlatformSimulator:](self->_context, "_setTargetPlatformSimulator:", a3);
}

- (NSArray)containerViewDescriptions
{
  return -[SBSAContext containerViewDescriptions](self->_context, "containerViewDescriptions");
}

- (NSArray)elementContexts
{
  return -[SBSAContext elementContexts](self->_context, "elementContexts");
}

- (NSArray)elementInteractionResults
{
  return -[SBSAContext elementInteractionResults](self->_context, "elementInteractionResults");
}

- (NSArray)elementSnapshotContexts
{
  return -[SBSAContext elementSnapshotContexts](self->_context, "elementSnapshotContexts");
}

- (SBSADefaultsContext)defaultsContext
{
  return -[SBSAContext defaultsContext](self->_context, "defaultsContext");
}

- (NSArray)gestureDescriptions
{
  return -[SBSAContext gestureDescriptions](self->_context, "gestureDescriptions");
}

- (NSArray)animatedTransitionResults
{
  return -[SBSAContext animatedTransitionResults](self->_context, "animatedTransitionResults");
}

- (NSArray)elapsedTimerDescriptions
{
  return -[SBSAContext elapsedTimerDescriptions](self->_context, "elapsedTimerDescriptions");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; context: %@>"),
               objc_opt_class(),
               self,
               self->_context);
}

- (SBSAContext)context
{
  return self->_context;
}

- (SBSAPreferences)preferences
{
  return -[SBSAContext preferences](self->_context, "preferences");
}

- (unint64_t)signals
{
  return -[SBSAContext signals](self->_context, "signals");
}

- (void)setSignals:(unint64_t)a3
{
  -[SBSAContext _setSignals:](self->_context, "_setSignals:", a3);
}

- (unint64_t)flags
{
  return -[SBSAContext flags](self->_context, "flags");
}

- (void)setFlags:(unint64_t)a3
{
  -[SBSAContext _setFlags:](self->_context, "_setFlags:", a3);
}

@end
