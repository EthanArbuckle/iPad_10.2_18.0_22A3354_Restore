@implementation HitPassthroughWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  unsigned __int8 v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HitPassthroughWindow();
  v7 = v15.receiver;
  v8 = a4;
  v9 = -[HitPassthroughWindow hitTest:withEvent:](&v15, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    v11 = type metadata accessor for HitPassthroughView();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
    v13 = objc_msgSend(v10, "isKindOfClass:", ObjCClassFromMetadata, v15.receiver, v15.super_class);

    v7 = v10;
    if ((v13 & 1) == 0)
      return v10;
  }
  else
  {

  }
  v10 = 0;
  return v10;
}

- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HitPassthroughWindow();
  return -[HitPassthroughWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator20HitPassthroughWindow *)sub_1000D3E60(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for HitPassthroughWindow);
}

- (_TtC17SequoiaTranslator20HitPassthroughWindow)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator20HitPassthroughWindow *)sub_1000D3ED8(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for HitPassthroughWindow);
}

@end
