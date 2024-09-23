@implementation AssetPersistentKeyLoader

- (_TtC15SeymourServices24AssetPersistentKeyLoader)init
{
  _TtC15SeymourServices24AssetPersistentKeyLoader *result;

  result = (_TtC15SeymourServices24AssetPersistentKeyLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_assetDataStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_assetFileStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_assetMediaStreamKeyProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_keyProvider);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_persistenceStore);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_keyLoaderQueue));
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  _TtC15SeymourServices24AssetPersistentKeyLoader *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CEBA66D8(v7);

}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6;
  id v7;
  _TtC15SeymourServices24AssetPersistentKeyLoader *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CEBA6EE8(v7);

}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  id v8;
  id v9;
  _TtC15SeymourServices24AssetPersistentKeyLoader *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1CEBA7494(v9, v11);

}

- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15SeymourServices24AssetPersistentKeyLoader *v11;
  char v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1CEBA7880(v10);

  return v12 & 1;
}

@end
