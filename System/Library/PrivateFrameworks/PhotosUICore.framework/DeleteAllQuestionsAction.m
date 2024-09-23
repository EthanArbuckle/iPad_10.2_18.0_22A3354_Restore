@implementation DeleteAllQuestionsAction

uint64_t ___DeleteAllQuestionsAction_block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1728], "deleteQuestions:", *(_QWORD *)(a1 + 32));
}

@end
