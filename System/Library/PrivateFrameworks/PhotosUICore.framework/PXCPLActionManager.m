@implementation PXCPLActionManager

- (void)performAction:(int64_t)a3 forCPLUIStatus:(id)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLActionManager.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cplUIStatus"));

  }
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLActionManager.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceAction != PXCPLStatusActionNone"));

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXCPLActionType _ActionTypeForServiceAction(PXCPLStatusAction)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCPLActionManager.m"), 56, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v7 = CFSTR("PXCPLActionTypePause");
      break;
    case 2:
      v7 = CFSTR("PXCPLActionTypeResume");
      break;
    case 3:
      v7 = CFSTR("PXCPLActionTypeManageCloudStorage");
      break;
    case 4:
      v7 = CFSTR("PXCPLActionTypeManageLocalStorage");
      break;
    case 5:
      v7 = CFSTR("PXCPLActionTypeManageCellularDataDisabled");
      break;
    case 6:
      v7 = CFSTR("PXCPLActionTypeManageAirplaneMode");
      break;
    case 7:
      v7 = CFSTR("PXCPLActionTypeViewItemsFailingToUpload");
      break;
    case 8:
      v7 = CFSTR("PXCPLActionTypeManageExitMode");
      break;
    case 9:
      v7 = CFSTR("PXCPLActionTypeLearnMoreClientVersionTooOld");
      break;
    case 10:
      v7 = CFSTR("PXCPLActionTypeManageClientAuthentication");
      break;
    case 11:
      v7 = CFSTR("PXCPLActionTypeLearnMoreUpgradeSuggested");
      break;
    default:
      v7 = 0;
      break;
  }
  -[PXCPLActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActionWithCPLUIStatus:completionHandler:", v13, 0);

}

- (id)actionPerformerForActionType:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLActionManager.m"), 46, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCPLActionManager actionPerformerForActionType:]", v8);

  abort();
}

@end
