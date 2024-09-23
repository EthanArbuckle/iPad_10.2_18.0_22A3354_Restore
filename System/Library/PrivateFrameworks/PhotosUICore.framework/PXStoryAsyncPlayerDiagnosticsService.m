@implementation PXStoryAsyncPlayerDiagnosticsService

- (PXStoryAsyncPlayerDiagnosticsService)initWithItemProviders:(id)a3
{
  unint64_t v3;

  sub_1A6856488(0, &qword_1EE9081D8);
  v3 = sub_1A7AE3A10();
  return (PXStoryAsyncPlayerDiagnosticsService *)StoryAsyncPlayerDiagnosticsService.init(itemProviders:)(v3);
}

- (NSString)title
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (BOOL)canPerformAction
{
  return 1;
}

- (void)performAction
{
  PXStoryAsyncPlayerDiagnosticsService *v2;

  v2 = self;
  sub_1A709E10C();

}

- (void).cxx_destruct
{

}

@end
