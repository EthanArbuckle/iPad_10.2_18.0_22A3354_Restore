@implementation THAnimationController

- (THAnimationController)init
{
  THAnimationController *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THAnimationController;
  v2 = -[THAnimationController init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)TSULayerSaveRestore);
    -[THAnimationController setLayerSaveRestore:](v2, "setLayerSaveRestore:", v3);

    -[THAnimationController setShadowFadeOutDurationScale:](v2, "setShadowFadeOutDurationScale:", 1.0);
    v2->mObservers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnimationController;
  -[THAnimationController dealloc](&v3, "dealloc");
}

- (CALayer)animationLayer
{
  if (-[THAnimationController wrapperLayer](self, "wrapperLayer"))
    return -[THAnimationController wrapperLayer](self, "wrapperLayer");
  if (-[THAnimationController shouldAnimateTargetLayer](self, "shouldAnimateTargetLayer"))
    return (CALayer *)-[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer");
  return (CALayer *)-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer");
}

- (CALayer)targetLayer
{
  if (-[THAnimationController shouldAnimateTargetLayer](self, "shouldAnimateTargetLayer"))
    return 0;
  else
    return (CALayer *)-[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer");
}

- (CALayer)targetShadowLayer
{
  if (-[THAnimationController shouldAnimateTargetLayer](self, "shouldAnimateTargetLayer"))
    return -[THAnimationController sourceShadowLayer](self, "sourceShadowLayer");
  else
    return self->_targetShadowLayer;
}

- (CALayer)targetReflectionLayer
{
  if (-[THAnimationController shouldAnimateTargetLayer](self, "shouldAnimateTargetLayer"))
    return -[THAnimationController sourceReflectionLayer](self, "sourceReflectionLayer");
  else
    return self->_targetReflectionLayer;
}

- (CALayer)fadeInAnimationLayer
{
  if ((-[THAnimatableSource shouldFadeOutAnimationLayer:](-[THAnimationController source](self, "source"), "shouldFadeOutAnimationLayer:", -[THAnimationController destination](self, "destination")) & 1) != 0|| -[THAnimationController targetLayer](self, "targetLayer")&& -[THAnimatableDestination shouldFadeInTargetLayer:](-[THAnimationController destination](self, "destination"), "shouldFadeInTargetLayer:", -[THAnimationController source](self, "source")))
  {
    return (CALayer *)-[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer");
  }
  else
  {
    return 0;
  }
}

- (CALayer)fadeOutAnimationLayer
{
  if ((-[THAnimatableSource shouldFadeOutAnimationLayer:](-[THAnimationController source](self, "source"), "shouldFadeOutAnimationLayer:", -[THAnimationController destination](self, "destination")) & 1) != 0|| -[THAnimationController targetLayer](self, "targetLayer")&& -[THAnimatableDestination shouldFadeInTargetLayer:](-[THAnimationController destination](self, "destination"), "shouldFadeInTargetLayer:", -[THAnimationController source](self, "source")))
  {
    return (CALayer *)-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer");
  }
  else
  {
    return 0;
  }
}

- (void)addObserver:(id)a3
{
  if ((-[NSMutableArray containsObject:](self->mObservers, "containsObject:") & 1) == 0)
    -[NSMutableArray addObject:](self->mObservers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->mObservers, "removeObjectIdenticalTo:", a3);
}

- (void)removeAllObservers
{
  -[NSMutableArray removeAllObjects](self->mObservers, "removeAllObjects");
}

- (void)willAnimate
{
  -[UIApplication beginIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "beginIgnoringInteractionEvents");
  -[NSMutableArray tsu_makeObjectsPerformSelectorIfImplemented:withObject:](self->mObservers, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", "animationControllerWillPresent:", self);
}

- (void)didAnimate
{
  id v3;

  v3 = -[NSMutableArray copy](self->mObservers, "copy");
  objc_msgSend(v3, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", "animationControllerDidPresent:", self);

  -[UIApplication endIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "endIgnoringInteractionEvents");
  objc_msgSend((id)objc_opt_class(UIViewController), "performSelector:withObject:afterDelay:", "attemptRotationToDeviceOrientation", 0, 0.01);
}

- (void)didAnimatePostCommit
{
  THAnimationController *v3;
  id v4;

  v3 = self;
  v4 = -[NSMutableArray copy](self->mObservers, "copy");
  objc_msgSend(v4, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", "animationControllerDidPresentPostCommit:", self);

  -[THAnimationController removeAllObservers](self, "removeAllObservers");
}

- (void)setupAnimationLayerForCrossFade
{
  THAnimatableSource *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CALayer *v8;
  CALayer *v9;
  CALayer *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CALayer *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  id v26;
  CALayer *layerToAnimateUnder;
  CALayer *v28;
  double v29;
  double v30;
  CALayer *v31;
  CALayer *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CATransform3D v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CATransform3D v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CATransform3D v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CATransform3D v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  _OWORD v68[3];
  _OWORD v69[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v72;

  memset(&v72, 0, sizeof(v72));
  v3 = -[THAnimationController source](self, "source");
  if (v3)
    -[THAnimatableSource freeTransform](v3, "freeTransform");
  else
    memset(&v72, 0, sizeof(v72));
  t1 = v72;
  v48 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v50 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.c = v48;
  v46 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&t2.tx = v46;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v69[0] = v50;
    v69[1] = v48;
    v69[2] = v46;
    objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "setAffineTransform:", v69);
  }
  -[THAnimationController p_scaleForAnimationLayer](self, "p_scaleForAnimationLayer", v46, v48, v50);
  v5 = v4;
  -[THAnimationController p_scaleForTargetLayer](self, "p_scaleForTargetLayer");
  v7 = v6;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t1, v5, v5);
  v8 = -[THAnimationController fadeInAnimationLayer](self, "fadeInAnimationLayer");
  v9 = -[THAnimationController fadeOutAnimationLayer](self, "fadeOutAnimationLayer");
  -[CALayer setHidden:](v8, "setHidden:", 1);
  -[CALayer setHidden:](v9, "setHidden:", 0);
  v10 = -[THAnimationController hostLayer](self, "hostLayer");
  objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "frame");
  v15 = TSDCenterOfRect(v11, v12, v13, v14);
  -[CALayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "superlayer"), v15, v16);
  -[THAnimationController setInitialLayerPosition:](self, "setInitialLayerPosition:");
  -[CALayer frame](-[THAnimationController animationLayer](self, "animationLayer"), "frame");
  -[THAnimationController setInitialLayerSize:](self, "setInitialLayerSize:", v17, v18);
  v19 = -[THAnimationController hostLayer](self, "hostLayer");
  -[CALayer frame](-[THAnimationController animationLayer](self, "animationLayer"), "frame");
  -[CALayer convertRect:fromLayer:](v19, "convertRect:fromLayer:", -[CALayer superlayer](-[THAnimationController animationLayer](self, "animationLayer"), "superlayer"), v20, v21, v22, v23);
  v24 = objc_alloc_init((Class)CALayer);
  v68[0] = v51;
  v68[1] = v49;
  v68[2] = v47;
  objc_msgSend(v24, "setAffineTransform:", v68);
  -[THAnimationController initialLayerPosition](self, "initialLayerPosition");
  objc_msgSend(v24, "setFrame:", TSDRectWithCenterAndSize(v25));
  v26 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v24, "bounds");
  objc_msgSend(v26, "setFrame:");
  objc_msgSend(v24, "addSublayer:", v26);
  layerToAnimateUnder = self->_layerToAnimateUnder;
  v28 = -[THAnimationController hostLayer](self, "hostLayer");
  if (layerToAnimateUnder)
    -[CALayer insertSublayer:below:](v28, "insertSublayer:below:", v24, self->_layerToAnimateUnder);
  else
    -[CALayer addSublayer:](v28, "addSublayer:", v24);
  if (v5 != 1.0)
  {
    v67 = t1;
    objc_msgSend(v24, "setAffineTransform:", &v67);
  }
  -[CALayer position](v9, "position");
  objc_msgSend(v26, "convertPoint:fromLayer:", -[CALayer superlayer](v9, "superlayer"), v29, v30);
  -[CALayer setPosition:](v9, "setPosition:");
  objc_msgSend(v26, "addSublayer:", v9);
  objc_msgSend(v26, "addSublayer:", v8);
  if (v5 != 1.0)
  {
    memset(&t2, 0, sizeof(t2));
    CGAffineTransformMakeScale(&t2, 1.0 / v5, 1.0 / v5);
    memset(&v66, 0, sizeof(v66));
    if (v9)
      -[CALayer transform](v9, "transform");
    else
      memset(&v65, 0, sizeof(v65));
    CATransform3DGetAffineTransform(&v66, &v65);
    v63 = v66;
    v62 = t2;
    CGAffineTransformConcat(&v64, &v63, &v62);
    v61 = v64;
    -[CALayer setAffineTransform:](v9, "setAffineTransform:", &v61);
  }
  if (v7 != 1.0)
  {
    memset(&t2, 0, sizeof(t2));
    CGAffineTransformMakeScale(&t2, v7, v7);
    memset(&v66, 0, sizeof(v66));
    v31 = -[THAnimationController targetLayer](self, "targetLayer");
    if (v31)
      -[CALayer transform](v31, "transform");
    else
      memset(&v60, 0, sizeof(v60));
    CATransform3DGetAffineTransform(&v66, &v60);
    v63 = v66;
    v62 = t2;
    CGAffineTransformConcat(&v59, &v63, &v62);
    v32 = -[THAnimationController targetLayer](self, "targetLayer");
    v58 = v59;
    -[CALayer setAffineTransform:](v32, "setAffineTransform:", &v58);
  }
  objc_msgSend(v26, "bounds");
  v37 = TSDCenterOfRect(v33, v34, v35, v36);
  v39 = v38;
  -[CALayer frame](v8, "frame");
  v44 = TSDCenterOfRect(v40, v41, v42, v43);
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformMakeTranslation(&t2, -(v44 - v37), -(v45 - v39));
  memset(&v66, 0, sizeof(v66));
  if (v8)
    -[CALayer transform](v8, "transform");
  else
    memset(&v57, 0, sizeof(v57));
  CATransform3DGetAffineTransform(&v66, &v57);
  v63 = v66;
  v62 = t2;
  CGAffineTransformConcat(&v56, &v63, &v62);
  v55 = v56;
  -[CALayer setAffineTransform:](v8, "setAffineTransform:", &v55);
  t2 = v72;
  *(_OWORD *)&v66.a = v51;
  *(_OWORD *)&v66.c = v49;
  *(_OWORD *)&v66.tx = v47;
  if (!CGAffineTransformEqualToTransform(&t2, &v66))
  {
    memset(&t2, 0, sizeof(t2));
    if (v24)
      objc_msgSend(v24, "transform");
    else
      memset(&v54, 0, sizeof(v54));
    CATransform3DGetAffineTransform(&t2, &v54);
    v66 = t2;
    v63 = v72;
    CGAffineTransformConcat(&v53, &v66, &v63);
    v52 = v53;
    objc_msgSend(v24, "setAffineTransform:", &v52);
  }
  -[THAnimationController setInteriorWrapperLayer:](self, "setInteriorWrapperLayer:", v26);
  -[THAnimationController setWrapperLayer:](self, "setWrapperLayer:", v24);

}

- (void)setupAnimationLayer
{
  THAnimatableSource *v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  _OWORD v29[3];
  _OWORD v30[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v33;

  memset(&v33, 0, sizeof(v33));
  v3 = -[THAnimationController source](self, "source");
  if (v3)
    -[THAnimatableSource freeTransform](v3, "freeTransform");
  else
    memset(&v33, 0, sizeof(v33));
  t1 = v33;
  v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v24 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t2.c = v22;
  v20 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&t2.tx = v20;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v30[0] = v24;
    v30[1] = v22;
    v30[2] = v20;
    -[CALayer setAffineTransform:](-[THAnimationController animationLayer](self, "animationLayer"), "setAffineTransform:", v30);
  }
  v4 = -[THAnimationController hostLayer](self, "hostLayer", v20, v22, v24);
  objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "frame");
  v9 = TSDCenterOfRect(v5, v6, v7, v8);
  -[CALayer convertPoint:fromLayer:](v4, "convertPoint:fromLayer:", objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "superlayer"), v9, v10);
  -[THAnimationController setInitialLayerPosition:](self, "setInitialLayerPosition:");
  -[CALayer frame](-[THAnimationController animationLayer](self, "animationLayer"), "frame");
  -[THAnimationController setInitialLayerSize:](self, "setInitialLayerSize:", v11, v12);
  v13 = objc_alloc_init((Class)CALayer);
  -[THAnimationController initialLayerPosition](self, "initialLayerPosition");
  v15 = v14;
  -[THAnimationController initialLayerSize](self, "initialLayerSize");
  objc_msgSend(v13, "setFrame:", TSDRectWithCenterAndSize(v15));
  v29[0] = v25;
  v29[1] = v23;
  v29[2] = v21;
  objc_msgSend(v13, "setAffineTransform:", v29);
  objc_msgSend(v13, "setZPosition:", 1.0);
  -[CALayer addSublayer:](-[THAnimationController hostLayer](self, "hostLayer"), "addSublayer:", v13);
  if (-[THAnimationController sourceOverlayLayer](self, "sourceOverlayLayer"))
    -[CALayer addSublayer:](-[THAnimationController hostLayer](self, "hostLayer"), "addSublayer:", -[THAnimationController sourceOverlayLayer](self, "sourceOverlayLayer"));
  objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "position");
  objc_msgSend(v13, "convertPoint:fromLayer:", objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "superlayer"), v16, v17);
  -[CALayer setPosition:](-[THAnimationController animationLayer](self, "animationLayer"), "setPosition:", v18, v19);
  t1 = v33;
  *(_OWORD *)&t2.a = v25;
  *(_OWORD *)&t2.c = v23;
  *(_OWORD *)&t2.tx = v21;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (v13)
      objc_msgSend(v13, "affineTransform");
    else
      memset(&v27, 0, sizeof(v27));
    t1 = v33;
    CGAffineTransformConcat(&v28, &v27, &t1);
    v26 = v28;
    objc_msgSend(v13, "setAffineTransform:", &v26);
  }
  objc_msgSend(v13, "addSublayer:", -[THAnimationController animationLayer](self, "animationLayer"));
  -[THAnimationController setWrapperLayer:](self, "setWrapperLayer:", v13);

  -[CALayer setHidden:](-[THAnimationController targetLayer](self, "targetLayer"), "setHidden:", 1);
}

