@implementation WFAVSystemController

- (id)avSystemController
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getAVSystemControllerClass_softClass;
  v9 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getAVSystemControllerClass_block_invoke;
    v5[3] = &unk_1E5FC8858;
    v5[4] = &v6;
    __getAVSystemControllerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedAVSystemController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)silentModeActive
{
  void *v2;
  char v3;

  -[WFAVSystemController avSystemController](self, "avSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getSilentMode");

  return v3;
}

- (BOOL)setSilentMode:(BOOL)a3 reason:(id)a4 client:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v8 = a4;
  -[WFAVSystemController avSystemController](self, "avSystemController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a5 == 3)
    v11 = 1;
  else
    v11 = 6;
  if (a5 == 2)
    v12 = 3;
  else
    v12 = v11;
  v13 = objc_msgSend(v9, "setSilentMode:untilTime:reason:clientType:", v6, 0, v8, v12);

  return v13;
}

- (BOOL)toggleSilentModeWithReason:(id)a3 client:(int64_t)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = -[WFAVSystemController setSilentMode:reason:client:](self, "setSilentMode:reason:client:", -[WFAVSystemController silentModeActive](self, "silentModeActive") ^ 1, v6, a4);

  return a4;
}

@end
