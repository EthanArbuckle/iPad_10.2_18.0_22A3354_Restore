@implementation BCAugmentedExperience

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("BCAugmentedExperience\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperience location](self, "location"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    location  . . . . . . . . : %@\n"), v4);

  -[BCAugmentedExperience delay](self, "delay");
  objc_msgSend(v3, "appendFormat:", CFSTR("    delay . . . . . . . . . . : %f\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("    kind  . . . . . . . . . . : %ld\n"), -[BCAugmentedExperience kind](self, "kind"));
  if (-[BCAugmentedExperience enabled](self, "enabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    enabled . . . . . . . . . : %@\n"), v6);
  if (-[BCAugmentedExperience skipToast](self, "skipToast"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    skipToast . . . . . . . . : %@\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperience presenter](self, "presenter"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    presenter . . . . . . . . : %@"), v8);

  return v3;
}

- (BCAugmentedExperiencePresenting)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (BCAugmentedExperiencePoint)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)skipToast
{
  return self->_skipToast;
}

- (void)setSkipToast:(BOOL)a3
{
  self->_skipToast = a3;
}

- (BOOL)pageProgressionIsRTL
{
  return self->_pageProgressionIsRTL;
}

- (void)setPageProgressionIsRTL:(BOOL)a3
{
  self->_pageProgressionIsRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
