@implementation RBProcessPowerAssertion

- (int)_targetPid
{
  if (self->_process && -[RBProcessState preventIdleSleep](self->_state, "preventIdleSleep"))
    return -[RBProcess rbs_pid](self->_process, "rbs_pid");
  else
    return 0;
}

- (id)_preventIdleSleepIdentifiers
{
  return -[RBProcessState preventIdleSleepIdentifiers](self->_state, "preventIdleSleepIdentifiers");
}

- (id)initWithProcess:(id *)a1
{
  id v4;
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v4 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)RBProcessPowerAssertion;
    v5 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 7, a2);
      objc_msgSend(a1[7], "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      a1[4] = (id)v7;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
