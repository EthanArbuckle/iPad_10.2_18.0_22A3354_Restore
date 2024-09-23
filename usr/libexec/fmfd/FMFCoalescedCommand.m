@implementation FMFCoalescedCommand

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_callerId, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (FMFCoalescedCommand)initWithHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 reason:(int64_t)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  FMFCoalescedCommand *v18;
  FMFCoalescedCommand *v19;
  objc_super v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)FMFCoalescedCommand;
  v18 = -[FMFCoalescedCommand init](&v21, "init");
  v19 = v18;
  if (v18)
  {
    -[FMFCoalescedCommand setHandles:](v18, "setHandles:", v14);
    -[FMFCoalescedCommand setSession:](v19, "setSession:", v15);
    -[FMFCoalescedCommand setCallerId:](v19, "setCallerId:", v16);
    -[FMFCoalescedCommand setPriority:](v19, "setPriority:", a6);
    -[FMFCoalescedCommand setReason:](v19, "setReason:", a7);
    -[FMFCoalescedCommand setCompletionBlock:](v19, "setCompletionBlock:", v17);
  }

  return v19;
}

- (FMFClientSession)session
{
  return self->_session;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setCallerId:(id)a3
{
  objc_storeStrong((id *)&self->_callerId, a3);
}

- (NSSet)handles
{
  return self->_handles;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (FMFHandle)callerId
{
  return self->_callerId;
}

- (int64_t)priority
{
  return self->_priority;
}

@end
