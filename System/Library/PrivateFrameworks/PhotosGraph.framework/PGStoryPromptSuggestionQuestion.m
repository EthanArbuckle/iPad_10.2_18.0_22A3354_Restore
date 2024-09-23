@implementation PGStoryPromptSuggestionQuestion

- (PGStoryPromptSuggestionQuestion)initWithPromptId:(id)a3 promptText:(id)a4 isValidated:(BOOL)a5 assetCount:(int64_t)a6 mcAvailabilityStatus:(int64_t)a7 localFactoryScore:(double)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  objc_super v21;

  v13 = sub_1CA85B534();
  v15 = v14;
  v16 = sub_1CA85B534();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedEntityIdentifier);
  *v17 = v13;
  v17[1] = v15;
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedLocalFactoryScore) = a8;
  *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedState) = 0;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___PGStoryPromptSuggestionQuestion_promptText);
  *v18 = v16;
  v18[1] = v19;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_isValidated) = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_assetCount) = (Class)a6;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_mcAvailabilityStatus) = (Class)a7;
  v21.receiver = self;
  v21.super_class = (Class)PGStoryPromptSuggestionQuestion;
  return -[PGStoryPromptSuggestionQuestion init](&v21, sel_init);
}

- (NSString)entityIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)localFactoryScore
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedLocalFactoryScore);
}

- (unsigned)state
{
  return *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedState);
}

- (void)setState:(unsigned __int16)a3
{
  *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___PGStoryPromptSuggestionQuestion_storedState) = a3;
}

- (NSDictionary)additionalInfo
{
  PGStoryPromptSuggestionQuestion *v2;
  void *v3;

  v2 = self;
  PGStoryPromptSuggestionQuestion.additionalInfo.getter();

  v3 = (void *)sub_1CA85B3FC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unsigned)type
{
  return 30;
}

- (unsigned)displayType
{
  return 6;
}

- (unsigned)entityType
{
  return 4;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v4;
  PGStoryPromptSuggestionQuestion *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = PGStoryPromptSuggestionQuestion.isEquivalent(toPersistedQuestion:)(v4);

  return self & 1;
}

- (PGStoryPromptSuggestionQuestion)init
{
  PGStoryPromptSuggestionQuestion *result;

  result = (PGStoryPromptSuggestionQuestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
