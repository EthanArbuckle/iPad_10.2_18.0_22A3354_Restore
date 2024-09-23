@implementation VUINowPlayingMonitorBoundaryTimeObserverInfo

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (BOOL)notifiedOfEntry
{
  return self->_notifiedOfEntry;
}

- (void)setNotifiedOfEntry:(BOOL)a3
{
  self->_notifiedOfEntry = a3;
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
