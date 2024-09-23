@implementation VLFSessionDebugPuckVisibilityMonitor

- (VLFSessionDebugPuckVisibilityMonitor)initWithObserver:(id)a3
{
  VLFSessionDebugPuckVisibilityMonitor *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLFSessionDebugPuckVisibilityMonitor;
  v3 = -[VLFSessionMonitor initWithObserver:](&v6, "initWithObserver:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, CFSTR("VLFSessionDebugPuckVisibilityMonitorActiveKey"), 1, 0);

    -[VLFSessionDebugPuckVisibilityMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("VLFSessionDebugPuckVisibilityMonitorActiveKey"), 0);

  v4.receiver = self;
  v4.super_class = (Class)VLFSessionDebugPuckVisibilityMonitor;
  -[VLFSessionDebugPuckVisibilityMonitor dealloc](&v4, "dealloc");
}

+ (BOOL)isEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionDebugPuckVisibilityMonitorEnabledKey"));

  return v3;
}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("VLFSessionDebugPuckVisibilityMonitorActiveKey"));

  if (v4)
    v5 = 2;
  else
    v5 = 0;
  -[VLFSessionMonitor setState:](self, "setState:", v5);
}

+ (BOOL)affectsPuckVisibility
{
  return 1;
}

+ (BOOL)affectsBannerVisibility
{
  return 0;
}

- (id)debugDescription
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("VLFSessionDebugPuckVisibilityMonitorActiveKey")))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  v9 = -[VLFSessionMonitor state](self, "state");
  v10 = CFSTR("Hide");
  if (v9 == 1)
    v10 = CFSTR("EnablePuck");
  if (v9 == 2)
    v10 = CFSTR("EnablePuckAndBanner");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, currentValue: %@, currentState: %@>"), v3, v5, v8, v10));

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v13 != v11)
  {

LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)VLFSessionDebugPuckVisibilityMonitor;
    -[VLFSessionDebugPuckVisibilityMonitor observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_6;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("VLFSessionDebugPuckVisibilityMonitorActiveKey"));

  if (!v14)
    goto LABEL_5;
  -[VLFSessionDebugPuckVisibilityMonitor updateState](self, "updateState");
LABEL_6:

}

@end
