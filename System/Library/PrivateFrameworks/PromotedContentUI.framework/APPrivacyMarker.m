@implementation APPrivacyMarker

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[APPrivacyMarker frame](self, sel_frame);
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (APPrivacyMarker)init
{
  return (APPrivacyMarker *)PrivacyMarker.init()();
}

- (APPrivacyMarker)initWithFrame:(CGRect)a3
{
  return (APPrivacyMarker *)PrivacyMarker.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (APPrivacyMarker)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B135437C();
}

- (void)systemColorStatusChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  APPrivacyMarker *v8;
  uint64_t v9;

  v4 = sub_1B1371C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  v8 = self;
  sub_1B1353F24();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sizeCategoryChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  APPrivacyMarker *v8;
  uint64_t v9;

  v4 = sub_1B1371C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  v8 = self;
  sub_1B12D0FA0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{

}

@end
