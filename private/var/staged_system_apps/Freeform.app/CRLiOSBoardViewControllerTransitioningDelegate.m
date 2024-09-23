@implementation CRLiOSBoardViewControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8Freeform46CRLiOSBoardViewControllerTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10057A184(v8, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC8Freeform46CRLiOSBoardViewControllerTransitioningDelegate *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_10057ABA0(v4);
  v7 = v6;

  return v7;
}

- (_TtC8Freeform46CRLiOSBoardViewControllerTransitioningDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSBoardViewControllerTransitioningDelegate();
  return -[CRLiOSBoardViewControllerTransitioningDelegate init](&v3, "init");
}

@end
