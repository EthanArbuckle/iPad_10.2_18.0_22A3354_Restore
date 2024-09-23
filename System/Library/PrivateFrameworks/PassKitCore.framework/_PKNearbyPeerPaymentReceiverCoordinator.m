@implementation _PKNearbyPeerPaymentReceiverCoordinator

+ (BOOL)nearbyReceiverIsEligible
{
  char v2;

  _s11PassKitCore36NearbyPeerPaymentReceiverCoordinatorC06nearbyG10IsEligibleSbyFZ_0();
  return v2 & 1;
}

- (_PKNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _PKNearbyPeerPaymentReceiverCoordinator *v7;

  v3 = a3;
  v4 = sub_1903D01B4();
  v6 = v5;

  v7 = (_PKNearbyPeerPaymentReceiverCoordinator *)sub_18FDDE634(v4, v6);
  sub_18FCD5938(v4, v6);
  return v7;
}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _PKNearbyPeerPaymentReceiverCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF3B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1903D085C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE1C0698;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE1C06A0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_18FDDE314((uint64_t)v9, (uint64_t)&unk_1EE1C06A8, (uint64_t)v14);
  swift_release();
}

- (void)recipientMetadataWithAppearanceData:(PKPeerPaymentProfileAppearanceData *)a3 nonce:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PKPeerPaymentProfileAppearanceData *v17;
  NSString *v18;
  _PKNearbyPeerPaymentReceiverCoordinator *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF3B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1903D085C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE1C0678;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = a0_3;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_18FDDE314((uint64_t)v11, (uint64_t)&unk_1EE1C0688, (uint64_t)v16);
  swift_release();
}

- (void)validateTransactionWithResult:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSData *v15;
  _PKNearbyPeerPaymentReceiverCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF3B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1903D085C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE1C0648;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE1BD5A0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_18FDDE314((uint64_t)v9, (uint64_t)&unk_1EE1BD5A8, (uint64_t)v14);
  swift_release();
}

- (_PKNearbyPeerPaymentReceiverCoordinator)init
{
  _PKNearbyPeerPaymentReceiverCoordinator *result;

  result = (_PKNearbyPeerPaymentReceiverCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_18FCD5938(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKNearbyPeerPaymentReceiverCoordinator_senderMetadata), *(_QWORD *)&self->peerPaymentAccount[OBJC_IVAR____PKNearbyPeerPaymentReceiverCoordinator_senderMetadata]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____PKNearbyPeerPaymentReceiverCoordinator____lazy_storage___amountFormatter));
}

@end
