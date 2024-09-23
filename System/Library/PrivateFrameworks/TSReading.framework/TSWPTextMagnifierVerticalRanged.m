@implementation TSWPTextMagnifierVerticalRanged

+ (id)sharedRangedMagnifier
{
  id result;

  result = (id)+[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier]::SharedInstance;
  if (!+[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier]::SharedInstance)
  {
    result = -[TSWPTextMagnifierVerticalRanged initWithDefaultFrame]([TSWPTextMagnifierVerticalRanged alloc], "initWithDefaultFrame");
    +[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier]::SharedInstance = (uint64_t)result;
  }
  return result;
}

- (TSWPTextMagnifierVerticalRanged)initWithDefaultFrame
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierVerticalRanged;
  return -[TSWPTextMagnifierRanged initWithFrame:](&v3, sel_initWithFrame_, 0.0, 0.0, 65.0, 150.0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPTextMagnifierVerticalRanged;
  -[TSWPTextMagnifierRanged dealloc](&v2, sel_dealloc);
}

- (void)zoomLeftAnimation
{
  CGFloat MaxX;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  memset(&v8, 0, sizeof(v8));
  -[TSWPTextMagnifierVerticalRanged bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v9);
  CGAffineTransformMakeTranslation(&v8, MaxX * 0.5, 0.0);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v5 = v7;
  -[TSWPTextMagnifierVerticalRanged setTransform:](self, "setTransform:", &v5);
  -[TSWPTextMagnifierVerticalRanged setAlpha:](self, "setAlpha:", 0.0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TSWPTextMagnifierVerticalRanged_zoomLeftAnimation__block_invoke;
  v4[3] = &unk_24D829278;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.1);
}

uint64_t __52__TSWPTextMagnifierVerticalRanged_zoomLeftAnimation__block_invoke(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
}

- (void)zoomRightAnimation
{
  double v3;
  CGFloat v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[TSWPTextMagnifierRanged animationPoint](self, "animationPoint");
  self->super._magnificationPoint.x = v3 + -8.0;
  self->super._magnificationPoint.y = v4;
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke;
  v6[3] = &unk_24D829278;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke_2;
  v5[3] = &unk_24D82A8D0;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v6, v5, 0.2);
}

uint64_t __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke(uint64_t a1)
{
  CGFloat MaxX;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 32), "updateFrame");
  memset(&v8, 0, sizeof(v8));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  MaxX = CGRectGetMaxX(v9);
  CGAffineTransformMakeTranslation(&v8, MaxX * 0.5, 0.0);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v3 = *(void **)(a1 + 32);
  v5 = v7;
  objc_msgSend(v3, "setTransform:", &v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.25);
}

uint64_t __53__TSWPTextMagnifierVerticalRanged_zoomRightAnimation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "remove");
  return objc_msgSend(*(id *)(a1 + 32), "setTarget:", 0);
}

- (double)currentOffset
{
  double result;
  double v3;

  result = 19.0;
  if (!self->super._inPlace)
  {
    -[TSWPTextMagnifierRanged offset](self, "offset", 19.0);
    return v3 + 41.0 + 7.0;
  }
  return result;
}

- (void)updateFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = (void *)-[TSWPTextMagnifierVerticalRanged superview](self, "superview");
  -[TSWPTextMagnifierRanged magnificationPoint](self, "magnificationPoint");
  objc_msgSend(v3, "convertPoint:fromView:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target"), "interactiveCanvasController"), "layerHost"), "canvasView"), v4, v5);
  v7 = v6;
  v9 = v8;
  -[TSWPTextMagnifierVerticalRanged bounds](self, "bounds");
  v11 = v10 * 0.5;
  self->super._inPlace = v7 + v10 * 0.5 + -41.0 < 45.0;
  -[TSWPTextMagnifierVerticalRanged currentOffset](self, "currentOffset");
  v13 = v7 - v12;
  if (v13 < v11)
    v13 = v11;
  -[TSWPTextMagnifierVerticalRanged setCenter:](self, "setCenter:", round(v13) + -0.5, round(v9) + 0.5);
}

- (void)remove
{
  __int128 v3;
  _OWORD v4[3];

  -[TSWPTextMagnifierRenderer tearDown](self->super._magnifierRenderer, "tearDown");
  -[TSWPTextMagnifierVerticalRanged removeFromSuperview](self, "removeFromSuperview");
  -[TSWPTextMagnifierVerticalRanged setAlpha:](self, "setAlpha:", 1.0);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSWPTextMagnifierVerticalRanged setTransform:](self, "setTransform:", v4);
  -[TSWPTextMagnifierRanged setFrame:](self, "setFrame:", 0.0, 0.0, 65.0, 150.0);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  double v9;
  double v10;
  double v13;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  objc_msgSend(+[TSWPTextMagnifierCaret sharedCaretMagnifier](TSWPTextMagnifierCaret, "sharedCaretMagnifier"), "stopMagnifying:", 0);
  -[TSWPTextMagnifierRanged setTarget:](self, "setTarget:", a3);
  -[TSWPTextMagnifierTimeWeightedPoint clearHistory](self->super._weightedPoint, "clearHistory");
  -[TSWPTextMagnifierRanged setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
  -[TSWPTextMagnifierVerticalRanged setNeedsLayout](self, "setNeedsLayout");
  -[TSWPTextMagnifierRanged setNeedsDisplay](self, "setNeedsDisplay");
  if (!-[TSWPTextMagnifierVerticalRanged window](self, "window"))
    objc_msgSend(+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "canvasView")), "addSubview:", self);
  v13 = 0.0;
  if (x >= 0.0)
    v13 = x;
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", round(v13), round(y));
  -[TSWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6)
    -[TSWPTextMagnifierVerticalRanged zoomLeftAnimation](self, "zoomLeftAnimation");
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    -[TSWPTextMagnifierVerticalRanged zoomRightAnimation](self, "zoomRightAnimation");
  }
  else
  {
    -[TSWPTextMagnifierVerticalRanged remove](self, "remove");
    -[TSWPTextMagnifierRanged setTarget:](self, "setTarget:", 0);
  }
  self->super._magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (id)underlayImageName
{
  return CFSTR("kb-magnifier-vertical-ranged-lo");
}

