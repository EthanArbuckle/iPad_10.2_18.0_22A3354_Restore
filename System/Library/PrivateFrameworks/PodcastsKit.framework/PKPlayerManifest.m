@implementation PKPlayerManifest

+ (id)manifestForEpisode:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_22FB30CE0(v3, (uint64_t)&off_24FD63400);

  return v4;
}

+ (id)manifestForShow:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_22FB30CE0(v3, (uint64_t)&off_24FD63410);

  return v4;
}

+ (id)manifestForShowUuid:(id)a3 siriContext:(id)a4
{
  return sub_22FB30A08((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))_s11PodcastsKit14PlayerManifestC19manifestForShowUuid_11siriContextACSS_AA04SiriJ0CSgtFZ_0);
}

+ (id)manifestForPlayMyPodcastsWithSiriContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = _s11PodcastsKit14PlayerManifestC017manifestForPlayMyA011siriContextAcA04SiriJ0CSg_tFZ_0(a3);

  return v5;
}

+ (id)manifestForEpisodeStoreId:(id)a3 siriContext:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_22FB31170(v5, a4, (uint64_t (*)(_QWORD))type metadata accessor for EpisodeStoreId, (uint64_t)&off_24FD63430);

  return v7;
}

+ (id)manifestForStationId:(id)a3 siriContext:(id)a4
{
  return sub_22FB30A08((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))_s11PodcastsKit14PlayerManifestC8manifest3for11siriContextACSS_AA04SiriH0CSgtFZ_0);
}

+ (id)manifestForEpisodeStoreId:(id)a3 assetInfo:(id)a4
{
  return sub_22FB30B68((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(_QWORD))type metadata accessor for EpisodeStoreId, (uint64_t)&off_24FD63430);
}

+ (id)manifestForShowStoreId:(id)a3 siriContext:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_22FB31170(v5, a4, (uint64_t (*)(_QWORD))type metadata accessor for ShowStoreId, (uint64_t)&off_24FD63420);

  return v7;
}

+ (id)manifestForShowStoreId:(id)a3 assetInfo:(id)a4
{
  return sub_22FB30B68((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(_QWORD))type metadata accessor for ShowStoreId, (uint64_t)&off_24FD63420);
}

- (PKPlayerManifest)init
{
  PKPlayerManifest *result;

  result = (PKPlayerManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PKPlayerManifest_playableContent);
  swift_bridgeObjectRelease();

}

@end
