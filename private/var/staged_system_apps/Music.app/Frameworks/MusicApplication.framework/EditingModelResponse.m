@implementation EditingModelResponse

- (_TtC16MusicApplication20EditingModelResponse)initWithRequest:(id)a3
{
  id v4;
  _TtC16MusicApplication20EditingModelResponse *result;
  _TtC16MusicApplication20EditingModelResponse *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EditingModelResponse();
  v4 = a3;
  result = -[EditingModelResponse initWithRequest:](&v7, "initWithRequest:", v4);
  if (result)
  {
    v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication20EditingModelResponse *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1350D28, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1D6A9C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_216664(a3, (uint64_t)v6, v7);
  sub_5C198((uint64_t)v6, v7);

}

@end
