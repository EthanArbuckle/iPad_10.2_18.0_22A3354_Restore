@implementation GKResourceIdentifier

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GKResourceIdentifier initWithKeys:](+[GKResourceIdentifier allocWithZone:](GKResourceIdentifier, "allocWithZone:", a3), "initWithKeys:", self->_keys);
}

- (GKResourceIdentifier)initWithKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  GKResourceIdentifier *v9;
  NSArray *v10;
  NSArray *keys;
  void *v12;
  NSArray *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A GKResourceIdentifier must have at least one key")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKResourceManager.m"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (0 < [keys count])\n[%s (%s:%d)]"), v5, "-[GKResourceIdentifier initWithKeys:]", objc_msgSend(v7, "UTF8String"), 35));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }
  v18.receiver = self;
  v18.super_class = (Class)GKResourceIdentifier;
  v9 = -[GKResourceIdentifier init](&v18, "init");
  if (v9)
  {
    v10 = (NSArray *)objc_msgSend(v4, "copy");
    keys = v9->_keys;
    v9->_keys = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("com.apple.gamed.resourceQueue")));
    v13 = v9->_keys;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A11F8;
    v16[3] = &unk_1002C0A90;
    v17 = v12;
    v14 = v12;
    -[NSArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v16);

  }
  return v9;
}

+ (id)resourceIdentifiersForBagKeys:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1280;
  v4[3] = &unk_1002C0AB0;
  v4[4] = a1;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_gkMapWithBlock:", v4));
}

+ (id)resourceIdentifierForKeys:(id)a3
{
  id v3;
  GKResourceIdentifier *v4;

  v3 = a3;
  v4 = -[GKResourceIdentifier initWithKeys:]([GKResourceIdentifier alloc], "initWithKeys:", v3);

  return v4;
}

- (unint64_t)hash
{
  NSArray *keys;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v10 = -[NSArray hash](self->_keys, "hash");
  keys = self->_keys;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A141C;
  v6[3] = &unk_1002BE8F8;
  v6[4] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](keys, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSArray *keys;
  void *v4;

  keys = self->_keys;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "keys"));
  LOBYTE(keys) = -[NSArray isEqual:](keys, "isEqual:", v4);

  return (char)keys;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKResourceIdentifier;
  v3 = -[GKResourceIdentifier description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ keys: %@"), v4, self->_keys));

  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
