@implementation PKAggregateDictionary

+ (id)sharedDictionary
{
  if (qword_1ECF22AC8 != -1)
    dispatch_once(&qword_1ECF22AC8, &__block_literal_global_187);
  return (id)_MergedGlobals_272;
}

void __41__PKAggregateDictionary_sharedDictionary__block_invoke()
{
  PKAggregateDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(PKAggregateDictionary);
  v1 = (void *)_MergedGlobals_272;
  _MergedGlobals_272 = (uint64_t)v0;

}

@end
