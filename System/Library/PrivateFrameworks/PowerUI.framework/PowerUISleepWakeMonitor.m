@implementation PowerUISleepWakeMonitor

- (PowerUISleepWakeMonitor)initWithManager:(id)a3 withCheckpoint:(unint64_t)a4 withLastDesktopCheck:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PowerUISleepWakeMonitor;
  return -[PowerUISleepWakeMonitor init](&v6, sel_init, a3, a4, a5);
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void)setCheckpoint:(unint64_t)a3
{
  self->_checkpoint = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PowerUISmartChargeManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (NSDate)desktopTransitionEvaluationDate
{
  return self->_desktopTransitionEvaluationDate;
}

- (void)setDesktopTransitionEvaluationDate:(id)a3
{
  objc_storeStrong((id *)&self->_desktopTransitionEvaluationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desktopTransitionEvaluationDate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
