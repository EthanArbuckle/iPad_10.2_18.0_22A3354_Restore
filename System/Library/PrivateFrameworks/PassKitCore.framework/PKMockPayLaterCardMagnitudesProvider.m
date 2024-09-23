@implementation PKMockPayLaterCardMagnitudesProvider

- (void)setMagnitudes:(id)a3
{
  PKPayLaterCardMagnitudes *v4;
  PKPayLaterCardMagnitudes *magnitudes;
  void (**updateHandler)(id, PKPayLaterCardMagnitudes *);

  v4 = (PKPayLaterCardMagnitudes *)objc_msgSend(a3, "copy");
  magnitudes = self->_magnitudes;
  self->_magnitudes = v4;

  updateHandler = (void (**)(id, PKPayLaterCardMagnitudes *))self->_updateHandler;
  if (updateHandler)
    updateHandler[2](updateHandler, self->_magnitudes);
}

- (void)setUpdateHandler:(id)a3
{
  void *v4;
  id updateHandler;
  void (**v6)(id, PKPayLaterCardMagnitudes *);

  v4 = _Block_copy(a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = v4;

  v6 = (void (**)(id, PKPayLaterCardMagnitudes *))self->_updateHandler;
  if (v6)
    v6[2](v6, self->_magnitudes);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (PKPayLaterCardMagnitudes)magnitudes
{
  return self->_magnitudes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnitudes, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