- (void)setupTarget
{
  id v3;
  NSMutableArray *mObservers;
  id v5;
  char **v6;
  id v7;
  uint64_t v8;
  void *v9;
  char **v10;
  const char *v11;
  void *v12;
  CALayer *v13;
  double v14;
  CALayer *v15;
  double v16;
  CALayer *v17;
  double v18;
  unsigned int v19;
  CALayer *v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  +[CATransaction flush](CATransaction, "flush");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  v3 = -[NSMutableArray mutableCopy](self->mObservers, "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  mObservers = self->mObservers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mObservers, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v6 = &selRef_absolutePageRangeForPresentationType_;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      v10 = v6;
      v11 = v6[371];
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(mObservers);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9);
        if ((objc_opt_respondsToSelector(v12, "animationControllerSetsDestination:") & 1) != 0
          && objc_msgSend(v12, "animationControllerSetsDestination:", self)
          && (objc_opt_respondsToSelector(v12, v11) & 1) != 0)
        {
          objc_msgSend(v12, "animationControllerSetupTarget:", self);
          objc_msgSend(v3, "removeObject:", v12);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mObservers, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v6 = v10;
    }
    while (v7);
  }
  else
  {
    v11 = "animationControllerSetupTarget:";
  }
  objc_msgSend(v3, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", v11, self);

  if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "animatableDestinationSetupTarget:") & 1) != 0)-[THAnimatableDestination animatableDestinationSetupTarget:](-[THAnimationController destination](self, "destination"), "animatableDestinationSetupTarget:", self);
  -[THAnimationController setShouldAnimateTargetLayer:](self, "setShouldAnimateTargetLayer:", -[THAnimatableSource shouldAnimateTargetLayer:](-[THAnimationController source](self, "source"), "shouldAnimateTargetLayer:", -[THAnimationController destination](self, "destination")));
  -[THAnimationController p_targetFrame](self, "p_targetFrame");
  -[THAnimationController setTargetFrame:](self, "setTargetFrame:");
  if (-[THAnimatableSource shouldFadeOutAnimationLayer:](-[THAnimationController source](self, "source"), "shouldFadeOutAnimationLayer:", -[THAnimationController destination](self, "destination"))&& (!-[THAnimatableSource shouldFadeOutAnimationLayer:](-[THAnimationController source](self, "source"), "shouldFadeOutAnimationLayer:", -[THAnimationController destination](self, "destination"))|| (-[THAnimatableSource shouldAnimateTargetLayer:](-[THAnimationController source](self, "source"), "shouldAnimateTargetLayer:", -[THAnimationController destination](self, "destination")) & 1) == 0))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnimationController setupTarget]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnimationController.m"), 530, CFSTR("When fading out source animation layer, we should animate in the target layer."));
  }
  -[THAnimationController p_saveLayer:](self, "p_saveLayer:", -[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"));
  -[THAnimationController p_saveLayer:](self, "p_saveLayer:", -[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer"));
  v13 = -[THAnimationController foregroundLayer](self, "foregroundLayer");
  LODWORD(v14) = 0;
  -[CALayer setOpacity:](v13, "setOpacity:", v14);
  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "sourceShadowLayer") & 1) != 0)
    -[THAnimationController setSourceShadowLayer:](self, "setSourceShadowLayer:", -[THAnimatableSource sourceShadowLayer](-[THAnimationController source](self, "source"), "sourceShadowLayer"));
  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "sourceReflectionLayer") & 1) != 0)
    -[THAnimationController setSourceReflectionLayer:](self, "setSourceReflectionLayer:", -[THAnimatableSource sourceReflectionLayer](-[THAnimationController source](self, "source"), "sourceReflectionLayer"));
  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "sourceOverlayLayer") & 1) != 0)
    -[THAnimationController setSourceOverlayLayer:](self, "setSourceOverlayLayer:", -[THAnimatableSource sourceOverlayLayer](-[THAnimationController source](self, "source"), "sourceOverlayLayer"));
  if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "targetShadowLayer") & 1) != 0)
  {
    -[THAnimationController setTargetShadowLayer:](self, "setTargetShadowLayer:", -[THAnimatableDestination targetShadowLayer](-[THAnimationController destination](self, "destination"), "targetShadowLayer"));
    -[THAnimationController p_saveLayer:](self, "p_saveLayer:", -[THAnimationController targetShadowLayer](self, "targetShadowLayer"));
    v15 = -[THAnimationController targetShadowLayer](self, "targetShadowLayer");
    LODWORD(v16) = 0;
    -[CALayer setOpacity:](v15, "setOpacity:", v16);
  }
  if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "targetReflectionLayer") & 1) != 0)
  {
    -[THAnimationController setTargetReflectionLayer:](self, "setTargetReflectionLayer:", -[THAnimatableDestination targetReflectionLayer](-[THAnimationController destination](self, "destination"), "targetReflectionLayer"));
    -[THAnimationController p_saveLayer:](self, "p_saveLayer:", -[THAnimationController targetReflectionLayer](self, "targetReflectionLayer"));
    v17 = -[THAnimationController targetReflectionLayer](self, "targetReflectionLayer");
    LODWORD(v18) = 0;
    -[CALayer setOpacity:](v17, "setOpacity:", v18);
  }
  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "enforceAnimationLayer") & 1) != 0)
    v19 = -[THAnimatableSource enforceAnimationLayer](-[THAnimationController source](self, "source"), "enforceAnimationLayer");
  else
    v19 = 0;
  if (-[THAnimationController p_shouldCrossFade](self, "p_shouldCrossFade"))
  {
    -[THAnimationController setupAnimationLayerForCrossFade](self, "setupAnimationLayerForCrossFade");
  }
  else
  {
    v20 = -[CALayer superlayer](-[THAnimationController animationLayer](self, "animationLayer"), "superlayer");
    if (v20 == -[THAnimationController hostLayer](self, "hostLayer"))
      v21 = v19;
    else
      v21 = 1;
    if (v21 == 1)
      -[THAnimationController setupAnimationLayer](self, "setupAnimationLayer");
  }
  +[CATransaction commit](CATransaction, "commit");
  +[CATransaction flush](CATransaction, "flush");
}

