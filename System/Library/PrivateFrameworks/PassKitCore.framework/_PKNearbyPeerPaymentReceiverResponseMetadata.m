@implementation _PKNearbyPeerPaymentReceiverResponseMetadata

+ (void)receiverDataWithNonce:(id)a3 nearbyMetadata:(id)a4 appearanceData:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF3B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  v13 = sub_1903D05C8();
  v15 = v14;
  v16 = a4;
  v17 = a5;
  v18 = sub_1903D01B4();
  v20 = v19;

  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v12;
  v22 = sub_1903D085C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v11, 1, 1, v22);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = v13;
  v23[5] = v15;
  v23[6] = v18;
  v23[7] = v20;
  v23[8] = v17;
  v23[9] = sub_18FDA2E40;
  v23[10] = v21;
  v24 = v17;
  swift_bridgeObjectRetain();
  sub_18FCD58F4(v18, v20);
  swift_retain();
  sub_18FE0EE00((uint64_t)v11, (uint64_t)&unk_1EE1C0EF8, (uint64_t)v23);
  swift_release();
  swift_release();
  sub_18FCD5938(v18, v20);
  swift_bridgeObjectRelease();

}

- (NSData)serializedData
{
  _PKNearbyPeerPaymentReceiverResponseMetadata *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  swift_getObjectType();
  sub_1903CFF14();
  swift_allocObject();
  v3 = self;
  sub_1903CFF08();
  sub_18FE12080((unint64_t *)&unk_1EE1C0600, v4, (uint64_t (*)(uint64_t))type metadata accessor for NearbyPeerPaymentReceiverResponseMetadata, (uint64_t)&protocol conformance descriptor for NearbyPeerPaymentReceiverResponseMetadata);
  v5 = sub_1903CFEFC();
  v7 = v6;
  swift_release();

  v8 = (void *)sub_1903D01A8();
  sub_18FCD5938(v5, v7);
  return (NSData *)v8;
}

- (_PKNearbyPeerPaymentReceiverResponseMetadata)init
{
  _PKNearbyPeerPaymentReceiverResponseMetadata *result;

  result = (_PKNearbyPeerPaymentReceiverResponseMetadata *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  sub_18FD4D5D8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKNearbyPeerPaymentReceiverResponseMetadata_receiverImageData), *(_QWORD *)&self->encryptedData[OBJC_IVAR____PKNearbyPeerPaymentReceiverResponseMetadata_receiverImageData]);
}

@end
