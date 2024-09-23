@implementation PXLemonadePeopleCellSpecsConstants

+ (double)cornerRadius
{
  return sub_1A69C8228((uint64_t)a1, (uint64_t)a2, &qword_1EE94F140, (uint64_t)&qword_1EE9989A8);
}

+ (double)smallCornerRadius
{
  return sub_1A69C8228((uint64_t)a1, (uint64_t)a2, qword_1EE94F148, (uint64_t)&qword_1EE9989B0);
}

- (PXLemonadePeopleCellSpecsConstants)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PXLemonadePeopleCellSpecsConstants init](&v3, sel_init);
}

@end
