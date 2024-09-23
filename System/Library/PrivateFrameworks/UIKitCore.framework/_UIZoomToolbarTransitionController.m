@implementation _UIZoomToolbarTransitionController

- (void)prepareTransitionWithToolbar:(id)a3
{
  id v4;
  _TtC5UIKit34_UIZoomToolbarTransitionController *v5;
  objc_class *v6;
  id v7;

  v4 = a3;
  v5 = self;
  sub_18563E93C(v4);
  v7 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_toolbarSnapshot);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_toolbarSnapshot) = v6;

}

- (void)beginTransitionWithToolbar:(id)a3 items:(id)a4 animated:(BOOL)a5
{
  id v7;
  _TtC5UIKit34_UIZoomToolbarTransitionController *v8;

  sub_1851F9080(0, (unint64_t *)&qword_1EDD82888);
  sub_186507654();
  v7 = a3;
  v8 = self;
  sub_18563EC44(v7);

  swift_bridgeObjectRelease();
}

- (void)cancelTransition
{
  _TtC5UIKit34_UIZoomToolbarTransitionController *v2;

  v2 = self;
  sub_18563E684();

}

- (void)endTransition
{
  _TtC5UIKit34_UIZoomToolbarTransitionController *v2;

  v2 = self;
  sub_18563E684();

}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC5UIKit34_UIZoomToolbarTransitionController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_18563E684();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[_UIZoomToolbarTransitionController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_toolbarSnapshot));
}

- (_TtC5UIKit34_UIZoomToolbarTransitionController)init
{
  _TtC5UIKit34_UIZoomToolbarTransitionController *result;

  result = (_TtC5UIKit34_UIZoomToolbarTransitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
