@implementation WebPluginPackage

- (WebPluginPackage)initWithPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  UInt32 packageType;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebPluginPackage;
  v4 = -[WebBasePluginPackage initWithPath:](&v10, sel_initWithPath_);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB34D0]);
    if (*((_QWORD *)v4 + 2))
    {
      v6 = objc_msgSend(v5, "initWithPath:", WTF::StringImpl::operator NSString *());
      *((_QWORD *)v4 + 12) = v6;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v7 = objc_msgSend(v5, "initWithPath:", &stru_1E9D6EC48);
      *((_QWORD *)v4 + 12) = v7;
      if (!v7)
      {
LABEL_9:

        return 0;
      }
    }
    if ((objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "_webkit_isCaseInsensitiveEqualToString:", CFSTR("webplugin")) & 1) == 0)
    {
      packageType = 0;
      CFBundleGetPackageInfo(*((CFBundleRef *)v4 + 10), &packageType, 0);
      if (packageType != 1463963724)
        goto LABEL_9;
    }
    if ((objc_msgSend(v4, "getPluginInfoFromPLists") & 1) == 0)
      goto LABEL_9;
  }
  return (WebPluginPackage *)v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebPluginPackage;
  -[WebBasePluginPackage dealloc](&v3, sel_dealloc);
}

- (Class)viewFactory
{
  return -[NSBundle principalClass](self->nsBundle, "principalClass");
}

- (BOOL)load
{
  _BOOL4 v3;
  objc_super v5;

  if (-[NSBundle isLoaded](self->nsBundle, "isLoaded") || (v3 = -[NSBundle load](self->nsBundle, "load")))
  {
    v5.receiver = self;
    v5.super_class = (Class)WebPluginPackage;
    LOBYTE(v3) = -[WebBasePluginPackage load](&v5, sel_load);
  }
  return v3;
}

- (id)bundle
{
  return self->nsBundle;
}

@end
