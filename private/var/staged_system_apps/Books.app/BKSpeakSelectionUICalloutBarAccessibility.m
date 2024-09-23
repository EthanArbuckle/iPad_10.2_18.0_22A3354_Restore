@implementation BKSpeakSelectionUICalloutBarAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UICalloutBar");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)updateAvailableButtons
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKSpeakSelectionUICalloutBarAccessibility;
  -[BKSpeakSelectionUICalloutBarAccessibility updateAvailableButtons](&v4, "updateAvailableButtons");
  if (NSClassFromString(CFSTR("AXQuickSpeak")))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100140E94;
    v3[3] = &unk_1008E72C0;
    v3[4] = self;
    sub_100099F24(v3);
  }
}

@end
