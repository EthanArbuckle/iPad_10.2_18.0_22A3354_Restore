@implementation TSWPTextMagnifierHorizontalRanged

+ (id)sharedRangedMagnifier
{
  return 0;
}

- (TSWPTextMagnifierHorizontalRanged)initWithDefaultFrame
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierHorizontalRanged;
  return -[TSWPTextMagnifierRanged initWithFrame:](&v3, sel_initWithFrame_, 0.0, 0.0, 145.0, 59.0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPTextMagnifierHorizontalRanged;
  -[TSWPTextMagnifierRanged dealloc](&v2, sel_dealloc);
}

- (void)zoomUpAnimation
{
  CGFloat MaxY;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  memset(&v8, 0, sizeof(v8));
  -[TSWPTextMagnifierHorizontalRanged bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v5 = v7;
  -[TSWPTextMagnifierHorizontalRanged setTransform:](self, "setTransform:", &v5);
  -[TSWPTextMagnifierHorizontalRanged setAlpha:](self, "setAlpha:", 0.0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TSWPTextMagnifierHorizontalRanged_zoomUpAnimation__block_invoke;
  v4[3] = &unk_24D829278;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.1);
}

uint64_t __52__TSWPTextMagnifierHorizontalRanged_zoomUpAnimation__block_invoke(uint64_t a1)
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

- (void)zoomDownAnimation
{
  double v3;
  CGFloat v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[TSWPTextMagnifierRanged animationPoint](self, "animationPoint");
  self->super._magnificationPoint.x = v4;
  self->super._magnificationPoint.y = v3 + 8.0;
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke;
  v6[3] = &unk_24D829278;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke_2;
  v5[3] = &unk_24D82A8D0;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v6, v5, 0.2);
}

uint64_t __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke(uint64_t a1)
{
  CGFloat MaxY;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 32), "updateFrame");
  memset(&v8, 0, sizeof(v8));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v3 = *(void **)(a1 + 32);
  v5 = v7;
  objc_msgSend(v3, "setTransform:", &v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.25);
}

uint64_t __54__TSWPTextMagnifierHorizontalRanged_zoomDownAnimation__block_invoke_2(uint64_t a1)
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
  double v14;

  v3 = (void *)-[TSWPTextMagnifierHorizontalRanged superview](self, "superview");
  -[TSWPTextMagnifierRanged magnificationPoint](self, "magnificationPoint");
  objc_msgSend(v3, "convertPoint:fromView:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target"), "interactiveCanvasController"), "layerHost"), "canvasView"), v4, v5);
  v7 = v6;
  v9 = v8;
  -[TSWPTextMagnifierHorizontalRanged bounds](self, "bounds");
  v11 = v10 * 0.5;
  self->super._inPlace = v9 + v10 * 0.5 + -41.0 < 45.0;
  -[TSWPTextMagnifierHorizontalRanged currentOffset](self, "currentOffset");
  v13 = v9 - v12;
  if (v13 >= v11)
    v14 = v13;
  else
    v14 = v11;
  -[TSWPTextMagnifierHorizontalRanged setCenter:](self, "setCenter:", round(v7) + 0.5, round(v14) + 0.5);
}

- (void)remove
{
  __int128 v3;
  _OWORD v4[3];

  -[TSWPTextMagnifierRenderer tearDown](self->super._magnifierRenderer, "tearDown");
  -[TSWPTextMagnifierHorizontalRanged removeFromSuperview](self, "removeFromSuperview");
  -[TSWPTextMagnifierHorizontalRanged setAlpha:](self, "setAlpha:", 1.0);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSWPTextMagnifierHorizontalRanged setTransform:](self, "setTransform:", v4);
  -[TSWPTextMagnifierRanged setFrame:](self, "setFrame:", 0.0, 0.0, 145.0, 59.0);
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
  -[TSWPTextMagnifierHorizontalRanged setNeedsLayout](self, "setNeedsLayout");
  -[TSWPTextMagnifierRanged setNeedsDisplay](self, "setNeedsDisplay");
  if (!-[TSWPTextMagnifierHorizontalRanged window](self, "window"))
    objc_msgSend(+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "canvasView")), "addSubview:", self);
  if (y >= 0.0)
    v13 = y;
  else
    v13 = 0.0;
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", round(x), round(v13));
  -[TSWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6)
    -[TSWPTextMagnifierHorizontalRanged zoomUpAnimation](self, "zoomUpAnimation");
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    -[TSWPTextMagnifierHorizontalRanged zoomDownAnimation](self, "zoomDownAnimation");
  }
  else
  {
    -[TSWPTextMagnifierHorizontalRanged remove](self, "remove");
    -[TSWPTextMagnifierRanged setTarget:](self, "setTarget:", 0);
  }
  self->super._magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
  -[TSWPTextMagnifierRanged setOffset:](self, "setOffset:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[TSWPTextMagnifierHorizontalRanged setShouldIgnoreTextInputEditor:](self, "setShouldIgnoreTextInputEditor:", 0);
}

