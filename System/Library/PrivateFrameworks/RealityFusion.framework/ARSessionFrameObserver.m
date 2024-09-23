@implementation ARSessionFrameObserver

- (ARSessionFrameObserver)initWithCallback:(function<void (rf::data_flow::provider::InputFrame)&&
{
  std::function<void ()(rf::data_flow::provider::InputFrame &&)>::operator=(self->_callback.__f_.__buf_.__lx, a3);
  return self;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *f;
  _OWORD v12[4];

  v5 = a4;
  objc_msgSend(v5, "camera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transform");
  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  v12[3] = v10;

  f = self->_callback.__f_.__f_;
  if (f)
    (*(void (**)(void *, _OWORD *))(*(_QWORD *)f + 48))(f, v12);

}

- (void)setCallback:(function<void (rf::data_flow::provider::InputFrame)&&
{
  std::function<void ()(rf::data_flow::provider::InputFrame &&)>::operator=(self->_callback.__f_.__buf_.__lx, a3);
}

- (void).cxx_destruct
{
  function<void (rf::data_flow::provider::InputFrame &&)> *p_callback;
  function<void (rf::data_flow::provider::InputFrame &&)> *f;
  uint64_t v4;

  p_callback = &self->_callback;
  f = (function<void (rf::data_flow::provider::InputFrame &&)> *)self->_callback.__f_.__f_;
  if (f == p_callback)
  {
    v4 = 4;
    f = p_callback;
  }
  else
  {
    if (!f)
      return;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v4))();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
