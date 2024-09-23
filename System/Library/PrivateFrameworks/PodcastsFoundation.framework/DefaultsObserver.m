@implementation DefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *v13;
  _TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  _OWORD v20[2];

  if (a3)
  {
    v9 = sub_1A93F8040();
    v11 = v10;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      v12 = a5;
      v13 = self;
      sub_1A93F8B44();
      v14 = (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *)swift_unknownObjectRelease();
      if (a5)
        goto LABEL_4;
LABEL_14:
      if (v11)
        goto LABEL_5;
LABEL_15:

      goto LABEL_16;
    }
  }
  memset(v20, 0, sizeof(v20));
  v19 = a5;
  v14 = self;
  if (!a5)
    goto LABEL_14;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1A9251138();
  sub_1A93F7EFC();

  if (!v11)
    goto LABEL_15;
LABEL_5:
  v16 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver_key);
  v17 = *(_QWORD *)&self->key[OBJC_IVAR____TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver_key];
  v18 = v9 == v16 && v11 == v17;
  if (v18
    || (v14 = (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *)sub_1A93F90C0(),
        (v14 & 1) != 0))
  {
    (*(void (**)(_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *, uint64_t, uint64_t, uint64_t))((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver_notify))(v14, v15, v16, v17);
  }

  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  sub_1A905FD54((uint64_t)v20, qword_1ED2AC800);
}

- (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver)init
{
  _TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *result;

  result = (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
