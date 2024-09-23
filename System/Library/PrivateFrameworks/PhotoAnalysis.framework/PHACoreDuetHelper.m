@implementation PHACoreDuetHelper

+ (id)CoreDuetEventQuery
{
  return objc_alloc_init(MEMORY[0x1E0D15A08]);
}

+ (id)KnowledgeStore
{
  return (id)objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStoreWithDirectReadOnlyAccess");
}

@end
