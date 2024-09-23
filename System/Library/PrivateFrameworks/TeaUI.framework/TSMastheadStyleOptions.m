@implementation TSMastheadStyleOptions

- (TSMastheadStyleOptions)initWithMastheadTextColor:(id)a3
{
  TSMastheadStyleOptions *result;

  MastheadStyleOptions.init(mastheadTextColor:)((uint64_t)a3);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1B1661EF8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MastheadStyleOptions.isEqual(_:));
}

- (TSMastheadStyleOptions)init
{
  MastheadStyleOptions.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_3_140((uint64_t)self, OBJC_IVAR___TSMastheadStyleOptions_mastheadTextColor);
}

@end
