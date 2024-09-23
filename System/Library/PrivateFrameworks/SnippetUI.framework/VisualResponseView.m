@implementation VisualResponseView

- (_TtC9SnippetUI18VisualResponseView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21EE80BFC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC9SnippetUI18VisualResponseView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_21EE80C9C(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC9SnippetUI18VisualResponseView *v2;

  v2 = self;
  sub_21EE80D68();

}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)sub_21EE81944(self, (uint64_t)a2, (void (*)(void))sub_21EE80E3C, &qword_255492CF0);
}

- (_TtC9SnippetUI18VisualResponseView)initWithFrame:(CGRect)a3
{
  VisualResponseView.init(frame:)();
}

- (void).cxx_destruct
{

  sub_21EE8279C((uint64_t)self + OBJC_IVAR____TtC9SnippetUI18VisualResponseView_anyRootView, type metadata accessor for AnyRootView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SnippetUI18VisualResponseView_hostingViewController));
}

- (void)setInitialFocusIndex:(int64_t)a3
{
  _TtC9SnippetUI18VisualResponseView *v4;

  v4 = self;
  VisualResponseView.setInitialFocus(_:)(a3);

}

- (void)updateSharedState:(id)a3
{
  uint64_t v4;
  _TtC9SnippetUI18VisualResponseView *v5;

  v4 = sub_21F1135DC();
  v5 = self;
  VisualResponseView.updateSharedState(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)updateSharedStateData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC9SnippetUI18VisualResponseView *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_21F10EC14();
  v7 = v6;

  VisualResponseView.updateSharedStateData(_:)();
  sub_21EE1D6A0(v5, v7);

}

- (void)setAsrText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC9SnippetUI18VisualResponseView *v7;
  Swift::String v8;

  v4 = sub_21F11369C();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  VisualResponseView.setAsrText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setIsInAmbient:(BOOL)a3 withScaleFactor:(double)a4
{
  _TtC9SnippetUI18VisualResponseView *v4;

  v4 = self;
  VisualResponseView.setIsInAmbient(_:withScaleFactor:)();

}

- (void)setPlayerState:(int64_t)a3 aceId:(id)a4
{
  _TtC9SnippetUI18VisualResponseView *v5;

  sub_21F11369C();
  v5 = self;
  VisualResponseView.setPlayerState(_:aceId:)();

  swift_bridgeObjectRelease();
}

- (void)postSiriEvent:(int64_t)a3
{
  _TtC9SnippetUI18VisualResponseView *v3;

  v3 = self;
  VisualResponseView.postSiriEvent(_:)();

}

- (int64_t)currentIdiom
{
  int64_t result;

  VisualResponseView.currentIdiom.getter();
  return result;
}

- (void)setCurrentIdiom:(int64_t)a3
{
  _TtC9SnippetUI18VisualResponseView *v4;

  v4 = self;
  VisualResponseView.currentIdiom.setter(a3);

}

- (double)snippetWidth
{
  _TtC9SnippetUI18VisualResponseView *v2;
  double v3;
  double v4;

  v2 = self;
  VisualResponseView.snippetWidth.getter();
  v4 = v3;

  return v4;
}

- (void)setSnippetWidth:(double)a3
{
  _TtC9SnippetUI18VisualResponseView *v3;

  v3 = self;
  VisualResponseView.snippetWidth.setter();

}

- (VRXInteractionDelegate)interactionDelegate
{
  id v2;

  VisualResponseView.interactionDelegate.getter();
  return (VRXInteractionDelegate *)v2;
}

- (void)setInteractionDelegate:(id)a3
{
  _TtC9SnippetUI18VisualResponseView *v4;

  swift_unknownObjectRetain();
  v4 = self;
  VisualResponseView.interactionDelegate.setter();

}

- (int64_t)backgroundMaterial
{
  _TtC9SnippetUI18VisualResponseView *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  VisualResponseView.backgroundMaterial.getter();
  v4 = v3;

  return v4;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  _TtC9SnippetUI18VisualResponseView *v3;

  v3 = self;
  VisualResponseView.backgroundMaterial.setter();

}

- (NSArray)aceCommands
{
  return (NSArray *)sub_21EE81944(self, (uint64_t)a2, VisualResponseView.aceCommands.getter, &qword_255492CE8);
}

- (BOOL)containsComponentsWithAction
{
  _TtC9SnippetUI18VisualResponseView *v2;
  char v3;

  v2 = self;
  v3 = VisualResponseView.containsComponentsWithAction.getter();

  return v3 & 1;
}

- (BOOL)requestsKeyWindow
{
  _TtC9SnippetUI18VisualResponseView *v2;

  v2 = self;
  VisualResponseView.requestsKeyWindow.getter();

  return 0;
}

- (NSString)viewId
{
  return (NSString *)sub_21EE81C74((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseView.viewId.getter);
}

- (void)setViewId:(id)a3
{
  sub_21EE81D00(self, (uint64_t)a2, (uint64_t)a3, VisualResponseView.viewId.setter);
}

- (NSString)responseViewId
{
  return (NSString *)sub_21EE81C74((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseView.responseViewId.getter);
}

- (void)setResponseViewId:(id)a3
{
  sub_21EE81D00(self, (uint64_t)a2, (uint64_t)a3, VisualResponseView.responseViewId.setter);
}

- (BOOL)isRedacted
{
  return VisualResponseView.isRedacted.getter() & 1;
}

- (void)setIsRedacted:(BOOL)a3
{
  VisualResponseView.isRedacted.setter(a3);
}

- (BOOL)isPresentedWithSmartDialogText
{
  _TtC9SnippetUI18VisualResponseView *v2;
  char v3;

  v2 = self;
  v3 = VisualResponseView.isPresentedWithSmartDialogText.getter();

  return v3 & 1;
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  _TtC9SnippetUI18VisualResponseView *v3;

  v3 = self;
  VisualResponseView.isPresentedWithSmartDialogText.setter();

}

- (int64_t)visualResponseLocation
{
  return VisualResponseView.visualResponseLocation.getter();
}

- (void)setVisualResponseLocation:(int64_t)a3
{
  VisualResponseView.visualResponseLocation.setter(a3);
}

- (NSString)description
{
  _TtC9SnippetUI18VisualResponseView *v2;
  void *v3;

  v2 = self;
  VisualResponseView.description.getter();

  v3 = (void *)sub_21F113678();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
