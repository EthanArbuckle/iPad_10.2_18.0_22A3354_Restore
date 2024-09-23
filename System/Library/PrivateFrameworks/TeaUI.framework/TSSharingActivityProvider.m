@implementation TSSharingActivityProvider

- (NSArray)activityItemSources
{
  return (NSArray *)sub_1B155F044((uint64_t)self, (uint64_t)a2, SharingActivityProvider.activityItemSources.getter, (void (*)(_QWORD))sub_1B155ECF8);
}

- (void)setActivityItemSources:(id)a3
{
  sub_1B155F0E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))sub_1B155ECF8, SharingActivityProvider.activityItemSources.setter);
}

- (NSArray)activities
{
  void *v2;

  SharingActivityProvider.activities.getter();
  sub_1B13A1818(0, &qword_1EEF33748);
  v2 = (void *)sub_1B16B9B48();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivities:(id)a3
{
  uint64_t v4;
  TSSharingActivityProvider *v5;

  sub_1B13A1818(0, &qword_1EEF33748);
  v4 = sub_1B16B9B54();
  v5 = self;
  SharingActivityProvider.activities.setter(v4);

}

- (NSArray)excludedActivityTypes
{
  return (NSArray *)sub_1B155F044((uint64_t)self, (uint64_t)a2, SharingActivityProvider.excludedActivityTypes.getter, type metadata accessor for ActivityType);
}

- (void)setExcludedActivityTypes:(id)a3
{
  sub_1B155F0E0(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ActivityType, SharingActivityProvider.excludedActivityTypes.setter);
}

- (id)linkPresentationSource
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  SharingActivityProvider.linkPresentationSource.getter((uint64_t)v9);
  v2 = v10;
  if (!v10)
    return 0;
  v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v3, v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  v7 = (void *)sub_1B16BA8F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

- (void)setLinkPresentationSource:(id)a3
{
  TSSharingActivityProvider *v3;
  TSSharingActivityProvider *v4;
  _OWORD v6[2];

  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    sub_1B16BA3AC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v4 = self;
  }
  SharingActivityProvider.linkPresentationSource.setter((uint64_t)v6);

}

- (NSArray)activityItems
{
  TSSharingActivityProvider *v2;
  void *v3;

  v2 = self;
  SharingActivityProvider.activityItems.getter();

  v3 = (void *)sub_1B16B9B48();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (TSSharingActivityProvider)initWithActivityItems:(id)a3 activitySources:(id)a4 excludedActivityTypes:(id)a5 linkPresentationSource:(id)a6
{
  TSSharingActivityProvider *result;

  sub_1B13A1818(0, &qword_1EEF33748);
  sub_1B16B9B54();
  sub_1B155ECF8();
  sub_1B16B9B54();
  type metadata accessor for ActivityType(0);
  sub_1B16B9B54();
  if (a6)
  {
    swift_unknownObjectRetain();
    sub_1B16BA3AC();
    swift_unknownObjectRelease();
  }
  SharingActivityProvider.init(activityItems:activitySources:excludedActivityTypes:linkPresentationSource:)();
  return result;
}

- (TSSharingActivityProvider)init
{
  SharingActivityProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B13F77F4((uint64_t)self + OBJC_IVAR___TSSharingActivityProvider_linkPresentationSource);
}

@end
