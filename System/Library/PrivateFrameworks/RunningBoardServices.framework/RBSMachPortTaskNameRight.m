@implementation RBSMachPortTaskNameRight

+ (id)taskNameForPID:(int)a3
{
  id v5;

  if (a3 < 1)
  {
    v5 = 0;
  }
  else if (_RBSSandboxCanGetMachTaskName(a3))
  {
    v5 = -[RBSMachPortTaskNameRight initWithPID:](objc_alloc((Class)a1), a3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)initWithPID:(void *)a1
{
  id v3;
  mach_port_name_t *v5;
  kern_return_t v6;
  mach_error_t v7;
  NSObject *v8;
  __int128 v10;
  kern_return_t v11;
  mach_error_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _OWORD v16[2];
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v19;
  mach_port_name_t tn;

  v3 = 0;
  if (!a1 || a2 < 1)
    goto LABEL_11;
  if (!_RBSSandboxCanGetMachTaskName(a2))
    goto LABEL_10;
  tn = 0;
  v5 = (mach_port_name_t *)MEMORY[0x1E0C83DA0];
  if (task_name_for_pid(*MEMORY[0x1E0C83DA0], a2, &tn))
  {
    if (RBSPIDExists(a2))
    {
      v6 = task_name_for_pid(*v5, a2, &tn);
      if (v6)
      {
        v7 = v6;
        rbs_general_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[RBSMachPortTaskNameRight initWithPID:].cold.2(v7);

        goto LABEL_10;
      }
      goto LABEL_12;
    }
LABEL_10:
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:
  *(_QWORD *)&v10 = -1;
  *((_QWORD *)&v10 + 1) = -1;
  *(_OWORD *)task_info_out = v10;
  v19 = v10;
  task_info_outCnt = 8;
  v11 = task_info(tn, 0xFu, task_info_out, &task_info_outCnt);
  if (v11)
  {
    v12 = v11;
    rbs_general_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBSMachPortTaskNameRight initWithPID:].cold.1(v12);

    v3 = 0;
    tn = 0;
  }
  else
  {
    v16[0] = *(_OWORD *)task_info_out;
    v16[1] = v19;
    +[RBSAuditToken tokenFromAuditToken:](RBSAuditToken, "tokenFromAuditToken:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSMachPort portConsumingRightForPort:](RBSMachPort, "portConsumingRightForPort:", tn);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)a1, a2, v15, v14);
    v3 = a1;

  }
LABEL_11:

  return v3;
}

- (uint64_t)_initWithPID:(void *)a3 port:(void *)a4 auditToken:
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 8), a3);
    *(_DWORD *)(a1 + 16) = a2;
    objc_storeStrong((id *)(a1 + 24), a4);
    v10 = (id)a1;
  }

  return a1;
}

- (RBSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_port, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[RBSMachPortTaskNameRight invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RBSMachPortTaskNameRight;
  -[RBSMachPortTaskNameRight dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[RBSMachPort invalidate](self->_port, "invalidate");
}

- (unsigned)port
{
  return -[RBSMachPort port](self->_port, "port");
}

- (RBSMachPortTaskNameRight)init
{
  pid_t v3;

  v3 = getpid();
  return (RBSMachPortTaskNameRight *)-[RBSMachPortTaskNameRight initWithPID:](self, v3);
}

- (BOOL)isUsable
{
  return -[RBSMachPort isUsable](self->_port, "isUsable");
}

+ (id)portForSelf
{
  return +[RBSMachPortTaskNameRight taskNameForPID:](RBSMachPortTaskNameRight, "taskNameForPID:", getpid());
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t pid;
  id v5;

  pid = self->_pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", pid, CFSTR("_pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auditToken, CFSTR("_auditToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_port, CFSTR("_port"));

}

- (RBSMachPortTaskNameRight)initWithRBSXPCCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_pid"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_auditToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)self, v5, v7, v6);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSMachPortTaskNameRight)initWithCoder:(id)a3
{
  id v4;
  RBSAuditToken *v5;
  RBSAuditToken *auditToken;
  RBSMachPort *v7;
  RBSMachPort *port;

  v4 = a3;
  self->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_pid"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_auditToken"));
  v5 = (RBSAuditToken *)objc_claimAutoreleasedReturnValue();
  auditToken = self->_auditToken;
  self->_auditToken = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_port"));
  v7 = (RBSMachPort *)objc_claimAutoreleasedReturnValue();

  port = self->_port;
  self->_port = v7;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid;
  id v5;

  pid = self->_pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", pid, CFSTR("_pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auditToken, CFSTR("_auditToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_port, CFSTR("_port"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  RBSMachPortTaskNameRight *v6;

  v5 = -[RBSMachPort copyWithZone:](self->_port, "copyWithZone:");
  if (v5)
  {
    v6 = +[RBSMachPortTaskNameRight allocWithZone:](RBSMachPortTaskNameRight, "allocWithZone:", a3);
    -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)v6, self->_pid, v5, self->_auditToken);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)pid
{
  return self->_pid;
}

- (void)initWithPID:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  mach_error_string(a1);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_190CD6000, v1, v2, "Unable to obtain an audit token for pid %i: %{public}s (0x%x)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)initWithPID:(mach_error_t)a1 .cold.2(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  mach_error_string(a1);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_190CD6000, v1, v2, "Unable to obtain a task name port right for pid %i: %{public}s (0x%x)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

@end
