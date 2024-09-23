@implementation PosterStore

- (_TtC11PosterBoard11PosterStore)init
{
  uint64_t v2;
  char *v3;
  char *v4;

  type metadata accessor for IncludeAllPostersFilter();
  v2 = swift_allocObject();
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterStore());
  v4 = sub_1CBAFD5C4(v2, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC11PosterBoard11PosterStore *)v4;
}

- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4
{
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _TtC11PosterBoard11PosterStore *v10;
  id v11;
  _TtC11PosterBoard11PosterStore *v12;
  id v13;
  id v14;
  _QWORD v15[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a4;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = sub_1CBAFF2DC;
  v8[4] = v7;
  v15[4] = sub_1CBAFFC98;
  v15[5] = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = sub_1CBB0CA34;
  v15[3] = &block_descriptor_116;
  v9 = _Block_copy(v15);
  v10 = self;
  v11 = a4;
  v12 = v10;
  v13 = v11;
  v14 = a3;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v9);

  swift_release();
}

- (void)posterExtensionDataStore:(id)a3 didAddConfiguration:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  _TtC11PosterBoard11PosterStore *v10;
  id v11;
  id v12;
  _QWORD v13[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a4;
  v13[4] = sub_1CBAFFBF0;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1CBB0CA34;
  v13[3] = &block_descriptor_106;
  v8 = _Block_copy(v13);
  v9 = a4;
  v10 = self;
  v11 = v9;
  v12 = a3;
  swift_release();
  BSDispatchMain();
  _Block_release(v8);

}

- (void)posterExtensionDataStore:(id)a3 didDeleteConfiguration:(id)a4
{
  sub_1CBAF8350(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E86F8A48, (uint64_t)sub_1CBAFFC04, (uint64_t)&block_descriptor_100);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSwitcherConfiguration:(id)a4
{
  sub_1CBAF8350(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E86F89F8, (uint64_t)sub_1CBAFFC04, (uint64_t)&block_descriptor_94);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4
{
  sub_1CBAF8BE4(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E86F89A8, (uint64_t)sub_1CBAFF2A8, (uint64_t)&block_descriptor_88);
}

- (void)posterExtensionDataStore:(id)a3 posterConfiguration:(id)a4 didUpdateAssociatedHomeScreenPosterConfigurationTo:(id)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  _TtC11PosterBoard11PosterStore *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = self;
  *(_QWORD *)(v9 + 24) = a4;
  v16[4] = sub_1CBAFF290;
  v16[5] = v9;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1CBB0CA34;
  v16[3] = &block_descriptor_82;
  v10 = _Block_copy(v16);
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = a3;
  v15 = a5;
  swift_release();
  BSDispatchMain();
  _Block_release(v10);

}

- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  sub_1CBAF8844(self, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t)&unk_1E86F8908, (uint64_t)sub_1CBAFFC04, (uint64_t)&block_descriptor_76);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  sub_1CBAF8844(self, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t)&unk_1E86F88B8, (uint64_t)sub_1CBAFF268, (uint64_t)&block_descriptor_70);
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSnapshotForConfiguration:(id)a4
{
  sub_1CBAF8BE4(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E86F8868, (uint64_t)sub_1CBAFF260, (uint64_t)&block_descriptor_64);
}

- (void)dataStoreDidTearDown
{
  uint64_t v3;
  void *v4;
  _TtC11PosterBoard11PosterStore *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_1CBAFF234;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1CBB0CA34;
  v6[3] = &block_descriptor_48;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  BSDispatchMain();
  _Block_release(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
