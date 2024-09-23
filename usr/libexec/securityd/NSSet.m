@implementation NSSet

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self, "allObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "compare:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concatenateWithSeparator:", CFSTR(", ")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{[%@]}"), v4));

  return v5;
}

- (id)sortedElementsJoinedByString:(id)a3
{
  return -[NSSet sortedElementsTruncated:JoinedByString:](self, "sortedElementsTruncated:JoinedByString:", 0, a3);
}

- (id)sortedElementsTruncated:(unint64_t)a3 JoinedByString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  unint64_t v15;

  v6 = a4;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100032A34;
  v13 = &unk_1002DB848;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = a3;
  v7 = v14;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(v7, "sortUsingSelector:", "compare:", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", v6));

  return v8;
}

- (BOOL)containsElementsNotIn:(id)a3
{
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032BB4;
  v6[3] = &unk_1002DB820;
  v4 = a3;
  v7 = v4;
  v8 = &v9;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (BOOL)isEmpty
{
  return -[NSSet count](self, "count") == 0;
}

@end
