@implementation HVBudget

- (_DWORD)sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:(int)a3 levelOfService:
{
  _DWORD *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;

  if (result)
  {
    v4 = result;
    v5 = result[2] | result[8];
    v6 = v5 & a2;
    v7 = v5 & a2 ^ a2;
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_sourcesFilteredByBudgetAndRegistrationsFromAvailableSources_levelOfService_, v4, CFSTR("HVBudget.m"), 137, CFSTR("It does not make sense to request sources that are not registered"));

        goto LABEL_4;
      case 1:
LABEL_4:
        v9 = HVIsConnectedToPower();
        v10 = v4[6] | v4[7];
        if (v9)
          v10 |= v4[5];
        goto LABEL_8;
      case 2:
        v10 = result[6] | result[7];
        goto LABEL_8;
      case 3:
        v10 = result[7];
LABEL_8:
        v7 &= v10;
        break;
      default:
        break;
    }
    if (!v7)
      return (_DWORD *)(v6 & ~(v4[3] | v4[4]));
    if (*((_BYTE *)v4 + 40))
      goto LABEL_13;
    +[HVPowerBudget defaultBudget](HVPowerBudget, "defaultBudget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "canDoDiscretionaryWork");

    if (v12 == 1)
    {
      v6 |= v4[9] & a2 & v7;
      return (_DWORD *)(v6 & ~(v4[3] | v4[4]));
    }
    if (v12 == 2)
LABEL_13:
      v6 = (v7 | v5) & a2;
    return (_DWORD *)(v6 & ~(v4[3] | v4[4]));
  }
  return result;
}

uint64_t __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (HVBudget)init
{
  HVBudget *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HVBudget;
  result = -[HVBudget init](&v3, sel_init);
  if (result)
  {
    result->_ignoreDiscretionaryPowerBudget = 0;
    *(_QWORD *)&result->_alwaysAllowSourcesOverride = 0;
    result->_noServiceSources = -1;
    *(_QWORD *)&result->_budgetedSources = 0;
    *(_QWORD *)&result->_periodicBackgroundSources = 0;
    result->_extraBudgetSources = 3;
  }
  return result;
}

- (void)registerLevelOfService:(int)a3 oneDataSource:
{
  int8x16_t *v4;
  __int32 v5;
  __int32 v6;
  __int32 v7;
  unsigned int v8;
  __int32 v9;
  NSObject *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = (int8x16_t *)((char *)a1 + 20);
    v5 = a1[1].i32[1];
    v6 = a1[1].i64[1];
    v7 = HIDWORD(a1[1].i64[1]);
    if ((v6 & a3) != 0)
      v8 = 2;
    else
      v8 = (v5 & a3) != 0;
    v9 = a1[2].i32[0];
    if ((v7 & a3) != 0)
      v8 = 3;
    if ((v9 & a3) != 0)
      v8 = 4;
    if (v8 < a2)
    {
      a1[1] = vandq_s8(a1[1], (int8x16_t)vdupq_n_s32(~a3));
      switch(a2)
      {
        case 1u:
          goto LABEL_14;
        case 2u:
          v5 = v6;
          v4 = (int8x16_t *)((char *)a1 + 24);
          goto LABEL_14;
        case 3u:
          v4 = (int8x16_t *)((char *)a1 + 28);
          v5 = v7;
          goto LABEL_14;
        case 4u:
          v5 = v9;
          v4 = a1 + 2;
LABEL_14:
          v4->i32[0] = v5 | a3;
          break;
        default:
          break;
      }
      hv_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[HVBudget sourcesFilteredByBudgetAndRegistrationsFromAvailableSources:levelOfService:](a1, -1, 1);
        HVDataSourceDescription(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_21AA1D000, v10, OS_LOG_TYPE_DEFAULT, "HVBudget: Sources With Budget And Consumers Available: %@", (uint8_t *)&v13, 0xCu);

      }
    }
  }
}

uint64_t __82__HVBudget_performWorkForOneDataSource_levelOfService_requireRegistrations_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_DWORD *)(a1 + 48) & *(_DWORD *)(v3 + 32)) != 0)
    v4 = 4;
  else
    v4 = *(unsigned __int8 *)(a1 + 52);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
}

@end
