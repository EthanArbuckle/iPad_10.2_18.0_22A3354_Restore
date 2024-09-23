@implementation IntentTopic

- (unint64_t):
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [IntentTopic : [String]] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [IntentTopic : [String]] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [IntentTopic : [String]]);
    v2[0] = lazy protocol witness table accessor for type CorrectionsUndoManager and conformance CorrectionsUndoManager(&lazy protocol witness table cache variable for type IntentTopic and conformance IntentTopic, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9B648], MEMORY[0x1E0D9B670]);
    v2[1] = lazy protocol witness table accessor for type [String] and conformance <A> [A]();
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0DEA0D8], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [IntentTopic : [String]] and conformance <> [A : B]);
  }
  return result;
}

@end
