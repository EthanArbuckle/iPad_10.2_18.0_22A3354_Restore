@implementation KmlPowerAssertion

- (KmlPowerAssertion)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KmlPowerAssertion;
  return -[KmlPowerAssertion init](&v3, "init");
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  sub_10023FCDC((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  queue = self->_queue;
  self->_queue = 0;

  v10.receiver = self;
  v10.super_class = (Class)KmlPowerAssertion;
  -[KmlPowerAssertion dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionName, 0);
  objc_storeStrong((id *)&self->_powerAssertTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
