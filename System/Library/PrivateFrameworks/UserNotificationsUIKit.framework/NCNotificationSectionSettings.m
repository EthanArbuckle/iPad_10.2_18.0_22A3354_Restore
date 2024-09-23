@implementation NCNotificationSectionSettings

void __99__NCNotificationSectionSettings_Bulletin___notificationSectionSettingsForSubSectionWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "subSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

@end
