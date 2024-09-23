@implementation MSDFetchCKDataOptions

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_createNewZoneIfMissing)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_userInitiatedRequest)
    v2 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MSDFetchCKDataOptions: createNewZoneIfMissing: %@ userInitiatedRequest: %@>"), v3, v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCreateNewZoneIfMissing:", -[MSDFetchCKDataOptions createNewZoneIfMissing](self, "createNewZoneIfMissing"));
  objc_msgSend(v4, "setUserInitiatedRequest:", -[MSDFetchCKDataOptions userInitiatedRequest](self, "userInitiatedRequest"));
  return v4;
}

- (BOOL)createNewZoneIfMissing
{
  return self->_createNewZoneIfMissing;
}

- (void)setCreateNewZoneIfMissing:(BOOL)a3
{
  self->_createNewZoneIfMissing = a3;
}

- (BOOL)userInitiatedRequest
{
  return self->_userInitiatedRequest;
}

- (void)setUserInitiatedRequest:(BOOL)a3
{
  self->_userInitiatedRequest = a3;
}

@end
