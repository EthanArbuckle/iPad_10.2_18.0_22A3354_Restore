@implementation SiriNLUTypesPrintUtils

+ (id)printableSpanMatchResponseWithSpanMatchResponse:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableSpanMatchResponse(spanMatchResponse:));
}

+ (id)printableSpanMatchResponseWithSpanMatchResponse:(id)a3 withUSOGraph:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = a3;
  static SiriNLUTypesPrintUtils.printableSpanMatchResponse(spanMatchResponse:withUSOGraph:)((uint64_t)v5, a4);

  v6 = (void *)sub_1C2019950();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)printableResponseWithResponse:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableResponse(response:));
}

+ (id)printableRequestWithRequest:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableRequest(request:));
}

+ (id)printableTaskWithTask:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableTask(task:));
}

+ (id)printableEntityCandidateWithEntityCandidate:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableEntityCandidate(entityCandidate:));
}

+ (id)printableSystemDialogActGroupWithSystemDialogActGroup:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableSystemDialogActGroup(systemDialogActGroup:));
}

+ (id)printableSystemDialogActWithSystemDialogAct:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableSystemDialogAct(systemDialogAct:));
}

+ (id)printableUserParseWithUserParse:(id)a3
{
  return sub_1C1EAD64C((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableUserParse(userParse:));
}

- (_TtC12SiriNLUTypes22SiriNLUTypesPrintUtils)init
{
  return (_TtC12SiriNLUTypes22SiriNLUTypesPrintUtils *)SiriNLUTypesPrintUtils.init()();
}

@end