- (id)underlayImageName
{
  return CFSTR("kb-magnifier-ranged-lo");
}

- (id)overlayImageName
{
  return CFSTR("kb-magnifier-ranged-hi");
}

- (id)maskImageName
{
  return CFSTR("kb-magnifier-ranged-mask");
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
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  double v41;
  double v42;
  TSDInteractiveCanvasController *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSDRep interactiveCanvasController](-[TSWPTextMagnifierRanged target](self, "target", a3), "interactiveCanvasController");
  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](v6, "layerHost");
  v7 = (void *)TSUDynamicCast();
  v8 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "canvasView");
  -[TSWPTextMagnifierHorizontalRanged frame](self, "frame");
  objc_msgSend(v8, "convertRect:fromView:", -[TSWPTextMagnifierHorizontalRanged superview](self, "superview"), v11, v9 + 3.0, v12, v10 + -3.0 + -18.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  CGContextSaveGState(a4);
  -[TSWPTextMagnifierHorizontalRanged frame](self, "frame");
  v22 = v21;
  -[TSWPTextMagnifierHorizontalRanged frame](self, "frame");
  v24 = v23;
  v25 = (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierHorizontalRanged maskImageName](self, "maskImageName"), TSWPBundle(), 0), "CGImage");
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v50.size.width = v22;
  v50.size.height = v24;
  CGContextClipToMask(a4, v50, v25);
  if (v6)
  {
    v26 = (void *)objc_msgSend(v7, "backgroundColorForMagnifier");
    if (v26)
    {
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v26, "CGColor"));
      v51.origin.x = 0.0;
      v51.origin.y = 0.0;
      v51.size.width = v22;
      v51.size.height = v24;
      CGContextFillRect(a4, v51);
    }
  }
  CGContextScaleCTM(a4, 1.2, 1.2);
  -[TSWPTextMagnifierHorizontalRanged currentOffset](self, "currentOffset");
  v28 = -v16 - v27;
  objc_opt_class();
  -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](v6, "editorController"), "textInputEditor");
  v29 = TSUDynamicCast();
  if (v29 && !*(&self->super._inPlace + 1))
  {
    v30 = (void *)v29;
    objc_opt_class();
    objc_msgSend(v30, "selection");
    v31 = (void *)TSUDynamicCast();
    v32 = -[TSDKnob tag](-[TSDKnobTracker knob](-[TSDRep currentKnobTracker](-[TSWPTextMagnifierRanged target](self, "target"), "currentKnobTracker"), "knob"), "tag");
    if (objc_msgSend(v31, "isVisual"))
    {
      v33 = v32 == 11 ? objc_msgSend(v31, "headChar") : objc_msgSend(v31, "tailChar");
    }
    else if (v32 == 11)
    {
      v33 = objc_msgSend(v31, "start");
    }
    else
    {
      v33 = v32
          ? objc_msgSend(v31, "end")
          : -[TSWPRep charIndexForPointWithPinning:](-[TSWPTextMagnifierRanged target](self, "target"), "charIndexForPointWithPinning:", v14, v16);
    }
    v34 = v33;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = -[TSWPRep columns](-[TSWPTextMagnifierRanged target](self, "target"), "columns");
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v36)
    {
      v37 = v36;
      v43 = v6;
      v38 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v45 != v38)
            objc_enumerationMutation(v35);
          v40 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "lineFragmentForCharIndex:knobTag:selectionType:", v34, v32, objc_msgSend(v31, "type"));
          if (v40)
          {
            -[TSDRep convertNaturalPointToUnscaledCanvas:](-[TSWPTextMagnifierRanged target](self, "target"), "convertNaturalPointToUnscaledCanvas:", 0.0, *(double *)(v40 + 32) + *(double *)(v40 + 40));
            v6 = v43;
            -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v43, "convertUnscaledToBoundsPoint:");
            v42 = v41;
            v52.origin.x = v14;
            v52.origin.y = v16;
            v52.size.width = v18;
            v52.size.height = v20;
            v28 = CGRectGetHeight(v52) - v42 + -7.0;
            goto LABEL_25;
          }
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v37)
          continue;
        break;
      }
      v6 = v43;
    }
  }
LABEL_25:
  CGContextTranslateCTM(a4, -v14, v28);
  CGContextTranslateCTM(a4, v18 * -0.100000001, v20 * -0.100000001);
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "canvasLayer"), "renderInContext:", a4);
  CGContextRestoreGState(a4);
}

- (BOOL)shouldIgnoreTextInputEditor
{
  return *(&self->super._inPlace + 1);
}

- (void)setShouldIgnoreTextInputEditor:(BOOL)a3
{
  *(&self->super._inPlace + 1) = a3;
}

@end
