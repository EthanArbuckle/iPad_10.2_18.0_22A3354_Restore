@implementation SKUIShareTemplateActivity

- (SKUIShareTemplateActivity)initWithActivityViewElement:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUIShareTemplateActivity *v9;
  SKUIShareTemplateActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareTemplateActivity initWithActivityViewElement:clientContext:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIShareTemplateActivity;
  v9 = -[UIActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_viewElement, a3);
  }

  return v10;
}

- (id)activityImage
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  -[SKUIShareSheetActivityViewElement activityType](self->_viewElement, "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("gift")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3870];
    v5 = CFSTR("ShareSheetGift");
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR("wishlist")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3870];
    v5 = CFSTR("ShareSheetWishList");
  }
  objc_msgSend(v4, "imageNamed:inBundle:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (id)activityTitle
{
  void *v3;
  SKUIClientContext *clientContext;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;

  -[SKUIShareSheetActivityViewElement activityType](self->_viewElement, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("gift")))
  {
    clientContext = self->_clientContext;
    if (clientContext)
    {
      v5 = CFSTR("SHARE_SHEET_GIFT_TITLE");
LABEL_7:
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v7 = (void *)v6;
      goto LABEL_13;
    }
    v8 = CFSTR("SHARE_SHEET_GIFT_TITLE");
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("wishlist")))
  {
    clientContext = self->_clientContext;
    if (clientContext)
    {
      v5 = CFSTR("ADD_TO_WISHLIST");
      goto LABEL_7;
    }
    v8 = CFSTR("ADD_TO_WISHLIST");
LABEL_11:
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v8, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (id)activityType
{
  void *v2;
  const __CFString *v3;

  -[SKUIShareSheetActivityViewElement activityType](self->_viewElement, "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("gift")) & 1) != 0)
  {
    v3 = CFSTR("SKUIActivityTypeGift");
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("wishlist")))
  {
    v3 = CFSTR("SKUIActivityTypeWishlist");
  }
  else
  {
    v3 = 0;
  }

  return (id)v3;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x1E0CEB1C0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  SKUIShareSheetActivityViewElement *v3;
  dispatch_time_t v4;
  SKUIShareSheetActivityViewElement *v5;
  _QWORD v6[4];
  SKUIShareSheetActivityViewElement *v7;
  SKUIShareTemplateActivity *v8;

  v3 = self->_viewElement;
  v4 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SKUIShareTemplateActivity_performActivity__block_invoke;
  v6[3] = &unk_1E739FD10;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], v6);

}

uint64_t __44__SKUIShareTemplateActivity_performActivity__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SKUIShareTemplateActivity_performActivity__block_invoke_2;
  v3[3] = &unk_1E73A2D58;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, v3);
}

uint64_t __44__SKUIShareTemplateActivity_performActivity__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithActivityViewElement:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShareTemplateActivity initWithActivityViewElement:clientContext:]";
}

@end
