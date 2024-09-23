@implementation SpatialGenericPlatter

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure21SpatialGenericPlatter *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100192190(v6, v7);

  return v9 & 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t (*v11)(uint64_t, uint64_t);
  id v12;
  _TtC7Measure21SpatialGenericPlatter *v13;
  int64_t v14;

  if (a4)
    return 0;
  v7 = (char *)self + qword_100488878;
  result = swift_unknownObjectWeakLoadStrong((char *)self + qword_100488878, a2);
  if (result)
  {
    v8 = (void *)result;
    v9 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType(result);
    v11 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 16);
    v12 = a3;
    v13 = self;
    v14 = v11(ObjectType, v9);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Measure21SpatialGenericPlatter *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100192370(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC7Measure21SpatialGenericPlatter *v5;

  v4 = a3;
  v5 = self;
  sub_10018F158();

}

@end
