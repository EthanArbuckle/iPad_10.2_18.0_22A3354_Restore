@implementation SKUIContentInsetScrollView

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentInsetScrollView setScrollIndicatorInsets:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContentInsetScrollView;
  -[SKUIContentInsetScrollView setScrollIndicatorInsets:](&v9, sel_setScrollIndicatorInsets_, top, left, bottom, right);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SKUIScrollViewContentInsetDidChangeNotification"), self);

}

- (void)setScrollIndicatorInsets:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIContentInsetScrollView setScrollIndicatorInsets:]";
}

@end
