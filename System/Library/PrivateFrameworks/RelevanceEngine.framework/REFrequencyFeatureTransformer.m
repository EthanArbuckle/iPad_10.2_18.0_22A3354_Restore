@implementation REFrequencyFeatureTransformer

+ (id)frequencyTransformWithCount:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "frequencyTransformWithCount:minimumValidCount:", a3, -1);
}

+ (id)frequencyTransformWithCount:(unint64_t)a3 minimumValidCount:(int64_t)a4
{
  void *v5;
  _REFrequencyFeatureTransformer *v6;
  CFTypeRef v8;
  CFTypeRef v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = (CFTypeRef)RECreateIntegerFeatureValueTaggedPointer(a3);
  v9 = (CFTypeRef)RECreateIntegerFeatureValueTaggedPointer(a4);
  +[RETransformerInvocation invocationWithArguments:count:](RETransformerInvocation, "invocationWithArguments:count:", &v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REReleaseFeatureValueTaggedPointer(v8);
  REReleaseFeatureValueTaggedPointer(v9);
  v6 = objc_alloc_init(_REFrequencyFeatureTransformer);
  -[_REFrequencyFeatureTransformer configureWithInvocation:](v6, "configureWithInvocation:", v5);

  return v6;
}

@end
