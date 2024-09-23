@implementation UIViewController

+ (id)_makeSearchResultsViewControllerWithViewModel:(id)a3
{
  id v4;
  id v5;
  id result;
  id v7;
  id v8;

  v4 = objc_allocWithZone((Class)type metadata accessor for SearchResultsViewController(0));
  v5 = a3;
  result = (id)sub_100007314(v5);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", result);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
