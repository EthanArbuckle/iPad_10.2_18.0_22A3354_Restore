@implementation PropertyCollectingAnimationState

- (_TtC5UIKit32PropertyCollectingAnimationState)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC5UIKit32PropertyCollectingAnimationState *v5;
  _TtC5UIKit32PropertyCollectingAnimationState *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC5UIKit32PropertyCollectingAnimationState_capturedProperties;
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1856A153C(MEMORY[0x1E0DEE9D8]);

  v8.receiver = v5;
  v8.super_class = ObjectType;
  v6 = -[UIView.InProcessAnimationState init](&v8, sel_init);
  -[UIViewAnimationState setDisallowInheritance:](v6, sel_setDisallowInheritance_, 1);
  return v6;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC5UIKit32PropertyCollectingAnimationState *v13;
  void *v14;

  if (a4)
  {
    v8 = sub_1865074F8();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = (void *)sub_18564305C((uint64_t)a3, v8, v10, a5);

  swift_bridgeObjectRelease();
  return v14;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
