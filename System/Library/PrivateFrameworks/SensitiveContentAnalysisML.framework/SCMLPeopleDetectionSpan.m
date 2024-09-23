@implementation SCMLPeopleDetectionSpan

- (SCMLPeopleDetectionSpan)init
{
  SCMLPeopleDetectionSpan *v2;
  SCMLPeopleDetectionSpan *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCMLPeopleDetectionSpan;
  v2 = -[SCMLPeopleDetectionSpan init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SCMLPeopleDetectionSpan setRange:](v2, "setRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[SCMLPeopleDetectionSpan setIsGeneric:](v3, "setIsGeneric:", 0);
    -[SCMLPeopleDetectionSpan setIsGroup:](v3, "setIsGroup:", 0);
    -[SCMLPeopleDetectionSpan setHasAge:](v3, "setHasAge:", 0);
    -[SCMLPeopleDetectionSpan setHasGender:](v3, "setHasGender:", 0);
    -[SCMLPeopleDetectionSpan setHasEthnicity:](v3, "setHasEthnicity:", 0);
  }
  return v3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (BOOL)isGeneric
{
  return self->_isGeneric;
}

- (void)setIsGeneric:(BOOL)a3
{
  self->_isGeneric = a3;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (BOOL)hasGender
{
  return self->_hasGender;
}

- (void)setHasGender:(BOOL)a3
{
  self->_hasGender = a3;
}

- (BOOL)hasEthnicity
{
  return self->_hasEthnicity;
}

- (void)setHasEthnicity:(BOOL)a3
{
  self->_hasEthnicity = a3;
}

- (BOOL)hasImplicitCategoryRequiringPersonalization
{
  return self->_hasImplicitCategoryRequiringPersonalization;
}

- (void)setHasImplicitCategoryRequiringPersonalization:(BOOL)a3
{
  self->_hasImplicitCategoryRequiringPersonalization = a3;
}

- (NSArray)ageSpans
{
  return self->_ageSpans;
}

- (void)setAgeSpans:(id)a3
{
  objc_storeStrong((id *)&self->_ageSpans, a3);
}

- (NSArray)genderSpans
{
  return self->_genderSpans;
}

- (void)setGenderSpans:(id)a3
{
  objc_storeStrong((id *)&self->_genderSpans, a3);
}

- (NSArray)ethnicitySpans
{
  return self->_ethnicitySpans;
}

- (void)setEthnicitySpans:(id)a3
{
  objc_storeStrong((id *)&self->_ethnicitySpans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ethnicitySpans, 0);
  objc_storeStrong((id *)&self->_genderSpans, 0);
  objc_storeStrong((id *)&self->_ageSpans, 0);
}

@end
