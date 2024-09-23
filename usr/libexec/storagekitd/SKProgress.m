@implementation SKProgress

- (void)setLocalizedAdditionalDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

  -[SKProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v6, _NSProgressRemoteLocalizedAdditionalDescriptionKey);
  v7.receiver = self;
  v7.super_class = (Class)SKProgress;
  -[SKProgress setLocalizedAdditionalDescription:](&v7, "setLocalizedAdditionalDescription:", v6);

}

+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3
{
  SKProgress *v4;

  v4 = objc_opt_new(SKProgress);
  -[SKProgress setTotalUnitCount:](v4, "setTotalUnitCount:", a3);
  return v4;
}

- (SKProgress)init
{
  SKProgress *v2;
  SKProgress *v3;
  NSMutableArray *v4;
  NSMutableArray *children;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKProgress;
  v2 = -[SKProgress init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[SKProgress set_adoptChildUserInfo:](v2, "set_adoptChildUserInfo:", 1);
    -[SKProgress setLocalizedAdditionalDescription:](v3, "setLocalizedAdditionalDescription:", &stru_100046738);
    v4 = objc_opt_new(NSMutableArray);
    children = v3->_children;
    v3->_children = v4;

  }
  return v3;
}

- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[SKProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgress children](self, "children"));
  objc_msgSend(v7, "addObject:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, _NSProgressRemoteLocalizedAdditionalDescriptionKey, 0, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  void *v8;
  id v9;

  v7 = _NSProgressRemoteLocalizedAdditionalDescriptionKey;
  if (objc_msgSend(a3, "isEqualToString:", _NSProgressRemoteLocalizedAdditionalDescriptionKey, a4, a5, a6))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SKProgress userInfo](self, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));
    -[SKProgress setLocalizedAdditionalDescription:](self, "setLocalizedAdditionalDescription:", v8);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgress children](self, "children"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002ACAC;
  v5[3] = &unk_100045950;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)SKProgress;
  -[SKProgress dealloc](&v4, "dealloc");
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
