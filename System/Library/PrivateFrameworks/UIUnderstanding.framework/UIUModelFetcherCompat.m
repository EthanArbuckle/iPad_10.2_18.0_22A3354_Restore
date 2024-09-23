@implementation UIUModelFetcherCompat

- (BOOL)areAssetsPresent
{
  UIUModelFetcherCompat *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_249702D7C();

  return v3 & 1;
}

- (BOOL)startAssetDownloadWithModelSet:(int64_t)a3 timeout:(double)a4
{
  UIUModelFetcherCompat *v6;

  v6 = self;
  LOBYTE(a3) = sub_249703190(a3, a4);

  return a3 & 1;
}

+ (id)sharedFetcher
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  if (qword_257879BF8 != -1)
    swift_once();
  v2 = (void *)qword_25787EBE8;
  if (qword_25787EBE8)
  {
    v3 = (id)qword_25787EBE8;
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UIUModelFetcher()), sel_init);
    v5 = (void *)qword_25787EBE8;
    qword_25787EBE8 = (uint64_t)v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

- (UIUModelFetcherCompat)init
{
  return (UIUModelFetcherCompat *)UIUModelFetcher.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___UIUModelFetcherCompat_log;
  v4 = sub_24972C9C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
