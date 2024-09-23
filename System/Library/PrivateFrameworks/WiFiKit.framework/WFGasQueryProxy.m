@implementation WFGasQueryProxy

- (void)gasQueryForRecords:(id)a3 request:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v11, "count");
  if (v8 && v10)
  {
    -[WFGasQueryProxy setHandler:](self, "setHandler:", v9);

    WiFiDeviceClientGasStartAsync();
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

  }
}

- (void)_processGasResults:(id)a3 error:(int)a4
{
  uint64_t v4;
  id v6;
  void (**v7)(id, id, _QWORD);

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[WFGasQueryProxy handler](self, "handler");
  v7 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6, v4);

}

- (__WiFiDeviceClient)device
{
  return self->_device;
}

- (void)setDevice:(__WiFiDeviceClient *)a3
{
  self->_device = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
