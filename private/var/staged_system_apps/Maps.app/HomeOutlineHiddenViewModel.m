@implementation HomeOutlineHiddenViewModel

+ (id)sharedViewModel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10076E774;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D31D0 != -1)
    dispatch_once(&qword_1014D31D0, block);
  return (id)qword_1014D31C8;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[HomeOutlineHiddenCellRegistration sharedRegistration](HomeOutlineHiddenCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return 0;
}

@end
