@implementation CNVCardParsingConcurrencyStrategy

+ (id)strategyForOptions:(id)a3
{
  int v3;
  __objc2_class **v4;

  v3 = objc_msgSend(a1, "shouldTryConcurrentParsingForOptions:", a3);
  v4 = off_1E956ED80;
  if (!v3)
    v4 = &off_1E956ED88;
  return objc_alloc_init(*v4);
}

+ (BOOL)shouldTryConcurrentParsingForOptions:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "useConcurrentParsing"))
    v4 = (unint64_t)objc_msgSend(v3, "contactLimit") > 0x7F;
  else
    v4 = 0;

  return v4;
}

@end
