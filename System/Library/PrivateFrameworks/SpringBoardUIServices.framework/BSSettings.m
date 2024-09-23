@implementation BSSettings

void __64__BSSettings_SBUISystemAperture__SBUI_systemApertureDescription__block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  for (i = 0; i != 44; ++i)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForSetting:", i + 3213009);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBUISystemApertureSettingKeyValueDescription(v4, i + 3213009);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SBUISystemApertureSettingKeyDescription(i + 3213009);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, v6, 1);

  }
}

void __83__BSSettings_SBUISystemAperture__SBUI_systemApertureDescriptionOfDiffFromSettings___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  for (i = 0; i != 44; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForSetting:", i + 3213009);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForSetting:", i + 3213009);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) == 0)
    {
      v5 = *(void **)(a1 + 48);
      SBUISystemApertureSettingKeyValueDescription(v3, i + 3213009);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SBUISystemApertureSettingKeyDescription(i + 3213009);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, v7, 0);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }

  }
}

@end
