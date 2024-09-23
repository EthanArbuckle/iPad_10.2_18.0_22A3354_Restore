@implementation AMPWritingDirectionsCounts

- (unint64_t)natural
{
  unint64_t result;

  WritingDirectionsCounts.natural.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (unint64_t)leftToRight
{
  unint64_t result;

  WritingDirectionsCounts.leftToRight.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (unint64_t)rightToLeft
{
  unint64_t result;

  WritingDirectionsCounts.rightToLeft.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (unint64_t)total
{
  unint64_t result;

  WritingDirectionsCounts.total.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (unint64_t)significantValues
{
  unint64_t result;

  WritingDirectionsCounts.significantValues.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)hasStronglyTypedCounts
{
  BOOL result;

  WritingDirectionsCounts.hasStronglyTypedCounts.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isRTLEnough
{
  BOOL result;

  WritingDirectionsCounts.isRTLEnough.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isRTLMinimal
{
  BOOL result;

  WritingDirectionsCounts.isRTLMinimal.getter();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (AMPWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5
{
  AMPWritingDirectionsCounts *result;

  WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)((char *)a3, a4, a5);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  AMPWritingDirectionsCounts *v4;
  AMPWritingDirectionsCounts *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DA144B7C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = WritingDirectionsCounts.isEqual(_:)((uint64_t)v8);

  sub_1D975077C((uint64_t)v8);
  return v6;
}

+ (id)add:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)static WritingDirectionsCounts.add(_:_:)(v5, v6);

  return OUTLINED_FUNCTION_15_14(v7);
}

+ (AMPWritingDirectionsCounts)zero
{
  return (AMPWritingDirectionsCounts *)static WritingDirectionsCounts.zero.getter();
}

- (NSString)description
{
  AMPWritingDirectionsCounts *v2;
  void *v3;

  v2 = self;
  WritingDirectionsCounts.description.getter();

  v3 = (void *)sub_1DA143E50();
  OUTLINED_FUNCTION_46();
  return (NSString *)OUTLINED_FUNCTION_15_14(v3);
}

- (AMPWritingDirectionsCounts)init
{
  WritingDirectionsCounts.init()();
}

@end
