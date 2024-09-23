@implementation UIViewController

- (void)present:(id)a3 :(BOOL)a4
{
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, a4, 0);
}

+ (id)jsa_topMostViewControllerForWindow:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowManager"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyWindow"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

  if (v9)
  {
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
      v8 = v10;
    }
    while (v11);
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

+ (void)jsa_presentViewController:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v9 = _Block_copy(a6);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (v9)
  {
    v11 = swift_allocObject(&unk_A1E90, 24, 7);
    *(_QWORD *)(v11 + 16) = v9;
    v9 = sub_6C1AC;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  _sSo16UIViewControllerC5JSAppE7present_7options8animated10completionyAB_SDys11AnyHashableVypGSbyycSgtFZ_0(v12, v10, a5, (uint64_t)v9, v11);
  sub_2D4DC((uint64_t)v9, v11);

  swift_bridgeObjectRelease(v10);
}

@end