- (void)teardownTarget
{
  -[THAnimationController p_restoreLayer:](self, "p_restoreLayer:", -[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer"));
  -[THAnimationController p_restoreLayer:](self, "p_restoreLayer:", -[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"));
  -[THAnimationController p_restoreLayer:](self, "p_restoreLayer:", -[THAnimationController targetShadowLayer](self, "targetShadowLayer"));
  -[THAnimationController p_restoreLayer:](self, "p_restoreLayer:", -[THAnimationController targetReflectionLayer](self, "targetReflectionLayer"));
  -[CALayer removeAnimationForKey:](-[THAnimationController foregroundLayer](self, "foregroundLayer"), "removeAnimationForKey:", CFSTR("THForegroundFadeAnimation"));
  -[CALayer removeAnimationForKey:](-[THAnimationController backgroundLayer](self, "backgroundLayer"), "removeAnimationForKey:", CFSTR("THBackgroundFadeAnimation"));
  -[CALayer removeFromSuperlayer](-[THAnimationController wrapperLayer](self, "wrapperLayer"), "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](-[THAnimationController sourceOverlayLayer](self, "sourceOverlayLayer"), "removeFromSuperlayer");
  -[THAnimationController setWrapperLayer:](self, "setWrapperLayer:", 0);
  -[THAnimationController setSourceShadowLayer:](self, "setSourceShadowLayer:", 0);
  -[THAnimationController setSourceReflectionLayer:](self, "setSourceReflectionLayer:", 0);
  -[THAnimationController setSourceOverlayLayer:](self, "setSourceOverlayLayer:", 0);
  -[THAnimationController setTargetShadowLayer:](self, "setTargetShadowLayer:", 0);
  -[THAnimationController setTargetReflectionLayer:](self, "setTargetReflectionLayer:", 0);
  -[NSMutableArray tsu_makeObjectsPerformSelectorIfImplemented:withObject:](self->mObservers, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", "animationControllerTeardownTarget:", self);
  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "reparentAnimationLayerIfBackedByView:") & 1) != 0)-[THAnimatableSource reparentAnimationLayerIfBackedByView:](-[THAnimationController source](self, "source"), "reparentAnimationLayerIfBackedByView:", self);
  if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "reparentTargetLayerIfBackedByView:") & 1) != 0)-[THAnimatableDestination reparentTargetLayerIfBackedByView:](-[THAnimationController destination](self, "destination"), "reparentTargetLayerIfBackedByView:", self);
}

