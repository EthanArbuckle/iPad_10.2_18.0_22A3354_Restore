@implementation NSDictionary

- (id)jsa_stringDictionaryForRequestHeaderOrURLParam
{
  NSMutableDictionary *v3;
  id v4;
  _QWORD v6[4];
  NSMutableDictionary *v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BCD4;
  v6[3] = &unk_9E258;
  v7 = objc_opt_new(NSMutableDictionary);
  v3 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = -[NSMutableDictionary copy](v3, "copy");

  return v4;
}

@end
