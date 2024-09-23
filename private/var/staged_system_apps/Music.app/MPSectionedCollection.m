@implementation MPSectionedCollection

- (id)filteredWithSections:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  MPSectionedCollection *v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E670;
  v8[3] = &unk_1010A94D8;
  v9 = a3;
  v10 = (id)objc_opt_new(MPMutableSectionedCollection);
  v11 = self;
  v4 = v10;
  v5 = v9;
  -[MPSectionedCollection enumerateSectionsUsingBlock:](self, "enumerateSectionsUsingBlock:", v8);
  v6 = objc_msgSend(v4, "copy");

  return v6;
}

@end
