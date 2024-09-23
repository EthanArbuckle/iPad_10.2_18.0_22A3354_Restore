@implementation _UISoftOutlineView.Layer

- (double)cornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  -[_UISoftOutlineView.Layer cornerRadius](&v3, sel_cornerRadius);
  return result;
}

- (void)setCornerRadius:(double)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  v4 = v6.receiver;
  -[_UISoftOutlineView.Layer setCornerRadius:](&v6, sel_setCornerRadius_, a3);
  if (objc_msgSend(v4, sel_delegate, v6.receiver, v6.super_class))
  {
    objc_opt_self();
    v5 = (void *)swift_dynamicCastObjCClass();
    if (!v5)
      swift_unknownObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, sel_setNeedsLayout);

}

- (NSString)cornerCurve
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  return -[_UISoftOutlineView.Layer cornerCurve](&v3, sel_cornerCurve);
}

- (void)setCornerCurve:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  v4 = a3;
  v5 = v7.receiver;
  -[_UISoftOutlineView.Layer setCornerCurve:](&v7, sel_setCornerCurve_, v4);
  if (objc_msgSend(v5, sel_delegate, v7.receiver, v7.super_class))
  {
    objc_opt_self();
    v6 = (void *)swift_dynamicCastObjCClass();
    if (!v6)
      swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, sel_setNeedsLayout);

}

- (unint64_t)maskedCorners
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  return -[_UISoftOutlineView.Layer maskedCorners](&v3, sel_maskedCorners);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  v4 = v6.receiver;
  -[_UISoftOutlineView.Layer setMaskedCorners:](&v6, sel_setMaskedCorners_, a3);
  if (objc_msgSend(v4, sel_delegate, v6.receiver, v6.super_class))
  {
    objc_opt_self();
    v5 = (void *)swift_dynamicCastObjCClass();
    if (!v5)
      swift_unknownObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, sel_setNeedsLayout);

}

- (_TtCC5UIKit18_UISoftOutlineViewP33_6543E4A9BA4D95B192A4BB42EE640B4D5Layer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  return -[_UISoftOutlineView.Layer init](&v3, sel_init);
}

- (_TtCC5UIKit18_UISoftOutlineViewP33_6543E4A9BA4D95B192A4BB42EE640B4D5Layer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtCC5UIKit18_UISoftOutlineViewP33_6543E4A9BA4D95B192A4BB42EE640B4D5Layer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_186507B1C();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_0Tm(v8, v8[3]);
  v4 = sub_186507FB4();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  v5 = -[_UISoftOutlineView.Layer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v8);
  return v5;
}

- (_TtCC5UIKit18_UISoftOutlineViewP33_6543E4A9BA4D95B192A4BB42EE640B4D5Layer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UISoftOutlineView.Layer();
  return -[_UISoftOutlineView.Layer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
