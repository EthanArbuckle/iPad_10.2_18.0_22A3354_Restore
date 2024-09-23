@implementation SDShareSheetAirDropTransferUpdate

- (NSString)sessionID
{
  return (NSString *)sub_1004BB754((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SDShareSheetAirDropTransferUpdate_sessionID);
}

- (NSString)realName
{
  return (NSString *)sub_1004BB754((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SDShareSheetAirDropTransferUpdate_realName);
}

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_state);
}

- (void)setState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_state) = (Class)a3;
}

- (double)progress
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_progress);
}

- (void)setProgress:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_progress) = a3;
}

- (SDShareSheetAirDropTransferUpdate)initWithSessionID:(id)a3 realName:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_state) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_progress) = 0;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_sessionID);
  *v12 = v8;
  v12[1] = v10;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___SDShareSheetAirDropTransferUpdate_realName);
  *v13 = v11;
  v13[1] = v14;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return -[SDShareSheetAirDropTransferUpdate init](&v16, "init");
}

- (SDShareSheetAirDropTransferUpdate)init
{
  SDShareSheetAirDropTransferUpdate *result;

  result = (SDShareSheetAirDropTransferUpdate *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.ShareSheetAirDropTransferUpdate", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->sessionID[OBJC_IVAR___SDShareSheetAirDropTransferUpdate_sessionID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->sessionID[OBJC_IVAR___SDShareSheetAirDropTransferUpdate_realName]);
}

@end
