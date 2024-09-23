@implementation NSSet

- (id)_lowercaseSet
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007EADC;
  v6[3] = &unk_10013F3C8;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", -[NSSet count](self, "count")));
  v3 = v7;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

@end
