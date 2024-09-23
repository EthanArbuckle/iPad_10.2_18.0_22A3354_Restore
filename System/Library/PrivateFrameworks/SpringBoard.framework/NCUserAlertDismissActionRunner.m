@implementation NCUserAlertDismissActionRunner

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  void *v8;
  void *v9;
  void (**v10)(id, uint64_t);

  v10 = (void (**)(id, uint64_t))a7;
  -[NCUserAlertActionRunner alertItem](self, "alertItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "deactivate");
  if (v10)
    v10[2](v10, 1);

}

@end
