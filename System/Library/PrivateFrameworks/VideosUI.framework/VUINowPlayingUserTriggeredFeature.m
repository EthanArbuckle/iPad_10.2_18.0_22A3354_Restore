@implementation VUINowPlayingUserTriggeredFeature

- (VUINowPlayingUserTriggeredFeature)init
{
  return -[VUINowPlayingUserTriggeredFeature initWithType:](self, "initWithType:", -1);
}

- (VUINowPlayingUserTriggeredFeature)initWithType:(unint64_t)a3
{
  VUINowPlayingUserTriggeredFeature *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUINowPlayingUserTriggeredFeature;
  result = -[VUINowPlayingUserTriggeredFeature init](&v5, sel_init);
  if (a3 && result)
  {
    *(_WORD *)&result->_active = 0;
    result->_type = a3;
  }
  else
  {

    return 0;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _sFeatureTypeDescription(-[VUINowPlayingUserTriggeredFeature type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingUserTriggeredFeature isActive](self, "isActive");
  VUIBoolLogString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\ntype: %@,\n active: %@\n}\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  _sFeatureTypeDescription(-[VUINowPlayingUserTriggeredFeature type](self, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUINowPlayingUserTriggeredFeature *v4;
  VUINowPlayingUserTriggeredFeature *v5;
  unint64_t v6;
  BOOL v7;

  v4 = (VUINowPlayingUserTriggeredFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[VUINowPlayingUserTriggeredFeature type](self, "type");
    v7 = v6 == -[VUINowPlayingUserTriggeredFeature type](v5, "type");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)shouldAutoRemove
{
  return self->_autoRemove;
}

- (void)setAutoRemove:(BOOL)a3
{
  self->_autoRemove = a3;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
}

@end
