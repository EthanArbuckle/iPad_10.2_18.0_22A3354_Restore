@implementation PGWeekdayFeatureExtractor

- (PGWeekdayFeatureExtractor)initWithError:(id *)a3
{
  void *v4;
  void *v5;
  PGWeekdayFeatureExtractor *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("Weekday");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNode weekdayOfMoment](PGGraphMomentNode, "weekdayOfMoment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PGWeekdayFeatureExtractor;
  v6 = -[PGGraphFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v8, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("Weekday"), v4, v5, &__block_literal_global_18089);

  return v6;
}

uint64_t __43__PGWeekdayFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

@end
