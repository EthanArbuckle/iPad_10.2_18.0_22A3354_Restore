@implementation AXZoomListenerContainer

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong(&self->handler, 0);
}

@end
