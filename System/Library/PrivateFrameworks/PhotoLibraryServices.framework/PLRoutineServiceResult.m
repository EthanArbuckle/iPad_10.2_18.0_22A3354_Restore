@implementation PLRoutineServiceResult

- (PLRoutineServiceResult)init
{
  PLRoutineServiceResult *v2;
  PLRoutineServiceResult *v3;
  dispatch_semaphore_t v4;
  OS_dispatch_semaphore *semaphore;
  PLRoutineServiceResult *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLRoutineServiceResult;
  v2 = -[PLRoutineServiceResult init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_semaphore_create(0);
    semaphore = v3->_semaphore;
    v3->_semaphore = (OS_dispatch_semaphore *)v4;

    v6 = v3;
  }

  return v3;
}

- (id)result
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSError)error
{
  PLResultWithUnfairLock();
  return (NSError *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)receivedReplyWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = a4;
  v7 = v9;
  v8 = v6;
  PLRunWithUnfairLock();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

}

- (BOOL)waitForReplyWithTimeout:(unint64_t)a3
{
  dispatch_time_t v4;

  v4 = dispatch_time(0, 1000000000 * a3);
  return dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, v4) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
}

void __56__PLRoutineServiceResult_receivedReplyWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

id __31__PLRoutineServiceResult_error__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __32__PLRoutineServiceResult_result__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

@end