- (void)presentAnimationWithCompletionBlock:(id)a3 overshoot:(BOOL)a4
{
  _BOOL8 v4;
  _QWORD v7[6];

  v4 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnimationController presentAnimationWithCompletionBlock:overshoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnimationController.m"), 627, CFSTR("Manipulating UI outside main thread."));
  objc_msgSend(+[UIWindow keyWindow](UIWindow, "keyWindow"), "beginDisablingInterfaceAutorotation");
  -[THAnimationController setOvershoot:](self, "setOvershoot:", v4);
  -[THAnimationController willAnimate](self, "willAnimate");
  -[THAnimationController setupTarget](self, "setupTarget");
  -[CALayer removeAllAnimations](-[THAnimationController animationLayer](self, "animationLayer"), "removeAllAnimations");
  -[CALayer removeAllAnimations](-[THAnimationController fadeInAnimationLayer](self, "fadeInAnimationLayer"), "removeAllAnimations");
  -[CALayer removeAllAnimations](-[THAnimationController fadeOutAnimationLayer](self, "fadeOutAnimationLayer"), "removeAllAnimations");
  +[CATransaction begin](CATransaction, "begin");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1417C4;
  v7[3] = &unk_426E78;
  v7[4] = self;
  v7[5] = a3;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v7);
  -[THAnimationController performAnimation](self, "performAnimation");
  +[CATransaction commit](CATransaction, "commit");
}

- (double)animationDuration
{
  double result;

  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "animationDuration") & 1) == 0)
    return 0.25;
  -[THAnimatableSource animationDuration](-[THAnimationController source](self, "source"), "animationDuration");
  return result;
}

