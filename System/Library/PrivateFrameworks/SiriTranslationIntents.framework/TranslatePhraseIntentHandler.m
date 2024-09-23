@implementation TranslatePhraseIntentHandler

- (void)resolvePhraseForTranslatePhrase:(id)a3 withCompletion:(id)a4
{
  sub_228A153AC(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_228A12A88);
}

- (void)resolveTargetLanguageForTranslatePhrase:(id)a3 withCompletion:(id)a4
{
  sub_228A153AC(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_228A13BEC);
}

- (void)confirmTranslatePhrase:(id)a3 completion:(id)a4
{
  sub_228A153AC(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_228A140B4);
}

- (void)handleTranslatePhrase:(id)a3 completion:(id)a4
{
  sub_228A153AC(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_228A147AC);
}

- (_TtC22SiriTranslationIntents28TranslatePhraseIntentHandler)init
{
  sub_228A16648();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_228A3B658();
  OUTLINED_FUNCTION_12_6(v3);
  swift_release();
  v4 = sub_228A3BA00();
  OUTLINED_FUNCTION_12_6(v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC22SiriTranslationIntents28TranslatePhraseIntentHandler_deviceState);
}

@end
