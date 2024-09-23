@implementation TSMastheadDisplayOptions

- (TSMastheadDisplayOptions)initWithDisplayMode:(int64_t)a3 styleOptions:(id)a4 statusBarVisiblityOffset:(double)a5
{
  id v8;

  v8 = a4;
  return (TSMastheadDisplayOptions *)MastheadDisplayOptions.init(displayMode:styleOptions:statusBarVisiblityOffset:)(a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  return sub_1B1661EF8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))MastheadDisplayOptions.isEqual(_:));
}

- (TSMastheadDisplayOptions)init
{
  MastheadDisplayOptions.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_3_140((uint64_t)self, OBJC_IVAR___TSMastheadDisplayOptions_styleOptions);
}

@end
