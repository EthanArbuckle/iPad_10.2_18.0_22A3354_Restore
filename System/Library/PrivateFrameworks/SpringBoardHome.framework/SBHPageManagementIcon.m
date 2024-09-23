@implementation SBHPageManagementIcon

- (SBIconListModel)listModel
{
  return (SBIconListModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR___SBHPageManagementIcon_listModel));
}

- (SBHPageManagementIcon)initWithListModel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  SBHPageManagementIcon *v11;
  objc_super v13;

  v5 = sub_1D015EFE8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SBHPageManagementIcon_listModel) = (Class)a3;
  v9 = a3;
  sub_1D015EFDC();
  sub_1D015EFD0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = (void *)sub_1D015F024();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)SBHPageManagementIcon;
  v11 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v13, sel_initWithLeafIdentifier_applicationBundleID_, v10, 0);

  return v11;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 0;
}

- (BOOL)canBeReceivedByIcon
{
  return 0;
}

- (BOOL)canBeAddedToSubfolder
{
  return 0;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

- (SBHPageManagementIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  SBHPageManagementIcon *result;

  result = (SBHPageManagementIcon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