- (void)addForegroundFadeAnimation
{
  CALayer *v3;
  CABasicAnimation *v4;
  double v5;
  double v6;
  CALayer *v7;
  double v8;

  v3 = -[THAnimationController foregroundLayer](self, "foregroundLayer");
  v4 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  LODWORD(v5) = 0;
  -[CABasicAnimation setFromValue:](v4, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  LODWORD(v6) = 1.0;
  -[CABasicAnimation setToValue:](v4, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  -[THAnimationController animationDuration](self, "animationDuration");
  -[CABasicAnimation setDuration:](v4, "setDuration:");
  -[CABasicAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v4, "setFillMode:", kCAFillModeForwards);
  -[CALayer addAnimation:forKey:](v3, "addAnimation:forKey:", v4, CFSTR("THForegroundFadeAnimation"));
  v7 = -[THAnimationController foregroundLayer](self, "foregroundLayer");
  LODWORD(v8) = 1.0;
  -[CALayer setOpacity:](v7, "setOpacity:", v8);
}

- (void)addBackgroundFadeOutAnimation
{
  CALayer *v3;
  CABasicAnimation *v4;
  double v5;
  double v6;

  v3 = -[THAnimationController backgroundLayer](self, "backgroundLayer");
  v4 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  LODWORD(v5) = 1.0;
  -[CABasicAnimation setFromValue:](v4, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  LODWORD(v6) = 0;
  -[CABasicAnimation setToValue:](v4, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  -[THAnimationController animationDuration](self, "animationDuration");
  -[CABasicAnimation setDuration:](v4, "setDuration:");
  -[CABasicAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v4, "setFillMode:", kCAFillModeForwards);
  -[CALayer addAnimation:forKey:](v3, "addAnimation:forKey:", v4, CFSTR("THBackgroundFadeAnimation"));
}

- (void)addContentAnimation
{
  id v3;
  unsigned int v4;
  const CAMediaTimingFunctionName *v5;
  id v6;
  CALayer *v7;
  const __CFString *v8;
  float v9;
  float v10;
  id v11;
  NSMutableArray *mObservers;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  -[NSMutableArray tsu_makeObjectsPerformSelectorIfImplemented:withObject:](self->mObservers, "tsu_makeObjectsPerformSelectorIfImplemented:withObject:", "animationControllerWillAddContentAnimations:", self);
  -[CALayer setHidden:](-[THAnimationController animationLayer](self, "animationLayer"), "setHidden:", 0);
  if (-[THAnimationController animationLayer](self, "animationLayer"))
    -[CALayer addAnimation:forKey:](-[THAnimationController animationLayer](self, "animationLayer"), "addAnimation:forKey:", -[THAnimationController curveAndOvershootAnimation](self, "curveAndOvershootAnimation"), CFSTR("animationLayerCurveAndOvershoot"));
  if (-[THAnimationController p_shouldCrossFade](self, "p_shouldCrossFade"))
  {
    -[CALayer setHidden:](-[THAnimationController fadeInAnimationLayer](self, "fadeInAnimationLayer"), "setHidden:", 0);
    -[CALayer setHidden:](-[THAnimationController fadeOutAnimationLayer](self, "fadeOutAnimationLayer"), "setHidden:", 1);
    v3 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v3, "setType:", kCATransitionFade);
    -[THAnimationController animationDuration](self, "animationDuration");
    objc_msgSend(v3, "setDuration:");
    v4 = -[THAnimationController shouldAnimateTargetLayer](self, "shouldAnimateTargetLayer");
    v5 = &kCAMediaTimingFunctionEaseOut;
    if (!v4)
      v5 = &kCAMediaTimingFunctionEaseIn;
    objc_msgSend(v3, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", *v5));
    -[CALayer addAnimation:forKey:](-[THAnimationController interiorWrapperLayer](self, "interiorWrapperLayer"), "addAnimation:forKey:", v3, 0);
  }
  if (-[THAnimatableSource shadowAnimationLayer](-[THAnimationController source](self, "source"), "shadowAnimationLayer"))
  {
    v6 = -[THAnimationController shadowFadeOutAnimation](self, "shadowFadeOutAnimation");
    v7 = (CALayer *)-[THAnimatableSource shadowAnimationLayer](-[THAnimationController source](self, "source"), "shadowAnimationLayer");
    v8 = CFSTR("THAnimationControllerFadeOutAnimation");
LABEL_15:
    -[CALayer addAnimation:forKey:](v7, "addAnimation:forKey:", v6, v8);
    goto LABEL_16;
  }
  if (-[THAnimationController sourceShadowLayer](self, "sourceShadowLayer"))
    -[CALayer addAnimation:forKey:](-[THAnimationController sourceShadowLayer](self, "sourceShadowLayer"), "addAnimation:forKey:", -[THAnimationController sourceShadowFadeOutAnimation](self, "sourceShadowFadeOutAnimation"), CFSTR("fadeOutAnimation"));
  if (-[THAnimationController sourceReflectionLayer](self, "sourceReflectionLayer"))
    -[CALayer addAnimation:forKey:](-[THAnimationController sourceReflectionLayer](self, "sourceReflectionLayer"), "addAnimation:forKey:", -[THAnimationController sourceShadowFadeOutAnimation](self, "sourceShadowFadeOutAnimation"), CFSTR("fadeOutAnimation"));
  if (-[THAnimationController sourceOverlayLayer](self, "sourceOverlayLayer"))
  {
    v6 = -[THAnimationController sourceShadowFadeOutAnimation](self, "sourceShadowFadeOutAnimation");
    v7 = -[THAnimationController sourceOverlayLayer](self, "sourceOverlayLayer");
    v8 = CFSTR("fadeOutAnimation");
    goto LABEL_15;
  }
LABEL_16:
  if (-[THAnimationController targetShadowLayer](self, "targetShadowLayer"))
  {
    objc_msgSend(-[THAnimationController p_objectForLayer:key:](self, "p_objectForLayer:key:", -[THAnimationController targetShadowLayer](self, "targetShadowLayer"), CFSTR("opacity")), "floatValue");
    -[CALayer addAnimation:forKey:](-[THAnimationController targetShadowLayer](self, "targetShadowLayer"), "addAnimation:forKey:", -[THAnimationController fadeInOnDelayAnimationToOpacity:](self, "fadeInOnDelayAnimationToOpacity:", v9), CFSTR("fadeInAnimation"));
  }
  if (-[THAnimationController targetReflectionLayer](self, "targetReflectionLayer"))
  {
    objc_msgSend(-[THAnimationController p_objectForLayer:key:](self, "p_objectForLayer:key:", -[THAnimationController targetReflectionLayer](self, "targetReflectionLayer"), CFSTR("opacity")), "floatValue");
    -[CALayer addAnimation:forKey:](-[THAnimationController targetReflectionLayer](self, "targetReflectionLayer"), "addAnimation:forKey:", -[THAnimationController fadeInOnDelayAnimationToOpacity:](self, "fadeInOnDelayAnimationToOpacity:", v10), CFSTR("fadeInAnimation"));
  }
  v11 = -[THAnimationController shadowTransformAnimation](self, "shadowTransformAnimation");
  if (v11)
    objc_msgSend(-[THAnimatableSource shadowAnimationLayer](-[THAnimationController source](self, "source"), "shadowAnimationLayer"), "addAnimation:forKey:", v11, CFSTR("THAnimationControllerShadowTransform"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  mObservers = self->mObservers;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mObservers, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(mObservers);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v17, "animationControllerDidAddContentAnimations:uniformTargetScale:") & 1) != 0)
          objc_msgSend(v17, "animationControllerDidAddContentAnimations:uniformTargetScale:", self, self->_uniformTargetScale);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mObservers, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }
}

- (id)curveAndOvershootAnimation
{
  CALayer *v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double d;
  double ty;
  double v19;
  double v20;
  double v21;
  double v22;
  CAMediaTimingFunction *v23;
  double v24;
  double v25;
  unsigned int v26;
  unsigned int v27;
  double y;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  __n128 v36;
  __n128 v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CAKeyframeAnimation *v64;
  double v65;
  NSNumber *v66;
  double v67;
  NSNumber *v68;
  double v69;
  CAKeyframeAnimation *v70;
  NSValue *v71;
  NSValue *v72;
  double v73;
  NSNumber *v74;
  double v75;
  NSNumber *v76;
  double v77;
  id v78;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CAMediaTimingFunction *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  double v100;
  double v101;
  double tx;
  double c;
  CATransform3D v104;
  CATransform3D v105;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v108;
  CATransform3D v109;
  _OWORD v110[3];
  _OWORD v111[3];
  CATransform3D v112;
  CGAffineTransform v113;

  memset(&v113, 0, sizeof(v113));
  v3 = -[THAnimationController animationLayer](self, "animationLayer");
  if (v3)
    -[CALayer transform](v3, "transform");
  else
    memset(&v112, 0, sizeof(v112));
  CATransform3DGetAffineTransform(&v113, &v112);
  v4 = -[THAnimationController animationLayer](self, "animationLayer");
  v98 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v99 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v111[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v111[1] = v98;
  v97 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v111[2] = v97;
  -[CALayer setAffineTransform:](v4, "setAffineTransform:", v111);
  -[THAnimationController initialLayerPosition](self, "initialLayerPosition");
  v6 = v5;
  -[THAnimationController initialLayerSize](self, "initialLayerSize");
  v90 = TSDRectWithCenterAndSize(v6);
  v86 = v7;
  v9 = v8;
  v11 = v10;
  if (-[THAnimationController targetLayer](self, "targetLayer")
    && (-[THAnimatableDestination shouldFadeInTargetLayer:](-[THAnimationController destination](self, "destination"), "shouldFadeInTargetLayer:", -[THAnimationController source](self, "source")) & 1) == 0)
  {
    v110[0] = v99;
    v110[1] = v98;
    v110[2] = v97;
    -[CALayer setAffineTransform:](-[THAnimationController targetLayer](self, "targetLayer"), "setAffineTransform:", v110);
  }
  -[THAnimationController targetFrame](self, "targetFrame");
  v82 = v13;
  v84 = v12;
  v15 = v14;
  v94 = v16;
  v92 = v113.a;
  d = v113.d;
  c = v113.c;
  HIDWORD(v12) = HIDWORD(v113.tx);
  ty = v113.ty;
  v101 = v113.b;
  tx = v113.tx;
  LODWORD(v12) = 1055286886;
  LODWORD(v13) = 0;
  LODWORD(v16) = 1.0;
  LODWORD(v14) = 1057803469;
  v89 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v12, v13, v14, v16);
  LODWORD(v19) = 0.25;
  LODWORD(v20) = 0.25;
  LODWORD(v21) = 1.0;
  LODWORD(v22) = 1057803469;
  v23 = +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v19, v20, v22, v21);
  -[THAnimationController animationDuration](self, "animationDuration");
  v80 = v24;
  -[THAnimationController animationDuration](self, "animationDuration");
  v93 = v25;
  v26 = -[THAnimationController overshoot](self, "overshoot");
  v27 = -[THAnimationController overshoot](self, "overshoot");
  y = CGPointZero.y;
  if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "shouldAnimateToFit") & 1) != 0
    && -[THAnimatableDestination shouldAnimateToFit](-[THAnimationController destination](self, "destination"), "shouldAnimateToFit"))
  {
    v29 = THScaleNeededToFitSizeInSize(v9, v11, v15, v94);
  }
  else
  {
    v29 = THScaleNeededToFillSizeInSize(v9, v11, v15, v94);
  }
  v88 = v29;
  v100 = d;
  v96 = ty;
  TSDMultiplyPointScalar(tx + c * y + v92 * CGPointZero.x, ty + d * y + v101 * CGPointZero.x, -1.0);
  v30 = TSDCenterOfRect(v84, v82, v15, v94);
  v32 = v31;
  v33 = TSDCenterOfRect(v90, v86, v9, v11);
  v35 = v34;
  v36.n128_f64[0] = v30;
  v37.n128_u64[0] = v32;
  v38 = TSDSubtractPoints(v36, v37, v33, v35);
  v40 = v39;
  v42 = TSDAddPoints(v41);
  v85 = v43;
  v87 = v42;
  v44 = 0.0;
  if (v27)
    v45 = 0.05;
  else
    v45 = 0.0;
  if (v26)
    v44 = 0.05;
  v81 = v44;
  v83 = v45;
  v91 = v80 * 0.899999976;
  v46 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v109.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v109.m33 = v46;
  v47 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v109.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v109.m43 = v47;
  v48 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v109.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v109.m13 = v48;
  v49 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v109.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v109.m23 = v49;
  *(_OWORD *)&v108.m31 = *(_OWORD *)&v109.m31;
  *(_OWORD *)&v108.m33 = v46;
  *(_OWORD *)&v108.m41 = *(_OWORD *)&v109.m41;
  *(_OWORD *)&v108.m43 = v47;
  *(_OWORD *)&v108.m11 = *(_OWORD *)&v109.m11;
  *(_OWORD *)&v108.m13 = v48;
  v50 = (v15 / v9 + v94 / v11) * 0.5 * (1.0 / ((fabs(v92 + c) + fabs(v101 + v100)) * 0.5));
  *(_OWORD *)&v108.m21 = *(_OWORD *)&v109.m21;
  *(_OWORD *)&v108.m23 = v49;
  CATransform3DTranslate(&v109, &v108, v38, v40, 0.0);
  a = v109;
  CATransform3DScale(&v108, &a, v88, v88, 1.0);
  v109 = v108;
  *(_OWORD *)&v108.m11 = v99;
  *(_OWORD *)&v108.m13 = v98;
  *(_OWORD *)&v108.m21 = v97;
  CATransform3DMakeAffineTransform(&b, (CGAffineTransform *)&v108);
  a = v109;
  CATransform3DConcat(&v108, &a, &b);
  v109 = v108;
  self->_uniformTargetScale = v88;
  v51 = TSDMultiplyPointScalar(0.0, 0.0, 8.0);
  v95 = v52;
  v108.m11 = v92;
  v108.m12 = v101;
  v108.m13 = c;
  v108.m14 = v100;
  v108.m21 = tx;
  v108.m22 = v96;
  -[THAnimationController p_rotationAngleFromTransform:](self, "p_rotationAngleFromTransform:", &v108);
  v54 = v53;
  *(_OWORD *)&v108.m11 = v99;
  *(_OWORD *)&v108.m13 = v98;
  *(_OWORD *)&v108.m21 = v97;
  -[THAnimationController p_rotationAngleFromTransform:](self, "p_rotationAngleFromTransform:", &v108);
  v56 = v54 - v55;
  v57 = 3.14059265 / vabdd_f64(v54, v55) + -1.0;
  if (v57 > 0.05)
    v57 = 0.05;
  v58 = v56 * v57;
  v59 = fmax((v50 + -1.0) * v81 + 1.0, 0.96);
  if (v59 <= 1.04)
    v60 = v59;
  else
    v60 = 1.04;
  v61 = TSDMultiplyPointScalar(v87, v85, v83);
  v63 = v62;
  v108 = v109;
  a = v109;
  CATransform3DScale(&v108, &a, v60, v60, 1.0);
  v105 = v108;
  CATransform3DRotate(&a, &v105, v58, 0.0, 0.0, 1.0);
  v108 = a;
  v105 = a;
  CATransform3DTranslate(&a, &v105, v61, v63, 0.0);
  v108 = a;
  v64 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.translation"));
  -[CAKeyframeAnimation setValues:](v64, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v51, v95), +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", CGSizeZero.width, CGSizeZero.height), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v64, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), 0));
  LODWORD(v65) = 0;
  v66 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v65);
  LODWORD(v67) = 1051361018;
  v68 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v67);
  LODWORD(v69) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v64, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v66, v68, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v69), 0));
  -[CAKeyframeAnimation setDuration:](v64, "setDuration:", v93 + v91 * 0.5);
  -[CAKeyframeAnimation setFillMode:](v64, "setFillMode:", kCAFillModeForwards);
  -[CAKeyframeAnimation setRemovedOnCompletion:](v64, "setRemovedOnCompletion:", 0);
  v70 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform"));
  a.m11 = v92;
  a.m12 = v101;
  a.m13 = c;
  a.m14 = v100;
  a.m21 = tx;
  a.m22 = v96;
  CATransform3DMakeAffineTransform(&v104, (CGAffineTransform *)&a);
  v71 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v104);
  a = v108;
  v72 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &a);
  a = v109;
  -[CAKeyframeAnimation setValues:](v70, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v71, v72, +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &a), 0));
  -[CAKeyframeAnimation setTimingFunctions:](v70, "setTimingFunctions:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, v89, 0));
  LODWORD(v73) = 0;
  v74 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v73);
  v75 = v93 / (v93 + v91);
  *(float *)&v75 = v75;
  v76 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v75);
  LODWORD(v77) = 1.0;
  -[CAKeyframeAnimation setKeyTimes:](v70, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v74, v76, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v77), 0));
  -[CAKeyframeAnimation setDuration:](v70, "setDuration:", v93 + v91);
  -[CAKeyframeAnimation setFillMode:](v70, "setFillMode:", kCAFillModeForwards);
  -[CAKeyframeAnimation setRemovedOnCompletion:](v70, "setRemovedOnCompletion:", 0);
  v78 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
  objc_msgSend(v78, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v64, v70, 0));
  objc_msgSend(v78, "setDuration:", v93 + v91);
  objc_msgSend(v78, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v78, "setRemovedOnCompletion:", 0);
  return v78;
}

