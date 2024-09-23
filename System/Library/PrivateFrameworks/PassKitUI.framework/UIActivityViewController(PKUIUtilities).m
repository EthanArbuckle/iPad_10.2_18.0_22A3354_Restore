@implementation UIActivityViewController(PKUIUtilities)

+ (id)pkui_activityControllerForPass:()PKUIUtilities passView:passLinkedApplication:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  PKActivityItemProvider *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[5];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "passType"))
  {
    v11 = objc_msgSend(v7, "sharingMethod");
    v12 = -[PKActivityItemProvider initWithPass:passView:linkedApp:sharingMethod:]([PKActivityItemProvider alloc], "initWithPass:passView:linkedApp:sharingMethod:", v7, v8, v9, v11);
    if (v12)
    {
      if (v11 == 1)
      {
        v18 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v7, "sharingURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayWithObjects:", v12, v19, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItems:applicationActivities:", v17, 0);
        v20 = *MEMORY[0x1E0D96DF0];
        v23[0] = *MEMORY[0x1E0D96DD8];
        v23[1] = v20;
        v23[2] = *MEMORY[0x1E0D96DE0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setExcludedActivityTypes:", v21);

        goto LABEL_9;
      }
      if (!v11)
      {
        v13 = objc_alloc(MEMORY[0x1E0D96D28]);
        v25[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v14, 0);

        v15 = *MEMORY[0x1E0D96DF8];
        v24[0] = *MEMORY[0x1E0D96DD0];
        v24[1] = v15;
        v16 = *MEMORY[0x1E0D96DF0];
        v24[2] = *MEMORY[0x1E0D96DD8];
        v24[3] = v16;
        v24[4] = *MEMORY[0x1E0D96DE0];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setExcludedActivityTypes:", v17);
LABEL_9:

        goto LABEL_10;
      }
    }
    v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

@end
