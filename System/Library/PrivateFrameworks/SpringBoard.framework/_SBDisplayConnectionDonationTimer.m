@implementation _SBDisplayConnectionDonationTimer

- (_SBDisplayConnectionDonationTimer)initWithUniqueId:(id)a3 deviceName:(id)a4 productName:(id)a5 connect:(BOOL)a6 mirroring:(BOOL)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _SBDisplayConnectionDonationTimer *v18;
  uint64_t v19;
  NSString *uniqueId;
  uint64_t v21;
  NSString *deviceName;
  uint64_t v23;
  NSString *productName;
  uint64_t v25;
  id handler;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)_SBDisplayConnectionDonationTimer;
  v18 = -[_SBDisplayConnectionDonationTimer init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    uniqueId = v18->_uniqueId;
    v18->_uniqueId = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    deviceName = v18->_deviceName;
    v18->_deviceName = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    productName = v18->_productName;
    v18->_productName = (NSString *)v23;

    v18->_connect = a6;
    v18->_mirroring = a7;
    v18->_counter = 0;
    v25 = objc_msgSend(v17, "copy");
    handler = v18->_handler;
    v18->_handler = (id)v25;

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[_SBDisplayConnectionDonationTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBDisplayConnectionDonationTimer;
  -[_SBDisplayConnectionDonationTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[NSTimer invalidate](self->_timer, "invalidate");
}

- (BOOL)stateChanged
{
  return self->_counter != 0;
}

- (void)resetTimerOnConnect:(BOOL)a3
{
  int64_t counter;
  int64_t v5;
  _QWORD block[5];

  counter = self->_counter;
  if (a3)
    v5 = counter + 1;
  else
    v5 = counter - 1;
  self->_counter = v5;
  -[NSTimer invalidate](self->_timer, "invalidate");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
