@implementation RelatedSearchSuggestionOutlineCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BCFD3C;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D4358 != -1)
    dispatch_once(&qword_1014D4358, block);
  return (id)qword_1014D4350;
}

@end
