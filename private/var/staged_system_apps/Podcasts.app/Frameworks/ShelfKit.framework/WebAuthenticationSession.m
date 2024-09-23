@implementation WebAuthenticationSession

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4;
  _TtC8ShelfKit24WebAuthenticationSession *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = (id)sub_77130();

  return v6;
}

- (_TtC8ShelfKit24WebAuthenticationSession)init
{
  _TtC8ShelfKit24WebAuthenticationSession *result;

  result = (_TtC8ShelfKit24WebAuthenticationSession *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.WebAuthenticationSession", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_authorizationURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_authenticationSession));

  sub_327A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_startCompletion), *(_QWORD *)&self->authenticationSession[OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_startCompletion]);
  swift_bridgeObjectRelease();
}

@end
