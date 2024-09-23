@implementation CRLWPTextKnob

- (CRLWPTextKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  CRLWPTextKnob *v7;
  CRLWPTextKnob *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLWPTextKnob;
  v7 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v10, "initWithType:position:radius:tag:onRep:", a3, a6, a7, a4.x, a4.y, a5);
  v8 = v7;
  if (v7)
    -[CRLCanvasKnob setWorksWhenEditingDisabled:](v7, "setWorksWhenEditingDisabled:", 1);
  return v8;
}

- (unint64_t)dragType
{
  return 1;
}

- (id)createKnobRenderable
{
  id v2;
  void *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLWPTextKnob;
  v2 = -[CRLCanvasKnob createKnobRenderable](&v6, "createKnobRenderable");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isRedesignedTextCursorEnabled"))
  {
    LODWORD(v4) = 0;
    objc_msgSend(v3, "setOpacity:", v4);
  }
  return v3;
}

- (BOOL)worksWithStylus
{
  return 1;
}

@end
