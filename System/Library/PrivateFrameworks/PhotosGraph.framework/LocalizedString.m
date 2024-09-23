@implementation LocalizedString

- (_TtC11PhotosGraph15LocalizedString)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocalizedString();
  return -[LocalizedString init](&v3, sel_init);
}

- (_TtC11PhotosGraph15LocalizedString)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LocalizedString();
  return -[LocalizedString initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC11PhotosGraph15LocalizedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC11PhotosGraph15LocalizedString *v11;

  v6 = a3;
  v7 = a4;
  v8 = sub_1CA85A490();
  v10 = v9;

  sub_1CA85B534();
  v11 = (_TtC11PhotosGraph15LocalizedString *)sub_1CA3CFC30();
  sub_1CA260204(v8, v10);
  return v11;
}

@end
