@implementation AccountButton

- (_TtC16MusicApplication13AccountButton)init
{
  if (qword_14AAA60 != -1)
    swift_once(&qword_14AAA60, sub_195254);
  return -[AccountButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, xmmword_14B5A70);
}

- (_TtC16MusicApplication13AccountButton)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication13AccountButton *result;

  sub_19326C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicApplication13AccountButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC16MusicApplication13AccountButton *)sub_1956A8();
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC16MusicApplication13AccountButton *v5;
  uint64_t v6;
  _TtC16MusicApplication13AccountButton *v7;
  objc_super v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_14AAB08;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_14AAB08, sub_1E63B4);
  v6 = qword_157FA18;
  v9 = xmmword_1060DF0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  v7 = v5;
  sub_8DF658((uint64_t)&v9, (uint64_t)v7, v6);

  v8.receiver = v7;
  v8.super_class = ObjectType;
  -[AccountButton dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication13AccountButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_profilePerson));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_loadedArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13AccountButton_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13AccountButton_allowedServicesSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13AccountButton_networkConnectivityObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_accountButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_notificationBadgeView));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication13AccountButton *v6;

  v5 = a3;
  v6 = self;
  sub_194840((uint64_t)a3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13AccountButton_size);
  v3 = *(double *)&self->delegate[OBJC_IVAR____TtC16MusicApplication13AccountButton_size];
  result.height = v3;
  result.width = v2;
  return result;
}

@end
