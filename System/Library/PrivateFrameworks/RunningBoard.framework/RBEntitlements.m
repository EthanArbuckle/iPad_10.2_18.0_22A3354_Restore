@implementation RBEntitlements

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  _QWORD *v4;
  uint8x8_t v5;
  int v6;
  unsigned int v7;
  char v8;
  _QWORD v10[2];
  void (*v11)(_QWORD *);
  void *v12;
  RBEntitlements *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  char v19;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v11 = (void (*)(_QWORD *))__39__RBEntitlements_hasEntitlementDomain___block_invoke;
  v12 = &unk_24DD45FC8;
  v13 = self;
  v14 = &v15;
  v4 = v10;
  if (a3)
  {
    v19 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a3) != 0)
        {
          v11(v4);
          if (v19)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }
  }

  v8 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __39__RBEntitlements_hasEntitlementDomain___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[RBEntitlements _entitlementsForOption:](*(_QWORD *)(a1 + 32), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v9 = v6;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "intersectsSet:", v8);

    v6 = v9;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a4 = 1;
  }

}

- (id)_entitlementsForOption:(uint64_t)a1
{
  uint8x8_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  id result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  const __CFString *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__entitlementsForOption_, a1, CFSTR("RBEntitlements.m"), 130, CFSTR("use _entitlementsForOptions:"));

  }
  v5 = 0;
  switch(a2)
  {
    case 1:
      v19[0] = CFSTR("com.apple.runningboard.process-state");
      v19[1] = CFSTR("com.apple.assertiond.app-state-monitor");
      v19[2] = CFSTR("com.apple.multitasking.termination");
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v19;
      goto LABEL_10;
    case 2:
      v18[0] = CFSTR("com.apple.runningboard.launchprocess");
      v18[1] = CFSTR("com.apple.assertiond.system-shell");
      v18[2] = CFSTR("com.apple.private.xpc.launchd.app-server");
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v18;
LABEL_10:
      v8 = 3;
      goto LABEL_14;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_15;
    case 4:
      v17[0] = CFSTR("com.apple.runningboard.terminateprocess");
      v17[1] = CFSTR("com.apple.multitasking.termination");
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v17;
      goto LABEL_13;
    case 8:
      v16[0] = CFSTR("com.apple.backboardd.debugapplications");
      v16[1] = CFSTR("com.apple.springboard.debugapplications");
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v16;
LABEL_13:
      v8 = 2;
      goto LABEL_14;
    default:
      if (a2 == 16)
      {
        v15 = CFSTR("com.apple.runningboard.endowment-originator");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBEntitlements _entitlementsForOption:](a1, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        result = v12;
      }
      else
      {
        if (a2 == 32)
        {
          v14[0] = CFSTR("com.apple.multitasking.unlimitedassertions");
          v14[1] = CFSTR("com.apple.multitasking.systemappassertions");
          v14[2] = CFSTR("com.apple.multitasking.newsstandassertions");
          v14[3] = CFSTR("com.apple.multitasking.voipassertions");
          v14[4] = CFSTR("com.apple.assertiond.system-shell");
          v6 = (void *)MEMORY[0x24BDBCE30];
          v7 = v14;
          v8 = 5;
LABEL_14:
          objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
LABEL_15:
        result = v5;
      }
      break;
  }
  return result;
}

- (id)_initWithEntitlements:(id)a3
{
  id v4;
  RBEntitlements *v5;
  uint64_t v6;
  NSSet *entitlements;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBEntitlements;
  v5 = -[RBEntitlements init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSSet *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
}

- (BOOL)hasEntitlement:(id)a3
{
  return -[NSSet containsObject:](self->_entitlements, "containsObject:", a3);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_entitlements, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n\t\t\t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| [\n\t\t\t%@\n\t\t\t]>"), v4, v6);

  return (NSString *)v7;
}

- (RBEntitlements)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBEntitlements.m"), 80, CFSTR("-init is not allowed on RBEntitlements"));

  return 0;
}

@end
