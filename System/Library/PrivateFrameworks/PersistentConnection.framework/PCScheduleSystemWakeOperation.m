@implementation PCScheduleSystemWakeOperation

- (id)initForScheduledWake:(BOOL)a3 wakeDate:(id)a4 acceptableDelay:(double)a5 userVisible:(BOOL)a6 serviceIdentifier:(id)a7 uniqueIdentifier:(void *)a8
{
  id v15;
  id v16;
  PCScheduleSystemWakeOperation *v17;
  PCScheduleSystemWakeOperation *v18;
  uint64_t v19;
  NSString *serviceIdentifier;
  objc_super v22;

  v15 = a4;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PCScheduleSystemWakeOperation;
  v17 = -[PCScheduleSystemWakeOperation init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_scheduleOrCancel = a3;
    objc_storeStrong((id *)&v17->_wakeDate, a4);
    v18->_acceptableDelay = a5;
    v18->_userVisible = a6;
    v19 = objc_msgSend(v16, "copy");
    serviceIdentifier = v18->_serviceIdentifier;
    v18->_serviceIdentifier = (NSString *)v19;

    v18->_unqiueIdentifier = a8;
  }

  return v18;
}

- (void)main
{
  OUTLINED_FUNCTION_0(&dword_1CBC1B000, a2, a3, "Unable to take power assertion. IOPMAssertionCreateWithName() returned %#x", a5, a6, a7, a8, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_wakeDate, 0);
}

@end
