@implementation FMFHideLocationCommand

- (FMFHideLocationCommand)initWithHideLocation:(BOOL)a3 forSession:(id)a4
{
  _BOOL8 v4;
  FMFHideLocationCommand *v5;
  FMFHideLocationCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFHideLocationCommand;
  v5 = -[FMFBaseCmd initWithClientSession:](&v8, "initWithClientSession:", a4);
  v6 = v5;
  if (v5)
    -[FMFHideLocationCommand setHideLocation:](v5, "setHideLocation:", v4);
  return v6;
}

- (id)pathSuffix
{
  return CFSTR("hideLocation/savePrefs");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  id v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFHideLocationCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v8, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (-[FMFHideLocationCommand hideLocation](self, "hideLocation"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("hideLocation"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("prefs"));

  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (BOOL)hideLocation
{
  return self->_hideLocation;
}

- (void)setHideLocation:(BOOL)a3
{
  self->_hideLocation = a3;
}

@end
