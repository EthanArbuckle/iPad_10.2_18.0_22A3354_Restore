@implementation NSDictionary

- (id)compactDescription
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032D08;
  v6[3] = &unk_1002DB7F8;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" ")));

  return v4;
}

@end
