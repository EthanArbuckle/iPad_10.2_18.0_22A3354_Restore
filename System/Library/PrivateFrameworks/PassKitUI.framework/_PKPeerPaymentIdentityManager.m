@implementation _PKPeerPaymentIdentityManager

- (NSString)firstName
{
  return (NSString *)sub_19D2FD5F0();
}

- (NSString)lastName
{
  return (NSString *)sub_19D2FD5F0();
}

- (NSData)_profilePictureData
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  v3 = *(_QWORD *)&self->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = *v2;
    sub_19D19FA40(*v2, v3);
    v4 = (void *)sub_19DE83814();
    sub_19D19FB40(v5, v3);
  }
  return (NSData *)v4;
}

- (void)set_profilePictureData:(id)a3
{
  void *v3;
  _PKPeerPaymentIdentityManager *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  _PKPeerPaymentIdentityManager *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_19DE83820();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  v9 = (Class *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  v11 = *(_QWORD *)&self->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData];
  *v9 = v3;
  v9[1] = v7;
  sub_19D19FB40(v10, v11);

}

- (NSData)profilePictureData
{
  _PKPeerPaymentIdentityManager *v3;
  uint64_t v4;
  unint64_t v5;
  void *v7;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v3 = self;
  sub_19DE83E98();
  swift_release();
  v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  v5 = *(_QWORD *)&v3->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData];
  sub_19D19FA2C(v4, v5);

  if (v5 >> 60 == 15)
    return (NSData *)0;
  v7 = (void *)sub_19DE83814();
  sub_19D19FB40(v4, v5);
  return (NSData *)v7;
}

- (void)setProfilePictureData:(id)a3
{
  _PKPeerPaymentIdentityManager *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _PKPeerPaymentIdentityManager *v10;
  uint64_t KeyPath;
  uint64_t v12;

  if (a3)
  {
    v5 = self;
    v6 = a3;
    v7 = sub_19DE83820();
    v9 = v8;

  }
  else
  {
    v10 = self;
    v7 = 0;
    v9 = 0xF000000000000000;
  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath, v12);
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  sub_19DE83E8C();
  sub_19D19FB40(v7, v9);

  swift_release();
}

- (BOOL)_shareLastName
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__shareLastName;
  swift_beginAccess();
  return *v2;
}

- (void)set_shareLastName:(BOOL)a3
{
  sub_19D2FE014((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____PKPeerPaymentIdentityManager__shareLastName);
}

- (BOOL)shareLastName
{
  return sub_19D2FE120(self, (uint64_t)a2, (uint64_t)&unk_19DEE7820, &OBJC_IVAR____PKPeerPaymentIdentityManager__shareLastName);
}

- (void)setShareLastName:(BOOL)a3
{
  _PKPeerPaymentIdentityManager *v4;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v4 = self;
  sub_19DE83E8C();

  swift_release();
}

- (BOOL)_shareProfilePicture
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__shareProfilePicture;
  swift_beginAccess();
  return *v2;
}

- (void)set_shareProfilePicture:(BOOL)a3
{
  sub_19D2FE014((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____PKPeerPaymentIdentityManager__shareProfilePicture);
}

- (BOOL)shareProfilePicture
{
  return sub_19D2FE120(self, (uint64_t)a2, (uint64_t)&unk_19DEE7868, &OBJC_IVAR____PKPeerPaymentIdentityManager__shareProfilePicture);
}

- (void)setShareProfilePicture:(BOOL)a3
{
  _PKPeerPaymentIdentityManager *v4;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v4 = self;
  sub_19DE83E8C();

  swift_release();
}

- (_PeerPaymentIdentityManagerDelegate)_delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__delegate;
  swift_beginAccess();
  return (_PeerPaymentIdentityManagerDelegate *)(id)MEMORY[0x1A1AE6A68](v2);
}

- (void)set_delegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_PeerPaymentIdentityManagerDelegate)delegate
{
  _PKPeerPaymentIdentityManager *v3;
  char *v4;
  void *v5;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v3 = self;
  sub_19DE83E98();
  swift_release();
  v4 = (char *)v3 + OBJC_IVAR____PKPeerPaymentIdentityManager__delegate;
  swift_beginAccess();
  v5 = (void *)MEMORY[0x1A1AE6A68](v4);

  return (_PeerPaymentIdentityManagerDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  _PKPeerPaymentIdentityManager *v4;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  swift_unknownObjectRetain();
  v4 = self;
  sub_19DE83E8C();

  swift_release();
  swift_unknownObjectRelease();
}

- (PKPeerPaymentProfileAppearanceData)_appearanceData
{
  return (PKPeerPaymentProfileAppearanceData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData));
}

- (void)set_appearanceData:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData) = (Class)a3;
  v3 = a3;

}

- (PKPeerPaymentProfileAppearanceData)appearanceData
{
  _PKPeerPaymentIdentityManager *v3;
  PKPeerPaymentProfileAppearanceData *v4;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v3 = self;
  sub_19DE83E98();
  swift_release();
  v4 = (PKPeerPaymentProfileAppearanceData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v3->super.isa
                                                                                     + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData));

  return v4;
}

- (void)setAppearanceData:(id)a3
{
  id v5;
  _PKPeerPaymentIdentityManager *v6;

  swift_getKeyPath();
  sub_19D1A03D8((unint64_t *)&qword_1EE4A2AD0, (uint64_t (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager, (uint64_t)&protocol conformance descriptor for PeerPaymentIdentityManager);
  v5 = a3;
  v6 = self;
  sub_19DE83E8C();

  swift_release();
}

- (_PKPeerPaymentIdentityManager)init
{
  return (_PKPeerPaymentIdentityManager *)PeerPaymentIdentityManager.init()();
}

- (void)commitUpdatesIfNeeded
{
  _PKPeerPaymentIdentityManager *v2;

  v2 = self;
  PeerPaymentIdentityManager.commitUpdatesIfNeeded()();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19D19FB40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData), *(_QWORD *)&self->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData]);
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____PKPeerPaymentIdentityManager__delegate);

  v3 = (char *)self + OBJC_IVAR____PKPeerPaymentIdentityManager___observationRegistrar;
  v4 = sub_19DE83EC8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