- (id)fadeInAnimation
{
  double v3;
  double v4;
  CABasicAnimation *v5;
  double v6;

  -[THAnimationController animationDuration](self, "animationDuration");
  v4 = v3;
  v5 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  -[CABasicAnimation setTimingFunction:](v5, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  -[CABasicAnimation setDuration:](v5, "setDuration:", v4);
  LODWORD(v6) = 0;
  -[CABasicAnimation setFromValue:](v5, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(-[THAnimationController p_objectForLayer:key:](self, "p_objectForLayer:key:", -[THAnimationController targetLayer](self, "targetLayer"), CFSTR("opacity")), "floatValue");
  -[CABasicAnimation setToValue:](v5, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  -[CABasicAnimation setFillMode:](v5, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v5, "setRemovedOnCompletion:", 0);
  return v5;
}

- (id)shadowFadeOutAnimation
{
  double v3;
  double v4;
  double v5;
  CABasicAnimation *v6;
  double v7;

  -[THAnimationController animationDuration](self, "animationDuration");
  v4 = v3;
  v5 = v3 * self->_shadowFadeOutDurationScale;
  v6 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("shadowOpacity"));
  -[CABasicAnimation setTimingFunction:](v6, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  -[CABasicAnimation setBeginTime:](v6, "setBeginTime:", v4 - v5 + CACurrentMediaTime());
  -[CABasicAnimation setDuration:](v6, "setDuration:", v5);
  LODWORD(v7) = 0;
  -[CABasicAnimation setToValue:](v6, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  -[CABasicAnimation setFillMode:](v6, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v6, "setRemovedOnCompletion:", 0);
  return v6;
}

- (id)fadeInOnDelayAnimationToOpacity:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CABasicAnimation *v9;
  double v10;
  double v11;

  -[THAnimationController animationDuration](self, "animationDuration");
  v6 = v5;
  -[THAnimationController animationDuration](self, "animationDuration");
  v8 = v7 * 0.899999976;
  v9 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  -[CABasicAnimation setTimingFunction:](v9, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  -[CABasicAnimation setBeginTime:](v9, "setBeginTime:", v6 + CACurrentMediaTime());
  -[CABasicAnimation setDuration:](v9, "setDuration:", v8);
  LODWORD(v10) = 0;
  -[CABasicAnimation setFromValue:](v9, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
  *(float *)&v11 = a3;
  -[CABasicAnimation setToValue:](v9, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
  -[CABasicAnimation setFillMode:](v9, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v9, "setRemovedOnCompletion:", 0);
  return v9;
}

- (id)sourceShadowFadeOutAnimation
{
  double v2;
  double v3;
  CABasicAnimation *v4;
  double v5;

  -[THAnimationController animationDuration](self, "animationDuration");
  v3 = v2 * 0.150000006;
  v4 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  -[CABasicAnimation setTimingFunction:](v4, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  -[CABasicAnimation setDuration:](v4, "setDuration:", v3);
  LODWORD(v5) = 0;
  -[CABasicAnimation setToValue:](v4, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  -[CABasicAnimation setFillMode:](v4, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v4, "setRemovedOnCompletion:", 0);
  return v4;
}

- (id)shadowTransformAnimation
{
  id v3;
  void *v5;
  double v6;
  double v7;
  THAnimatableSource *v8;
  THAnimatableDestination *v9;
  CABasicAnimation *v10;
  double v11;
  CATransform3D v13;
  CGAffineTransform m;
  CATransform3D v15;
  CGAffineTransform v16[2];

  v3 = -[THAnimatableSource shadowAnimationLayer](-[THAnimationController source](self, "source"), "shadowAnimationLayer");
  if (self->_shadowTransformDurationScale <= 0.0 || v3 == 0)
    return 0;
  v5 = v3;
  if ((objc_opt_respondsToSelector(-[THAnimationController source](self, "source"), "shadowAnimationLayerDestinationTransform:uniformTargetScale:") & 1) == 0)return 0;
  -[THAnimationController animationDuration](self, "animationDuration");
  v7 = v6;
  objc_msgSend(v5, "affineTransform");
  memset(v16, 0, sizeof(v16));
  v8 = -[THAnimationController source](self, "source");
  v9 = -[THAnimationController destination](self, "destination");
  if (v8)
    -[THAnimatableSource shadowAnimationLayerDestinationTransform:uniformTargetScale:](v8, "shadowAnimationLayerDestinationTransform:uniformTargetScale:", v9, self->_uniformTargetScale);
  else
    memset(v16, 0, 48);
  v11 = v7 * self->_shadowTransformDurationScale;
  v10 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform"));
  -[CABasicAnimation setTimingFunction:](v10, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  -[CABasicAnimation setDuration:](v10, "setDuration:", v11);
  m = v16[1];
  CATransform3DMakeAffineTransform(&v15, &m);
  -[CABasicAnimation setFromValue:](v10, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v15));
  m = v16[0];
  CATransform3DMakeAffineTransform(&v13, &m);
  -[CABasicAnimation setToValue:](v10, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v13));
  -[CABasicAnimation setFillMode:](v10, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setRemovedOnCompletion:](v10, "setRemovedOnCompletion:", 0);
  return v10;
}

- (void)performAnimation
{
  NSMutableArray *mObservers;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnimationController performAnimation]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnimationController.m"), 1046, CFSTR("Manipulating UI outside main thread."));
  -[THAnimationController addForegroundFadeAnimation](self, "addForegroundFadeAnimation");
  -[THAnimationController addContentAnimation](self, "addContentAnimation");
  -[THAnimationController addBackgroundFadeOutAnimation](self, "addBackgroundFadeOutAnimation");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  mObservers = self->mObservers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mObservers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mObservers);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "animationController:updateWhitePointAdaptivtyStyleWithDuration:") & 1) != 0)
        {
          -[THAnimationController animationDuration](self, "animationDuration");
          objc_msgSend(v8, "animationController:updateWhitePointAdaptivtyStyleWithDuration:", self);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mObservers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (double)p_rotationAngleFromTransform:(CGAffineTransform *)a3
{
  return atan2(a3->c + a3->a * 0.0 + a3->tx - (a3->tx - (a3->c - a3->a * 0.0)), a3->d + a3->b * 0.0 + a3->ty - (a3->ty - (a3->d - a3->b * 0.0)));
}

- (CGRect)p_targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v7 = height;
  v8 = width;
  v9 = y;
  v10 = CGRectNull.origin.x;
  if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "ftcTargetFrame") & 1) != 0)
  {
    -[THAnimatableDestination ftcTargetFrame](-[THAnimationController destination](self, "destination"), "ftcTargetFrame");
    v10 = v11;
    v9 = v12;
    v8 = v13;
    v7 = v14;
  }
  v32.origin.x = v10;
  v32.origin.y = v9;
  v32.size.width = v8;
  v32.size.height = v7;
  if (CGRectIsEmpty(v32))
  {
    v15 = -[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer");
    if (-[THAnimationController hostLayer](self, "hostLayer"))
    {
      if (v15 && objc_msgSend(v15, "superlayer"))
      {
        if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "targetFrameForSource:") & 1) != 0)
        {
          -[THAnimatableDestination targetFrameForSource:](-[THAnimationController destination](self, "destination"), "targetFrameForSource:", -[THAnimationController source](self, "source"));
          x = v16;
          y = v17;
          width = v18;
          height = v19;
        }
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        if (CGRectIsEmpty(v33))
        {
          objc_msgSend(v15, "frame");
          x = v20;
          y = v21;
          width = v22;
          height = v23;
        }
        -[CALayer convertRect:fromLayer:](-[THAnimationController hostLayer](self, "hostLayer"), "convertRect:fromLayer:", objc_msgSend(v15, "superlayer"), x, y, width, height);
        v10 = v24;
        v9 = v25;
        v8 = v26;
        v7 = v27;
      }
    }
  }
  v28 = v10;
  v29 = v9;
  v30 = v8;
  v31 = v7;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)p_objectForLayer:(id)a3 key:(id)a4
{
  return -[TSULayerSaveRestore objectForLayer:key:](-[THAnimationController layerSaveRestore](self, "layerSaveRestore"), "objectForLayer:key:", a3, a4);
}

