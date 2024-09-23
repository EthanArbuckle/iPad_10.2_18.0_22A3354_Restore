@implementation MusicStoreFlowScriptInterface

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MusicStoreFlowScriptInterface;
  -[MusicStoreFlowScriptInterface dealloc](&v3, "dealloc");
}

- (MusicStoreFlowScriptCapabilitiesController)capabilitiesController
{
  MusicStoreFlowScriptCapabilitiesController *capabilitiesController;
  MusicStoreFlowScriptCapabilitiesController *v4;
  MusicStoreFlowScriptCapabilitiesController *v5;
  MusicStoreFlowScriptCapabilitiesController *v6;

  -[MusicStoreFlowScriptInterface lock](self, "lock");
  capabilitiesController = self->_capabilitiesController;
  v4 = capabilitiesController;
  if (!capabilitiesController)
  {
    v5 = objc_alloc_init(MusicStoreFlowScriptCapabilitiesController);
    self->_capabilitiesController = v5;
    -[MusicStoreFlowScriptCapabilitiesController setVisible:](v5, "setVisible:", 1);
    v4 = self->_capabilitiesController;
  }
  v6 = v4;
  -[MusicStoreFlowScriptInterface unlock](self, "unlock");
  if (!capabilitiesController)
    -[MusicStoreFlowScriptInterface checkInScriptObject:](self, "checkInScriptObject:", v6);
  return v6;
}

- (void)setCapabilitiesController:(id)a3
{
  +[WebScriptObject throwException:](WebScriptObject, "throwException:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("musicCapabilitiesController")));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = objc_msgSend((id)qword_100011BD0, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MusicStoreFlowScriptInterface;
    return objc_msgSendSuper2(&v6, "webScriptNameForKeyName:", a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, &unk_100011BD8, 0);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MusicStoreFlowScriptInterface;
    return objc_msgSendSuper2(&v6, "webScriptNameForSelector:", a3);
  }
  return result;
}

- (id)attributeKeys
{
  return -[MusicStoreFlowScriptInterface scriptAttributeKeys](self, "scriptAttributeKeys");
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowScriptInterface;
  v2 = -[MusicStoreFlowScriptInterface scriptAttributeKeys](&v4, "scriptAttributeKeys");
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)qword_100011BD0, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class(MusicStoreFlowScriptInterface, a2) == a1)
    qword_100011BD0 = &off_10000CAA0;
}

@end
