@implementation APPCVideoRepresentation

- (int64_t)fileSize
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_fileSize);
}

- (double)skipThreshold
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_skipThreshold);
}

- (BOOL)skipEnabled
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_skipEnabled);
}

- (BOOL)unbranded
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_unbranded);
}

- (double)bitrate
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_bitrate);
}

- (unint64_t)signalStrength
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_signalStrength);
}

- (int64_t)connectionType
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_connectionType);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)videoSize
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_videoSize);
  v3 = *(double *)&self->super.identifier[OBJC_IVAR___APPCVideoRepresentation_videoSize];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSURL)videoURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  APPCVideoRepresentation *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B1289584();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1B122B964(v6);

  v8 = (void *)sub_1B1289560();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (void)setVideoURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  APPCVideoRepresentation *v12;
  uint64_t v13;

  v4 = sub_1B11FFBAC((uint64_t *)&unk_1ED391290);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B1289584();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B128956C();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v11 = (char *)self + OBJC_IVAR___APPCVideoRepresentation____lazy_storage___videoURL;
  swift_beginAccess();
  v12 = self;
  sub_1B122BFA8((uint64_t)v6, (uint64_t)v11);
  swift_endAccess();

}

- (APPCVideoRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 videoURL:(id)a6 duration:(double)a7 fileSize:(int64_t)a8 skipThreshold:(double)a9 skipEnabled:(BOOL)a10 unbranded:(BOOL)a11 bitrate:(double)a12 connectionType:(int64_t)a13 signalStrength:(unint64_t)a14 videoSize:(id)a15 tapAction:(id)a16 adPolicyData:(id)a17
{
  double var1;
  double var0;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  id v29;
  APPCVideoRepresentation *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;

  v35 = a10;
  v33 = a5;
  v34 = a8;
  v32 = a4;
  var1 = a15.var1;
  var0 = a15.var0;
  v22 = sub_1B1289584();
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1B1289674();
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v32 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B128965C();
  sub_1B128956C();
  v28 = a16;
  v29 = a17;
  v30 = (APPCVideoRepresentation *)sub_1B122DAFC((uint64_t)v27, v32, v33, (uint64_t)v24, v34, v35, a11, a13, a7, a9, a12, var0, var1, a14, a16, a17);

  return v30;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B1206378((uint64_t)self + OBJC_IVAR___APPCVideoRepresentation____lazy_storage___videoURL);
  v3 = (char *)self + OBJC_IVAR___APPCVideoRepresentation_originalVideoURL;
  v4 = sub_1B1289584();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
