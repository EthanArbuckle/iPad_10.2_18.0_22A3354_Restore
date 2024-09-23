@implementation ContinuationBasedXPCBridge

- (void)sendSuggestionsWithSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_2472782C8();
  v7 = v6;

  sub_24726B028();
  sub_2471FD35C(v5, v7);

}

- (void)connectionErrorWithError:(id)a3
{
  _TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_24726B324(v5);

}

- (void)finalise
{
  _TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge *v2;

  v2 = self;
  sub_24726B3AC();

}

- (_TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge)init
{
  sub_24726B4B0();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge_continuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
