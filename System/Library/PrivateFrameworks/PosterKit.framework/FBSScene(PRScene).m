@implementation FBSScene(PRScene)

- (void)pr_performUpdate:()PRScene
{
  void (**v4)(id, id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(a1, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v6, "transitionContextClass"), "transitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v8, v7);
  objc_msgSend(a1, "updateClientSettings:withTransitionContext:", v8, v7);

}

@end
