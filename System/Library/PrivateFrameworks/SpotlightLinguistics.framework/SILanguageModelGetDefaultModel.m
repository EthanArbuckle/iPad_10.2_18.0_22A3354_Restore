@implementation SILanguageModelGetDefaultModel

uint64_t __SILanguageModelGetDefaultModel_block_invoke()
{
  uint64_t result;

  result = SILanguageModelCreateWithOptions(0, 0);
  SILanguageModelGetDefaultModel::model = result;
  return result;
}

@end
