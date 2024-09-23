@implementation WBSMultiRoundAutoFillManager

- (void)dispatchFollowUpAutoFillOfFormWithMetdata:(id)a3 autoFillBlock:(id)a4
{
  WBSFormMetadata *v6;
  id v7;
  WBSFormMetadata *formMetadataFromPreviousAutoFillAttempt;
  WBSFormMetadata *v9;
  void *v10;
  id v11;
  NSTimer *v12;
  NSTimer *timerForFollowUpAutoFill;
  _QWORD v14[4];
  id v15;

  v6 = (WBSFormMetadata *)a3;
  v7 = a4;
  ++self->_numberOfFollowUpAutoFillAttempts;
  formMetadataFromPreviousAutoFillAttempt = self->_formMetadataFromPreviousAutoFillAttempt;
  self->_autoFillAttemptTrigger = 1;
  self->_formMetadataFromPreviousAutoFillAttempt = v6;
  v9 = v6;

  v10 = (void *)MEMORY[0x1E0C99E88];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__WBSMultiRoundAutoFillManager_dispatchFollowUpAutoFillOfFormWithMetdata_autoFillBlock___block_invoke;
  v14[3] = &unk_1E4B3D148;
  v15 = v7;
  v11 = v7;
  objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, 0.25);
  v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timerForFollowUpAutoFill = self->_timerForFollowUpAutoFill;
  self->_timerForFollowUpAutoFill = v12;

}

uint64_t __88__WBSMultiRoundAutoFillManager_dispatchFollowUpAutoFillOfFormWithMetdata_autoFillBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didEditFormText
{
  self->_userDidInteractWithForm = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timerForFollowUpAutoFill, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSMultiRoundAutoFillManager;
  -[WBSMultiRoundAutoFillManager dealloc](&v3, sel_dealloc);
}

- (WBSMultiRoundAutoFillManager)init
{
  WBSMultiRoundAutoFillManager *v2;
  WBSMultiRoundAutoFillManager *v3;
  NSTimer *timerForFollowUpAutoFill;
  NSMutableSet *v5;
  NSMutableSet *controlUniqueIDToBeIgnoredByFollowUpAutoFill;
  WBSMultiRoundAutoFillManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSMultiRoundAutoFillManager;
  v2 = -[WBSMultiRoundAutoFillManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_autoFillAttemptTrigger = 0;
    v2->_userDidInteractWithForm = 0;
    timerForFollowUpAutoFill = v2->_timerForFollowUpAutoFill;
    v2->_numberOfFollowUpAutoFillAttempts = 0;
    v2->_timerForFollowUpAutoFill = 0;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    controlUniqueIDToBeIgnoredByFollowUpAutoFill = v3->_controlUniqueIDToBeIgnoredByFollowUpAutoFill;
    v3->_controlUniqueIDToBeIgnoredByFollowUpAutoFill = v5;

    v7 = v3;
  }

  return v3;
}

- (BOOL)shouldAttemptFollowUpAutoFillInFormWithMetadata:(id)a3 requestType:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a3;
  LOBYTE(v7) = 0;
  if (!a4 && !self->_userDidInteractWithForm)
  {
    if (self->_numberOfFollowUpAutoFillAttempts <= 4)
      v7 = !-[WBSFormMetadata isEqual:](self->_formMetadataFromPreviousAutoFillAttempt, "isEqual:", v6);
    else
      LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)currentAutoFillAttemptTrigger
{
  return self->_autoFillAttemptTrigger;
}

- (void)addControlUniqueIDIgnoredByFollowUpAutoFill:(id)a3
{
  -[NSMutableSet addObject:](self->_controlUniqueIDToBeIgnoredByFollowUpAutoFill, "addObject:", a3);
}

- (void)addControlUniqueIDsIgnoredByFollowUpAutoFill:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_controlUniqueIDToBeIgnoredByFollowUpAutoFill, "addObjectsFromArray:", a3);
}

- (BOOL)shouldControlBeIgnoredByFollowUpAutoFill:(id)a3
{
  return -[NSMutableSet containsObject:](self->_controlUniqueIDToBeIgnoredByFollowUpAutoFill, "containsObject:", a3);
}

- (void)setAddressBookPropertiesThatCanBeFilled:(id)a3
{
  NSSet *v4;
  NSSet *addressBookPropertiesThatCanBeFilled;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", a3);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  addressBookPropertiesThatCanBeFilled = self->_addressBookPropertiesThatCanBeFilled;
  self->_addressBookPropertiesThatCanBeFilled = v4;

}

- (NSString)addressSetLabelUsedDuringFirstAutoFillPass
{
  return self->_addressSetLabelUsedDuringFirstAutoFillPass;
}

- (void)setAddressSetLabelUsedDuringFirstAutoFillPass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)addressBookPropertiesThatCanBeFilled
{
  return self->_addressBookPropertiesThatCanBeFilled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBookPropertiesThatCanBeFilled, 0);
  objc_storeStrong((id *)&self->_addressSetLabelUsedDuringFirstAutoFillPass, 0);
  objc_storeStrong((id *)&self->_controlUniqueIDToBeIgnoredByFollowUpAutoFill, 0);
  objc_storeStrong((id *)&self->_timerForFollowUpAutoFill, 0);
  objc_storeStrong((id *)&self->_formMetadataFromPreviousAutoFillAttempt, 0);
}

@end
