@implementation VisualResponseViewController

- (_TtC9SnippetUI28VisualResponseViewController)initWithCoder:(id)a3
{
  sub_21EFD4A68((uint64_t)a3, 76, (void (*)(uint64_t, _QWORD, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, char))sub_21F08155C);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC9SnippetUI28VisualResponseViewController *v5;
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
  sub_21EFD461C(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC9SnippetUI28VisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_21F11369C();
  v5 = a4;
  VisualResponseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SnippetUI28VisualResponseViewController_context));
  sub_21EE8279C((uint64_t)self + OBJC_IVAR____TtC9SnippetUI28VisualResponseViewController_anyRootView, type metadata accessor for AnyRootView);
  OUTLINED_FUNCTION_139();
}

- (void)setInitialFocusIndex:(int64_t)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v4;

  v4 = self;
  VisualResponseViewController.setInitialFocus(_:)(a3);

}

- (void)updateSharedState:(id)a3
{
  uint64_t v4;
  _TtC9SnippetUI28VisualResponseViewController *v5;

  v4 = sub_21F1135DC();
  v5 = self;
  VisualResponseViewController.updateSharedState(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)updateSharedStateData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC9SnippetUI28VisualResponseViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_21F10EC14();
  v7 = v6;

  VisualResponseViewController.updateSharedStateData(_:)();
  sub_21EE1D6A0(v5, v7);

}

- (void)setAsrText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC9SnippetUI28VisualResponseViewController *v7;
  Swift::String v8;

  v4 = sub_21F11369C();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  VisualResponseViewController.setAsrText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setIsInAmbient:(BOOL)a3 withScaleFactor:(double)a4
{
  _TtC9SnippetUI28VisualResponseViewController *v4;

  v4 = self;
  VisualResponseViewController.setIsInAmbient(_:withScaleFactor:)();

}

- (void)setPlayerState:(int64_t)a3 aceId:(id)a4
{
  _TtC9SnippetUI28VisualResponseViewController *v5;

  sub_21F11369C();
  v5 = self;
  VisualResponseViewController.setPlayerState(_:aceId:)();

  swift_bridgeObjectRelease();
}

- (void)postSiriEvent:(int64_t)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v3;

  v3 = self;
  VisualResponseViewController.postSiriEvent(_:)();

}

- (int64_t)currentIdiom
{
  int64_t result;

  VisualResponseViewController.currentIdiom.getter();
  return result;
}

- (void)setCurrentIdiom:(int64_t)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v4;

  v4 = self;
  VisualResponseViewController.currentIdiom.setter(a3);

}

- (double)snippetWidth
{
  _TtC9SnippetUI28VisualResponseViewController *v2;
  double v3;
  double v4;

  v2 = self;
  VisualResponseViewController.snippetWidth.getter();
  v4 = v3;

  return v4;
}

- (void)setSnippetWidth:(double)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v3;

  v3 = self;
  VisualResponseViewController.snippetWidth.setter();

}

- (VRXInteractionDelegate)interactionDelegate
{
  id v2;

  VisualResponseViewController.interactionDelegate.getter();
  return (VRXInteractionDelegate *)v2;
}

- (void)setInteractionDelegate:(id)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  VisualResponseViewController.interactionDelegate.setter();

}

- (int64_t)backgroundMaterial
{
  _TtC9SnippetUI28VisualResponseViewController *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  VisualResponseViewController.backgroundMaterial.getter();
  v4 = v3;

  return v4;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v3;

  v3 = self;
  VisualResponseViewController.backgroundMaterial.setter();

}

- (NSArray)aceCommands
{
  _TtC9SnippetUI28VisualResponseViewController *v2;
  void *v3;

  v2 = self;
  VisualResponseViewController.aceCommands.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_255492CE8);
  v3 = (void *)sub_21F1138A0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)containsComponentsWithAction
{
  _TtC9SnippetUI28VisualResponseViewController *v2;
  char v3;

  v2 = self;
  v3 = VisualResponseViewController.containsComponentsWithAction.getter();

  return v3 & 1;
}

- (BOOL)requestsKeyWindow
{
  _TtC9SnippetUI28VisualResponseViewController *v2;

  v2 = self;
  VisualResponseViewController.requestsKeyWindow.getter();

  return 0;
}

- (NSString)viewId
{
  return (NSString *)sub_21EE81C74((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseViewController.viewId.getter);
}

- (void)setViewId:(id)a3
{
  sub_21EE81D00(self, (uint64_t)a2, (uint64_t)a3, VisualResponseViewController.viewId.setter);
}

- (NSString)responseViewId
{
  return (NSString *)sub_21EE81C74((uint64_t)self, (uint64_t)a2, (void (*)(void))VisualResponseViewController.responseViewId.getter);
}

- (void)setResponseViewId:(id)a3
{
  sub_21EE81D00(self, (uint64_t)a2, (uint64_t)a3, VisualResponseViewController.responseViewId.setter);
}

- (BOOL)isRedacted
{
  return VisualResponseViewController.isRedacted.getter() & 1;
}

- (void)setIsRedacted:(BOOL)a3
{
  VisualResponseViewController.isRedacted.setter(a3);
}

- (BOOL)isPresentedWithSmartDialogText
{
  _TtC9SnippetUI28VisualResponseViewController *v2;
  char v3;

  v2 = self;
  v3 = VisualResponseViewController.isPresentedWithSmartDialogText.getter();

  return v3 & 1;
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  _TtC9SnippetUI28VisualResponseViewController *v3;

  v3 = self;
  VisualResponseViewController.isPresentedWithSmartDialogText.setter();

}

- (int64_t)visualResponseLocation
{
  return VisualResponseViewController.visualResponseLocation.getter();
}

- (void)setVisualResponseLocation:(int64_t)a3
{
  VisualResponseViewController.visualResponseLocation.setter(a3);
}

- (NSString)description
{
  _TtC9SnippetUI28VisualResponseViewController *v2;
  void *v3;

  v2 = self;
  VisualResponseViewController.description.getter();

  v3 = (void *)sub_21F113678();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
