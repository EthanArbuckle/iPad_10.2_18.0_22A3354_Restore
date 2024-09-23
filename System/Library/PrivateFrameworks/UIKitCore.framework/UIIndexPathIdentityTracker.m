@implementation UIIndexPathIdentityTracker

void __71___UIIndexPathIdentityTracker__mappingIdentifierForSanitizedIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __69___UIIndexPathIdentityTracker__identifierBasedUpdateWithUpdateItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = objc_msgSend(a3, "length");
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v11 = v5;
  if (v6 == 1)
  {
    v8 = objc_msgSend(v7, "indexForSectionIdentifier:", v11);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v7, "indexPathForItemIdentifier:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "section") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "item") != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;

  }
  v9 = 0;
LABEL_8:

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v9)
    objc_msgSend(v10, "setObject:forKey:", v9, v11);
  else
    objc_msgSend(v10, "removeObjectForKey:", v11);

}

void __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  _manuallyUpdateSanitizedIndexPath(a3, v5, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v9 = (id)v7;
  if (v7)
    objc_msgSend(v8, "setObject:forKey:", v7, v6);
  else
    objc_msgSend(v8, "removeObjectForKey:", v6);

}

void __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  _manuallyUpdateSanitizedIndexPath(a3, v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v9 = (id)v7;
  if (v7)
    objc_msgSend(v8, "setObject:forKey:", v7, v6);
  else
    objc_msgSend(v8, "removeObjectForKey:", v6);

}

uint64_t __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", a3, a2);
}

@end
