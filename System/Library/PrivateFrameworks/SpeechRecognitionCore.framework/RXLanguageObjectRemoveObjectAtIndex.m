@implementation RXLanguageObjectRemoveObjectAtIndex

void __RXLanguageObjectRemoveObjectAtIndex_block_invoke(uint64_t a1)
{
  uint64_t v2;
  RXRecognitionSystem **v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = (RXRecognitionSystem **)(v2 + 16);
  else
    v3 = 0;
  RXRecognitionSystem::StartChanges(v3[2]);
  RXLanguageObject::RemoveObject((RXLanguageObject *)v3, *(_QWORD *)(a1 + 40));
  RXRecognitionSystem::CommitChanges(v3[2]);
}

@end
