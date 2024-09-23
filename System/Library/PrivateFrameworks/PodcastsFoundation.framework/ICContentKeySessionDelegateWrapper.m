@implementation ICContentKeySessionDelegateWrapper

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  _TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper *v15;
  id v16;

  v10 = sub_1A93F8040();
  v12 = v11;
  if (MEMORY[0x1AF41420C]((char *)self+ OBJC_IVAR____TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper_delegate))
  {
    v13 = a3;
    v14 = a5;
    v15 = self;
    v16 = a6;
    sub_1A93DAC0C(v10, v12, a5, a6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (_TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper)init
{
  _TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper *result;

  result = (_TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A914CAE4((uint64_t)self+ OBJC_IVAR____TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper_delegate);
}

@end
