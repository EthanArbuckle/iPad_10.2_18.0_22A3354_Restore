@implementation AEMarkupBarButtonItem

- (AEMarkupBarButtonItem)initWithCoder:(id)a3
{
  AEMarkupBarButtonItem *result;

  result = (AEMarkupBarButtonItem *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000001654F0, "AEBookPlugins/MarkupBarButtonItem.swift", 39, 2, 18, 0);
  __break(1u);
  return result;
}

- (AEMarkupBarButtonItem)init
{
  id v3;
  AEMarkupBarButtonItem *v4;
  objc_class *v5;
  AEMarkupBarButtonItem *v6;
  objc_super v8;

  v3 = objc_allocWithZone((Class)type metadata accessor for MarkupButtonContainerView());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR___AEMarkupBarButtonItem_toggleView) = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  v6 = -[AEMarkupBarButtonItem init](&v8, "init");
  -[AEMarkupBarButtonItem setCustomView:](v6, "setCustomView:", *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR___AEMarkupBarButtonItem_toggleView));
  return v6;
}

- (id)target
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  return -[AEMarkupBarButtonItem target](&v3, "target");
}

- (void)setTarget:(id)a3
{
  AEMarkupBarButtonItem *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_111B68((uint64_t)a3);

  swift_unknownObjectRelease(a3);
}

- (SEL)action
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  return -[AEMarkupBarButtonItem action](&v3, "action");
}

- (void)setAction:(SEL)a3
{
  AEMarkupBarButtonItem *v4;

  v4 = self;
  sub_111874((uint64_t)a3);

}

- (BOOL)selected
{
  return sub_111A48(self, (uint64_t)a2, (SEL *)&selRef_selected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  unsigned __int8 v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  v4 = (char *)v7.receiver;
  -[AEMarkupBarButtonItem setSelected:](&v7, "setSelected:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR___AEMarkupBarButtonItem_toggleView];
  v6 = objc_msgSend(v4, "selected", v7.receiver, v7.super_class);
  *(_BYTE *)(v5 + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_selected) = v6;
  sub_10D168();

}

- (BOOL)isEnabled
{
  return sub_111A48(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  v4 = (char *)v6.receiver;
  -[AEMarkupBarButtonItem setEnabled:](&v6, "setEnabled:", v3);
  v5 = objc_retain(*(id *)(*(_QWORD *)&v4[OBJC_IVAR___AEMarkupBarButtonItem_toggleView]
                         + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_button));
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "isEnabled", v6.receiver, v6.super_class));

}

- (void).cxx_destruct
{

}

@end
