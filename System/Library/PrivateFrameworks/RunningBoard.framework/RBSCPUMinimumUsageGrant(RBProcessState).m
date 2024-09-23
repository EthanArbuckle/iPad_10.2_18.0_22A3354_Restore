@implementation RBSCPUMinimumUsageGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  void *v7;
  char v8;
  uint64_t v9;
  RBProcessCPUMinimumLimits *v10;
  uint64_t v11;
  double v12;
  RBProcessCPUMinimumLimits *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a5, "targetProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlatformBinary");

  if ((v8 & 1) == 0)
  {
    v9 = objc_msgSend(a1, "role");
    v10 = [RBProcessCPUMinimumLimits alloc];
    v11 = objc_msgSend(a1, "percentage");
    objc_msgSend(a1, "duration");
    v13 = -[RBProcessCPUMinimumLimits initWithPercentage:duration:](v10, "initWithPercentage:duration:", v11, vcvtpd_u64_f64(v12));
    objc_msgSend(v14, "setMinCPUUsageLimits:forRole:", v13, v9);

  }
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribute conflict: attribute %@ conflicts with attribute %@"), a1, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BE80D88];
      v12 = *MEMORY[0x24BDD0FD8];
      v13[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 2, v10);
      *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }

  return a4;
}

@end