- (void)p_saveLayer:(id)a3
{
  if (a3)
    -[TSULayerSaveRestore saveLayer:](-[THAnimationController layerSaveRestore](self, "layerSaveRestore"), "saveLayer:", a3);
}

- (void)p_restoreLayer:(id)a3
{
  if (a3)
    -[TSULayerSaveRestore restoreLayer:](-[THAnimationController layerSaveRestore](self, "layerSaveRestore"), "restoreLayer:", a3);
}

- (double)p_scaleForTargetLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = 1.0;
  if (-[THAnimationController targetLayer](self, "targetLayer")
    && -[THAnimatableDestination shouldFadeInTargetLayer:](-[THAnimationController destination](self, "destination"), "shouldFadeInTargetLayer:", -[THAnimationController source](self, "source")))
  {
    objc_msgSend(-[THAnimatableSource animationLayer](-[THAnimationController source](self, "source"), "animationLayer"), "frame");
    v5 = v4;
    v7 = v6;
    objc_msgSend(-[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination"), "targetLayer"), "frame");
    v9 = v8;
    v11 = v10;
    if ((objc_opt_respondsToSelector(-[THAnimationController destination](self, "destination"), "shouldAnimateToFit") & 1) != 0
      && -[THAnimatableDestination shouldAnimateToFit](-[THAnimationController destination](self, "destination"), "shouldAnimateToFit"))
    {
      v12 = THScaleNeededToFitSizeInSize(v5, v7, v9, v11);
    }
    else
    {
      v12 = THScaleNeededToFillSizeInSize(v5, v7, v9, v11);
    }
    if (v12 <= 0.0)
      return 1.0;
    else
      return 1.0 / v12;
  }
  return v3;
}

- (double)p_scaleForAnimationLayer
{
  unsigned int v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = -[THAnimationController shouldAnimateTargetLayer](self, "shouldAnimateTargetLayer");
  result = 1.0;
  if (v3)
  {
    objc_msgSend(-[THAnimatableDestination targetLayer](-[THAnimationController destination](self, "destination", 1.0), "targetLayer"), "frame");
    v6 = v5;
    v8 = v7;
    -[CALayer frame](-[THAnimationController fadeOutAnimationLayer](self, "fadeOutAnimationLayer"), "frame");
    result = THScaleNeededToFillSizeInSize(v6, v8, v9, v10);
    if (result <= 0.0)
      return 1.0;
  }
  return result;
}

- (BOOL)p_shouldCrossFade
{
  return -[THAnimationController fadeOutAnimationLayer](self, "fadeOutAnimationLayer") != 0;
}

- (THAnimatableSource)source
{
  return self->mSource;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THAnimatableDestination)destination
{
  return self->mDestination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CALayer)hostLayer
{
  return self->mHostLayer;
}

- (void)setHostLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CALayer)foregroundLayer
{
  return self->mForegroundLayer;
}

