@implementation SuggestedActionsService

- (_TtC10LinkDaemon23SuggestedActionsService)init
{
  sub_10005BCDC();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->applicationSuggestionsProvider[OBJC_IVAR____TtC10LinkDaemon23SuggestedActionsService_applicationSuggestionsProvider]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10LinkDaemon23SuggestedActionsService_registrySource));
}

- (void)suggestedActionsForSuggestionsRequests:(NSArray *)a3 reply:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSArray *v8;
  _TtC10LinkDaemon23SuggestedActionsService *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_10011C2F8, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100004C84((uint64_t)&unk_100129CE8, (uint64_t)v7);
}

@end
