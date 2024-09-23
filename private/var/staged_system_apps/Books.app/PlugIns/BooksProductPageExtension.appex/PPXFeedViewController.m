@implementation PPXFeedViewController

- (PPXFeedViewController)initWithOptions:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PPXFeedViewController *v11;
  objc_super v13;

  if (a3)
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  else
    v4 = objc_opt_new(NSMutableDictionary);
  v5 = v4;
  v6 = objc_opt_class(NSDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("metadata")));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[JSAFeedMetadata metadataDictionary:variationWithNavigationBarStyle:](JSAFeedMetadata, "metadataDictionary:variationWithNavigationBarStyle:", v9, 1));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, CFSTR("metadata"));
  v13.receiver = self;
  v13.super_class = (Class)PPXFeedViewController;
  v11 = -[PPXFeedViewController initWithOptions:](&v13, "initWithOptions:", v5);

  return v11;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPXFeedViewController;
  -[PPXFeedViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[PPXFeedViewController suspendAndTeardownForReason:](self, "suspendAndTeardownForReason:", CFSTR("PPX disappear"));
}

- (BOOL)runningInExtension
{
  return 1;
}

- (CGSize)_windowSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PPXJSAWindowProvider sharedProvider](PPXJSAWindowProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
