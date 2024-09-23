@implementation REBookReaderHostLayoutController

- (CGRect)frame
{
  REBookReaderHostLayoutController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[4];
  CGRect result;

  v2 = self;
  CurrentValueSubject.value.getter(v7);

  v3 = *(double *)v7;
  v4 = *(double *)&v7[1];
  v5 = *(double *)&v7[2];
  v6 = *(double *)&v7[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  REBookReaderHostLayoutController *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  BookReaderHostLayoutController.frame.setter(x, y, width, height);

}

- (UIEdgeInsets)safeAreaInsets
{
  REBookReaderHostLayoutController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[4];
  UIEdgeInsets result;

  v2 = self;
  CurrentValueSubject.value.getter(v7);

  v3 = *(double *)v7;
  v4 = *(double *)&v7[1];
  v5 = *(double *)&v7[2];
  v6 = *(double *)&v7[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  REBookReaderHostLayoutController *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  BookReaderHostLayoutController.safeAreaInsets.setter(top, left, bottom, right);

}

- (UITraitCollection)traitCollection
{
  REBookReaderHostLayoutController *v2;
  id v4;

  v2 = self;
  CurrentValueSubject.value.getter(&v4);

  return (UITraitCollection *)v4;
}

- (void)setTraitCollection:(id)a3
{
  id v4;
  REBookReaderHostLayoutController *v5;

  v4 = a3;
  v5 = self;
  BookReaderHostLayoutController.traitCollection.setter(v4);

}

- (double)defaultStatusBarHeight
{
  REBookReaderHostLayoutController *v2;
  double v3;

  v2 = self;
  v3 = BookReaderHostLayoutController.defaultStatusBarHeight.getter();

  return v3;
}

- (REBookReaderHostLayoutController)initWithViewController:(id)a3
{
  id v4;
  REBookReaderHostLayoutController *result;
  REBookReaderHostLayoutController *v6;
  REBookReaderHostLayoutController *v7;

  v4 = a3;
  result = (REBookReaderHostLayoutController *)objc_msgSend(v4, "view");
  if (result)
  {
    v6 = result;
    v7 = -[REBookReaderHostLayoutController initWithView:](self, "initWithView:", result);

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (REBookReaderHostLayoutController)initWithView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t ObjectType;
  __int128 v31;
  __int128 v32;
  double right;
  double bottom;
  double left;

  left = UIEdgeInsetsZero.left;
  right = UIEdgeInsetsZero.right;
  bottom = UIEdgeInsetsZero.bottom;
  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "safeAreaInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v4, "traitCollection");
  v22 = objc_allocWithZone((Class)type metadata accessor for BookReaderHostLayoutController());
  *(_QWORD *)&v32 = v18;
  *((_QWORD *)&v32 + 1) = v20;
  *(_QWORD *)&v31 = v14;
  *((_QWORD *)&v31 + 1) = v16;
  v28 = sub_1004B96D8(v21, v4, UIEdgeInsetsZero.top, left, bottom, right, v6, v8, v10, v12, (uint64_t)v22, v23, v24, v25, v26, v27, v31, v32);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 105, 7);
  return (REBookReaderHostLayoutController *)v28;
}

- (void)willEnterForeground
{
  REBookReaderHostLayoutController *v2;

  v2 = self;
  BookReaderHostLayoutController.willEnterForeground()();

}

- (void)didEnterBackground
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___REBookReaderHostLayoutController_isInForeground) = 0;
}

- (REBookReaderHostLayoutController)init
{
  REBookReaderHostLayoutController *result;

  result = (REBookReaderHostLayoutController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderHostLayoutController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___REBookReaderHostLayoutController_edgeInsetsSubject));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___REBookReaderHostLayoutController_frameSubject));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___REBookReaderHostLayoutController_safeAreaInsetsSubject));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___REBookReaderHostLayoutController_traitCollectionSubject));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___REBookReaderHostLayoutController_view);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___REBookReaderHostLayoutController_cancellables));
}

- (NSString)description
{
  REBookReaderHostLayoutController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  BookReaderHostLayoutController.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end