- (void)setForegroundLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CALayer)backgroundLayer
{
  return self->mBackgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CALayer)layerToAnimateUnder
{
  return self->_layerToAnimateUnder;
}

- (void)setLayerToAnimateUnder:(id)a3
{
  self->_layerToAnimateUnder = (CALayer *)a3;
}

- (double)shadowFadeOutDurationScale
{
  return self->_shadowFadeOutDurationScale;
}

- (void)setShadowFadeOutDurationScale:(double)a3
{
  self->_shadowFadeOutDurationScale = a3;
}

- (double)shadowTransformDurationScale
{
  return self->_shadowTransformDurationScale;
}

- (void)setShadowTransformDurationScale:(double)a3
{
  self->_shadowTransformDurationScale = a3;
}

- (TSULayerSaveRestore)layerSaveRestore
{
  return self->_layerSaveRestore;
}

- (void)setLayerSaveRestore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (void)setWrapperLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CALayer)interiorWrapperLayer
{
  return self->_interiorWrapperLayer;
}

- (void)setInteriorWrapperLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CGPoint)initialLayerPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLayerPosition.x;
  y = self->_initialLayerPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLayerPosition:(CGPoint)a3
{
  self->_initialLayerPosition = a3;
}

- (CGSize)initialLayerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialLayerSize.width;
  height = self->_initialLayerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInitialLayerSize:(CGSize)a3
{
  self->_initialLayerSize = a3;
}

- (double)uniformTargetScale
{
  return self->_uniformTargetScale;
}

- (CALayer)sourceShadowLayer
{
  return self->_sourceShadowLayer;
}

- (void)setSourceShadowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CALayer)sourceReflectionLayer
{
  return self->_sourceReflectionLayer;
}

- (void)setSourceReflectionLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (CALayer)sourceOverlayLayer
{
  return self->_sourceOverlayLayer;
}

- (void)setSourceOverlayLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setTargetShadowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setTargetReflectionLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (BOOL)shouldAnimateTargetLayer
{
  return self->_shouldAnimateTargetLayer;
}

- (void)setShouldAnimateTargetLayer:(BOOL)a3
{
  self->_shouldAnimateTargetLayer = a3;
}

- (BOOL)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(BOOL)a3
{
  self->_overshoot = a3;
}

@end
