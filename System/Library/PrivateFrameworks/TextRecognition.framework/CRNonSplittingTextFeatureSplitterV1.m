@implementation CRNonSplittingTextFeatureSplitterV1

- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD, void *, char *, double);
  id v6;
  void *v7;
  char v8;

  v5 = (void (**)(id, _QWORD, void *, char *, double))a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_recognizerRegionsFromLineRegions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v5[2](v5, 0, v7, &v8, 1.0);

}

@end
