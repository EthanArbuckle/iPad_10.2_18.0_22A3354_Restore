@implementation UIOMenuPreparationAction

void __58___UIOMenuPreparationAction_initWithMenu_responseHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("_UIOMenuPreparationAction.m"), 57, CFSTR("We should've never received a response that isn't a UIOMenuPreparationAction"));

  }
}

void __64___UIOMenuPreparationAction_handleClientActionToOverlayService___block_invoke(uint64_t *a1, void *a2)
{
  _UIOMenuPreparationResponse *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend((id)a1[4], "canSendResponse"))
  {
    v3 = -[_UIOMenuPreparationResponse initWithPreparedMenu:]([_UIOMenuPreparationResponse alloc], "initWithPreparedMenu:", v9);
    -[_UIOMenuPreparationResponse preparedMenu](v3, "preparedMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1[6];
      v7 = a1[4];
      -[_UIOMenuPreparationResponse preparedMenu](v3, "preparedMenu");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("_UIOMenuPreparationAction.m"), 74, CFSTR("Prepared menu is not encoded correctly %@."), v8);

    }
    objc_msgSend((id)a1[4], "sendResponse:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (_UIOMenuPreparationResponse *)objc_claimAutoreleasedReturnValue();
    -[_UIOMenuPreparationResponse handleFailureInMethod:object:file:lineNumber:description:](v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("_UIOMenuPreparationAction.m"), 77, CFSTR("Unable to send response back to the server (%@)"), a1[5]);
  }

}

@end
