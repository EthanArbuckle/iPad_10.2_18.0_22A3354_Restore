@implementation SearchFindMyFriendOperation

- (NSString)searchQuery
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->searchQuery[OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchQuery];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (AutocompleteContext)context
{
  return (AutocompleteContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                        + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_context));
}

- (BOOL)isOffline
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_isOffline);
}

- (BOOL)singularResults
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_singularResults);
}

- (_TtC4Maps19SearchFindMySession)searchFindMySession
{
  return (_TtC4Maps19SearchFindMySession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                   + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchFindMySession));
}

- (_TtP4Maps35SearchFindMyFriendOperationDelegate_)delegate
{
  return (_TtP4Maps35SearchFindMyFriendOperationDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_delegate, a3);
}

- (_TtC4Maps27SearchFindMyFriendOperation)initWithSearchQuery:(id)a3 context:(id)a4 isOffline:(BOOL)a5 singularResults:(BOOL)a6 searchFindMySession:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC4Maps27SearchFindMyFriendOperation *v16;

  v8 = a6;
  v9 = a5;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = a4;
  v15 = a7;
  v16 = (_TtC4Maps27SearchFindMyFriendOperation *)sub_1001927B8(v11, v13, v14, v9, v8, a7);

  return v16;
}

- (void)start
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_1001874D8();

}

- (void)main
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_100187900();

}

- (void)cancel
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_10018D590();

}

- (BOOL)isExecuting
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_isExecutingOperation);
}

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_isFinishedOperation);
}

- (void)dealloc
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_10018D944();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->searchQuery[OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchQuery]);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchFindMySession));
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_searchTerms));
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_autocompleteItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_matchedContactsDict));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps27SearchFindMyFriendOperation_matchedContactsArray));
}

- (BOOL)checkIfCancelledOrFinished
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_10018DC6C();

  return v3 & 1;
}

- (_TtC4Maps27SearchFindMyFriendOperation)init
{
  _TtC4Maps27SearchFindMyFriendOperation *result;

  result = (_TtC4Maps27SearchFindMyFriendOperation *)_swift_stdlib_reportUnimplementedInitializer("Maps.SearchFindMyFriendOperation", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)contactsMatchingSearchQueryWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps27SearchFindMyFriendOperation *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011A7870, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A7898, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10149E588;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011A78C0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10149A9C0;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_10149F0F0, (uint64_t)v12);
  swift_release();
}

- (void)createAutocompletePersonContacts
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_10019116C();

}

- (void)markOperationAsComplete
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_100191868();

}

- (void)markOperationAsInComplete
{
  _TtC4Maps27SearchFindMyFriendOperation *v2;

  v2 = self;
  sub_100191C00();

}

@end
