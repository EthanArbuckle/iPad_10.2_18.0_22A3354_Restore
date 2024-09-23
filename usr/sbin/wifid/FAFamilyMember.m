@implementation FAFamilyMember

- (id)wifiDisplayName
{
  id v3;
  NSString *v4;

  v3 = objc_alloc_init((Class)NSPersonNameComponents);
  objc_msgSend(v3, "setGivenName:", -[FAFamilyMember firstName](self, "firstName"));
  objc_msgSend(v3, "setFamilyName:", -[FAFamilyMember lastName](self, "lastName"));
  v4 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v3, 0, 0);

  return v4;
}

@end
