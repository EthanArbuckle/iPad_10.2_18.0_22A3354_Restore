@implementation MTPlaybackContext

+ (id)defaultContext
{
  id v2;
  uint64_t v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setSource:", 0);
  if (isTV(objc_msgSend(v2, "setInteractive:", 1)))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v2, "setPresentationType:", v3);
  return v2;
}

+ (id)contextWithReason:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultContext"));
  objc_msgSend(v4, "setSource:", a3);
  return v4;
}

- (unint64_t)upNextQueueIntent
{
  return self->_upNextQueueIntent;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setUpNextQueueIntent:(unint64_t)a3
{
  self->_upNextQueueIntent = a3;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (BOOL)playbackIsUserRequested
{
  return (id)-[MTPlaybackContext source](self, "source") != (id)1;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSource:", -[MTPlaybackContext source](self, "source"));
  objc_msgSend(v4, "setInteractive:", -[MTPlaybackContext isInteractive](self, "isInteractive"));
  objc_msgSend(v4, "setPresentationType:", -[MTPlaybackContext presentationType](self, "presentationType"));
  objc_msgSend(v4, "setUpNextQueueIntent:", -[MTPlaybackContext upNextQueueIntent](self, "upNextQueueIntent"));
  return v4;
}

- (BOOL)interruptEvent
{
  return self->_interruptEvent;
}

- (void)setInterruptEvent:(BOOL)a3
{
  self->_interruptEvent = a3;
}

@end
