@implementation THBookUserDefaults

- (THBookUserDefaults)initWithBookID:(id)a3
{
  THBookUserDefaults *v5;
  THBookUserDefaults *v6;
  objc_super v8;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults initWithBookID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"), 26, CFSTR("invalid nil value for '%s'"), "bookID");
  v8.receiver = self;
  v8.super_class = (Class)THBookUserDefaults;
  v5 = -[THBookUserDefaults init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v5->_bookID = (NSString *)objc_msgSend(a3, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBookUserDefaults;
  -[THBookUserDefaults dealloc](&v3, "dealloc");
}

- (id)objectForKey:(id)a3
{
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults objectForKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"), 53, CFSTR("invalid nil value for '%s'"), "defaultName");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_1B1898;
  v12 = sub_1B18A8;
  v13 = 0;
  if (a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1B18B4;
    v7[3] = &unk_42B0B0;
    v7[4] = a3;
    v7[5] = &v8;
    -[THBookUserDefaults p_readBookDefaultsDictionary:](self, "p_readBookDefaultsDictionary:", v7);
    v5 = (void *)v9[5];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  _QWORD v5[6];

  if (a3)
  {
    if (a4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1B1A24;
      v5[3] = &unk_42B0D8;
      v5[4] = a3;
      v5[5] = a4;
      -[THBookUserDefaults p_modifyBookDefaultsDictionary:](self, "p_modifyBookDefaultsDictionary:", v5);
      return;
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults setObject:forKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"), 69, CFSTR("invalid nil value for '%s'"), "value");
    if (a4)
      return;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults setObject:forKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"), 70, CFSTR("invalid nil value for '%s'"), "defaultName");
}

- (void)removeObjectForKey:(id)a3
{
  _QWORD v3[5];

  if (a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1B1AF8;
    v3[3] = &unk_42B100;
    v3[4] = a3;
    -[THBookUserDefaults p_modifyBookDefaultsDictionary:](self, "p_modifyBookDefaultsDictionary:", v3);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookUserDefaults removeObjectForKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookUserDefaults.m"), 82, CFSTR("invalid nil value for '%s'"), "defaultName");
  }
}

- (BOOL)BOOLForKey:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[THBookUserDefaults objectForKey:](self, "objectForKey:", a3);
  v4 = objc_opt_class(NSNumber);
  v6 = TSUDynamicCast(v4, v3).n128_u64[0];
  if (v5 || (v7 = objc_opt_class(NSString), v6 = TSUDynamicCast(v7, v3).n128_u64[0], v5))
    LOBYTE(v5) = objc_msgSend(v5, "BOOLValue", *(double *)&v6);
  return (char)v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  -[THBookUserDefaults setObject:forKey:](self, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3), a4);
}

- (void)registerDefaults:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1B1BE8;
  v3[3] = &unk_42B100;
  v3[4] = a3;
  -[THBookUserDefaults p_modifyBookDefaultsDictionary:](self, "p_modifyBookDefaultsDictionary:", v3);
}

- (void)p_readBookDefaultsDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_opt_class(NSDictionary);
  v6 = TSUCheckedDynamicCast(v5, -[NSUserDefaults objectForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "objectForKey:", self->_bookID));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)p_modifyBookDefaultsDictionary:(id)a3
{
  id v5;
  NSUserDefaults *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_1B1898;
  v12 = sub_1B18A8;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B1E60;
  v7[3] = &unk_42B128;
  v7[4] = &v8;
  -[THBookUserDefaults p_readBookDefaultsDictionary:](self, "p_readBookDefaultsDictionary:", v7);
  if (!v9[5])
  {
    v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v9[5] = (uint64_t)v5;
  }
  (*((void (**)(id))a3 + 2))(a3);
  v6 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults setObject:forKey:](v6, "setObject:forKey:", v9[5], self->_bookID);
  _Block_object_dispose(&v8, 8);
}

@end
