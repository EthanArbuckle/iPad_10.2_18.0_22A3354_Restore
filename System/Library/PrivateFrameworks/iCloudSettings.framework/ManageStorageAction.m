@implementation ManageStorageAction

- (BOOL)isDefault
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_isDefault);
}

- (BOOL)isDestructive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_isDestructive);
}

- (NSString)title
{
  return (NSString *)sub_24B51A6A0();
}

- (int64_t)actionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType);
}

- (void)setActionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType) = (Class)a3;
}

- (NSString)actionString
{
  return (NSString *)sub_24B51A6A0();
}

- (NSString)actionURL
{
  return (NSString *)sub_24B51A6A0();
}

- (void)setActionURL:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_24B5E42F0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionURL);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)actionParameters
{
  return (NSDictionary *)sub_24B519DB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionParameters);
}

- (NSDictionary)buyParameters
{
  return (NSDictionary *)sub_24B519DB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_buyParameters);
}

- (_TtC14iCloudSettings25ManageStorageConfirmation)confirmation
{
  return (_TtC14iCloudSettings25ManageStorageConfirmation *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_confirmation);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return ManageStorageAction.init(_:)(v3);
}

- (_TtC14iCloudSettings6Action)homeAction
{
  _TtC14iCloudSettings19ManageStorageAction *v2;
  id v3;

  v2 = self;
  v3 = sub_24B51A3C8();

  return (_TtC14iCloudSettings6Action *)v3;
}

- (BOOL)isUpsellAction
{
  return (*(unint64_t *)((char *)&self->super.isa
                              + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType)
        - 114 < 0xE) & (0x20F1u >> (*((_BYTE *)&self->super.isa
                                    + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType)
                                  - 114));
}

- (BOOL)isFamilyAction
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType)
       - 109 < 3;
}

- (_TtC14iCloudSettings19ManageStorageAction)init
{
  _TtC14iCloudSettings19ManageStorageAction *result;

  result = (_TtC14iCloudSettings19ManageStorageAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
