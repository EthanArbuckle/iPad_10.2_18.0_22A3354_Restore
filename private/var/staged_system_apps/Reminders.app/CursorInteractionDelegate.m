@implementation CursorInteractionDelegate

- (_TtC9RemindersP33_CB8DF1A557292041751C28CBB1A9D75525CursorInteractionDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[CursorInteractionDelegate init](&v3, "init");
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC9RemindersP33_CB8DF1A557292041751C28CBB1A9D75525CursorInteractionDelegate *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_10011A1E4(v6);

  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9RemindersP33_CB8DF1A557292041751C28CBB1A9D75525CursorInteractionDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10011A66C(v8, v9);

  return v12;
}

@end
