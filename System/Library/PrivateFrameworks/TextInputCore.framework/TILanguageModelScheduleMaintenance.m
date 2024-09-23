@implementation TILanguageModelScheduleMaintenance

id __TILanguageModelScheduleMaintenance_block_invoke()
{
  return +[TILanguageModelMaintainer sharedLanguageModelMaintainer](TILanguageModelMaintainer, "sharedLanguageModelMaintainer");
}

@end
