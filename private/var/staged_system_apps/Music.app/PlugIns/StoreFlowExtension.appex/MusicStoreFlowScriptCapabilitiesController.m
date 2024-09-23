@implementation MusicStoreFlowScriptCapabilitiesController

- (id)hasUserRequestedSubscriptionHidden
{
  id v2;
  unsigned int v3;
  id *v4;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
  objc_msgSend(v2, "synchronize");
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UserRequestedSubscriptionHidden"));

  v4 = (id *)&kCFBooleanTrue;
  if (!v3)
    v4 = (id *)&kCFBooleanFalse;
  return *v4;
}

- (id)isCloudLibraryEnabled
{
  unsigned int v2;
  id *v3;

  v2 = objc_msgSend(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"), "isCloudLibraryEnabled");
  v3 = (id *)&kCFBooleanTrue;
  if (!v2)
    v3 = (id *)&kCFBooleanFalse;
  return *v3;
}

- (void)setCloudLibraryEnabled:(id)a3
{
  +[WebScriptObject throwException:](WebScriptObject, "throwException:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("isCloudLibraryEnabled")));
}

- (void)setHasUserRequestedSubscriptionHidden:(id)a3
{
  id v3;
  id v4;

  v3 = objc_msgSend(a3, "BOOLValue");
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
  if ((_DWORD)v3 != objc_msgSend(v4, "BOOLForKey:", CFSTR("UserRequestedSubscriptionHidden")))
  {
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("UserRequestedSubscriptionHidden"));
    objc_msgSend(v4, "synchronize");
  }

}

- (void)enableCloudLibraryWithMergingFromCloudAllowed:(id)a3 completionFunction:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char isKindOfClass;
  id v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[2];
  CFBooleanRef v18;

  v7 = objc_opt_class(WebUndefined, a2);
  if ((objc_opt_isKindOfClass(a4, v7) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_opt_class(NSNull, v8);
    isKindOfClass = objc_opt_isKindOfClass(a4, v10);
    v9 = 0;
    if (a4 && (isKindOfClass & 1) == 0)
      v9 = objc_msgSend(objc_alloc((Class)SUScriptFunction), "initWithScriptObject:", a4);
  }
  objc_msgSend(v9, "setThisObject:", self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004A34;
  v15[3] = &unk_10000C370;
  v15[4] = v9;
  v12 = +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  if (v12)
  {
    v13 = v12;
    v16[0] = MPCloudControllerEnableCloudLibraryOptionStartInitialImport;
    v16[1] = MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary;
    v17[0] = &__kCFBooleanTrue;
    v17[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "BOOLValue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100004AD4;
    v14[3] = &unk_10000C398;
    v14[4] = v15;
    objc_msgSend(v13, "enableCloudLibraryWithOptions:completionHandler:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2), v14);
  }
  else
  {
    v18 = kCFBooleanFalse;
    objc_msgSend(v9, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    objc_msgSend(v9, "setThisObject:", 0);
  }

}

- (void)disableCloudLibraryWithCompletionFunction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  CFBooleanRef v13;

  v5 = objc_opt_class(WebUndefined, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_opt_class(NSNull, v6);
    isKindOfClass = objc_opt_isKindOfClass(a3, v8);
    v7 = 0;
    if (a3 && (isKindOfClass & 1) == 0)
      v7 = objc_msgSend(objc_alloc((Class)SUScriptFunction), "initWithScriptObject:", a3);
  }
  objc_msgSend(v7, "setThisObject:", self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004CB4;
  v12[3] = &unk_10000C370;
  v12[4] = v7;
  v10 = +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004D54;
    v11[3] = &unk_10000C398;
    v11[4] = v12;
    objc_msgSend(v10, "disableCloudLibraryWithCompletionHandler:", v11);
  }
  else
  {
    v13 = kCFBooleanFalse;
    objc_msgSend(v7, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v7, "setThisObject:", 0);
  }

}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = objc_msgSend((id)qword_100011B88, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MusicStoreFlowScriptCapabilitiesController;
    return objc_msgSendSuper2(&v6, "webScriptNameForKeyName:", a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, &qword_100011B90, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MusicStoreFlowScriptCapabilitiesController;
    return objc_msgSendSuper2(&v6, "webScriptNameForSelector:", a3);
  }
  return result;
}

- (id)attributeKeys
{
  return -[MusicStoreFlowScriptCapabilitiesController scriptAttributeKeys](self, "scriptAttributeKeys");
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowScriptCapabilitiesController;
  v2 = -[MusicStoreFlowScriptCapabilitiesController scriptAttributeKeys](&v4, "scriptAttributeKeys");
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)qword_100011B88, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class(MusicStoreFlowScriptCapabilitiesController, a2) == a1)
  {
    qword_100011B90 = (uint64_t)"enableCloudLibraryWithMergingFromCloudAllowed:completionFunction:";
    *(_QWORD *)algn_100011B98 = CFSTR("enableCloudLibrary");
    qword_100011BA0 = (uint64_t)"disableCloudLibraryWithCompletionFunction:";
    unk_100011BA8 = CFSTR("disableCloudLibrary");
    qword_100011B88 = &off_10000CA78;
  }
}

@end
