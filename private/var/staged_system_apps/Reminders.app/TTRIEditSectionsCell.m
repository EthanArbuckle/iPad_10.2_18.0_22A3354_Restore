@implementation TTRIEditSectionsCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9Reminders20TTRIEditSectionsCell *v8;
  UICellConfigurationState *v9;
  Class isa;
  objc_super v12;
  _BYTE v13[48];

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = type metadata accessor for UICellConfigurationState(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v8 = self;
  v9 = -[TTRIEditSectionsCell _bridgedConfigurationState](&v12, "_bridgedConfigurationState");
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10008C8AC((uint64_t)v8 + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel, (uint64_t)v13);
  sub_10008C9D8((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10008C874);
  sub_10008C8F4((uint64_t)v13);
  sub_10008C9D8((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10008CA10);

  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (UICellConfigurationState *)isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders20TTRIEditSectionsCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10008AAEC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)isAccessibilityElement
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_displayNameField), "isEditing") ^ 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_10008BD30);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_10008C310(self, (uint64_t)a2, a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_10008BF3C);
}

- (void)setAccessibilityValue:(id)a3
{
  sub_10008C310(self, (uint64_t)a2, a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_10008C200(self, (uint64_t)a2, (void (*)(void))sub_10008C268);
}

- (void)setAccessibilityHint:(id)a3
{
  sub_10008C310(self, (uint64_t)a2, a3, (SEL *)&selRef_setAccessibilityHint_);
}

- (BOOL)accessibilityActivate
{
  _TtC9Reminders20TTRIEditSectionsCell *v2;
  char v3;

  v2 = self;
  v3 = sub_10008C3A8();

  return v3 & 1;
}

- (_TtC9Reminders20TTRIEditSectionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders20TTRIEditSectionsCell *)sub_10008C4E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders20TTRIEditSectionsCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders20TTRIEditSectionsCell *)sub_10008C63C(v3, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_displayNameField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_canonicalNameField));
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_accessibilityDelegate);
  sub_10008CA10(*(void **)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel), *(_QWORD *)&self->displayNameField[OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel], *(_QWORD *)&self->canonicalNameField[OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel], *(_QWORD *)&self->currentLayout[OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel], *(_QWORD *)&self->accessibilityDelegate[OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_viewModel + 7]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_nameFields));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders20TTRIEditSectionsCell_sectionCellConstraints));
}

@end
