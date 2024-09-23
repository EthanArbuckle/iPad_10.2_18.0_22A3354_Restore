@implementation PGStoryPromptSuggestionQuestionFactory

- (PGStoryPromptSuggestionQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGStoryPromptSuggestionQuestionFactory;
  return -[PGSurveyQuestionFactory initWithWorkingContext:questionVersion:](&v5, sel_initWithWorkingContext_questionVersion_, a3, a4);
}

- (unsigned)questionType
{
  return 30;
}

- (int64_t)questionOptions
{
  return 0x10000000;
}

- (id)generateQuestionsWithLimit:(int64_t)a3 progressBlock:(id)a4
{
  void *v6;
  PGStoryPromptSuggestionQuestionFactory *v7;
  void *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1CA24E700(a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED874A08);
  v8 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return v8;
}

- (PGStoryPromptSuggestionQuestionFactory)init
{
  PGStoryPromptSuggestionQuestionFactory *result;

  result = (PGStoryPromptSuggestionQuestionFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
