@implementation SKUIURLConnectionRequest

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  objc_super v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIURLConnectionRequest startWithConnectionResponseBlock:].cold.1();
  }
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, &__block_literal_global_69);
  v9[1] = 3221225472;
  v9[2] = __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2;
  v9[3] = &unk_1E73A9CB0;
  v10 = v5;
  v11 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SKUIURLConnectionRequest;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v4;
  v7 = v5;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](&v8, sel_startWithConnectionResponseBlock_, v9);

}

void __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0DAFD58], 0);

}

void __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_4_1);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __61__SKUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0DAFD60], 0);

}

- (void)startWithConnectionResponseBlock:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIURLConnectionRequest startWithConnectionResponseBlock:]";
}

@end
