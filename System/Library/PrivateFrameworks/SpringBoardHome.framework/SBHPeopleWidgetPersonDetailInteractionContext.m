@implementation SBHPeopleWidgetPersonDetailInteractionContext

- (SBHPeopleWidgetPersonDetailInteractionContext)initWithPersonURL:(id)a3 sourceIconView:(id)a4 referenceIconView:(id)a5 containerViewController:(id)a6 containerView:(id)a7 homeScreenContentView:(id)a8 homeScreenContentFrame:(CGRect)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  SBHPeopleWidgetPersonDetailInteractionContext *v23;
  uint64_t v24;
  NSURL *personURL;
  id v27;
  id v28;
  objc_super v29;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v19 = a3;
  v28 = a4;
  v27 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SBHPeopleWidgetPersonDetailInteractionContext;
  v23 = -[SBHPeopleWidgetPersonDetailInteractionContext init](&v29, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v19, "copy", v27, v28);
    personURL = v23->_personURL;
    v23->_personURL = (NSURL *)v24;

    objc_storeStrong((id *)&v23->_sourceIconView, a4);
    objc_storeStrong((id *)&v23->_referenceIconView, a5);
    objc_storeStrong((id *)&v23->_containerViewController, a6);
    objc_storeStrong((id *)&v23->_containerView, a7);
    objc_storeStrong((id *)&v23->_homeScreenContentView, a8);
    v23->_homeScreenContentFrame.origin.x = x;
    v23->_homeScreenContentFrame.origin.y = y;
    v23->_homeScreenContentFrame.size.width = width;
    v23->_homeScreenContentFrame.size.height = height;
  }

  return v23;
}

- (NSURL)personURL
{
  return self->_personURL;
}

- (BSInvalidatable)sourceIconView
{
  return self->_sourceIconView;
}

- (SBIconView)referenceIconView
{
  return self->_referenceIconView;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)homeScreenContentView
{
  return self->_homeScreenContentView;
}

- (CGRect)homeScreenContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_homeScreenContentFrame.origin.x;
  y = self->_homeScreenContentFrame.origin.y;
  width = self->_homeScreenContentFrame.size.width;
  height = self->_homeScreenContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenContentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong((id *)&self->_sourceIconView, 0);
  objc_storeStrong((id *)&self->_personURL, 0);
}

@end
