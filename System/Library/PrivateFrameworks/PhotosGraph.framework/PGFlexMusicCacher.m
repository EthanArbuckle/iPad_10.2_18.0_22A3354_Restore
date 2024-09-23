@implementation PGFlexMusicCacher

+ (void)cacheSongAudioAndArtworkForUIDs:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;

  v3 = sub_1CA85B7B0();
  v4 = sub_1CA4970F8(v3);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v5 = sub_1CA85C08C();
  if (!v5)
    goto LABEL_10;
LABEL_3:
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1CAA4DD64](i, v4);
      else
        v7 = *(id *)(v4 + 8 * i + 32);
      v8 = v7;
      objc_msgSend(v7, sel_pg_requestDownloadIfNeeded);

    }
    goto LABEL_10;
  }
  __break(1u);
}

- (PGFlexMusicCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGFlexMusicCacher init](&v3, sel_init);
}

@end
