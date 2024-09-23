@implementation TITypologyRecordLastAcceptedCandidateCorrected

- (TITypologyRecordLastAcceptedCandidateCorrected)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TITypologyRecordLastAcceptedCandidateCorrected;
  return -[TITypologyRecord initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TITypologyRecordLastAcceptedCandidateCorrected;
  -[TITypologyRecord encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (id)shortDescription
{
  return CFSTR("LAST ACCEPTED CANDIDATE CORRECTED");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordLastAcceptedCandidateCorrected:", self);
}

@end
