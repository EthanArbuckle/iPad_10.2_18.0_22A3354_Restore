@implementation EpisodeCellDoubleClickGestureRecognizer

- (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer)init
{
  _TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EpisodeCellDoubleClickGestureRecognizer();
  v2 = -[EpisodeCellDoubleClickGestureRecognizer initWithTarget:action:](&v4, "initWithTarget:action:", 0, 0);
  -[EpisodeCellDoubleClickGestureRecognizer setDelegate:](v2, "setDelegate:", v2);
  -[EpisodeCellDoubleClickGestureRecognizer setNumberOfTapsRequired:](v2, "setNumberOfTapsRequired:", 2);
  -[EpisodeCellDoubleClickGestureRecognizer setCancelsTouchesInView:](v2, "setCancelsTouchesInView:", 0);
  -[EpisodeCellDoubleClickGestureRecognizer setDelaysTouchesBegan:](v2, "setDelaysTouchesBegan:", 0);
  -[EpisodeCellDoubleClickGestureRecognizer setDelaysTouchesEnded:](v2, "setDelaysTouchesEnded:", 0);

  return v2;
}

- (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  __n128 v5;
  uint64_t v6;
  _TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *result;
  _QWORD v8[4];

  if (a3)
  {
    v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6, v5);
    swift_unknownObjectRelease(a3);
  }
  result = (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.EpisodeCellDoubleClickGestureRecognizer", 63, "init(target:action:)", 20, 0);
  __break(1u);
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *v7;
  _TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *v8;
  _TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *v9;
  _TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *v10;
  uint64_t v11;
  char v12;

  v6 = a3;
  v7 = (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *)a4;
  v8 = self;
  v9 = (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *)-[EpisodeCellDoubleClickGestureRecognizer view](v7, "view");
  if (v9)
  {
    v10 = v9;
    v11 = objc_opt_self(UIControl);
    v12 = swift_dynamicCastObjCClass(v10, v11) == 0;

    v7 = v8;
    v8 = v10;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

@end
