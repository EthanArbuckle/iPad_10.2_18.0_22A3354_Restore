@implementation RXLanguageObjectSetObjectAtIndex

void __RXLanguageObjectSetObjectAtIndex_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  RXRecognitionSystem **v3;
  uint64_t v4;
  RXLanguageObject *v5;

  v2 = a1[4];
  if (v2)
    v3 = (RXRecognitionSystem **)(v2 + 16);
  else
    v3 = 0;
  RXRecognitionSystem::StartChanges(v3[2]);
  v4 = a1[6];
  if (v4)
    v5 = (RXLanguageObject *)(v4 + 16);
  else
    v5 = 0;
  RXLanguageObject::SetObject((RXLanguageObject *)v3, a1[5], v5);
  RXRecognitionSystem::CommitChanges(v3[2]);
}

@end
