@implementation TDVHomeButtonHandler

- (TDVHomeButtonHandler)initWithCompletion:(id)a3
{
  id v4;
  TDVHomeButtonHandler *v5;
  TDVHomeButtonHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TDVHomeButtonHandler;
  v5 = -[TDVHomeButtonHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TDVHomeButtonHandler startConsumingHardwarePresses:](v5, "startConsumingHardwarePresses:", v4);

  return v6;
}

+ (id)handlerWithCompletion:(id)a3
{
  id v3;
  TDVHomeButtonHandler *v4;

  v3 = a3;
  v4 = -[TDVHomeButtonHandler initWithCompletion:]([TDVHomeButtonHandler alloc], "initWithCompletion:", v3);

  return v4;
}

- (void)startConsumingHardwarePresses:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[TDVHomeButtonHandler setHomeButtonHandlerCallback:](self, "setHomeButtonHandlerCallback:", a3);
  -[TDVHomeButtonHandler homeButtonAssertion](self, "homeButtonAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 1, self, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[TDVHomeButtonHandler setHomeButtonAssertion:](self, "setHomeButtonAssertion:", v6);
  }
}

- (void)stopConsumingHardwarePresses
{
  void *v3;

  -[TDVHomeButtonHandler homeButtonAssertion](self, "homeButtonAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[TDVHomeButtonHandler setHomeButtonAssertion:](self, "setHomeButtonAssertion:", 0);
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  void (**homeButtonHandlerCallback)(void);

  homeButtonHandlerCallback = (void (**)(void))self->_homeButtonHandlerCallback;
  if (homeButtonHandlerCallback)
    homeButtonHandlerCallback[2]();
}

- (id)homeButtonHandlerCallback
{
  return self->_homeButtonHandlerCallback;
}

- (void)setHomeButtonHandlerCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BSInvalidatable)homeButtonAssertion
{
  return self->_homeButtonAssertion;
}

- (void)setHomeButtonAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_homeButtonAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeButtonAssertion, 0);
  objc_storeStrong(&self->_homeButtonHandlerCallback, 0);
}

@end
