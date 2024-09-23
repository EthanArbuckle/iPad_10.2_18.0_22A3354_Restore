@implementation PLLoggingServiceListener

- (PLLoggingServiceListener)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLLoggingServiceListener;
  return -[PLLoggingServiceListener init](&v3, sel_init);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCListenerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

+ (PLLoggingServiceListener)sharedInstance
{
  if (qword_254AC47D0 != -1)
    swift_once();
  return (PLLoggingServiceListener *)(id)qword_254AC4AE0;
}

@end
