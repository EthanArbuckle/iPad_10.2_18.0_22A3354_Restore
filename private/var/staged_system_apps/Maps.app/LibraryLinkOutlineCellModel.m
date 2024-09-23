@implementation LibraryLinkOutlineCellModel

- (_TtC4Maps17LibraryItemsCount)libraryItemsCount
{
  return (_TtC4Maps17LibraryItemsCount *)sub_1000113F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount);
}

- (void)setLibraryItemsCount:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self) ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  _TtC4Maps27LibraryLinkOutlineCellModel *v5;
  _TtC4Maps27LibraryLinkOutlineCellModel *v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = LibraryLinkOutlineCellModel.isEqual(_:)((uint64_t)v9);

  sub_10000C180((uint64_t)v9);
  return v7 & 1;
}

- (int64_t)hash
{
  int64_t *v2;
  int64_t result;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount, v4, 0, 0);
  result = *v2;
  if (*v2)
    return (int64_t)objc_msgSend((id)result, "hash");
  return result;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  uint64_t v2;
  _TtC4Maps27LibraryLinkOutlineCellModel *v3;
  UICollectionViewCellRegistration *v4;

  v2 = qword_101490CA8;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_101490CA8, sub_100011AD4);
  v4 = (UICollectionViewCellRegistration *)(id)qword_1014D4608;

  return v4;
}

- (id)homeDragAndDropObject
{
  return 0;
}

- (_TtC4Maps27LibraryLinkOutlineCellModel)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27LibraryLinkOutlineCellModel_libraryItemsCount) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LibraryLinkOutlineCellModel init](&v5, "init");
}

- (void).cxx_destruct
{

}

@end