- (id)overlayImageName
{
  return CFSTR("kb-magnifier-vertical-ranged-hi");
}

- (id)maskImageName
{
  return CFSTR("kb-magnifier-vertical-ranged-mask");
}

- (BOOL)shouldHideCanvasLayer
{
  uint64_t v2;
  void *v3;
  void *v4;

  -[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target"), "interactiveCanvasController");
  objc_opt_class();
  v2 = TSUDynamicCast();
  if (v2 && (v3 = (void *)v2, objc_opt_class(), objc_msgSend(v3, "layerHost"), (v4 = (void *)TSUDynamicCast()) != 0))
    return objc_msgSend(v4, "shouldHideCanvasLayerInMagnifier");
  else
    return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  TSDInteractiveCanvasController *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGImage *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  TSWPRep *v46;
  double v47;
  double v48;
  double v49;
  TSDInteractiveCanvasController *v50;
  void *v51;
  CGContext *v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target", a3), "interactiveCanvasController");
  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](v6, "layerHost");
  v7 = (void *)TSUDynamicCast();
  v8 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "canvasView");
  -[TSWPTextMagnifierVerticalRanged frame](self, "frame");
  objc_msgSend(v8, "convertRect:fromView:", -[TSWPTextMagnifierVerticalRanged superview](self, "superview"), v9 + -18.0, v11, v10 + -3.0 + -18.0, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  CGContextSaveGState(a4);
  -[TSWPTextMagnifierVerticalRanged frame](self, "frame");
  v22 = v21;
  -[TSWPTextMagnifierVerticalRanged frame](self, "frame");
  v24 = v23;
  v25 = (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierVerticalRanged maskImageName](self, "maskImageName"), TSWPBundle(), 0), "CGImage");
  v62.origin.x = 0.0;
  v62.origin.y = 0.0;
  v62.size.width = v22;
  v62.size.height = v24;
  CGContextClipToMask(a4, v62, v25);
  if (v6)
  {
    v26 = (void *)objc_msgSend(v7, "backgroundColorForMagnifier");
    if (v26)
    {
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v26, "CGColor"));
      v63.origin.x = 0.0;
      v63.origin.y = 0.0;
      v63.size.width = v22;
      v63.size.height = v24;
      CGContextFillRect(a4, v63);
    }
  }
  CGContextScaleCTM(a4, 1.2, 1.2);
  -[TSWPTextMagnifierVerticalRanged currentOffset](self, "currentOffset");
  v28 = v27;
  objc_opt_class();
  -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](v6, "editorController"), "textInputEditor");
  v29 = (void *)objc_msgSend((id)TSUDynamicCast(), "selection");
  v30 = -[TSDKnob tag](-[TSDKnobTracker knob](-[TSDRep currentKnobTracker](-[TSWPTextMagnifierRanged target](self, "target"), "currentKnobTracker"), "knob"), "tag");
  if (v30 == 11)
    v31 = objc_msgSend(v29, "start");
  else
    v31 = objc_msgSend(v29, "end");
  v32 = v31;
  v33 = v14 + v28;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v34 = -[TSWPRep columns](-[TSWPTextMagnifierRanged target](self, "target"), "columns");
  v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v35)
  {
    v36 = v35;
    v50 = v6;
    v51 = v8;
    v52 = a4;
    v37 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v57 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v40 = objc_msgSend(v39, "lineFragmentForCharIndex:knobTag:selectionType:", v32, v30, objc_msgSend(v29, "type"));
        if (v40)
        {
          v41 = v40;
          v42 = 0uLL;
          v43 = 0uLL;
          v44 = 0uLL;
          v45 = 0uLL;
          if (v39)
          {
            objc_msgSend(v39, "transformFromWP", 0.0, 0.0, 0.0);
            v42 = 0uLL;
            v44 = v53;
            v45 = v54;
            v43 = v55;
          }
          v46 = -[TSWPTextMagnifierRanged target](self, "target", vaddq_f64(v43, vmlaq_f64(vmulq_n_f64(v45, *(double *)(v41 + 32) + *(double *)(v41 + 40)), v42, v44)));
          -[TSDRep convertNaturalPointToUnscaledCanvas:](v46, "convertNaturalPointToUnscaledCanvas:", v48, v49);
          -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v50, "convertUnscaledToBoundsPoint:");
          v33 = 21.0 - v47;
          goto LABEL_19;
        }
      }
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v36)
        continue;
      break;
    }
LABEL_19:
    v8 = v51;
    a4 = v52;
  }
  CGContextTranslateCTM(a4, v33, -v16);
  CGContextTranslateCTM(a4, v18 * -0.100000001, v20 * -0.100000001);
  objc_msgSend((id)objc_msgSend(v8, "canvasLayer"), "renderInContext:", a4);
  CGContextRestoreGState(a4);
}

@end
