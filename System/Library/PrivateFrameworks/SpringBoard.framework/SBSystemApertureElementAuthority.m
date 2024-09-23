@implementation SBSystemApertureElementAuthority

- (id)elementsOrderedByPromotionFromTemporallyOrderedElements:(id)a3 withPreviousOrdering:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  SBSystemApertureElementAuthority *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    v8 = v6;
    goto LABEL_29;
  }
  SBLogSystemApertureMediation();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_21_2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_mapNoNulls:", &__block_literal_global_22_2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v10;
    v40 = 2114;
    v41 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ordering elements by promotion: temporallyOrderedElements: %{public}@; previouslyOrderedElements: %{public}@",
      buf,
      0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementAuthorityDelegate);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_23;
  v34[3] = &unk_1E8EB2D20;
  v13 = WeakRetained;
  v35 = v13;
  v36 = self;
  v37 = v6;
  objc_msgSend(v37, "sortedArrayUsingComparator:", v34);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  SBLogSystemApertureMediation();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_44_0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Ordered elements after initial sort: %{public}@", buf, 0xCu);

  }
  v16 = objc_msgSend(v13, "systemApertureApertureElementAuthorityMaximumNumberOfSimultaneouslyVisibleElements:", self);
  if (objc_msgSend(v8, "count") <= v16)
    goto LABEL_28;
  objc_msgSend(v8, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "systemApertureApertureElementAuthority:preferredLayoutModeForElement:", self, v17);

  if (v18 > 2)
    goto LABEL_28;
  v32 = v7;
  v33 = v6;
  if (!objc_msgSend(v8, "count"))
  {
    v20 = 0;
    v19 = 0;
    goto LABEL_25;
  }
  v19 = 0;
  v20 = 0;
  v21 = 0;
  while (1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "systemApertureApertureElementAuthority:isElementRequiredToRemainVisible:", self, v22))
    {
      if (v21 >= v16)
        break;
    }
LABEL_19:

    if (++v21 >= objc_msgSend(v8, "count"))
      goto LABEL_25;
  }
  if (v19)
  {
    if (v20)
      goto LABEL_15;
  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v20)
      goto LABEL_15;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
LABEL_15:
  if (objc_msgSend(v19, "count") < v16)
  {
    SBLogSystemApertureMediation();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      _SBShortElementDescription(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v24;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Prioritizing '%{public}@' since it requires visibility", buf, 0xCu);

    }
    objc_msgSend(v19, "addObject:", v22);
    objc_msgSend(v20, "addIndex:", v21);
    goto LABEL_19;
  }

LABEL_25:
  v25 = objc_msgSend(v19, "count");
  v7 = v32;
  if (v25)
  {
    v26 = v25;
    v27 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v27, "removeObjectsAtIndexes:", v20);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v16 - v26, v26);
    objc_msgSend(v27, "insertObjects:atIndexes:", v19, v28);

    v8 = v27;
  }

  v6 = v33;
LABEL_28:

