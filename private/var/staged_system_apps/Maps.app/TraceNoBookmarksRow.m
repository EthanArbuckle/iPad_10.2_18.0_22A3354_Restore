@implementation TraceNoBookmarksRow

- (void)configureCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TraceNoBookmarksRow;
  v3 = a3;
  -[TraceBookmarkRow configureCell:](&v6, "configureCell:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
}

@end
