@implementation PhotosSlideTransitionTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_244339F08();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_244339FC8();

  return v6;
}

- (_TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate)init
{
  return (_TtC18PhotosUIFoundationP33_245E59FB3AED492785587A094999446D42PhotosSlideTransitionTransitioningDelegate *)sub_24433A05C();
}

@end
