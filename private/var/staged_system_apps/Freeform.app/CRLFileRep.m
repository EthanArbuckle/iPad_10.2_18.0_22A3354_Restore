@implementation CRLFileRep

- (_TtC8Freeform10CRLFileRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC8Freeform10CRLFileRep *)sub_1008C5904(v5, a4);
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (void)willBeRemoved
{
  _TtC8Freeform10CRLFileRep *v2;

  v2 = self;
  sub_1008C5A24();

}

- (void)processChangedProperty:(unint64_t)a3
{
  _TtC8Freeform10CRLFileRep *v4;

  v4 = self;
  sub_1008C65D4(a3);

}

- (_TtC8Freeform11CRLFileItem)item
{
  _TtC8Freeform10CRLFileRep *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1008C670C();
  v4 = v3;

  return (_TtC8Freeform11CRLFileItem *)v4;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  -[CRLFileRep enterPreviewMode](self, "enterPreviewMode", a4, a3.x, a3.y);
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityPerformPress
{
  -[CRLFileRep enterPreviewMode](self, "enterPreviewMode");
  return 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform10CRLFileRep_downloadObserverIdentifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1004CB49C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8Freeform10CRLFileRep____lazy_storage___placeholderImage));
}

- (int64_t)supportedMediaTypes
{
  return 3;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 1;
}

- (BOOL)replacingInterfaceAllowsMultipleSelection
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 1;
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)enterPreviewMode
{
  _TtC8Freeform10CRLFileRep *v2;

  v2 = self;
  sub_100D468AC();

}

@end