LABEL_29:
  SBLogSystemApertureMediation();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_49_0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v30;
    _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Elements ordered by promotion: %{public}@", buf, 0xCu);

  }
  return v8;
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_2(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

uint64_t __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  id v13;
  uint64_t v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "systemApertureApertureElementAuthority:preferredLayoutModeForElement:", *(_QWORD *)(a1 + 40), v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "systemApertureApertureElementAuthority:preferredLayoutModeForElement:", *(_QWORD *)(a1 + 40), v6);
  if (v7 <= 0 && v8 < 1)
  {
    v32 = 0;
    v31 = CFSTR("Neither element visible");
    goto LABEL_34;
  }
  v10 = v8;
  if (v7 >= 1 && v8 <= 0)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    _SBShortElementDescription(v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _SBShortElementDescription(v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Element '%@' visible while '%@' is not"), v26, v27);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v32 = -1;
    goto LABEL_34;
  }
  if (v7 <= 0 && v8 >= 1)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    _SBShortElementDescription(v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _SBShortElementDescription(v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("Element '%@' visible while '%@' is not"), v29, v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v32 = 1;
    goto LABEL_34;
  }
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_2_26;
  v51[3] = &unk_1E8EB2CF8;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v52 = v13;
  v53 = v14;
  v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v51);
  v16 = objc_msgSend(*(id *)(a1 + 32), "systemApertureApertureElementAuthority:isElementUrgentlyVisible:", *(_QWORD *)(a1 + 40), v5);
  v17 = objc_msgSend(*(id *)(a1 + 32), "systemApertureApertureElementAuthority:isElementUrgentlyVisible:", *(_QWORD *)(a1 + 40), v6);
  v18 = ((uint64_t (**)(_QWORD, id, uint64_t))v15)[2](v15, v5, v7);
  v19 = ((uint64_t (**)(_QWORD, id, uint64_t))v15)[2](v15, v6, v10);
  if (v16 && v17)
  {
    v20 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v5);
    v21 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v6);
    v22 = (void *)MEMORY[0x1E0CB3940];
    if (v20 <= v21)
    {
      _SBShortElementDescription(v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v5;
    }
    else
    {
      _SBShortElementDescription(v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v6;
    }
    _SBShortElementDescription(v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Both elements urgent and important, element '%@' temporally after '%@'"), v23, v39);
LABEL_28:
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v20 > v21)
    {

      goto LABEL_30;
    }

LABEL_32:
    v32 = 1;
    goto LABEL_33;
  }
  if (!v16)
  {
    if (v17)
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      _SBShortElementDescription(v6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _SBShortElementDescription(v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("Element '%@' is urgent while '%@' is not"), v37, v38);
    }
    else
    {
      if ((v18 & v19) == 1)
      {
        v20 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v5);
        v21 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v6);
        v46 = (void *)MEMORY[0x1E0CB3940];
        if (v20 <= v21)
        {
          _SBShortElementDescription(v6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v5;
        }
        else
        {
          _SBShortElementDescription(v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v6;
        }
        _SBShortElementDescription(v47);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("Both elements alerts, alerting activities, or expanded due to user interaction, element '%@' temporally after '%@'"), v23, v39);
        goto LABEL_28;
      }
      if (v18)
      {
        v48 = (void *)MEMORY[0x1E0CB3940];
        _SBShortElementDescription(v5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _SBShortElementDescription(v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("Element '%@' is an alert, alerting activity, or expanded due to user interaction while '%@' is not"), v34, v35);
        goto LABEL_22;
      }
      if (!v19)
      {
        v50 = 0;
        v32 = _CompareActivityElementsByElementIdentifier(v5, v6, &v50);
        v31 = (__CFString *)v50;
        goto LABEL_33;
      }
      v49 = (void *)MEMORY[0x1E0CB3940];
      _SBShortElementDescription(v6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _SBShortElementDescription(v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", CFSTR("Element '%@' is an alert, alerting activity, or expanded due to user interaction while '%@' is not"), v37, v38);
    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  v33 = (void *)MEMORY[0x1E0CB3940];
  _SBShortElementDescription(v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  _SBShortElementDescription(v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("Element '%@' is urgent while '%@' is not"), v34, v35);
LABEL_22:
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_30:
  v32 = -1;
LABEL_33:

LABEL_34:
  SBLogSystemApertureMediation();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    if (v32 == 1)
    {
      _SBShortElementDescription(v6);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("over");
      v43 = v5;
    }
    else
    {
      _SBShortElementDescription(v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
        v42 = CFSTR("over");
      else
        v42 = CFSTR("same as");
      v43 = v6;
    }
    _SBShortElementDescription(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v55 = v41;
    v56 = 2114;
    v57 = v42;
    v58 = 2114;
    v59 = v44;
    v60 = 2114;
    v61 = v31;
    _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "Prioritizing '%{public}@' %{public}@ '%{public}@' (%{public}@)", buf, 0x2Au);

  }
  return v32;
}

uint64_t __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_2_26(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if ((SAHasAlertBehavior() & 1) != 0
    || SAHasActivityBehavior()
    && (objc_msgSend(*(id *)(a1 + 32), "systemApertureApertureElementAuthority:isActivityElementAlerting:", *(_QWORD *)(a1 + 40), v5) & 1) != 0)
  {
    v6 = 1;
  }
  else if (a3 == 3)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "systemApertureApertureElementAuthority:isElementExpandedDueToUserInteraction:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_43(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_48(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

- (BOOL)elementRequiresBeingDisplayedAlone:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementAuthorityDelegate);
  if (SAHasActivityBehavior()
    && (objc_msgSend(WeakRetained, "systemApertureApertureElementAuthority:isActivityElementAlerting:", self, v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(WeakRetained, "systemApertureApertureElementAuthority:isElementUrgentlyVisible:", self, v4);
  }

  return v6;
}

- (SBSystemApertureElementAuthorityDelegate)elementAuthorityDelegate
{
  return (SBSystemApertureElementAuthorityDelegate *)objc_loadWeakRetained((id *)&self->_elementAuthorityDelegate);
}

- (void)setElementAuthorityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_elementAuthorityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementAuthorityDelegate);
}

@end
