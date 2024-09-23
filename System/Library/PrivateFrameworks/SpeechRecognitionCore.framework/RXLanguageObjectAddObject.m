@implementation RXLanguageObjectAddObject

void __RXLanguageObjectAddObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  RXRecognitionSystem **v3;
  uint64_t v4;
  RXLanguageObject *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = (RXRecognitionSystem **)(v2 + 16);
  else
    v3 = 0;
  RXRecognitionSystem::StartChanges(v3[2]);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = (RXLanguageObject *)(v4 + 16);
  else
    v5 = 0;
  RXLanguageObject::AddObject((RXLanguageObject *)v3, v5);
  RXRecognitionSystem::CommitChanges(v3[2]);
}

@end
