@implementation _UIDragMonitorSessionLifecyleListener

- (_UIDragMonitorSessionLifecyleListener)initWithDragMonitor:(id)a3
{
  id v4;
  _UIDragMonitorSessionLifecyleListener *v5;
  _UIDragMonitorSessionLifecyleListener *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDragMonitorSessionLifecyleListener;
  v5 = -[_UIDragMonitorSessionLifecyleListener init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dragMonitor, v4);

  return v6;
}

- (void)dragDidBeginWithSession:(id)a3 identifier:(unsigned int)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _UIDragMonitorSessionLifecyleListener *v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82___UIDragMonitorSessionLifecyleListener_dragDidBeginWithSession_identifier_reply___block_invoke;
  v12[3] = &unk_1E16D66F8;
  v16 = a4;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

- (void)dragDidEndWithSession:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("dragDidEndWithSession: requires identifier: when used with UIKit drag monitor"));
}

- (void)dragDidEndWithSession:(id)a3 identifier:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74___UIDragMonitorSessionLifecyleListener_dragDidEndWithSession_identifier___block_invoke;
  v4[3] = &unk_1E16BFE10;
  v4[4] = self;
  v5 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (_UIDragMonitorDelegate)delegate
{
  return (_UIDragMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIDragMonitor)dragMonitor
{
  return (_UIDragMonitor *)objc_loadWeakRetained((id *)&self->_dragMonitor);
}

- (void)setDragMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_dragMonitor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragMonitor);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
