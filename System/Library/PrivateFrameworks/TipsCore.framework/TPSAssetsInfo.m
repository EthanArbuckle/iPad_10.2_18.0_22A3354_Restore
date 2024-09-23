@implementation TPSAssetsInfo

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19A909630((uint64_t)self + OBJC_IVAR___TPSAssetsInfo_videoURL);
  swift_bridgeObjectRelease();
  sub_19A909630((uint64_t)self + OBJC_IVAR___TPSAssetsInfo_imageURL);
}

- (TPSAssetsInfo)initWithVideoIdentifier:(id)a3 videoURL:(id)a4 imageIdentifier:(id)a5 imageURL:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v25 - v14;
  if (a3)
  {
    a3 = (id)sub_19A990D58();
    v17 = v16;
    if (a4)
    {
LABEL_3:
      sub_19A9909EC();
      v18 = sub_19A990A34();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 0, 1, v18);
      goto LABEL_6;
    }
  }
  else
  {
    v17 = 0;
    if (a4)
      goto LABEL_3;
  }
  v19 = sub_19A990A34();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v15, 1, 1, v19);
LABEL_6:
  if (!a5)
  {
    v21 = 0;
    if (a6)
      goto LABEL_8;
LABEL_10:
    v23 = sub_19A990A34();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v13, 1, 1, v23);
    return (TPSAssetsInfo *)TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)((uint64_t)a3, v17, (uint64_t)v15, (uint64_t)a5, v21, (uint64_t)v13);
  }
  a5 = (id)sub_19A990D58();
  v21 = v20;
  if (!a6)
    goto LABEL_10;
LABEL_8:
  sub_19A9909EC();
  v22 = sub_19A990A34();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v13, 0, 1, v22);
  return (TPSAssetsInfo *)TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)((uint64_t)a3, v17, (uint64_t)v15, (uint64_t)a5, v21, (uint64_t)v13);
}

- (NSString)videoIdentifier
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

- (void)setVideoIdentifier:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

- (NSURL)videoURL
{
  return (NSURL *)sub_19A974F4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_videoURL);
}

- (void)setVideoURL:(id)a3
{
  sub_19A975034(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSAssetsInfo_videoURL);
}

- (NSString)imageIdentifier
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

- (void)setImageIdentifier:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

- (NSURL)imageURL
{
  return (NSURL *)sub_19A974F4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_imageURL);
}

- (void)setImageURL:(id)a3
{
  sub_19A975034(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSAssetsInfo_imageURL);
}

- (TPSAssetsInfo)init
{
  TPSAssetsInfo *result;

  result = (TPSAssetsInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSAssetsInfo *v5;

  v4 = a3;
  v5 = self;
  TPSAssetsInfo.encode(with:)((NSCoder)v4);

}

- (TPSAssetsInfo)initWithCoder:(id)a3
{
  return (TPSAssetsInfo *)TPSAssetsInfo.init(coder:)(a3);
}

- (NSString)description
{
  TPSAssetsInfo *v2;
  void *v3;

  v2 = self;
  TPSAssetsInfo.description.getter();

  v3 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
