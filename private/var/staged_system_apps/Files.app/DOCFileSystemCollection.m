@implementation DOCFileSystemCollection

- (BOOL)isGathering
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_isGathering);
}

- (void)setIsGathering:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _TtC5Files23DOCFileSystemCollection *v7;
  _QWORD v8[5];
  uint64_t v9;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_isGathering) = a3;
  if (a3)
  {
    v4 = swift_allocObject(&unk_1005DEC40, 24, 7);
    *(_QWORD *)(v4 + 16) = self;
    v8[4] = sub_100339344;
    v9 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_10004A82C;
    v8[3] = &unk_1005DEC58;
    v5 = _Block_copy(v8);
    v6 = v9;
    v7 = self;
    swift_release(v6);
    DOCRunInMainThread(v5);
    _Block_release(v5);

  }
}

- (_TtC5Files23DOCFileSystemCollection)init
{
  _TtC5Files23DOCFileSystemCollection *result;

  result = (_TtC5Files23DOCFileSystemCollection *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCFileSystemCollection", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_observedNode));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_internalObservedNode));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCFileSystemCollection__nodes));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_stateLock));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_iCloudRootNodeObservation));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_sortDescriptors));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_propertiesImpactingSort));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_nodesWithPendingUpdates));
  v3 = (char *)self + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_nodesUpdatesFlushInterval;
  v4 = type metadata accessor for DispatchTimeInterval(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files23DOCFileSystemCollection_lastFlushTime, &qword_10064F398);

}

- (void)childChanged:(id)a3 in:(id)a4 for:(unsigned int)a5
{
  id v8;
  id v9;
  _TtC5Files23DOCFileSystemCollection *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_100332098(v8, v9, a5);

}

- (void)nodeChanged:(id)a3 for:(unsigned int)a4
{
  id v6;
  _TtC5Files23DOCFileSystemCollection *v7;

  v6 = a3;
  v7 = self;
  sub_100332B14(v6, a4);

}

- (void)childrenAdded:(id)a3 to:(id)a4
{
  sub_100335164(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_100333454);
}

- (void)childrenDeleted:(id)a3 from:(id)a4
{
  sub_100335164(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_10033407C);
}

- (void)temporaryNodeDeleted:(id)a3
{
  id v4;
  _TtC5Files23DOCFileSystemCollection *v5;

  v4 = a3;
  v5 = self;
  sub_1003351EC(v4);

}

- (void)openSyncStarted:(id)a3
{
  id v4;
  _TtC5Files23DOCFileSystemCollection *v5;

  v4 = a3;
  v5 = self;
  sub_100335990(v4);

}

- (void)openSyncCompleted:(id)a3
{
  id v4;
  _TtC5Files23DOCFileSystemCollection *v5;

  v4 = a3;
  v5 = self;
  sub_100336040(v4);

}

@end
