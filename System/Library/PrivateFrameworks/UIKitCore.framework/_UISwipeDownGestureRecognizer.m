@implementation _UISwipeDownGestureRecognizer

- (BOOL)_willScrollX
{
  return 0;
}

- (BOOL)_willScrollY
{
  _TtC5UIKit29_UISwipeDownGestureRecognizer *v2;
  char v3;

  v2 = self;
  v3 = sub_1856C1728();

  return v3 & 1;
}

- (int64_t)state
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[UIGestureRecognizer state](&v3, sel_state);
}

- (void)setState:(int64_t)a3
{
  objc_class *ObjectType;
  _TtC5UIKit29_UISwipeDownGestureRecognizer *v6;
  UIView *v7;
  _TtC5UIKit29_UISwipeDownGestureRecognizer *v8;
  objc_super v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  -[UIGestureRecognizer setState:](&v10, sel_setState_, a3);
  v9.receiver = v6;
  v9.super_class = ObjectType;
  if ((id)-[UIGestureRecognizer state](&v9, sel_state) == (id)1)
  {
    v7 = -[UIGestureRecognizer view](v6, sel_view);
    if (v7)
    {
      v8 = (_TtC5UIKit29_UISwipeDownGestureRecognizer *)v7;
      -[UIPanGestureRecognizer translationInView:](v6, sel_translationInView_, v7);
      -[UIPanGestureRecognizer setTranslation:inView:](v6, sel_setTranslation_inView_, v8, 0.0);

      v6 = v8;
    }
  }

}

- (_TtC5UIKit29_UISwipeDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC5UIKit29_UISwipeDownGestureRecognizer *)sub_1856C1A68((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit29_UISwipeDownGestureRecognizer_lastTouchPoint));
}

@end
